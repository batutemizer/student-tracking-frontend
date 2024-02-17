import 'package:flutter/material.dart';
import 'package:ted_1/screens/login_page.dart';
import 'package:ted_1/screens/teacher_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/tedlogo.png',
                  width: 200, // İstediğiniz genişliği ayarlayabilirsiniz
                  height: 200, // İstediğiniz yüksekliği ayarlayabilirsiniz
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TeacherPage(enteredUsername: 'teacher')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    fixedSize: const Size(300, 60),
                  ),
                  icon: const Icon(Icons.person, size: 36.0),
                  label: const Text(
                    'Öğretmen Girişi',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage(isTeacher: false)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    fixedSize: const Size(300, 60),
                  ),
                  icon: const Icon(Icons.school, size: 36.0),
                  label: const Text(
                    'Öğrenci Girişi',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
