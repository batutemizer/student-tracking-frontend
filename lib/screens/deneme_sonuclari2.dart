import 'package:flutter/material.dart';

class SonDenemeSonuclari2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Son Deneme Sonuçları'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.orange],
          ),
        ),
        child: const Center(
          child: Text(
            'Bu sayfa Son Deneme Sonuçları sayfasıdır.',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
