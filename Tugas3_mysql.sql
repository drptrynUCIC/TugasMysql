Microsoft Windows [Version 10.0.22631.3447]
(c) Microsoft Corporation. All rights reserved.

C:\Users\asus>cd \xampp\mysql

C:\xampp\mysql>cd bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 1347
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE dbpos_sib6;
Database changed
MariaDB [dbpos_sib6]> SHOW TABLES;
+-----------------------------+
| Tables_in_dbpos_sib6        |
+-----------------------------+
| failed_jobs                 |
| jenis_produk                |
| kartu                       |
| lihat_vendor                |
| member                      |
| migrations                  |
| password_reset_tokens       |
| password_resets             |
| pelanggan                   |
| pembayaran                  |
| pembelian                   |
| pembelian_produk_vendor     |
| personal_access_tokens      |
| pesanan                     |
| pesanan_items               |
| pesanan_pelanggan_kartu     |
| pesanan_pelanggan_kartu_new |
| produk                      |
| staff                       |
| users                       |
| vendor                      |
+-----------------------------+
21 rows in set (0.001 sec)

MariaDB [dbpos_sib6]>  SELECT produk.nama,produk.stok, produk.min_stok, jenis_produk.nama as jenis FROM produk
    -> INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+-------------------+------+----------+-------------+
| nama              | stok | min_stok | jenis       |
+-------------------+------+----------+-------------+
| Televisi 21 inchs |    8 |        2 | elektroniks |
| Televisi 40 inch  |    4 |        2 | elektroniks |
| Kulkas 2 pintu    |    6 |        2 | elektroniks |
| Meja Makan        |    4 |        3 | furniture   |
| Teh Kotak         |    6 |       10 | minuman     |
| PC Desktop HP     |    9 |        2 | komputer    |
| Teh Botol         |   53 |       10 | minuman     |
| Notebook Acer S   |    7 |        2 | komputer    |
| Notebook Lenovo   |    9 |        2 | komputer    |
| Laptop Lenovo     |    5 |        2 | elektroniks |
| Kopi              |   10 |       15 | minuman     |
| Teh Sosro 2       |   10 |       12 | elektroniks |
| Laptop Asus       |   10 |       20 | elektroniks |
| Televisi 22 inc   |    5 |        2 | elektroniks |
| Televisi 23 inc   |    5 |        2 | elektroniks |
| Televisi 24 inc   |    5 |        2 | elektroniks |
| Televisi 25 inc   |    5 |        2 | elektroniks |
| Televisi 27 inc   |    5 |        2 | elektroniks |
| Televisi 28 inc   |    5 |        2 | elektroniks |
| Televisi 29 inc   |    5 |        2 | elektroniks |
| Teh Pucuk         |   10 |        2 | minuman     |
| Teh Pucuk2        |   10 |        2 | minuman     |
+-------------------+------+----------+-------------+
22 rows in set (0.001 sec)

MariaDB [dbpos_sib6]>  SELECT produk.nama,produk.stok, produk.min_stok, jenis_produk.nama as jenis FROM produk
    -> LEFT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+-------------------+------+----------+-------------+
| nama              | stok | min_stok | jenis       |
+-------------------+------+----------+-------------+
| Televisi 21 inchs |    8 |        2 | elektroniks |
| Televisi 40 inch  |    4 |        2 | elektroniks |
| Kulkas 2 pintu    |    6 |        2 | elektroniks |
| Meja Makan        |    4 |        3 | furniture   |
| Teh Kotak         |    6 |       10 | minuman     |
| PC Desktop HP     |    9 |        2 | komputer    |
| Teh Botol         |   53 |       10 | minuman     |
| Notebook Acer S   |    7 |        2 | komputer    |
| Notebook Lenovo   |    9 |        2 | komputer    |
| Laptop Lenovo     |    5 |        2 | elektroniks |
| Kopi              |   10 |       15 | minuman     |
| Teh Sosro 2       |   10 |       12 | elektroniks |
| Laptop Asus       |   10 |       20 | elektroniks |
| Televisi 22 inc   |    5 |        2 | elektroniks |
| Televisi 23 inc   |    5 |        2 | elektroniks |
| Televisi 24 inc   |    5 |        2 | elektroniks |
| Televisi 25 inc   |    5 |        2 | elektroniks |
| Televisi 27 inc   |    5 |        2 | elektroniks |
| Televisi 28 inc   |    5 |        2 | elektroniks |
| Televisi 29 inc   |    5 |        2 | elektroniks |
| Teh Pucuk         |   10 |        2 | minuman     |
| Teh Pucuk2        |   10 |        2 | minuman     |
+-------------------+------+----------+-------------+
22 rows in set (0.001 sec)

