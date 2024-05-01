import 'package:flutter/material.dart';
import 'package:tugas_mobile2/utils/colors.dart';

class BilanganPrima extends StatefulWidget {
  const BilanganPrima({Key? key}) : super(key: key);

  @override
  State<BilanganPrima> createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima> {
  TextEditingController _numberController = TextEditingController();
  String _result = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menentukan Bilangan Prima',
          style: TextStyle(
            color: ColorsCalc.hexToColor(ColorsCalc.white),
            fontSize: 18.0,
          ),
        ),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Angka',
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16),
            //check bil prima
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  int? number = int.tryParse(_numberController.text);
                  if (number != null && number > 0) {
                    bool isPrimeNumber = isPrime(number);
                    setState(() {
                      _result = isPrimeNumber
                          ? '$number adalah bilangan prima'
                          : '$number bukan bilangan prima';
                    });
                  } else {
                    setState(() {
                      _result = 'Masukkan bilangan positif!';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsCalc.hexToColor(ColorsCalc.orange),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Check',
                  style: TextStyle(
                    color: ColorsCalc.hexToColor(ColorsCalc.green),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '$_result',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
