import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/login_screen.dart';
import 'package:finance_app/screens/transaction_screen.dart';
import 'package:finance_app/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var PageViewList = [HomeScreen(), TransactionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: isLogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.exit_to_app))
        ],
      ),
      body: PageViewList[currentIndex],
    );
  }
}
