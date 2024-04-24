Microsoft Windows [Version 10.0.22631.3374]
(c) Microsoft Corporation. All rights reserved.

C:\Users\asus>cd \xampp\mysql

C:\xampp\mysql>cd bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 392
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE dbpos_sib6;
Database changed
MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk FROM produk;
+---------------+
| jumlah_produk |
+---------------+
|            22 |
+---------------+
1 row in set (0.004 sec)

MariaDB [dbpos_sib6]> SELECT MAX(harga_jual) AS produk_termahal FROM produk;
+-----------------+
| produk_termahal |
+-----------------+
|        50500000 |
+-----------------+
1 row in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT MIN(harga_jual) AS produk_termahal FROM produk
    -> ;
+-----------------+
| produk_termahal |
+-----------------+
|            2500 |
+-----------------+
1 row in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT SUM(stok - min_stok) AS SELISIH FROM produk;
+---------+
| SELISIH |
+---------+
|      91 |
+---------+
1 row in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT SUM(stok) as total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|         193 |
+-------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT kode, nama, stok FROM produk WHERE
    -> stok = (SELECT MAX(stok) FROM produk);
+------+-----------+------+
| kode | nama      | stok |
+------+-----------+------+
| TB01 | Teh Botol |   53 |
+------+-----------+------+
1 row in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT DISTINCT harga_jual FROM produk;
+------------+
| harga_jual |
+------------+
|   50500000 |
|    7440000 |
|    4680000 |
|     600000 |
|       3500 |
|    9984000 |
|       2500 |
|   11232000 |
|   12480000 |
|   16000000 |
|      30000 |
|      15000 |
|    5000000 |
|       5000 |
+------------+
14 rows in set (0.002 sec)

MariaDB [dbpos_sib6]>  SELECT nama, harga_jual, stok,
    ->  CASE
    -> WHEN stok >= 5 THEN 'cukup'
    ->  ELSE 'kurang'
    ->  END AS keterangan
    -> FROM produk;
+-------------------+------------+------+------------+
| nama              | harga_jual | stok | keterangan |
+-------------------+------------+------+------------+
| Televisi 21 inchs |   50500000 |    5 | cukup      |
| Televisi 40 inch  |    7440000 |    4 | kurang     |
| Kulkas 2 pintu    |    4680000 |    6 | cukup      |
| Meja Makan        |     600000 |    4 | kurang     |
| Teh Kotak         |       3500 |    6 | cukup      |
| PC Desktop HP     |    9984000 |    9 | cukup      |
| Teh Botol         |       2500 |   53 | cukup      |
| Notebook Acer S   |   11232000 |    7 | cukup      |
| Notebook Lenovo   |   12480000 |    9 | cukup      |
| Laptop Lenovo     |   16000000 |    5 | cukup      |
| Kopi              |      30000 |   10 | cukup      |
| Teh Sosro 2       |      15000 |   10 | cukup      |
| Laptop Asus       |    5000000 |   10 | cukup      |
| Televisi 22 inc   |   50500000 |    5 | cukup      |
| Televisi 23 inc   |   50500000 |    5 | cukup      |
| Televisi 24 inc   |   50500000 |    5 | cukup      |
| Televisi 25 inc   |   50500000 |    5 | cukup      |
| Televisi 27 inc   |   50500000 |    5 | cukup      |
| Televisi 28 inc   |   50500000 |    5 | cukup      |
| Televisi 29 inc   |   50500000 |    5 | cukup      |
| Teh Pucuk         |       5000 |   10 | cukup      |
| Teh Pucuk2        |       5000 |   10 | cukup      |
+-------------------+------------+------+------------+
22 rows in set (0.002 sec)

MariaDB [dbpos_sib6]>  SELECT id, nama, stok, min_stok,
    -> CASE
    -> WHEN stok >= min_stok THEN 'STOK aman'
    -> ELSE 'Silakam belanja'
    -> END AS keterangan
    -> FROM produk;
