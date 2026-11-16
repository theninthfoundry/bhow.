-- BHOW user-scoped records and private image storage.
-- Safe to run in the Supabase SQL editor. Uses auth.uid() for row ownership.

create extension if not exists pgcrypto;

