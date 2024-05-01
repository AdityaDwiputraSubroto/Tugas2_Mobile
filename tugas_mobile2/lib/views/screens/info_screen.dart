import 'package:flutter/material.dart';
import 'package:tugas_mobile2/utils/colors.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildHelpItem(
            context,
            'Menampilkan Bilangan Prima',
            '1. Buka aplikasi dan masukkan angka yang ingin Anda periksa apakah bilangan prima atau bukan.\n'
                '2. Klik tombol "Check".\n'
                '3. Aplikasi akan menampilkan hasil apakah angka tersebut prima atau bukan.',
          ),
          _buildHelpItem(
            context,
            'Penghitung Luas dan Keliling Segitiga',
            '1. Buka aplikasi dan masukkan panjang sisi segitiga yang diinginkan.\n'
                '2. Klik tombol "Hitung Luas" untuk menghitung luas segitiga.\n'
                '3. Klik tombol "Hitung Keliling" untuk menghitung keliling segitiga.\n'
                '4. Aplikasi akan menampilkan hasil perhitungan luas dan keliling segitiga.',
          ),
          _buildHelpItem(
            context,
            'Stopwatch',
            '1. Buka aplikasi dan klik tombol "Start" untuk memulai stopwatch.\n'
                '2. Klik tombol "Stop" untuk menghentikan stopwatch.\n'
                '3. Klik tombol "Reset" untuk mengatur ulang stopwatch ke nol.',
          ),
          _buildHelpItem(
            context,
            'Situs Rekomendasi',
            '1. Buka aplikasi dan temukan daftar situs rekomendasi.\n'
                '2. Klik ikon hati ("Favorite") di samping situs web yang ingin Anda tandai sebagai favorit.\n'
                '3. Situs web favorit akan ditambahkan ke menu "Favorite".\n'
                '4. Untuk membuka situs web favorit, cukup klik situs web dari menu "Favorite".\n'
                '5. Jika Anda ingin menghapus situs web dari daftar favorit, klik ikon hati lagi untuk membatalkan tanda favoritnya.',
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(
      BuildContext context, String title, String description) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Implementasi untuk menampilkan detail bantuan jika diperlukan
          // Misalnya menampilkan dialog dengan deskripsi lengkap
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
