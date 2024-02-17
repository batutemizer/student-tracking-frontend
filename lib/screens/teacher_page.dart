import 'package:flutter/material.dart';
import 'teacher_page2.dart';
import 'first_page.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key, required this.enteredUsername})
      : super(key: key);

  final String enteredUsername;

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
                const Text(
                  'ÖĞRETMEN GİRİŞ',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 63, 70),
                    fontFamily: 'Your-Preferred-Font',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                _buildTextField(
                  'Kullanıcı Adı',
                  Icons.person,
                  usernameController,
                ),
                const SizedBox(height: 14.0),
                _buildTextField(
                  'Şifre',
                  Icons.lock,
                  passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 18.0),
                ElevatedButton(
                  onPressed: () {
                    validateLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: isLoginSuccessful
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                      : const Text(
                          'GİRİŞ YAP',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight:
                                FontWeight.bold, // Kalınlaştırma eklendi
                          ),
                        ),
                ),
                const SizedBox(height: 14.0),
                if (isLoginSuccessful)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Giriş başarılı, yönlendiriliyorsunuz...',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 14.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black), // İkon rengini siyah yaptık
                  label: Text(
                    'Geri Dön',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black, // Yazı rengini siyah yaptık
                        fontWeight: FontWeight.bold), // Kalınlaştırma eklendi
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12.0),
                    primary: Theme.of(context).backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
    IconData prefixIcon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(prefixIcon, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  void validateLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "mustafayavuz2" && password == "123456") {
      setState(() {
        isLoginSuccessful = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TeacherPage2(),
            ));
      });
    } else {
      showSnackBar('Kullanıcı adı veya şifre yanlış. Tekrar gir.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
