import 'package:flutter/material.dart';
import 'package:ufood/screens/register.dart';
import 'package:ufood/shared/shared.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isFormValid = false; 
  bool isButtonClicked = false; 

  @override
  void initState() {
    super.initState();
    
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  
  void _validateForm() {
    setState(() {
      isFormValid = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  
  void _onButtonPressed() {
    if (isFormValid) {
      setState(() {
        isButtonClicked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Masukan Email dan Password anda!',
                  style: TextStyle(
                    color: thirdColor,
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  height: 50,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          _onButtonPressed();
                        }
                      : null, // Nonaktifkan tombol jika form tidak valid
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? (isButtonClicked ? Colors.grey : primaryColor)
                        : Colors.grey[
                            400], // Jika form valid, tampilkan warna aktif, jika sudah diklik, ubah jadi abu-abu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(8),
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun?',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                          color: thirdColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
