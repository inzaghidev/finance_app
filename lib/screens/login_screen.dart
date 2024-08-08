import 'package:finance_app/screens/dashboard.dart';
import 'package:finance_app/screens/sign_up.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:finance_app/utils/appvalidator.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

// ignore: must_be_immutable

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "email": _emailController.text,
        "password": _passwordController
            .text, // Mengambil nilai teks dari _passwordController
      };

      await authService.login(data, context);

      setState(() {
        isLoader =
            false; // Perbaiki untuk mengembalikan isLoader menjadi false setelah selesai loading
      });
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323556),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Tambahkan Form widget di sekitar TextFormField
          key: _formKey, // Tambahkan key pada Form widget
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "Login Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 56.0,
              ),
              TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Email", Icons.email),
                  validator: appValidator.validateEmail),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true, // Hide password
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: appValidator.validatePassword,
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF15900)),
                    onPressed: () {
                      isLoader ? print("Loading") : _submitForm();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator())
                        : Text("Login", style: TextStyle(fontSize: 20))),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(color: Color(0xFFF15900), fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    ); // Scaffold
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: Color(0xAA494A59),
      filled: true,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0x35949494))),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelStyle: TextStyle(color: Color(0x35949494)),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: Color(0xFF949494),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
