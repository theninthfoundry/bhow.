-- BHOW user-scoped records and private image storage.
-- Safe to run in the Supabase SQL editor. Uses auth.uid() for row ownership.

create extension if not exists pgcrypto;

create table if not exists public.bhow_user_records (
    id uuid primary key default gen_random_uuid(),
    owner_id uuid not null references auth.users(id) on delete cascade,
    store_name text not null check (store_name in ('dogs', 'tasks', 'cases')),
    record_id text not null,
    payload jsonb not null default '{}'::jsonb,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    unique (owner_id, store_name, record_id)
);

create index if not exists bhow_user_records_owner_store_idx
    on public.bhow_user_records(owner_id, store_name);

create or replace function public.bhow_set_updated_at()
returns trigger
language plpgsql
as $$
begin
    new.updated_at = now();
    return new;
end;
$$;

drop trigger if exists bhow_user_records_updated_at on public.bhow_user_records;
create trigger bhow_user_records_updated_at
before update on public.bhow_user_records
for each row execute function public.bhow_set_updated_at();

alter table public.bhow_user_records enable row level security;

drop policy if exists "bhow_records_select_own" on public.bhow_user_records;
create policy "bhow_records_select_own"
on public.bhow_user_records for select
to authenticated
using (owner_id = auth.uid());

drop policy if exists "bhow_records_insert_own" on public.bhow_user_records;
create policy "bhow_records_insert_own"
on public.bhow_user_records for insert
to authenticated
with check (owner_id = auth.uid());

drop policy if exists "bhow_records_update_own" on public.bhow_user_records;
create policy "bhow_records_update_own"
on public.bhow_user_records for update
to authenticated
using (owner_id = auth.uid())
with check (owner_id = auth.uid());

drop policy if exists "bhow_records_delete_own" on public.bhow_user_records;
create policy "bhow_records_delete_own"
on public.bhow_user_records for delete
to authenticated
using (owner_id = auth.uid());

grant select, insert, update, delete on public.bhow_user_records to authenticated;

