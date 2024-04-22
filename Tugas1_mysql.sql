Microsoft Windows [Version 10.0.22631.3374]
(c) Microsoft Corporation. All rights reserved.

C:\Users\asus>cd \xampp\mysql

C:\xampp\mysql>cd bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 98
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SELECT nama,stok FROM produk;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> USE sib_6;
Database changed
MariaDB [sib_6]> SELECT nama,stok FROM produk;
+-------------+------+
| nama        | stok |
+-------------+------+
| TV          |   20 |
| Radio       |   10 |
| Meja        |    5 |
| Kursi       |    5 |
| Nasi Goreng |   10 |
| Es Campur   |   10 |
+-------------+------+
6 rows in set (0.012 sec)

MariaDB [sib_6]> USE dbpos_sib6;
Database changed
MariaDB [dbpos_sib6]> show tables;
+-------------------------+
| Tables_in_dbpos_sib6    |
+-------------------------+
| failed_jobs             |
| jenis_produk            |
| kartu                   |
| lihat_vendor            |
| member                  |
| migrations              |
| password_reset_tokens   |
| password_resets         |
| pelanggan               |
| pembayaran              |
| pembelian               |
| personal_access_tokens  |
| pesanan                 |
| pesanan_items           |
| pesanan_pelanggan_kartu |
| produk                  |
| staff                   |
| users                   |
| vendor                  |
+-------------------------+
19 rows in set (0.001 sec)

-- 4.	Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbpos_sib6]>  SELECT kode,nama, stok from produk WHERE stok=4;
+------+------------------+------+
| kode | nama             | stok |
+------+------------------+------+
| TV02 | Televisi 40 inch |    4 |
| M001 | Meja Makan       |    4 |
+------+------------------+------+
2 rows in set (0.001 sec)
-- 5.	Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbpos_sib6]> SELECT * from pelanggan  WHERE tmp_lahir='jakarta';
+----+-------+-------------+----+-----------+------------+------------------+----------+
| id | kode  | nama        | jk | tmp_lahir | tgl_lahir  | email
| kartu_id |
+----+-------+-------------+----+-----------+------------+------------------+----------+
|  6 | C006  | Gayatri Dwi | P  | Jakarta   | 1987-11-28 | gaya87@gmail.com |        1 |
|  7 | C007  | Dewi Gyat   | P  | Jakarta   | 1988-12-01 | giyat@gmail.com  |        1 |
| 12 | K0011 | Ira         | P  | Jakarta   | 2023-11-07 | ira@gmail.com    |        4 |
+----+-------+-------------+----+-----------+------------+------------------+----------+
3 rows in set (0.001 sec)
-- 6.	Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbpos_sib6]>  SELECT kode, nama, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;
+-------+--------------------+------------+------------+
| kode  | nama               | tmp_lahir  | tgl_lahir  |
+-------+--------------------+------------+------------+
| K0011 | Ira                | Jakarta    | 2023-11-07 |
| K0010 | Andi Wijaya        | Tangerang  | 2023-11-07 |
| C001  | Agung Sedayu Group | Solo       | 2010-01-01 |
| C009  | Ahmad Hasan        | Surabaya   | 1992-10-15 |
| C010  | Cassanndra         | Belfast    | 1990-11-20 |
| C008  | Andre Haru         | Surabaya   | 1990-07-15 |
| C007  | Dewi Gyat          | Jakarta    | 1988-12-01 |
| C006  | Gayatri Dwi        | Jakarta    | 1987-11-28 |
| C005  | Pradabashu         | Pati       | 1985-04-02 |
| C003  | Sekar Mirah        | Kediri     | 1983-02-20 |
| C004  | Swandaru Geni      | Kediri     | 1981-01-04 |
| C002  | Pandan Wangi       | Yogyakarta | 1950-01-01 |
+-------+--------------------+------------+------------+
12 rows in set (0.001 sec)
-- 2.2
-- 1.	Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbpos_sib6]> SELECT * from produk WHERE stok=3 OR stok=10;
+----+--------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| id | kode   | nama        | harga_beli | harga_jual | stok | min_stok | foto                   | deskripsi


       | jenis_produk_id |
