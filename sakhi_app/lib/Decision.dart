import 'package:flutter/material.dart';

class DecisionsPage extends StatefulWidget {
  final String decision;
   DecisionsPage({
    super.key,
    required this.decision,
    });

  @override
  State<DecisionsPage> createState() => _DecisionsPageState();
}

class _DecisionsPageState extends State<DecisionsPage> {
  void navigateback(){
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: navigateback, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.decision==""?CircularProgressIndicator():Text(widget.decision)
          ],
        ),
      ),
    );
  }
}