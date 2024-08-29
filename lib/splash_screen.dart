import 'dart:async';

import 'package:ch9_app/login_screen.dart';
import 'package:ch9_app/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:ch9_app/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Call the isLogin method to check the login status
    isLogin();

  }

  // Method to check if the user is logged in or not
  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false; // null check to set default to false
String userType  =sp.getString('Usertype')?? '';

    if (isLogin) {
      if(userType=='student'){
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
        });
      } else if (userType=='teacher') {
        // Navigate to LoginScreen after 3 seconds if not logged in
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });}
      else{
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });}
        // Navigate to HomeScreen after 3 seconds if logged in
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
      // Navigate to LoginScreen after 3 seconds if not logged in
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/3844788/pexels-photo-3844788.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
