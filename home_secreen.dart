import 'package:flutter/material.dart';
import 'package:tugas2_tpm/utils/colors.dart';
import 'package:tugas2_tpm/views/secreens/bilangan_prima.dart';
import 'package:tugas2_tpm/views/secreens/segitiga.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 228, 228),
        title: Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Halaman Utama',
              style: TextStyle(color: Colors.black, fontSize: 18.0), 
            ),
          ],
        ),
        elevation: 4,
      ),
      body: Center( // Center widget di sini
        child: ListView(
          padding: EdgeInsets.all(16.0),
          shrinkWrap: true, // Mengizinkan ListView untuk menyesuaikan ukuran anak-anaknya
          children: [
            MenuItemCard(
              title: 'Daftar Anggota',
              icon: Icons.people,
              onTap: () {
                // Tambahkan navigasi ke halaman Daftar Anggota di sini
              },
            ),
            MenuItemCard(
              title: 'Bilangan Prima',
              icon: Icons.check_circle_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BilanganPrima()),
                );
              },
            ),
            MenuItemCard(
              title: 'Luas dan Keliling Segitiga',
              icon: Icons.change_history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Segitiga()),
                );
              },
            ),
            MenuItemCard(
              title: 'Situs Rekomendasi',
              icon: Icons.link,
              onTap: () {
                // Tambahkan navigasi ke halaman Situs Rekomendasi di sini
              },
            ),
            MenuItemCard(
              title: 'Favorite',
              icon: Icons.favorite,
              onTap: () {
                // Tambahkan navigasi ke halaman Favorite di sini
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItemCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: ColorsCalc.hexToColor(ColorsCalc.green), // Ubah warna background card
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 36.0, color: Color.fromRGBO(183, 192, 14, 1)), // Ubah warna ikon menjadi putih
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18.0, color: ColorsCalc.hexToColor(ColorsCalc.white)), // Ubah warna teks menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

