import 'package:flutter/material.dart';
import 'package:tugas_mobile2/utils/colors.dart';

class DataKelompokScreen extends StatefulWidget {
  @override
  State<DataKelompokScreen> createState() => _DataKelompokScreenState();
}

class _DataKelompokScreenState extends State<DataKelompokScreen> {
  final List<Map<String, String>> profiles = [
    {
      'name': 'Aditya Dwiputra Subroto',
      'nim': '123210053',
    },
    {
      'name': 'Nuriyatus Sholihah',
      'nim': '123210129',
    },
    {
      'name': 'Nicholas Gendy Putra Mahardika',
      'nim': '123210017',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Kelompok',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme:
            IconThemeData(color: ColorsCalc.hexToColor(ColorsCalc.white)),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Anggota Kelompok',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              // Set the shrinkWrap property to true to avoid unnecessary scrolling
              shrinkWrap: true,
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return _profileCard(profiles[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard(Map<String, String> profile) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            profile['name']!, // Access name using index
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            profile['nim']!, // Access nim using index
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
