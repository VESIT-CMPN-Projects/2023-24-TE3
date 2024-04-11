
import 'package:flutter/material.dart';
import 'package:sakhi_app/main_tab/EndoInfo.dart';
import 'package:sakhi_app/main_tab/PCOS_info.dart';
import 'package:sakhi_app/main_tab/UTIInfo.dart';

import 'main_tab/main_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigator(page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.green,
                child: const Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      //backgroundImage: NetworkImage(""),
                      radius: 60,
                    ),
                    Text(
                      "Hi <Username>",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ]
                )
              )
            ]
            )
      ),
        
      body: Column(
        children: [
          // Include the HeaderWidget
          AppHeader(),
          // Add other widgets below the header
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        navigator(PCOSInfo());
                      },
                      child: CircleAvatar(radius: 120,
                      child:Text("PCOS") ,//Images needed instead of text
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigator(EndoInfo());
                      },
                      child: CircleAvatar(radius: 120,
                      child: Text("Endometriosis"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigator(UTIInfo());
                      },
                      child: CircleAvatar(radius: 120,
                      child: Text("UTI"),),
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}