MariaDB [dbpos_sib6]>  SELECT produk.nama,produk.stok, produk.min_stok, jenis_produk.nama as jenis FROM produk
    -> RIGHT JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;
+-------------------+------+----------+-----------------------+
| nama              | stok | min_stok | jenis                 |
+-------------------+------+----------+-----------------------+
| Televisi 21 inchs |    8 |        2 | elektroniks           |
| Televisi 40 inch  |    4 |        2 | elektroniks           |
| Kulkas 2 pintu    |    6 |        2 | elektroniks           |
| Laptop Lenovo     |    5 |        2 | elektroniks           |
| Teh Sosro 2       |   10 |       12 | elektroniks           |
| Laptop Asus       |   10 |       20 | elektroniks           |
| Televisi 22 inc   |    5 |        2 | elektroniks           |
| Televisi 23 inc   |    5 |        2 | elektroniks           |
| Televisi 24 inc   |    5 |        2 | elektroniks           |
| Televisi 25 inc   |    5 |        2 | elektroniks           |
| Televisi 27 inc   |    5 |        2 | elektroniks           |
| Televisi 28 inc   |    5 |        2 | elektroniks           |
| Televisi 29 inc   |    5 |        2 | elektroniks           |
| Meja Makan        |    4 |        3 | furniture             |
| NULL              | NULL |     NULL | makanan               |
| Teh Kotak         |    6 |       10 | minuman               |
| Teh Botol         |   53 |       10 | minuman               |
| Kopi              |   10 |       15 | minuman               |
| Teh Pucuk         |   10 |        2 | minuman               |
| Teh Pucuk2        |   10 |        2 | minuman               |
| PC Desktop HP     |    9 |        2 | komputer              |
| Notebook Acer S   |    7 |        2 | komputer              |
| Notebook Lenovo   |    9 |        2 | komputer              |
| NULL              | NULL |     NULL | Makanan Ringan        |
| NULL              | NULL |     NULL | Minuman soda          |
| NULL              | NULL |     NULL | Makanan Berat         |
| NULL              | NULL |     NULL | Makanan Mengenyangkan |
| NULL              | NULL |     NULL | Minuman Manis         |
+-------------------+------+----------+-----------------------+
28 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis         |
+----+-----------------------+
10 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> START TRANSACTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbpos_sib6]> INSERT INTO jenis_produk (nama) VALUES
    -> ('Makanan Mengenyangkan'),
    -> ('Minuman Manis');
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis         |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
12 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> COMMIT;
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbpos_sib6]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> SAVEPOIN update jenis;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SAVEPOIN update jenis' at line 1
MariaDB [dbpos_sib6]> SAVEPOIN update_jenis;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SAVEPOIN update_jenis' at line 1
MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis         |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
12 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> ROLLBACK;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis         |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
12 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> DELETE FROM jenis_produk WHERE id=10;
Query OK, 1 row affected (0.004 sec)

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 11 | Minuman Manis         |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
11 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> ROLLBACK;
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis         |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
12 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> COMMIT;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> SAVEPOINT update_jenis;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> UPDATE jenis_produk set nama = 'Minuman Manis aja' WHE
RE id = 11;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbpos_sib6]> SELECT * FROM jenis_produk;
+----+-----------------------+
| id | nama                  |
+----+-----------------------+
|  1 | elektroniks           |
|  2 | furniture             |
|  3 | makanan               |
|  4 | minuman               |
|  5 | komputer              |
|  6 | Makanan Ringan        |
|  7 | Minuman soda          |
|  8 | Makanan Berat         |
| 10 | Makanan Mengenyangkan |
| 11 | Minuman Manis aja     |
| 21 | Makanan Mengenyangkan |
| 22 | Minuman Manis         |
+----+-----------------------+
12 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> START TRANSACTION;
Query OK, 0 rows affected (0.004 sec)

