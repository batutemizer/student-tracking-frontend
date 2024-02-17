import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ted_1/main.dart';

void main() {
  testWidgets('Login App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginApp());

    // Burada öğrenci numarası ve şifre alanlarını bulalım.
    final usernameField = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration!.labelText == 'Öğrenci Numarası');
    final passwordField = find.byWidgetPredicate((widget) =>
        widget is TextField && widget.decoration!.labelText == 'Şifre');

    // TextField'lar var mı kontrol edelim.
    expect(usernameField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    // Kullanıcı adı ve şifre alanlarına değerler girilsin.
    await tester.enterText(usernameField, '12345');
    await tester.enterText(passwordField, '1234');

    // Login butonuna tıklayalım.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Animasyonlar tamamlansın.

    // Giriş başarılı olmalı, bu nedenle "Giriş Başarılı" mesajını bulmalıyız.
    expect(
        find.text('Giriş Başarılı, Yönlendiriliyorsunuz...'), findsOneWidget);

    // Bir süre bekleyip ikinci ekrana geçiş yapılsın.
    await tester.pump(const Duration(seconds: 2));

    // İkinci ekranda "Hoş geldin! Bu ikinci ekran." yazısı bulunmalı.
    expect(find.text('Hoş geldin! Bu ikinci ekran.'), findsOneWidget);
  });
}