+----+--------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| 15 | L112   | Kopi        |      20000 |      30000 |   10 |       15 | foto-15.png            | Luwak White Coffee merupakan bubuk biji kopi luwak yang dikombinasikan dengan gurihnya krimer serta manisnya gula. Keharuman kopi serta rasa manisnya yang pas juga membuat popularitas Luwak White Coffee melejit. |               4 |
| 16 | L113   | Teh Sosro 2 |      10000 |      15000 |   10 |       12 | .png                   | NULL


       |               1 |
| 18 | L0015  | Laptop Asus |    3000000 |    5000000 |   10 |       20 | foto-65542ffa66604.jpg | NULL


       |               1 |
| 27 | THP001 | Teh Pucuk   |       4000 |       5000 |   10 |        2 | pucuk.jpg              | Teh pucuk adalah


       |               4 |
| 28 | THP002 | Teh Pucuk2  |       4000 |       5000 |   10 |        2 | pucuk.jpg              | Teh pucuk adalah


       |               4 |
+----+--------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
5 rows in set (0.001 sec)
-- 2.	Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbpos_sib6]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
|  3 | K001 | Kulkas 2 pintu |    3500000 |    4680000 |    6 |        2 |      | NULL      |               1 |
|  4 | M001 | Meja Makan     |     500000 |     600000 |    4 |        3 | NULL | NULL      |               2 |
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
2 rows in set (0.001 sec)
-- 3.	Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbpos_sib6]> SELECT * FROM produk WHERE min_stok > stok;
+----+-------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| id | kode  | nama        | harga_beli | harga_jual | stok | min_stok | foto                   | deskripsi


      | jenis_produk_id |
+----+-------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
|  5 | TK01  | Teh Kotak   |       3000 |       3500 |    6 |       10 | foto-5.png             | NULL


      |               4 |
| 15 | L112  | Kopi        |      20000 |      30000 |   10 |       15 | foto-15.png            | Luwak White Coffee merupakan bubuk biji kopi luwak yang dikombinasikan dengan gurihnya krimer serta manisnya gula. Keharuman kopi serta rasa manisnya yang pas juga membuat popularitas Luwak White Coffee melejit. |               4 |
| 16 | L113  | Teh Sosro 2 |      10000 |      15000 |   10 |       12 | .png                   | NULL


      |               1 |
| 18 | L0015 | Laptop Asus |    3000000 |    5000000 |   10 |       20 | foto-65542ffa66604.jpg | NULL


      |               1 |
+----+-------+-------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
4 rows in set (0.001 sec)
-- 4.	Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+-------+--------------------+----+------------+------------+----------------------+----------+
| id | kode  | nama               | jk | tmp_lahir  | tgl_lahir  | email                | kartu_id |
+----+-------+--------------------+----+------------+------------+----------------------+----------+
| 12 | K0011 | Ira                | P  | Jakarta    | 2023-11-07 | ira@gmail.com        |        4 |
| 11 | K0010 | Andi Wijaya        | L  | Tangerang  | 2023-11-07 | andi@gmail.com       |        2 |
|  1 | C001  | Agung Sedayu Group | L  | Solo       | 2010-01-01 | sedayu@gmail.com     |        1 |
|  9 | C009  | Ahmad Hasan        | L  | Surabaya   | 1992-10-15 | ahasan@gmail.com     |        4 |
| 10 | C010  | Cassanndra         | P  | Belfast    | 1990-11-20 | casa90@gmail.com     |        1 |
|  8 | C008  | Andre Haru         | L  | Surabaya   | 1990-07-15 | andre.haru@gmail.com |        4 |
|  7 | C007  | Dewi Gyat          | P  | Jakarta    | 1988-12-01 | giyat@gmail.com      |        1 |
|  6 | C006  | Gayatri Dwi        | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com     |        1 |
|  5 | C005  | Pradabashu         | L  | Pati       | 1985-04-02 | prada85@gmail.com    |        2 |
|  3 | C003  | Sekar Mirah        | P  | Kediri     | 1983-02-20 | mirah@yahoo.com      |        1 |
|  4 | C004  | Swandaru Geni      | L  | Kediri     | 1981-01-04 | swandaru@yahoo.com   |        4 |
|  2 | C002  | Pandan Wangi       | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com      |        2 |
+----+-------+--------------------+----+------------+------------+----------------------+----------+
12 rows in set (0.000 sec)
-- 5.	Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';
+----+-------+-------------+----+-----------+------------+------------------+----------+
| id | kode  | nama        | jk | tmp_lahir | tgl_lahir  | email
| kartu_id |
+----+-------+-------------+----+-----------+------------+------------------+----------+
|  6 | C006  | Gayatri Dwi | P  | Jakarta   | 1987-11-28 | gaya87@gmail.com |        1 |
|  7 | C007  | Dewi Gyat   | P  | Jakarta   | 1988-12-01 | giyat@gmail.com  |        1 |
| 12 | K0011 | Ira         | P  | Jakarta   | 2023-11-07 | ira@gmail.com    |        4 |
+----+-------+-------------+----+-----------+------------+------------------+----------+
3 rows in set (0.001 sec)
-- 6.	Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbpos_sib6]> SELECT * from pelanggan WHERE id IN (2,4,6);
+----+------+---------------+----+------------+------------+--------------------+----------+
| id | kode | nama          | jk | tmp_lahir  | tgl_lahir  | email
    | kartu_id |
