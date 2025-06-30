import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_firebase_project/Home_Screen.dart';
import 'package:google_signin_firebase_project/SignInWithGoogle.dart';

class SigninScreen extends StatefulWidget {

   SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GoogleAuthService _authService = GoogleAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Google Login",style: TextStyle(
            color: Colors.black
        ),),),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                 User?user= await _authService.SignInWithGoogle();
                 if(user != null){
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => HomeScreen(user:user),));
                 }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      spacing: 80,
                      children: [
                        Image.asset("assets/image/google.png",
                          height: 30,width: 30,),

                        Text("Continue with Google",style:TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