+----+-------------------+------+----------+-----------------+
| id | nama              | stok | min_stok | keterangan      |
+----+-------------------+------+----------+-----------------+
|  1 | Televisi 21 inchs |    5 |        2 | STOK aman       |
|  2 | Televisi 40 inch  |    4 |        2 | STOK aman       |
|  3 | Kulkas 2 pintu    |    6 |        2 | STOK aman       |
|  4 | Meja Makan        |    4 |        3 | STOK aman       |
|  5 | Teh Kotak         |    6 |       10 | Silakam belanja |
|  6 | PC Desktop HP     |    9 |        2 | STOK aman       |
|  7 | Teh Botol         |   53 |       10 | STOK aman       |
|  8 | Notebook Acer S   |    7 |        2 | STOK aman       |
|  9 | Notebook Lenovo   |    9 |        2 | STOK aman       |
| 11 | Laptop Lenovo     |    5 |        2 | STOK aman       |
| 15 | Kopi              |   10 |       15 | Silakam belanja |
| 16 | Teh Sosro 2       |   10 |       12 | Silakam belanja |
| 18 | Laptop Asus       |   10 |       20 | Silakam belanja |
| 19 | Televisi 22 inc   |    5 |        2 | STOK aman       |
| 20 | Televisi 23 inc   |    5 |        2 | STOK aman       |
| 21 | Televisi 24 inc   |    5 |        2 | STOK aman       |
| 22 | Televisi 25 inc   |    5 |        2 | STOK aman       |
| 24 | Televisi 27 inc   |    5 |        2 | STOK aman       |
| 25 | Televisi 28 inc   |    5 |        2 | STOK aman       |
| 26 | Televisi 29 inc   |    5 |        2 | STOK aman       |
| 27 | Teh Pucuk         |   10 |        2 | STOK aman       |
| 28 | Teh Pucuk2        |   10 |        2 | STOK aman       |
+----+-------------------+------+----------+-----------------+
22 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT
    -> CASE jenis_produk_id
    -> WHEN 1 THEN 'Elektronik'
    -> WHEN 2 THEN 'Furniture'
    -> WHEN 3 THEN 'Makanan'
    -> ELSE 'Minuman'
    -> END AS kategori,
    -> SUM(stok) AS jumlah
    -> FROM produk
    -> GROUP BY jenis_produk_id;
+------------+--------+
| kategori   | jumlah |
+------------+--------+
| Elektronik |     75 |
| Furniture  |      4 |
| Minuman    |     89 |
| Minuman    |     25 |
+------------+--------+
4 rows in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN
    -> 1980 AND 1990;
+----+------+---------------+----+-----------+------------+----------------------+----------+
| id | kode | nama          | jk | tmp_lahir | tgl_lahir  | email
     | kartu_id |
+----+------+---------------+----+-----------+------------+----------------------+----------+
|  3 | C003 | Sekar Mirah   | P  | Kediri    | 1983-02-20 | mirah@yahoo.com      |        1 |
|  4 | C004 | Swandaru Geni | L  | Kediri    | 1981-01-04 | swandaru@yahoo.com   |        4 |
|  5 | C005 | Pradabashu    | L  | Pati      | 1985-04-02 | prada85@gmail.com    |        2 |
|  6 | C006 | Gayatri Dwi   | P  | Jakarta   | 1987-11-28 | gaya87@gmail.com     |        1 |
|  7 | C007 | Dewi Gyat     | P  | Jakarta   | 1988-12-01 | giyat@gmail.com      |        1 |
|  8 | C008 | Andre Haru    | L  | Surabaya  | 1990-07-15 | andre.haru@gmail.com |        4 |
| 10 | C010 | Cassanndra    | P  | Belfast   | 1990-11-20 | casa90@gmail.com     |        1 |
+----+------+---------------+----+-----------+------------+----------------------+----------+
7 rows in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
Empty set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
Empty set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
Empty set (0.002 sec)

MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=07;
+----+------+------------+----+-----------+------------+----------------------+----------+
| id | kode | nama       | jk | tmp_lahir | tgl_lahir  | email
  | kartu_id |
