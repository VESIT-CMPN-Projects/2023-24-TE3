import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/home_page.dart';
import 'package:sakhi_app/login_page.dart';
import 'package:sakhi_app/uihelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

    signUp(String email, String password)async{
      if (email=="" && password==""){
        UiHelper.CustomAlertBox(context, "Enter required fields");
      }
      else{
        UserCredential? usercredential;
        try{
          usercredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          });
        }
        on FirebaseAuthException catch(ex){
          return UiHelper.CustomAlertBox(context, ex.code.toString());
        }
      }
    }
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController= TextEditingController();
    final TextEditingController passController = TextEditingController();
    final borderprops =
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)));
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 221, 230, 1.0),
        body: SafeArea(
            child: Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color.fromARGB(255, 247, 145, 179),
                //       Colors.white,
                //     ],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //   ),
                // ), padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
                    UiHelper.CustomTextField(passController, "Password", Icons.password, true),
                    SizedBox(height:30),
                    UiHelper.CustomButton(() {
                      signUp(emailController.text.toString(), passController.text.toString());
                    }, "Sign Up"),
                    SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?", style:TextStyle(fontSize:16),),

                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        }, child: Text("Login", style:TextStyle(fontSize:20, fontWeight:FontWeight.w600, color: Colors.black)))
                      ],
                    )

                  ],

                )



            ))
    );
  }
}