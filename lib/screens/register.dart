import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatelessWidget {
const Register({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore database = FirebaseFirestore.instance;

    final String Username = usernameController.text;
    final String email = emailController.text;
    final String Password = passwordController.text;
    
    try {
       final UserCredential Users = await auth.createUserWithEmailAndPassword(email: email, password: Password);
       await database.collection("users").doc(Users.user!.uid).set({
        "username": Username,
        "email": email,
      });
    } catch (e) {
      print("error = $e");
    }
   
  }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Welcome",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),),
            const Text(
              "Flutter Authentication",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Username",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Already have an account? Signin",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}