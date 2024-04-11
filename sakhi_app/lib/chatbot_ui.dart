import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:sakhi_app/Decision.dart';
import 'package:sakhi_app/Messages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  

class Home extends StatefulWidget {
  const Home({ Key? key}):super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> res = {};
  Future<Map<String, dynamic>> sendDataToPythonServer() async {
    
    final Uri apiUrl = Uri.parse('http://192.168.29.140:5000/predict');

    Map<String, dynamic> dataToSend = {
      "answers": answers,
    };
    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dataToSend),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('Response: ${response.body}');
        res = json.decode(response.body);
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
    setState(() {
      res["Prediction"] = res["Prediction"];
      res['decision']=res['decision'];
    });
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return  DecisionsPage(decision: res['decision'],);
    })));
    return res;
  }
 List<String> messages = [];
 List<String> answers=[];
 List<Question> questions = [
  Question(
    text: "What is your age?",
    options: ["Adolescents","Young Adults","Adults","Perimenopausal"],
  ),
  // Question(
  //   text: "What is your height (in cm or inches)?",
  //   options: ["121-130","131-140","141-150","151-160","161-170","171-180","181-190"],
  // ),
  Question(
    text: "What is your weight (in kg or lbs)?",
    options: ["35-45","45-55","55-65","65-75","75-85",],
  ),
  Question(
    text: "What is your occupational Background?",
    options: ["Student", "Self-Employed","Public Sector","Private Sector","Housewife","Domestic Help"],
  ),
  // Question(
  //   text: "How satisfied are you with your job (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"],
  // ),
  // Question(
  //   text: "How irregular is your sleep cycle (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"],
  // ),
  // Question(
  //   text: "Do you sleep at least 6.5 hours per night (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  Question(
    text: "How irregular is your diet (scale of 1 to 10)?",
    options: ["Yes","No"],
  ),
  Question(
    text: "How would you describe your lifestyle (e.g., active, sedentary)?",
    options: ["Active","Sedentary"],
  ),
  // Question(
  //   text: "How would you rate your daily diet intake (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"],
  // ),
  // Question(
  //   text: "How many meals do you typically have in a day?",
  //   options: ["1","2","3","4"],
  // ),
  Question(
    text: "Do you have a family history of PCOS (yes/no)?",
    options: ["Yes", "No"],
  ),
  // Question(
  //   text: "Do you have a family history of diabetes (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "Do you have a family history of obesity (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "How often do you use sanitary products (e.g., pads, tampons)?",
  //   options: ["Pads","Tampons"],
  // ),
  Question(
    text: "At what age did you have your first period?",
    options: ["10","11","12","13","14"],
  ),
  Question(
    text: "What is the average duration of your period (in days)?",
    options: ["0-5","6-10","10+"],
  ),
  // Question(
  //   text: "How would you describe your menstrual period (e.g., heavy, light)?",
  //   options: ["Heavy","Light"],
  // ),
  // Question(
  //   text: "Do you experience white discharge (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  Question(
    text: "Do you experience foul smell from the vagina (yes/no)?",
    options: ["Yes", "No"],
  ),
  Question(
    text: "Do you have excess hair growth on skin (yes/no)?",
    options: ["Yes", "No"],
  ),
  Question(
    text: "Do you experience hair loss (yes/no)?",
    options: ["Yes", "No"],
  ),
  // Question(
  //   text: "Do you have male-like baldness (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "Do you have dark patches on the skin (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "Do you have excess skin in the armpit area (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  Question(
    text: "Do you have excess acne (yes/no)?",
    options: ["Yes", "No"],
  ),
  // Question(
  //   text: "Do you have excess junk food intake (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  Question(
    text: "Do you experience foul smell during urination (yes/no)?",
    options: ["Yes", "No"],
  ),
  Question(
    text: "Do you experience pain during urination (yes/no)?",
    options: ["Yes", "No"],
  ),
  Question(
    text: "Do you experience nausea during urination (yes/no)?",
    options: ["Yes", "No"],
  ),
  // Question(
  //   text: "Do you regularly perform self-checks (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "What is your mental health score (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"],
  // ),
  // Question(
  //   text: "Do you have any mental illness (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "Are you in menopause (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
  // Question(
  //   text: "How irritable is your bowel (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"],
  // ),
  // Question(
  //   text: "How would you rate your personal hygiene (scale of 1 to 10)?",
  //   options: ["1","2","3","4","5","6","7","8","9","10"] ,
  // ),
  // Question(
  //   text: "Do you experience vesicoureteral reflux (yes/no)?",
  //   options: ["Yes", "No"],
  // ),
];

  int currentQuestionIndex = 0;
  String selectedOption="";

  @override
  void initState() {
    super.initState();
    displayNextQuestion();
  }

  void displayNextQuestion() {
    if (currentQuestionIndex < questions.length) {
      messages.add(questions[currentQuestionIndex].text);
    } else {
      messages.add("No more questions.");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatBot"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (BuildContext context, int index) {
                print(messages[index]);
                return ListTile(
                  title:Text(messages[index]),
                  subtitle:Text(index < answers.length ? answers[index] : '')
                );
              },
            ),
          ),
          if (currentQuestionIndex < questions.length)
            Column(
              children: [
                ...questions[currentQuestionIndex].options.map((option) {
                  return RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                  );
                }).toList(),
                if (selectedOption!=null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Selected option: $selectedOption",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      sendMessage(selectedOption);
                    },
                    child: Text("Next Question"),
                  ),
                ),
                ElevatedButton(
                  onPressed:sendDataToPythonServer,
                  child:Text("Send data Now")
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String selectedOption) {
    if (selectedOption!="") {
      setState(() {
        print(selectedOption);
        questions[currentQuestionIndex].answer = selectedOption;
        answers.add(selectedOption);
        print(answers);
        currentQuestionIndex++;
        // selectedOption="";
        // messages.clear();
        displayNextQuestion();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an option!'),
        ),
      );
    }
  }
}

