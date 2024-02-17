import 'package:flutter/material.dart';
import 'package:ted_1/screens/first_page.dart';
import 'second_screen.dart';

class LoginPage extends StatefulWidget {
  final bool isTeacher;

  const LoginPage({Key? key, required this.isTeacher}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  ' ÖĞRENCİ GİRİŞ ',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 63, 70),
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  'Öğrenci Numarası',
                  Icons.person,
                  usernameController,
                ),
                const SizedBox(height: 16.0),
                _buildTextField(
                  'Şifre',
                  Icons.lock,
                  passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    validateLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 24.0),
                  ),
                  child: isLoginSuccessful
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                      : const Text(
                          'Giriş Yap',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Yazı rengi siyah
                          ),
                        ),
                ),
                const SizedBox(height: 5.0),
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
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black), // Ok ikonu rengi siyah
                  label: const Text(
                    'Geri Dön',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold, // Kalın yazı
                      color: Colors.black, // Yazı rengi siyah
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 14.0),
                    backgroundColor: Theme.of(context).colorScheme.background,
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

  void validateLogin(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // Öğrenci girişi
    if (!widget.isTeacher &&
        (username == '27' || username == '28') &&
        password == '1234') {
      setState(() {
        isLoginSuccessful = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(
              enteredUsername: username,
              isMouseOver: false,
            ),
          ),
        );
      });
    }
    // Öğretmen girişi
    else if (widget.isTeacher &&
        username == 'teacher' &&
        password == 'password') {
      setState(() {
        isLoginSuccessful = true;
      });

      Future.delayed(const Duration(seconds: 2), () {});
    } else {
      showSnackBar('Kullanıcı adı veya şifre hatalı.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
