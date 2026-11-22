# Kalender Kegiatan untuk GitHub Pages

Halaman ini statis (bisa di GitHub Pages), dan datanya disimpan di Supabase supaya semua orang yang membuka tautannya melihat kegiatan yang sama. Perubahan muncul di perangkat lain sekitar 10 detik kemudian.

## 1. Siapkan database (Supabase, gratis)

1. Daftar di https://supabase.com lalu klik **New project**. Isi nama bebas, buat password database, dan pilih region terdekat (misalnya Singapore).
2. Setelah proyek siap, buka **SQL Editor**, tempel seluruh isi `setup.sql`, lalu klik **Run**.
3. Buka **Project Settings > API Keys** (atau **API**). Salin dua hal:
   - **Project URL** (bentuknya `https://xxxx.supabase.co`)
   - kunci **anon / publishable** (kunci publik, bukan `service_role`)

## 2. Isi konfigurasi

Buka `index.html` dengan editor teks, cari dua baris ini (dekat bagian "Server"), lalu ganti isinya:

    var SUPABASE_URL = 'GANTI_DENGAN_PROJECT_URL';
    var SUPABASE_KEY = 'GANTI_DENGAN_ANON_PUBLIC_KEY';

Selama dua baris itu belum diisi, halaman tetap jalan dalam mode contoh: data hanya tersimpan di browser masing-masing.

## 3. Unggah ke GitHub Pages

1. Buat repository baru di GitHub (pilih **Public**, karena Pages gratis butuh repository publik).
2. Unggah `index.html` ke repository itu.
3. Buka **Settings > Pages**. Di bagian **Build and deployment**, pilih **Deploy from a branch**, branch `main`, folder `/ (root)`, lalu **Save**.
4. Tunggu 1 sampai 2 menit. Alamatnya: `https://username.github.io/nama-repository/`
5. Bagikan alamat itu ke temanmu.

## Catatan penting

- **Siapa pun yang tahu alamatnya bisa melihat dan mengubah kegiatan.** Kunci anon memang publik dan akan terlihat di kode halaman. Jangan menulis hal rahasia di kalender ini, dan jangan sebar alamatnya sembarangan.
- Jangan pernah memakai kunci `service_role` di `index.html`.
- Proyek Supabase gratis dijeda otomatis kalau lama tidak dipakai (sekitar seminggu). Kalau kalender berhenti memuat data, buka dashboard Supabase dan klik **Restore project**.
- Cadangan: di Supabase buka **Table Editor > events**, lalu ekspor sebagai CSV.
