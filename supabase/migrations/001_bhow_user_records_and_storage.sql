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