+----+------+---------------+----+------------+------------+--------------------+----------+
|  2 | C002 | Pandan Wangi  | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com    |        2 |
|  4 | C004 | Swandaru Geni | L  | Kediri     | 1981-01-04 | swandaru@yahoo.com |        4 |
|  6 | C006 | Gayatri Dwi   | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com   |        1 |
+----+------+---------------+----+------------+------------+--------------------+----------+
3 rows in set (0.001 sec)
-- 7.	Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbpos_sib6]> SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;
+----+-------+----------------+------------+------------+------+----------+------------------------+-----------+-----------------+
| id | kode  | nama           | harga_beli | harga_jual | stok | min_stok | foto                   | deskripsi | jenis_produk_id |
+----+-------+----------------+------------+------------+------+----------+------------------------+-----------+-----------------+
|  3 | K001  | Kulkas 2 pintu |    3500000 |    4680000 |    6 |        2 |                        | NULL      |               1 |
|  4 | M001  | Meja Makan     |     500000 |     600000 |    4 |        3 | NULL                   | NULL      |               2 |
| 18 | L0015 | Laptop Asus    |    3000000 |    5000000 |   10 |       20 | foto-65542ffa66604.jpg | NULL      |               1 |
+----+-------+----------------+------------+------------+------+----------+------------------------+-----------+-----------------+
3 rows in set (0.001 sec)
-- 2.3 (mandiri)
-- 1.	Tampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbpos_sib6]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
|  3 | K001 | Kulkas 2 pintu |    3500000 |    4680000 |    6 |        2 |      | NULL      |               1 |
|  4 | M001 | Meja Makan     |     500000 |     600000 |    4 |        3 | NULL | NULL      |               2 |
+----+------+----------------+------------+------------+------+----------+------+-----------+-----------------+
2 rows in set (0.001 sec)
-- 2.	Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbpos_sib6]> SELECT * FROM produk WHERE kode NOT LIKE 'M%';
+----+--------+-------------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| id | kode   | nama              | harga_beli | harga_jual | stok | min_stok | foto                   | deskripsi


             | jenis_produk_id |
+----+--------+-------------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
|  1 | TV01   | Televisi 21 inchs |    3500000 |   50500000 |    5 |        2 |                        | NULL


             |               1 |
|  2 | TV02   | Televisi 40 inch  |    5500000 |    7440000 |    4 |        2 | NULL                   | NULL


             |               1 |
|  3 | K001   | Kulkas 2 pintu    |    3500000 |    4680000 |    6 |        2 |                        | NULL


             |               1 |
|  5 | TK01   | Teh Kotak         |       3000 |       3500 |    6 |       10 | foto-5.png             | NULL


             |               4 |
