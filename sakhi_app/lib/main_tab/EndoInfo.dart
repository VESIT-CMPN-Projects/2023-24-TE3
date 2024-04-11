import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/chatbot_ui.dart';
import 'package:sakhi_app/query_bot.dart';

class EndoInfo extends StatefulWidget {
  const EndoInfo({super.key});

  @override
  State<EndoInfo> createState() => _EndoInfoState();
}

class _EndoInfoState extends State<EndoInfo> {
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
            title: Text("About Endometriosis")),
        body: Center(
          child: Column(children: [
            Container(
              height: 150,
              width: double.infinity,
              
              child:Center(
                child: Text("Endometriosis",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),),
              ),
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
                      "Endometriosis is a chronic gynecological condition that affects 5–10% of women of reproductive age. Women with endometriosis have endometrial-type tissue outside of the uterus."+
                       "In exceptional cases, endometriosis lesions may reach organs distant from the pelvis such as the membranes of"+
                       "the lungs, heart, limbs, and brain. As a result, and in response to the substances that this tissue produces, the immune system is activated, and a chronic inflammatory process is triggered, leading to the formation of adhesions, scars, and cysts between the pelvic and abdominal organs. Endometriosis tissue can also penetrate various organs in the body, including the"+
                       "digestive and urinary systems, and attach to nerves",
                          maxLines: maxLines,
                          overflow:overFlow,
                          ),
                  ),
                  TextButton(onPressed: readmore, 
                  child: Text(buttontext))
              ],
            ),
            Divider(),
            Text("Wanna tryout a test for detecting Endometriosis ?"),
            ElevatedButton(onPressed: (){
              navigator(Home());
            }, 
            child: Text("Click here now"))
          ]),
        ));
  }
}
