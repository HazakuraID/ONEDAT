# ONEDAT
adalah proyek untuk membuat daftar filter [Bromite](https://www.bromite.org/). Lihat halaman tentang [Custom Ad Block Filters](https://www.bromite.org/custom-filters) untuk info lebih lanjut.

# Lists
anda dapat memilih daftar mana saja dari tabel, lalu tahan nama untuk menyalin tautannya. Tambahkan ke Bromite dengan masuk ke pengaturan > AdBlock pengaturan, lalu atur "Filter URL" ke tautan yang baru saja anda salin.

| Link | Description  |
| ------ | ------|


Daftar ini secara teratur diperbarui secara otomatis menggunakan GitHub Actions.

**Note**: Saya tidak 100% yakin apakah semua format daftar yang digunakan benar-benar didukung oleh [the ruleset generation tool](https://github.com/xarantolus/subresource_filter_tools) (sebagai output menunjukkan beberapa kegagalan). Jika anda memiliki komentar tentang itu, silakan buka masalah :)

### Advanced blocking
Mesin pemblokiran iklan Bromite normal tidak mendukung semua format pemblokiran. Namun, sejak pengenalan skrip pengguna, menjadi mungkin untuk memblokir lebih banyak lagi annoying elements. Jika Anda ingin lebih banyak pemblokir (mis. untuk permintaan cookie), lihat my [custom Bromite user scripts repository]().

### Menggunakan daftar filter anda sendiri
Program ini dirancang sedemikian rupa sehingga memungkinkan Browser daftar baru dengan mudah.

Untuk membuat daftar baru:

1. Fork ini repository
2. Enable GitHub Actions dengan beralih ke "Actions" tab repo anda, lalu konfirmasikan bahwa kamu ingin mengaktifkan mereka
3. Pilih nama untuk daftar tersebut, mis. berikut namanya `example-list`. Harap perhatikan bahwa nama file harus diakhiri dengan `.txt`, jadi dalam kasus kami, kami menyebutnya `contoh-list.txt` (memasukkannya ke dalam `lists` directory).
4. Telusuri daftar filter yang ingin Anda gunakan. anda misalnya dapat menemukan mereka [DiSini](https://filterlists.com/), gunakan yang di "uBlock Origin" atau "AdBlock Plus" format (Namun, mungkin saja [tidak semua jenis aturan didukung](https://github.com/bromite/bromite/wiki/AdBlocking)). Buka info, lalu "Lihat" dan salin URL ke daftar.
5. Buat file `lists/example-list.txt` (in the `lists` directory) yang berisi URL untuk memfilter daftar yang anda salin sebelumnya. Seharusnya terlihat seperti ini:
    ```
    # Baris yang dimulai dengan # diabaikan, baris kosong juga diperbolehkan
    # List one URL per line:
    https://easylist.to/easylist/easylist.txt
    https://...

    # Baris berikut tidak berfungsi, hanya masukkan komentar atau URL dalam satu baris, tidak keduanya
    http://  # Komentar tidak valid pada URL
    ```
6. Simpan file anda, commit dan push. Tindakan GitHub sekarang harus membuat daftar dan membuat rilis
7. Setelah GitHub Actions generated rilis, anda dapat menyalin URL tertaut di rilis untuk selalu mendapatkan yang terbaru generated versi. URL ini terlihat seperti `https://github.com/USERNAME/filtrite/releases/latest/download/FILENAME.dat`. Jika URL Anda (kecuali bagian nama pengguna/nama file) berisi angka, Anda menyalin tautan yang salah.
8. Pastikan ukuran file filter yang dihasilkan kurang dari jumlah maksimum yang diizinkan [20 MB](https://github.com/bromite/bromite/blob/6f40f8341ab3fbcab458c10fe7b6bbcb8f881404/build/patches/Bromite-subresource-adblocker.patch#L1160-L1161). Jika tidak, anda harus menghapus beberapa daftar
9. Tetapkan URL ini sebagai file filter di pengaturan Bromite.

Hal lain yang perlu diperhatikan adalah [GitHub disables scheduled workflows after 60 days](https://docs.github.com/en/actions/managing-workflow-runs/disabling-and-enabling-a-workflow), artinya terkadang anda harus melakukan sesuatu agar garpu kamu tetap "hidup".


### [License](LICENSE)
Ini gratis seperti dalam perangkat lunak kebebasan. Lakukan apa pun yang anda suka dengannya.