|  6 | PC01   | PC Desktop HP     |    7000000 |    9984000 |    9 |        2 | NULL                   | NULL


             |               5 |
|  7 | TB01   | Teh Botol         |       2000 |       2500 |   53 |       10 | foto-7.jpg             | NULL


             |               4 |
|  8 | AC01   | Notebook Acer S   |    8000000 |   11232000 |    7 |        2 | NULL                   | NULL


             |               5 |
|  9 | LN01   | Notebook Lenovo   |    9000000 |   12480000 |    9 |        2 | NULL                   | NULL


             |               5 |
| 11 | L005   | Laptop Lenovo     |   13000000 |   16000000 |    5 |        2 |                        | NULL


             |               1 |
| 15 | L112   | Kopi              |      20000 |      30000 |   10 |       15 | foto-15.png            | Luwak White Coffee merupakan bubuk biji kopi luwak yang dikombinasikan dengan gurihnya krimer serta manisnya gula. Keharuman kopi serta rasa manisnya yang pas juga membuat popularitas Luwak White Coffee melejit. |               4 |
| 16 | L113   | Teh Sosro 2       |      10000 |      15000 |   10 |       12 | .png                   | NULL


             |               1 |
| 18 | L0015  | Laptop Asus       |    3000000 |    5000000 |   10 |       20 | foto-65542ffa66604.jpg | NULL


             |               1 |
| 19 | TV0115 | Televisi 22 inc  |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 20 | TV0116 | Televisi 23 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 21 | TV0117 | Televisi 24 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 22 | TV0118 | Televisi 25 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 24 | TV0120 | Televisi 27 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 25 | TV0121 | Televisi 28 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 26 | TV0122 | Televisi 29 inc   |    3500000 |   50500000 |    5 |        2 | NULL                   | NULL


             |               1 |
| 27 | THP001 | Teh Pucuk         |       4000 |       5000 |   10 |        2 | pucuk.jpg              | Teh pucuk adalah


             |               4 |
| 28 | THP002 | Teh Pucuk2        |       4000 |       5000 |   10 |        2 | pucuk.jpg              | Teh pucuk adalah


             |               4 |
+----+--------+-------------------+------------+------------+------+----------+------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
21 rows in set (0.001 sec)
-- 3.	Tampilkan produk-produk televisi
MariaDB [dbpos_sib6]>  SELECT * FROM produk WHERE nama LIKE '%Televisi%';
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode   | nama              | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
|  1 | TV01   | Televisi 21 inchs |    3500000 |   50500000 |    5 |        2 |      | NULL      |               1 |
|  2 | TV02   | Televisi 40 inch  |    5500000 |    7440000 |    4 |        2 | NULL | NULL      |               1 |
| 19 | TV0115 | Televisi 22 inc  |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 20 | TV0116 | Televisi 23 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 21 | TV0117 | Televisi 24 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 22 | TV0118 | Televisi 25 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 24 | TV0120 | Televisi 27 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 25 | TV0121 | Televisi 28 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
| 26 | TV0122 | Televisi 29 inc   |    3500000 |   50500000 |    5 |        2 | NULL | NULL      |               1 |
+----+--------+-------------------+------------+------------+------+----------+------+-----------+-----------------+
9 rows in set (0.001 sec)
-- 4.	Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE nama LIKE '%SA%';
+----+------+-------------+----+-----------+------------+------------------+----------+
| id | kode | nama        | jk | tmp_lahir | tgl_lahir  | email            | kartu_id |
+----+------+-------------+----+-----------+------------+------------------+----------+
|  9 | C009 | Ahmad Hasan | L  | Surabaya  | 1992-10-15 | ahasan@gmail.com |        4 |
| 10 | C010 | Cassanndra  | P  | Belfast   | 1990-11-20 | casa90@gmail.com |        1 |
+----+------+-------------+----+-----------+------------+------------------+----------+
2 rows in set (0.000 sec)
-- 5.	Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbpos_sib6]>  SELECT * FROM pelanggan WHERE tmp_lahir != 'Jakarta' AND nama LIKE '%yo%';
Empty set (0.001 sec)
-- 6.	Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan WHERE SUBSTRING(nama, 2, 1) =
'A';
+----+------+--------------+----+------------+------------+------------------+----------+
| id | kode | nama         | jk | tmp_lahir  | tgl_lahir  | email
 | kartu_id |