+----+------+------------+----+-----------+------------+----------------------+----------+
|  8 | C008 | Andre Haru | L  | Surabaya  | 1990-07-15 | andre.haru@gmail.com |        4 |
+----+------+------------+----+-----------+------------+----------------------+----------+
1 row in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+--------------------+------------+------------+------+
| nama               | tmp_lahir  | tgl_lahir  | umur |
+--------------------+------------+------------+------+
| Agung Sedayu Group | Solo       | 2010-01-01 |   14 |
| Pandan Wangi       | Yogyakarta | 1950-01-01 |   74 |
| Sekar Mirah        | Kediri     | 1983-02-20 |   41 |
| Swandaru Geni      | Kediri     | 1981-01-04 |   43 |
| Pradabashu         | Pati       | 1985-04-02 |   39 |
| Gayatri Dwi        | Jakarta    | 1987-11-28 |   37 |
| Dewi Gyat          | Jakarta    | 1988-12-01 |   36 |
| Andre Haru         | Surabaya   | 1990-07-15 |   34 |
| Ahmad Hasan        | Surabaya   | 1992-10-15 |   32 |
| Cassanndra         | Belfast    | 1990-11-20 |   34 |
| Andi Wijaya        | Tangerang  | 2023-11-07 |    1 |
| Ira                | Jakarta    | 2023-11-07 |    1 |
+--------------------+------------+------------+------+
12 rows in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_pelanggan
    -> FROM pelanggan
    -> WHERE YEAR(tgl_lahir) = 1998;
+------------------+
| jumlah_pelanggan |
+------------------+
|                0 |
+------------------+
1 row in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_pelanggan_perempuan_Jakarta
    -> FROM pelanggan
    -> WHERE jk = 'P' AND tmp_lahir = 'Jakarta';
+------------------------------------+
| jumlah_pelanggan_perempuan_Jakarta |
+------------------------------------+
|                                  3 |
+------------------------------------+
1 row in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT SUM(stok) AS total_stok
    -> FROM produk
    -> WHERE harga_jual < 10000;
+------------+
| total_stok |
+------------+
|         79 |
+------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk_K
    -> FROM produk
    -> WHERE kode LIKE 'K%';
+-----------------+
| jumlah_produk_K |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.010 sec)

MariaDB [dbpos_sib6]> SELECT AVG(harga_jual) AS harga_jual_rata_rata
    -> FROM produk
    -> WHERE harga_jual > 1000000;
+----------------------+
| harga_jual_rata_rata |
+----------------------+
|   31387733.333333332 |
+----------------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT MAX(stok) AS jumlah_stok_terbesar
    -> FROM produk;
+----------------------+
| jumlah_stok_terbesar |
+----------------------+
|                   53 |
+----------------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT COUNT(*) AS jumlah_produk_kurang_dari_min_stok
    -> FROM produk
    -> WHERE stok < min_stok;
+------------------------------------+
| jumlah_produk_kurang_dari_min_stok |
+------------------------------------+
|                                  4 |
+------------------------------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT SUM(harga_beli * stok) AS total_asset
    -> FROM produk;
+-------------+
| total_asset |
+-------------+
|   480504000 |
+-------------+
1 row in set (0.001 sec)

MariaDB [dbpos_sib6]>  SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW()) - YEAR
    -> (tgl_lahir)) AS umur
    -> FROM pelanggan;
+--------------------+------------+------------+------+
| nama               | tmp_lahir  | tgl_lahir  | umur |
+--------------------+------------+------------+------+
| Agung Sedayu Group | Solo       | 2010-01-01 |   14 |
| Pandan Wangi       | Yogyakarta | 1950-01-01 |   74 |
| Sekar Mirah        | Kediri     | 1983-02-20 |   41 |
| Swandaru Geni      | Kediri     | 1981-01-04 |   43 |
| Pradabashu         | Pati       | 1985-04-02 |   39 |
| Gayatri Dwi        | Jakarta    | 1987-11-28 |   37 |
| Dewi Gyat          | Jakarta    | 1988-12-01 |   36 |
| Andre Haru         | Surabaya   | 1990-07-15 |   34 |
| Ahmad Hasan        | Surabaya   | 1992-10-15 |   32 |
| Cassanndra         | Belfast    | 1990-11-20 |   34 |
| Andi Wijaya        | Tangerang  | 2023-11-07 |    1 |
| Ira                | Jakarta    | 2023-11-07 |    1 |
+--------------------+------------+------------+------+
12 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT id, nama, stok,
    ->     CASE
    ->         WHEN stok <= min_stok THEN 'segera belanja'
    ->         ELSE 'stok aman'
    ->     END AS status_stok
    -> FROM produk;
