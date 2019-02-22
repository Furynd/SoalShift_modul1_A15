# SoalShift_modul1_A15

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
jumat pada bulan Februari.
-----------------------------------

Untuk menjawabnya pertama – tama yang diperlukan adalah extract nature.zip terlebih dahulu

![1.png](img/1.png)

Lakukan perulangan untuk setiap file yang ada di dalam folder nature yang sudah di extract

![1.2.png](img/1.2.png)

Untuk setiap file akan di tampung di variabel i, nantinya file akan di decode dengan base64 terlebih dahulu

![1.3.png](img/1.3.png)

Kemudian hasilnya akan di decode reverse dengan hexdump

![1.4.png](img/1.4.png)

Hasil file yang telah terencrypt akan disimpan pada folder nature dengan format hasil[urutan].jpg

![1.5.png](img/1.5.png)

File sebelum di encrypt di hapus

![1.6.png](img/1.6.png)

Untuk mengatur cron agar sesuai dengan perintah maka diatur seperti dibawah ini :

![1.7.png](img/1.7.png)

- - - -

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:
-----------------------------------

a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.

c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

- - - -

Untuk penyelesaiannya digunakan awk, pada saat menggunakan awk untuk membaca file .csv, digunakan option FS="," pada bagian BEGIN, untuk menunjukkan bahwa input pada tiap baris dipisahkan oleh tanda ",".

a. dibuat map dengan index nama negara, berisi jumlah total penjualan

![2.1.png](img/2.1.png)

kemudian pada bagian END dilakukan looping untuk menemukan negara dengan penjualan terbanyak

![2.2.png](img/2.2.png)

output dari soal a disimpan ke dalam variabel country

![2.png](img/2.png)

b. menambahkan nama negara hasil dari soal a dengan option -v var="$country" pada command awk

![2.4.png](img/2.4.png)

membuat map seprti soal a, dengan index nama product line khusus untuk negara yang didapatkan pada soal a

![2.5.png](img/2.5.png)

kemudian pada bagian END outputkan jumlah penjualan dan nama product line, dan di pipe dengan command sort agar terurut, dan disimpan dalam file temporary 2.txt

![2.6.png](img/2.6.png)

dengan looping shell dan awk sederhana tiga productline teratas di masukkan ke dalam array pline

![2.7.png](img/2.7.png)

c. membuat map dengan index nama product dari 3 product line hasil soal b

![2.8.png](img/2.8.png)

setelah diprint pada bagian END, di-pipe ke command sort, dan diprint tiga product teratas dengan awk

![2.10.png](img/2.10.png)

- - - -

3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:
---------------------------

a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt

b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

d. Password yang dihasilkan tidak boleh sama.

- - - -

Pertama tama yang dilakukan adalah menentukan nama file yang akan dibuat dan disimpan dalam variabel n4 

![3.png](img/3.png)

Setelah mendapat nama filenya kita perlu menggenerate passwordnya yang dilakukan dengan cara membuat sebuah array yang berisi digit, lowercase, dan uppercase

![3.1.png](img/3.1.png)

Dari array yang telah dibuat kita akan melakukan iterasi sebanyak 12 kali untuk memilih elemen randam yang terdapat dalam array

![3.2.png](img/3.2.png)

Setelah menggenerate password perlu dilakukan cek apakah password memiliki ketiga elemen yang telah ditentukan
1. Cek digit dalam password

![3.3.png](img/3.3.png)

2. Cek lowercase dalam password

![3.4.png](img/3.4.png)

3. Cek uppercase dalam password

![3.5.png](img/3.5.png)

Setelah password sesuai, password akan disimpan dalam file

![3.6.png](img/3.6.png)

- - - -

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-
bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string
manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai
berikut:
--------------------------

a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan
pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki
urutan ke 12+2 = 14.

b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke
empat belas, dan seterusnya.

c. setelah huruf z akan kembali ke huruf a

d. Backup file syslog setiap jam.

e. dan buatkan juga bash script untuk dekripsinya.

- - - -

untuk nama file, digunakan command date dengan format yang diinginkan

![4.png](img/4.png)

untuk menentukan jam sekarang, digunakan command date

![4.1.png](img/4.1.png)

enkripsi dilakukan dengan command tr dengan argument kedua merupakan hasil translasi huruf menggunakan array huruf

![4.2.png](img/4.2.png)

karena nama file mengandung karakter " " (spasi), variabel IFS (Internal Field Separator) harus didefinisikan sebagai newline

![4.3.png](img/4.3.png)

untuk dekripsi jam sebagai decrypt-key didapatkan dari nama file

![4.4.png](img/4.4.png)

untuk dekripsinya cukup membalik argumen pada tr di kode enkripsinya

![4.5.png](img/4.5.png)

script enkripsi dijalankan tiap jam dengan crontab @hourly atau 0 * * * * *

- - - -

5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:
---------------------------

a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”,
serta buatlah pencarian stringnya tidak bersifat case sensitive,
sehingga huruf kapital atau tidak, tidak menjadi masalah.

b. Jumlah field (number of field) pada baris tersebut berjumlah kurang
dari 13.

c. Masukkan record tadi ke dalam file logs yang berada pada direktori
/home/[user]/modul1.

d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh
13:02, 13:08, 13:14, dst.

- - - -

Untuk mengerjakannya kita dapat menggunakan fungsi awk
a. Untuk mencari log yang tidak mengandu “sudo” tetapi mengandung “cron” ditambahkan option

![5.png](img/5.png)

b. Untuk log yang jumlah fielldnya kurang dari 13 tambahkan 

![5.1.png](img/5.1.png)

c. Kemudian record akan disimpan ke direktori /home/[user]/modul1

![5.2.png](img/5.2.png)

Sehingga hasil keseluruhan bash script adalah

![5.3.png](img/5.3.png)

d. Untuk mengatur cron agar sesuai dengan perintah maka diatur seperti dibawah ini :

![5.4.png](img/5.4.png)

- - - -