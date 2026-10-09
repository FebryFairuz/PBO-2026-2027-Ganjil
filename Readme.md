# Sample 1

Program Java sederhana yang mencetak teks `hello`.

## Isi Program

`Main.java`:

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("hello");
    }
}
```

## Prasyarat

- Java Development Kit (JDK) sudah terpasang. Cek dengan:

  ```bash
  java -version
  javac -version
  ```

## Cara Menjalankan

1. Buka terminal di folder ini (`sample-1`):

   ```bash
   cd /Users/febryfairuz/Documents/IBIK/2026-2027/PBO/study-cases/sample-1
   ```

2. Compile file `.java` menjadi bytecode `.class`:

   ```bash
   javac Main.java
   ```

3. Jalankan program:

   ```bash
   java Main
   ```

## Hasil

Setelah dijalankan, output yang muncul:

```
hello
```

## Kenapa muncul file `.class`?

`javac` adalah **Java Compiler** (kompiler Java). Tugasnya menerjemahkan kode sumber yang kamu tulis (file `.java`) menjadi **bytecode** (file `.class`).

Prosesnya:

```
Main.java  ──(javac / kompilasi)──►  Main.class  ──(java / dijalankan)──►  output "hello"
   kode sumber                       bytecode                            hasil di terminal
   (bisa dibaca manusia)             (dibaca mesin)
```

### Isi file `.class`

File `.class` berisi **bytecode**, yaitu instruksi level rendah dalam format khusus yang dimengerti oleh **Java Virtual Machine (JVM)** — bukan kode mesin untuk CPU tertentu, dan bukan lagi teks yang mudah dibaca manusia.

Contoh: baris `System.out.println("hello")` di `Main.java`, setelah dikompilasi menjadi sekumpulan instruksi bytecode seperti `getstatic`, `ldc`, `invokevirtual`, `return`, dst.

### Kenapa harus lewat tahap ini dulu?

1. **Java itu bahasa yang dikompilasi + diinterpretasi (hybrid).** Jadi ada dua tahap:
   - **Kompilasi** (`javac`): mengubah `.java` → `.class`.
   - **Eksekusi** (`java`): JVM membaca dan menjalankan `.class`.
2. **JVM tidak membaca `.java` langsung.** Yang dijalankan oleh perintah `java Main` adalah bytecode di `Main.class`, bukan file teks `Main.java`.
3. **Portabilitas (write once, run anywhere).** Karena `.class` berisi bytecode yang bersifat universal, file `.class` yang sama bisa dijalankan di JVM di sistem operasi mana pun (Windows, macOS, Linux) tanpa perlu dikompilasi ulang.

### Singkatnya

- `javac` = **compiler**, tugasnya mengubah kode sumber menjadi bytecode.
- `.class` = **hasil kompilasi** (bytecode) yang siap dijalankan JVM.
- `.java` = kode sumber yang kamu tulis dan baca.
- `.class` muncul secara otomatis setiap kali kamu menjalankan `javac`, dan selalu diperlukan agar program bisa dijalankan dengan `java`.

Untuk melihat isi bytecode, gunakan perintah:

```bash
javap -c Main
```

## Catatan penting

- Nama file harus sama persis dengan nama class: `public class Main` → file bernama `Main.java`. ✅ (sudah sesuai)
- Langkah compile (`javac`) wajib dilakukan **sebelum** `java`, karena Java butuh file bytecode (`Main.class`).
- Setelah di-compile, akan muncul file `Main.class` di folder yang sama. File itu yang dijalankan oleh `java Main` (tanpa ekstensi `.class`).
- Untuk menjalankan lagi setelah ada perubahan kode, ulangi `javac Main.java` dulu.

## Memisahkan file `.class` ke folder `class/`

Secara default, `javac sample-1/Main.java` menaruh `Main.class` **di sebelah** file `.java`-nya, sehingga folder kode jadi bercampur dengan hasil kompilasi. Agar rapi, semua `.class` bisa dikumpulkan di folder `class/` di root project, dipisah per sample:

```
class/
├── sample-1/Main.class
└── sample-2/Main.class
            Students.class
```

### Kuncinya ada di opsi `-d`

`javac` tidak bisa menebak folder tujuan sendiri, jadi folder tujuan harus ditulis lewat opsi `-d`. Jalankan dari root project:

```bash
javac -d class/sample-1 sample-1/*.java
java -cp class/sample-1 Main

javac -d class/sample-2 sample-2/*.java
java -cp class/sample-2 Main
```

- `-d class/sample-2` → simpan `.class` ke folder itu (folder dibuat otomatis kalau belum ada).
- `-cp class/sample-2` → beri tahu `java` di mana mencari `.class` (`cp` = *classpath*).
- `sample-2/*.java` → compile semua file `.java` di folder itu sekaligus (misalnya `Main.java` dan `Students.java`).

### Cara singkat: `run.sh`

Supaya tidak perlu mengetik perintah panjang, gunakan script `run.sh` di root project. Script ini meng-compile semua `.java` di folder sample ke `class/<folder>`, lalu langsung menjalankan `Main`:

```bash
./run.sh sample-1
./run.sh sample-2              # bisa nama folder
./run.sh sample-2/Main.java    # atau path file
```

### Membersihkan hasil kompilasi

Karena semua `.class` ada di satu tempat, cukup hapus folder `class/`:

```bash
rm -rf class
```

File `.class` akan dibuat ulang setiap kali kamu meng-compile lagi.
