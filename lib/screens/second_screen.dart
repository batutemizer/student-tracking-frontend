import 'package:flutter/material.dart';
import 'SonDenemeSonuclariSayfasi.dart';
import 'first_page.dart';
import 'DenemeIstatistikleriSayfasi.dart';
import 'OgretmenRaporuSayfasi.dart';
import 'OgrenciGelisimRaporuSayfasi.dart';

class SecondScreen extends StatelessWidget {
  final String enteredUsername;
  final bool isMouseOver;

  const SecondScreen({
    Key? key,
    required this.enteredUsername,
    required this.isMouseOver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayedName = getDisplayName(enteredUsername);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TEDANALYSIS'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.orange],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'lib/assets/images/tedlogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$displayedName',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '- $enteredUsername',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  buildGradientButton(
                    text: 'Son Deneme Sonuçları',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonDenemeSonuclariSayfasi(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  buildGradientButton(
                    text: 'Deneme İstatistikleri',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DenemeIstatistikleriSayfasi(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  buildGradientButton(
                    text: 'Öğretmen Raporu',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OgretmenRaporuSayfasi(
                            teacherReport: '',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  buildGradientButton(
                    text: 'Öğrenci Gelişim Raporu',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OgrenciGelisimRaporuSayfasi(
                            studentReport: '',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text(
                    'Çıkış Yap',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    primary: Color.fromARGB(255, 241, 241, 241),
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    elevation: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDisplayName(String username) {
    const String ahmetTugrulStudentNumber = '27';

    return username == ahmetTugrulStudentNumber ? 'Ahmet Tuğrul' : 'Sena BAL';
  }

  Widget buildGradientButton(
      {required String text, required VoidCallback onPressed}) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12.0),
            primary: Color.fromARGB(255, 65, 157, 219),
            onPrimary: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16.0,
            ),
            fixedSize: const Size(250, 50),
            elevation: 8,
          ),
          child: Text(text),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
