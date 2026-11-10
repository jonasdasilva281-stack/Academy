-- Links curtos dos formulários (ficha, presença, opinião)
-- Corra uma vez no Supabase: SQL Editor → New query → colar → Run
create table if not exists public.academy_links (
  k text primary key,
  ctx jsonb not null,
  criado_em timestamptz not null default now()
);
alter table public.academy_links enable row level security;
drop policy if exists "links ler" on public.academy_links;
drop policy if exists "links criar" on public.academy_links;
create policy "links ler" on public.academy_links for select to anon using (true);
create policy "links criar" on public.academy_links for insert to anon with check (char_length(k) between 6 and 20);
grant select, insert on public.academy_links to anon;
