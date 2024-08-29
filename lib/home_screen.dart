import 'package:ch9_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email='', age=''; //initilize to be shown data
  @override
  void initState(){
    super.initState();
    loadData();}
  loadData () async {
    SharedPreferences sp =await SharedPreferences .getInstance();//now is turn to show user data
  email = sp.getString('email')?? '';//can't be null so give empty string
    age = sp .getString('age')??'';//here ?? is called null-coalesing operator used to provide default value in case the variable is null
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       title:Text('homeScreen'),
        automaticallyImplyLeading: false,
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
        Text('Homescreen'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Email'),
                Text(email.toString())
              ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('Age'),
                  Text(age.toString())
                ]
            ),
            SizedBox(height:40),
            Center(
              child: InkWell(
                onTap:()async {
                  SharedPreferences sp = await SharedPreferences .getInstance();
                  sp.clear();
                  Navigator.push(
                      context, MaterialPageRoute(
                          builder: (context)=>LoginScreen()));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color:Colors.green,
                  child:const  Center(
                    child: Text(
                        'login'
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}