+----+-------------------+------+----------------+
| id | nama              | stok | status_stok    |
+----+-------------------+------+----------------+
|  1 | Televisi 21 inchs |    5 | stok aman      |
|  2 | Televisi 40 inch  |    4 | stok aman      |
|  3 | Kulkas 2 pintu    |    6 | stok aman      |
|  4 | Meja Makan        |    4 | stok aman      |
|  5 | Teh Kotak         |    6 | segera belanja |
|  6 | PC Desktop HP     |    9 | stok aman      |
|  7 | Teh Botol         |   53 | stok aman      |
|  8 | Notebook Acer S   |    7 | stok aman      |
|  9 | Notebook Lenovo   |    9 | stok aman      |
| 11 | Laptop Lenovo     |    5 | stok aman      |
| 15 | Kopi              |   10 | segera belanja |
| 16 | Teh Sosro 2       |   10 | segera belanja |
| 18 | Laptop Asus       |   10 | segera belanja |
| 19 | Televisi 22 inc  |    5 | stok aman      |
| 20 | Televisi 23 inc   |    5 | stok aman      |
| 21 | Televisi 24 inc   |    5 | stok aman      |
| 22 | Televisi 25 inc   |    5 | stok aman      |
| 24 | Televisi 27 inc   |    5 | stok aman      |
| 25 | Televisi 28 inc   |    5 | stok aman      |
| 26 | Televisi 29 inc   |    5 | stok aman      |
| 27 | Teh Pucuk         |   10 | stok aman      |
| 28 | Teh Pucuk2        |   10 | stok aman      |
+----+-------------------+------+----------------+
22 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT id, nama, (YEAR(NOW()) - YEAR(tgl_lahir)) AS umur,
    ->     CASE
    ->         WHEN (YEAR(NOW()) - YEAR(tgl_lahir)) < 17 THEN 'muda'
    ->         WHEN (YEAR(NOW()) - YEAR(tgl_lahir)) BETWEEN 17 AND 55 THEN 'Dewasa'
    ->         ELSE 'Tua'
    ->     END AS kategori_umur
    -> FROM pelanggan;
+----+--------------------+------+---------------+
| id | nama               | umur | kategori_umur |
+----+--------------------+------+---------------+
|  1 | Agung Sedayu Group |   14 | muda          |
|  2 | Pandan Wangi       |   74 | Tua           |
|  3 | Sekar Mirah        |   41 | Dewasa        |
|  4 | Swandaru Geni      |   43 | Dewasa        |
|  5 | Pradabashu         |   39 | Dewasa        |
|  6 | Gayatri Dwi        |   37 | Dewasa        |
|  7 | Dewi Gyat          |   36 | Dewasa        |
|  8 | Andre Haru         |   34 | Dewasa        |
|  9 | Ahmad Hasan        |   32 | Dewasa        |
| 10 | Cassanndra         |   34 | Dewasa        |
| 11 | Andi Wijaya        |    1 | muda          |
| 12 | Ira                |    1 | muda          |
+----+--------------------+------+---------------+
12 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT id, kode, nama,
    ->   CASE
    ->     WHEN kode = 'TV01' THEN 'DVD Player'
    ->     WHEN kode = 'K001' THEN 'Rice Cooker'
    ->     ELSE 'Tidak Ada'
    ->   END AS bonus
    -> FROM produk;
