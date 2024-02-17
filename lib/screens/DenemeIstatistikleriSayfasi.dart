import 'dart:math';

import 'package:flutter/material.dart';

class DenemeIstatistikleriSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deneme İstatistikleri'),
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
                    'Deneme İstatistikleri:',
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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildStatisticsItem('Bilgi Sarmalı TYT',
                            'Başarı Oranı: ${Random().nextDouble()}'),
                        _buildStatisticsItem('Apotemi TYT',
                            'Başarı Oranı: ${Random().nextDouble()}'),
                        _buildStatisticsItem('Çap TYT',
                            'Başarı Oranı: ${Random().nextDouble()}'),
                        // ...
                      ],
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

  Widget _buildStatisticsItem(String exam, String successRate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exam,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          successRate,
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
