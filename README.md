# Vangla kordamisküsimused

Õppimisleht vanglateenistuse kordamisküsimustega (290 küsimust). Leht on üks fail: `index.html`.
Parandusettepanekud salvestuvad Supabase'i andmebaasi.

## 1. Supabase'i tabel (üks kord)

1. Ava Supabase'is oma projekt → **SQL Editor** → **New query**.
2. Kleebi faili `supabase/migrations/20261104120000_parandused.sql` sisu ja vajuta **Run**.

## 2. Võtmed lehele

Ava `index.html`, otsi üles read `SUPABASE_URL` ja `SUPABASE_KEY` ning pane jutumärkide vahele:

- **SUPABASE_URL**: Project Settings → Data API → Project URL (nt `https://abcdefgh.supabase.co`)
- **SUPABASE_KEY**: Project Settings → API Keys → **anon / publishable** võti

Salajast võtit (`service_role` / `secret`) ära kunagi lehele pane.

## 3. GitHub Pages

1. Lae `index.html`, `README.md` ja kaust `supabase` hoidlasse üles (Add file → Upload files).
2. Settings → Pages → Source: **Deploy from a branch**, Branch: **main**, kaust **/ (root)** → Save.
3. Mõne minuti pärast on leht aadressil `https://chrisrichv.github.io/kordamiskusimused2/`.

## 4. Paranduste kinnitamine

Uus parandus ilmub lehele kohe märkega **⏳ kinnitamata**.

1. Supabase → **Table Editor** → tabel `parandused`.
2. Muuda veerus `status` väärtus:
   - `kinnitatud`: parandus on lehel märkega **✓ kinnitatud**
   - `tagasi_lükatud`: parandus kaob lehelt

Kui tahad kinnitatud paranduse viia põhivastusesse, kopeeri lehel „Muudatused“ nimekiri ja saada see Claude'ile.
