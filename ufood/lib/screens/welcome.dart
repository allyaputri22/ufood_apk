import 'package:flutter/material.dart';
import 'package:ufood/screens/login.dart';
import 'package:ufood/screens/register.dart';
import 'package:ufood/shared/shared.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              SizedBox(height: 95),
              Image.asset(
                "assets/images/welcome.png",
                height: 254,
                width: 276,
              ),
              SizedBox(height: 25),
              Text(
                "Selamat Datang",
                style: formTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                "UFOOD adalah aplikasi pesan antar makanan di area kampus Unsika",
                style: whiteTextStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: thirdColor,
                    foregroundColor: whiteColor, // Warna teks tombol
                    textStyle: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor,
                    side: BorderSide(color: Colors.black),
                    textStyle: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
