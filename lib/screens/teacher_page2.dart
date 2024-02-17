import 'package:flutter/material.dart';
import 'deneme_sonuclari2.dart';
import 'deneme_istatistikleri2.dart';
import 'ogretmen_raporu2.dart';
import 'ogretmen_raporu3.dart';
import 'teacher_page.dart';

class TeacherPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEDANALYSIS'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.orange],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'lib/assets/images/tedlogo.png',
                  width: 160,
                  height: 160,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                '${TeacherPage(
                  enteredUsername: 'Mustafa YAVUZ',
                ).enteredUsername}',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              buildGradientButton(
                text: 'SON DENEME SONUÇLARI',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SonDenemeSonuclari2(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              buildGradientButton(
                text: 'DENEME İSTATİSTİKLERİ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DenemeIstatistikleri2(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              buildGradientButton(
                text: 'ÖĞRETMEN RAPORU EKLE',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgretmenRaporu2(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              buildGradientButton(
                text: 'GEÇMİŞ RAPORLAR',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgretmenRaporu3(),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherPage(
                          enteredUsername: TeacherPage(
                            enteredUsername: '',
                          ).enteredUsername,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text('ÇIKIŞ YAP'),
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // Yuvarlaklık
                    ),
                    primary: Color.fromARGB(255, 65, 157, 219),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGradientButton(
      {required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Yuvarlaklık
        ),
        primary: Color.fromARGB(255, 65, 157, 219),
        onPrimary: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
