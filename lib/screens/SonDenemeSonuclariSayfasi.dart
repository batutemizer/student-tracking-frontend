import 'dart:math';
import 'package:flutter/material.dart';

class SonDenemeSonuclariSayfasi extends StatelessWidget {
  final List<String> konular = [
    'Türkce',
    'Matematik1',
    'Cografya',
    'Tarih',
    'Din',
    'Felsefe',
    'Fizik',
    'Kimya',
    'Biyoloji',
    'Toplam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Son Deneme Sonuçları'),
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
                    'Son Deneme Sonuçları:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Divider(
                    color: Colors.black,
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < 10; i++)
                            _buildResultItem(
                              konular[i],
                              'Doğru: ${Random().nextInt(30)}, Yanlış: ${Random().nextInt(10)}',
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultItem(String topic, String result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topic,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          result,
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 12.0),
        Divider(
          color: Colors.black,
          height: 1,
          thickness: 1,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
