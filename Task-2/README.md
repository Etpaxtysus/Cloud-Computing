# Cloud-Computing

## Task-2

### Case 1 :

Masuk ke dalam direktori `case1` terlebih dahulu:

```
cd docker/case1
```
Buat folder dengan nama `files` untuk menyimpan jokes :
```
mkdir files
```
Jalankan `run_process.sh` dengan cara :
```
chmod +x run_process.sh  
./run_process.sh         
```
Untuk melihat hasilnya, buka direktori `files` dengan cara :
```
ls ./files
```
Untuk menghentikan containernya, kita dapat menggunakan cara :
```
docker rm -f myprocess1
```

### Case 2 :

Masuk ke dalam direktori `case2` terlebih dahulu:

```
cd docker/case2
```
Jalankan `run_simple_web.sh` dengan cara :
```
chmod +x run_process.sh  
./run_process.sh         
```
Untuk melihat hasilnya, lakukan command berikut :
```
curl localhost:9999
```
Atau dengan cara membuka manual di browser dengan menuliskan :
```
http://localhost:9999
```
Untuk menghentikan containernya, kita dapat menggunakan cara :
```
docker rm -f webserver1
```

### Case 3 :

Masuk ke dalam direktori `case3` terlebih dahulu:

```
cd docker/case3
```
Buat folder dengan nama `dbdata` untuk menyimpan databasenya dengan cara :
```
mkdir dbdata
```

Jalankan `run_mysql.sh` dengan cara :
```
chmod +x run_process.sh  
./run_mysql.sh        
```
Jalankan `run_myadmin.sh` dengan cara :
```
chmod +x run_process.sh  
./run_myadmin.sh
```

Lalu akses phpMyAdmin dengan pada browser dengan cara menuliskan :
```
http://localhost:10000
```
Login dengan menggunakan username `'root'` dan password `'mydb6789tyui'` untuk mengelola database mydb.

Untuk menghentikan containernya, kita dapat menggunakan cara :
```
docker rm -f mysql1
docker rm -f phpmyadmin1
```
### Case 4 :

Masuk ke dalam direktori `case4` terlebih dahulu :

```
cd docker/case4
```
Jalankan `log_generator.py` dan tunggu sampai proses generate log nya selesai :
```
python3 log_generate.py
```
Kemudian jalankan `run_web.sh`
```
chmod +x run_web.sh  
./run_web.sh
```

