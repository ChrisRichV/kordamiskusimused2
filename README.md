# Vangla kordamisküsimused

Õppimisleht vanglateenistuse kordamisküsimustega (290 küsimust). Leht on üks fail: `index.html`.
Parandusettepanekud salvestuvad Supabase'i andmebaasi.

## 1. Supabase'i tabel (üks kord)

1. Ava Supabase'is oma projekt → **SQL Editor** → **New query**.
2. Kleebi faili `supabase/migrations/20261104120000_parandused.sql` sisu ja vajuta **Run**.

Seejärel käivita samamoodi ka `supabase/migrations/20261104140000_kasutajad_haaled_statistika.sql`.
See loob kasutajad (ainult nimega), „👍 Nõustun“ hääled ja kursuse statistika.

## 2. Võtmed lehele

Ava `index.html`, otsi üles read `SUPABASE_URL` ja `SUPABASE_KEY` ning pane jutumärkide vahele:

- **SUPABASE_URL**: Project Settings → Data API → Project URL (nt `https://abcdefgh.supabase.co`)
- **SUPABASE_KEY**: Project Settings → API Keys → **anon / publishable** võti

Salajast võtit (`service_role` / `secret`) ära kunagi lehele pane.

## 3. GitHub Pages

1. Lae `index.html`, `README.md` ja kaust `supabase` hoidlasse üles (Add file → Upload files).
2. Settings → Pages → Source: **Deploy from a branch**, Branch: **main**, kaust **/ (root)** → Save.
3. Mõne minuti pärast on leht aadressil `https://chrisrichv.github.io/kordamiskusimused2/`.

## 4. Parandused

Uus parandus ilmub kohe kõigile vana vastuse alla kujul „Nimi – parandatud vastus“. Kinnitada pole vaja.

Kui keegi kirjutab midagi sobimatut, ava Supabase → **Table Editor** → `parandused` ja muuda selle rea `status` väärtuseks `tagasi_lükatud`. Siis kaob parandus lehelt, aga jääb andmebaasi alles.

Kui tahad paranduse viia põhivastusesse, kopeeri lehel „Muudatused“ nimekiri ja saada see Claude'ile.

## 5. Kasutajad, edetabel ja kursuse statistika

- **Sisselogimiseks on vaja ainult nime**, parooli ei ole. Kui nime veel pole, luuakse konto. Teises seadmes logitakse sisse sama nimega ning XP, statistika ja raskeimad küsimused tulevad kaasa.
- **Edetabel** näitab 20 kõige suurema XP-ga kasutajat.
- **Kursuse raskeimad küsimused** tulevad kõigi vastuste anonüümsest statistikast (küsimusele peab olema vastatud vähemalt 3 korda).
- **👍 Nõustun**: sisse loginud kasutaja saab parandusega nõustuda. Kõige rohkem hääli saanud parandus on esimene.

Kuna parooli ei ole, saab igaüks, kes teab nime, selle nimega sisse logida. Kasutajaid saad vajadusel kustutada Supabase'i Table Editoris (tabel `kasutajad`).
