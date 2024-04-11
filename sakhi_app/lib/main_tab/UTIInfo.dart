import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/chatbot_ui.dart';
import 'package:sakhi_app/query_bot.dart';
class UTIInfo extends StatefulWidget {
  const UTIInfo({super.key});

  @override
  State<UTIInfo> createState() => _UTIInfoState();
}

class _UTIInfoState extends State<UTIInfo> {
  void navigator(page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return page;
    }));
  }
  var overFlow=TextOverflow.fade;
  var maxLines=3;
  var buttontext="Read More";
  void tohomepage() {
    Navigator.of(context).pop();
  }

  void readmore(){
    if(buttontext=="Read More"){
      setState(() {
        overFlow=TextOverflow.visible;
        maxLines=100;
        buttontext="Read Less";
      });
    }
    else{
      setState(() {
        overFlow=TextOverflow.fade;
        maxLines=3;
        buttontext="Read More";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            leading:
                IconButton(onPressed: tohomepage, icon: Icon(Icons.arrow_back)),
            title: Text("About UTI")),
        body: Center(
          child: Column(children: [
            Container(
              child: Center(child: Text("UTI",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),)),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                image:DecorationImage(image:NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fweb-image196654477&psig=AOvVaw0zAoB8yjrHRFttcK6-iOBX&ust=1710041678872000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOiRsOuf5oQDFQAAAAAdAAAAABAD"))
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      "A urinary tract infection (UTI) is an infection in any part of the urinary system. The urinary system includes the kidneys, ureters, bladder and urethra. Most infections involve the lower urinary tract — the bladder and the urethra."+
                          "Women are at greater risk of developing a UTI than are men. If an infection is limited to the bladder, it can be painful and annoying. But serious health problems can result if a UTI spreads to the kidneys."+
                          "Urine (pee) is a byproduct of your blood-filtering system, which your kidneys perform. Your kidneys create pee when they remove waste products and excess water from your blood. Pee usually moves through your urinary system without any contamination. However, bacteria can get into your urinary system, which can cause UTIs.",
                          maxLines: maxLines,
                          overflow:overFlow,
                          ),
                  ),
                  TextButton(onPressed: readmore, 
                  child: Text(buttontext))
              ],
            ),
            Divider(),
            Text("Wanna tryout a test for detecting UTI ?"),
            ElevatedButton(onPressed: (){
              navigator(Home());
            }, 
            child: Text("Click here now"))
          ]),
        ));
  
  }
}