+----+--------+-------------------+-------------+
| id | kode   | nama              | bonus       |
+----+--------+-------------------+-------------+
|  1 | TV01   | Televisi 21 inchs | DVD Player  |
|  2 | TV02   | Televisi 40 inch  | Tidak Ada   |
|  3 | K001   | Kulkas 2 pintu    | Rice Cooker |
|  4 | M001   | Meja Makan        | Tidak Ada   |
|  5 | TK01   | Teh Kotak         | Tidak Ada   |
|  6 | PC01   | PC Desktop HP     | Tidak Ada   |
|  7 | TB01   | Teh Botol         | Tidak Ada   |
|  8 | AC01   | Notebook Acer S   | Tidak Ada   |
|  9 | LN01   | Notebook Lenovo   | Tidak Ada   |
| 11 | L005   | Laptop Lenovo     | Tidak Ada   |
| 15 | L112   | Kopi              | Tidak Ada   |
| 16 | L113   | Teh Sosro 2       | Tidak Ada   |
| 18 | L0015  | Laptop Asus       | Tidak Ada   |
| 19 | TV0115 | Televisi 22 inc  | Tidak Ada   |
| 20 | TV0116 | Televisi 23 inc   | Tidak Ada   |
| 21 | TV0117 | Televisi 24 inc   | Tidak Ada   |
| 22 | TV0118 | Televisi 25 inc   | Tidak Ada   |
| 24 | TV0120 | Televisi 27 inc   | Tidak Ada   |
| 25 | TV0121 | Televisi 28 inc   | Tidak Ada   |
| 26 | TV0122 | Televisi 29 inc   | Tidak Ada   |
| 27 | THP001 | Teh Pucuk         | Tidak Ada   |
| 28 | THP002 | Teh Pucuk2        | Tidak Ada   |
+----+--------+-------------------+-------------+
22 rows in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan
    -> FROM pelanggan
    -> GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Belfast    |                1 |
| Jakarta    |                3 |
| Kediri     |                2 |
| Pati       |                1 |
| Solo       |                1 |
| Surabaya   |                2 |
| Tangerang  |                1 |
| Yogyakarta |                1 |
+------------+------------------+
8 rows in set (0.004 sec)

MariaDB [dbpos_sib6]> SELECT nama AS jenis_produk, COUNT(*) AS jumlah_produk

    -> FROM produk
    -> GROUP BY nama;
+-------------------+---------------+
| jenis_produk      | jumlah_produk |
+-------------------+---------------+
| Kopi              |             1 |
| Kulkas 2 pintu    |             1 |
| Laptop Asus       |             1 |
| Laptop Lenovo     |             1 |
| Meja Makan        |             1 |
| Notebook Acer S   |             1 |
| Notebook Lenovo   |             1 |
| PC Desktop HP     |             1 |
| Teh Botol         |             1 |
| Teh Kotak         |             1 |
| Teh Pucuk         |             1 |
| Teh Pucuk2        |             1 |
| Teh Sosro 2       |             1 |
| Televisi 21 inchs |             1 |
| Televisi 22 inc  |             1 |
| Televisi 23 inc   |             1 |
| Televisi 24 inc   |             1 |
| Televisi 25 inc   |             1 |
| Televisi 27 inc   |             1 |
| Televisi 28 inc   |             1 |
| Televisi 29 inc   |             1 |
| Televisi 40 inch  |             1 |
+-------------------+---------------+
22 rows in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan
    -> FROM pelanggan
    -> GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Belfast    |                1 |
| Jakarta    |                3 |
| Kediri     |                2 |
| Pati       |                1 |
| Solo       |                1 |
| Surabaya   |                2 |
| Tangerang  |                1 |
| Yogyakarta |                1 |
+------------+------------------+
8 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT id, nama, tmp_lahir, tgl_lahir, (YEAR(NOW()) - YEAR(tgl_lahir)) AS umur
    -> FROM pelanggan
    -> WHERE (YEAR(NOW()) - YEAR(tgl_lahir)) < (SELECT AVG(YEAR(NOW()) - YEAR(tgl_lahir)) FROM pelanggan);
