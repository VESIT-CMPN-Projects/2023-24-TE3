import 'package:flutter/cupertino.dart';

import '../home_page.dart';

class AppHeader extends StatelessWidget {

  Widget currentTab = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height : 200,
      color: Color.fromRGBO(255, 221, 230, 1.0),
      child: Center(child: Text("Welcome to our app",style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),)),
    );
  }
}
