import 'package:flutter/material.dart';
import 'package:tugas2_tpm/utils/colors.dart';

class Segitiga extends StatefulWidget {
  const Segitiga({Key? key}) : super(key: key);

  @override
  State<Segitiga> createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  TextEditingController _alasController = TextEditingController();
  TextEditingController _tinggiController = TextEditingController();
  TextEditingController _sisiAController = TextEditingController();
  TextEditingController _sisiBController = TextEditingController();
  TextEditingController _sisiCController = TextEditingController();
  String _luasResult = '';
  String _kelilingResult = '';

  void _hitungLuas() {
    double alas = double.tryParse(_alasController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;
    //rumus luas
    double luas = 0.5 * alas * tinggi;

    setState(() {
      _luasResult = 'Luas : $luas';
    });
  }

void _hitungKeliling() {
  double sisiA = double.tryParse(_sisiAController.text) ?? 0;
  double sisiB = double.tryParse(_sisiBController.text) ?? 0;
  double sisiC = double.tryParse(_sisiCController.text) ?? 0;

  if (sisiA == 0 || sisiB == 0 || sisiC == 0) {
    setState(() {
      _kelilingResult = 'Masukkan semua sisi!';
    });
  } else {
    double keliling = sisiA + sisiB + sisiC;
    setState(() {
      _kelilingResult = 'Keliling : $keliling';
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Luas dan Keliling Segitiga',
          style: TextStyle(color: ColorsCalc.hexToColor(ColorsCalc.white), fontSize: 18.0,),
          
        ),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _alasController,
                keyboardType: TextInputType.number,
                //dekorasi
                decoration: InputDecoration(
                  labelText: 'Alas',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: _hitungLuas,
                style: ElevatedButton.styleFrom(
                  backgroundColor:  ColorsCalc.hexToColor(ColorsCalc.orange),
                ),
                child: Text('Hitung Luas', style: TextStyle(color: ColorsCalc.hexToColor(ColorsCalc.white)),),
              ),

              SizedBox(height: 16),

              Text(
                _luasResult,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32),

              // keliling
              TextField(
                controller: _sisiAController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sisi A',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sisiBController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sisi B',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sisiCController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sisi C',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _hitungKeliling,
                style: ElevatedButton.styleFrom(
                backgroundColor:  ColorsCalc.hexToColor(ColorsCalc.orange), 
                ),
                child: Text('Hitung Keliling',style: TextStyle(color: ColorsCalc.hexToColor(ColorsCalc.white)),),
              ),
              SizedBox(height: 16),
              if (_kelilingResult.isNotEmpty) // Tampilkan hasil keliling jika sudah dihitung
                Text(
                  _kelilingResult,
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
