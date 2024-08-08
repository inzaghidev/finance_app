import 'dart:js';

import 'package:finance_app/screens/dashboard.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/login_screen.dart';
import 'package:finance_app/utils/appvalidator.dart';

// ignore: must_be_immutable

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _usernameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController,
        'remainingAmount': 0,
        'totalCredit': 0,
        'totalDebit': 0,
      };

      await authService.createUser(data, context);
      //Navigator.pushReplacement(
      //  context as BuildContext,
      //  MaterialPageRoute(builder: (context) => Dashboard()),
      //);

      setState(() {
        isLoader = true;
      });

      ScaffoldMessenger.of(_formKey.currentContext!)
          .showSnackBar(const SnackBar(
        content: Text('Form submitted successfully!'),
      ));
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323556),
      body: SingleChildScrollView(
        // Wrap Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Create new Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Username", Icons.person),
                    validator: appValidator.validateUsername),
                SizedBox(
                  height: 16.0,
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      _buildInputDecoration("Phone Number", Icons.email),
                  validator: appValidator.validatePhoneNumber,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
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
                          : Text("Create", style: TextStyle(fontSize: 20))),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color(0xFFF15900), fontSize: 25),
                    ))
              ],
            ),
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
