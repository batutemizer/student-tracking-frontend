import 'package:flutter/material.dart';

class OgrenciGelisimRaporuSayfasi extends StatelessWidget {
  final String studentReport;

  OgrenciGelisimRaporuSayfasi({required this.studentReport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Gelişim Raporu'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.orange],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Öğrenci Gelişim Raporu:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    studentReport,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
