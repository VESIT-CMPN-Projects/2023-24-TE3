import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  String _response = '';

  Future<void> _getResponse() async {
    final userInput = _textController.text;
    print(userInput);

    try {
      final response = await getGptResponse(userInput);
      setState(() {
        _response = response;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> getGptResponse(String userInput) async {
    print("Hii asidbviasd");
    final apiKey = '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';
    final endpoint = 'https://api.openai.com/v1/chat/completions' ;

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo-0125',
         "messages": [
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": "Who won the World Series in 2020?"}
    ],
        'prompt': userInput,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['choices'][0]['text'];
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('AI Response:'),
                  subtitle: Text(_response),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _getResponse,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}