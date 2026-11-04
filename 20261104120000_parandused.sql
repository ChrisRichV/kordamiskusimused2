-- Kordamisküsimuste lehe parandusettepanekute tabel.
-- Käivita Supabase'is: SQL Editor -> New query -> kleebi see fail -> Run.

create table if not exists public.parandused (
  id          bigint generated always as identity primary key,
  question_id text        not null check (char_length(question_id) between 2 and 10),
  name        text        not null check (char_length(name) between 1 and 60),
  text        text        not null check (char_length(text) between 1 and 3000),
  note        text                 check (note is null or char_length(note) <= 500),
  status      text        not null default 'kinnitamata'
                          check (status in ('kinnitamata', 'kinnitatud', 'tagasi_lükatud')),
  created_at  timestamptz not null default now()
);

alter table public.parandused enable row level security;

-- Lehe külastajad näevad kinnitatud ja kinnitamata parandusi, tagasi lükatuid mitte.
drop policy if exists "parandused_lugemine" on public.parandused;
create policy "parandused_lugemine" on public.parandused
  for select to anon, authenticated
  using (status in ('kinnitamata', 'kinnitatud'));

-- Igaüks saab lisada uue paranduse, aga ainult olekuga "kinnitamata".
drop policy if exists "parandused_lisamine" on public.parandused;
create policy "parandused_lisamine" on public.parandused
  for insert to anon, authenticated
  with check (status = 'kinnitamata');

-- Muuta ega kustutada lehelt ei saa. Seda teed sina Supabase'i Table Editoris.
grant select, insert on public.parandused to anon, authenticated;
