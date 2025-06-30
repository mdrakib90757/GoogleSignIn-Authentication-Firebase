import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_firebase_project/SignInWithGoogle.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleAuthService _authService= GoogleAuthService();
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
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photoURL??""),
              radius: 40,
            ),
            SizedBox(height: 20,),
            Text("Name-${widget.user.displayName}"),
            SizedBox(height: 8,),
            Text("Email-${widget.user.email}"),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                _authService.signOut();
                Navigator.pop(context);
              },
              child: Text("SignOut"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red.shade700
              ),)
          ],
        )
      ),
    );
  }
}