+----+--------------------+-----------+------------+------+
| id | nama               | tmp_lahir | tgl_lahir  | umur |
+----+--------------------+-----------+------------+------+
|  1 | Agung Sedayu Group | Solo      | 2010-01-01 |   14 |
|  9 | Ahmad Hasan        | Surabaya  | 1992-10-15 |   32 |
| 11 | Andi Wijaya        | Tangerang | 2023-11-07 |    1 |
| 12 | Ira                | Jakarta   | 2023-11-07 |    1 |
+----+--------------------+-----------+------------+------+
4 rows in set (0.003 sec)

MariaDB [dbpos_sib6]> SELECT id, nama, harga_jual
    -> FROM produk
    -> WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+----+-------------------+------------+
| id | nama              | harga_jual |
+----+-------------------+------------+
|  1 | Televisi 21 inchs |   50500000 |
| 19 | Televisi 22 inc  |   50500000 |
| 20 | Televisi 23 inc   |   50500000 |
| 21 | Televisi 24 inc   |   50500000 |
| 22 | Televisi 25 inc   |   50500000 |
| 24 | Televisi 27 inc   |   50500000 |
| 25 | Televisi 28 inc   |   50500000 |
| 26 | Televisi 29 inc   |   50500000 |
+----+-------------------+------------+
8 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT p.*
    -> FROM pelanggan p
    -> JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.iuran > 90000;
+----+-------+--------------------+----+------------+------------+-------------------+----------+
| id | kode  | nama               | jk | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
|  1 | C001  | Agung Sedayu Group | L  | Solo       | 2010-01-01 | sedayu@gmail.com  |        1 |
|  2 | C002  | Pandan Wangi       | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com   |        2 |
|  3 | C003  | Sekar Mirah        | P  | Kediri     | 1983-02-20 | mirah@yahoo.com   |        1 |
|  5 | C005  | Pradabashu         | L  | Pati       | 1985-04-02 | prada85@gmail.com |        2 |
|  6 | C006  | Gayatri Dwi        | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com  |        1 |
|  7 | C007  | Dewi Gyat          | P  | Jakarta    | 1988-12-01 | giyat@gmail.com   |        1 |
| 10 | C010  | Cassanndra         | P  | Belfast    | 1990-11-20 | casa90@gmail.com  |        1 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang  | 2023-11-07 | andi@gmail.com    |        2 |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
8 rows in set (0.001 sec)

MariaDB [dbpos_sib6]> SELECT
    ->     AVG(harga_jual) AS rata_rata_harga,
    ->     MIN(harga_jual) AS harga_terendah,
    ->     MAX(harga_jual) AS harga_tertinggi,
    ->     COUNT(*) AS jumlah_produk
    -> FROM produk
    -> WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
+-------------------+----------------+-----------------+---------------+
| rata_rata_harga   | harga_terendah | harga_tertinggi | jumlah_produk |
+-------------------+----------------+-----------------+---------------+
| 4819785.714285715 |           2500 |        16000000 |            14 |
+-------------------+----------------+-----------------+---------------+
1 row in set (0.000 sec)

MariaDB [dbpos_sib6]> SELECT p.*
    -> FROM pelanggan p
    -> JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.diskon > 0.03;
+----+-------+--------------------+----+------------+------------+-------------------+----------+
| id | kode  | nama               | jk | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
|  1 | C001  | Agung Sedayu Group | L  | Solo       | 2010-01-01 | sedayu@gmail.com  |        1 |
|  2 | C002  | Pandan Wangi       | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com   |        2 |
|  3 | C003  | Sekar Mirah        | P  | Kediri     | 1983-02-20 | mirah@yahoo.com   |        1 |
|  5 | C005  | Pradabashu         | L  | Pati       | 1985-04-02 | prada85@gmail.com |        2 |
|  6 | C006  | Gayatri Dwi        | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com  |        1 |
|  7 | C007  | Dewi Gyat          | P  | Jakarta    | 1988-12-01 | giyat@gmail.com   |        1 |
| 10 | C010  | Cassanndra         | P  | Belfast    | 1990-11-20 | casa90@gmail.com  |        1 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang  | 2023-11-07 | andi@gmail.com    |        2 |
+----+-------+--------------------+----+------------+------------+-------------------+----------+
8 rows in set (0.000 sec)