class Question {
  String text;
  List<String> options;
  String? answer;

  Question({
    required this.text,
    required this.options,
    this.answer,
  });
}

  // late DialogFlowtter dialogFlowtter;
  // final TextEditingController _controller = TextEditingController();

  // List<Map<String, dynamic>> messages=[];

  // @override
  // void initState() {
  //   // DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  //   // super.initState();
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Sakhi ChatBot"),
  //     ),
  //     body: Container(
  //       child: Column(
  //         children: [
  //           Expanded(child: MessagesScreen(messages:messages)),
  //           Container(
  //             padding: EdgeInsets.symmetric(
  //               horizontal: 14,
  //               vertical: 8
  //             ),
  //             color: Colors.pinkAccent,
  //             child: Row(
  //               children: [
  //                 Expanded(child:
  //                 TextField(
  //                   controller: _controller,
  //                   style: TextStyle(color: Colors.white),
  //                 )
  //                 ),
  //                 IconButton(onPressed: () {
  //                   sendMessage(_controller.text);
  //                   _controller.clear();
  //                 }, icon: Icon(Icons.send))
  //               ],
  //             ),
  //           ),
  //         ],
  //       )
  //     ),
  //   );
  // }


  // sendMessage(String text)async{
  //   if(text.isEmpty){
  //     print('Message is Empty');
  //   }
  //   else{
  //     setState(() {
  //       addMessage(Message(text: DialogText(text:[text])), true);
  //     });

  //     DetectIntentResponse response=await dialogFlowtter.detectIntent(
  //         queryInput: QueryInput(text: TextInput(text: text)));
  //     if(response.message==null) return;
  //     setState(() {
  //       addMessage(response.message!);
  //     });
  //   }
  // }
  // addMessage(Message message,[bool isUserMessage=false]){
  //   messages.add({
  //     'message': message,
  //     'isUserMessage': isUserMessage,
  //   });
  // }

