import 'package:ch9_app/User_screen.dart';
import 'package:ch9_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ch9_app/teacher_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller:emailController,
                decoration: const InputDecoration(
                   hintText: 'email',
                ),

              ),
             const  SizedBox(height:20),
              TextFormField(
                controller:passwordController,
                decoration:const  InputDecoration(
                  hintText: 'password',
                ),

              ),
              const SizedBox(height:20),
              TextFormField(
                controller:ageController,
                keyboardType: TextInputType.number,
                decoration:const  InputDecoration(
                  hintText: 'age',
                ),

              ),
              const  SizedBox(height:20),
              Material(
                child: InkWell(
                  onTap:()async {
                   SharedPreferences sp = await SharedPreferences .getInstance();
                sp.setString('email',emailController.text.toString() );
                sp.setString('age', ageController.text.toString());
                sp.setString('UserType', 'teacher');//user may be admin,student,or teacher
                   sp.setBool('islogin',true);
                   if(sp.getString('UserType')=='teacher'){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
    }
    else if(sp.getString('UserType')=='student'){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen()));
                   }
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
              )

            ],
          ),
      ),);

  }

}