MariaDB [dbpos_sib6]> INSERT INTO jenis_produk (nama) VALUES ('sayur');
Query OK, 1 row affected (0.002 sec)

MariaDB [dbpos_sib6]> INSERT INTO jenis_produk (nama) VALUES ('buah');
Query OK, 1 row affected (0.000 sec)

MariaDB [dbpos_sib6]> INSERT INTO jenis_produk (nama) VALUES ('skincare');
Query OK, 1 row affected (0.000 sec)

MariaDB [dbpos_sib6]> UPDATE produk SET stok = 8 WHERE nama = 'Televisi 21 inchs';
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [dbpos_sib6]> COMMIT;
Query OK, 0 rows affected (0.009 sec)

MariaDB [dbpos_sib6]> Bye
Ctrl-C -- exit!

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 1402
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE dbpos_sib6;
Database changed
MariaDB [dbpos_sib6]> SHOW TABLES;
+-----------------------------+
| Tables_in_dbpos_sib6        |
+-----------------------------+
| failed_jobs                 |
| jenis_produk                |
| kartu                       |
| lihat_vendor                |
| member                      |
| migrations                  |
| password_reset_tokens       |
| password_resets             |
| pelanggan                   |
| pembayaran                  |
| pembelian                   |
| pembelian_produk_vendor     |
| personal_access_tokens      |
| pesanan                     |
| pesanan_items               |
| pesanan_pelanggan_kartu     |
| pesanan_pelanggan_kartu_new |
| produk                      |
| staff                       |
| users                       |
| vendor                      |
+-----------------------------+
21 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SAVEPOINT stok;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> DELETE FROM produk WHERE id = 27;
Query OK, 1 row affected (0.008 sec)

MariaDB [dbpos_sib6]> ROLLBACK;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]> UPDATE kartu SET iuran = 1000000 WHERE nama = 'GOLD';
Query OK, 0 rows affected (0.001 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [dbpos_sib6]> COMMIT;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbpos_sib6]>

-- 2.	Berikan penjelasan kapan saat yang tepat menggunakan LOCK TABLES READ
Waktu yang tepat untuk menggunakan LOCK TABLES READ adalah ketika Anda ingin membaca 
data dari sebuah tabel dan memastikan bahwa data tersebut tidak diubah oleh transaksi lain 
selama proses membaca. Ini berguna untuk menjaga konsistensi data pada saat pembacaan, 
terutama dalam situasi di mana data yang Anda baca sangat penting dan perlu stabil.

-- 3.	Berikan penjelasan kapan saat yang tepat menggunakan LOCK TABLES WRITE
erasi penulisan pada sebuah tabel dan ingin memastikan tidak ada transaksi lain 
yang membaca atau menulis ke tabel yang sama selama proses penulisan berlangsung. 
Ini diperlukan untuk mencegah anomali dan menjaga konsistensi data selama proses penulisan.

Setelah Anda menyediakan kode lengkap untuk transaction dan penjelasan untuk LOCK TABLES READ dan LOCK TABLES WRITE, 
Anda dapat memasukkan query tersebut ke dalam GitHub dengan mengikuti langkah-langkah yang telah saya jelaskan sebelumnya. 
Jika ada pertanyaan lebih lanjut atau hal lain yang bisa saya bantu, jangan ragu untuk bertanya!