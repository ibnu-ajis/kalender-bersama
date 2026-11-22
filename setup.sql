-- Kalender Kegiatan: tempel seluruh isi file ini di Supabase > SQL Editor, lalu klik Run.

create table if not exists public.events (
  id          text primary key check (id ~ '^[A-Za-z0-9_-]{1,40}$'),
  title       text not null check (char_length(title) between 1 and 80),
  event_date  date not null,
  event_time  text not null default '' check (event_time = '' or event_time ~ '^([01][0-9]|2[0-3]):[0-5][0-9]$'),
  cat         text not null default 'pribadi' check (cat in ('pribadi', 'kerja', 'belajar', 'sosial')),
  note        text not null default '' check (char_length(note) <= 300),
  updated_at  timestamptz not null default now()
);

alter table public.events enable row level security;

drop policy if exists "kalender_baca"  on public.events;
drop policy if exists "kalender_tambah" on public.events;
drop policy if exists "kalender_ubah"  on public.events;
drop policy if exists "kalender_hapus" on public.events;

create policy "kalender_baca"   on public.events for select to anon using (true);
create policy "kalender_tambah" on public.events for insert to anon with check (true);
create policy "kalender_ubah"   on public.events for update to anon using (true) with check (true);
create policy "kalender_hapus"  on public.events for delete to anon using (true);

grant usage on schema public to anon;
grant select, insert, update, delete on public.events to anon;