+----+------+--------------+----+------------+------------+------------------+----------+
|  2 | C002 | Pandan Wangi | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com  |        2 |
|  6 | C006 | Gayatri Dwi  | P  | Jakarta    | 1987-11-28 | gaya87@gmail.com |        1 |
| 10 | C010 | Cassanndra   | P  | Belfast    | 1990-11-20 | casa90@gmail.com |        1 |
+----+------+--------------+----+------------+------------+------------------+----------+
3 rows in set (0.001 sec)
-- 2.4 
-- 1.	Tampilkan 2 data produk termahal
MariaDB [dbpos_sib6]> SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode | nama            | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
| 11 | L005 | Laptop Lenovo   |   13000000 |   16000000 |    5 |        2 |      | NULL      |               1 |
|  9 | LN01 | Notebook Lenovo |    9000000 |   12480000 |    9 |        2 | NULL | NULL      |               5 |
+----+------+-----------------+------------+------------+------+----------+------+-----------+-----------------+
2 rows in set (0.001 sec)
-- 2.	Tampilkan produk yang paling murah
MariaDB [dbpos_sib6]> SELECT * FROM produk ORDER BY harga_beli ASC LIMIT 1;
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | foto       | deskripsi | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
|  7 | TB01 | Teh Botol |       2000 |       2500 |   53 |       10 | foto-7.jpg | NULL      |               4 |
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
1 row in set (0.001 sec)
-- 3.	Tampilkan produk yang stoknya paling banyak
MariaDB [dbpos_sib6]> SELECT * FROM produk ORDER BY stok DESC LIMIT 1;
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | foto       | deskripsi | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
|  7 | TB01 | Teh Botol |       2000 |       2500 |   53 |       10 | foto-7.jpg | NULL      |               4 |
+----+------+-----------+------------+------------+------+----------+------------+-----------+-----------------+
1 row in set (0.000 sec)
-- 4.	Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbpos_sib6]> SELECT * FROM produk ORDER BY stok ASC LIMIT 2;
+----+------+------------------+------------+------------+------+----------+------+-----------+-----------------+
| id | kode | nama             | harga_beli | harga_jual | stok | min_stok | foto | deskripsi | jenis_produk_id |
+----+------+------------------+------------+------------+------+----------+------+-----------+-----------------+
|  2 | TV02 | Televisi 40 inch |    5500000 |    7440000 |    4 |        2 | NULL | NULL      |               1 |
|  4 | M001 | Meja Makan       |     500000 |     600000 |    4 |        3 | NULL | NULL      |               2 |
+----+------+------------------+------------+------------+------+----------+------+-----------+-----------------+
2 rows in set (0.000 sec)
-- 5.	Tampilkan pelanggan yang paling muda
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan ORDER BY tgl_lahir ASC LIMIT 1
;
+----+------+--------------+----+------------+------------+-----------------+----------+
| id | kode | nama         | jk | tmp_lahir  | tgl_lahir  | email
| kartu_id |
+----+------+--------------+----+------------+------------+-----------------+----------+
|  2 | C002 | Pandan Wangi | P  | Yogyakarta | 1950-01-01 | wangi@gmail.com |        2 |
+----+------+--------------+----+------------+------------+-----------------+----------+
1 row in set (0.000 sec)
-- 6.	Tampilkan pelanggan yang paling tua
MariaDB [dbpos_sib6]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT
1;
+----+-------+------+----+-----------+------------+---------------+----------+
| id | kode  | nama | jk | tmp_lahir | tgl_lahir  | email         | kartu_id |
+----+-------+------+----+-----------+------------+---------------+----------+
| 12 | K0011 | Ira  | P  | Jakarta   | 2023-11-07 | ira@gmail.com |        4 |
+----+-------+------+----+-----------+------------+---------------+----------+
1 row in set (0.000 sec)

