-- Run this in Supabase → SQL Editor → New Query

create table if not exists stores (
  id uuid default gen_random_uuid() primary key,
  created_at timestamptz default now(),
  name text not null,
  address text,
  city text,
  country text,
  description text,
  owner_id uuid references auth.users not null
);

create table if not exists aisles (
  id uuid default gen_random_uuid() primary key,
  created_at timestamptz default now(),
  store_id uuid references stores(id) on delete cascade not null,
  name text not null,
  description text,
  position integer default 0
);

create table if not exists items (
  id uuid default gen_random_uuid() primary key,
  created_at timestamptz default now(),
  store_id uuid references stores(id) on delete cascade not null,
  aisle_id uuid references aisles(id) on delete cascade not null,
  name text not null,
  description text,
  location_detail text,
  category text
);

alter table stores enable row level security;
alter table aisles enable row level security;
alter table items enable row level security;

create policy "stores_select" on stores for select using (true);
create policy "stores_insert" on stores for insert with check (auth.uid() = owner_id);
create policy "stores_update" on stores for update using (auth.uid() = owner_id);
create policy "stores_delete" on stores for delete using (auth.uid() = owner_id);

create policy "aisles_select" on aisles for select using (true);
create policy "aisles_insert" on aisles for insert with check (auth.uid() = (select owner_id from stores where id = store_id));
create policy "aisles_update" on aisles for update using (auth.uid() = (select owner_id from stores where id = store_id));
create policy "aisles_delete" on aisles for delete using (auth.uid() = (select owner_id from stores where id = store_id));

create policy "items_select" on items for select using (true);
create policy "items_insert" on items for insert with check (auth.uid() = (select owner_id from stores where id = store_id));
create policy "items_update" on items for update using (auth.uid() = (select owner_id from stores where id = store_id));
create policy "items_delete" on items for delete using (auth.uid() = (select owner_id from stores where id = store_id));
