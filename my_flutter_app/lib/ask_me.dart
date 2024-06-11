import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApiData {
  final String apiUrl;

  MyApiData(this.apiUrl);

  Future<List<dynamic>> sendData(List<String> symptoms) async {
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({'symptoms': symptoms});

    try {
      var response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to connect to server');
      }
    } catch (error) {
      print('Error sending data to server: $error');
      throw error;
    }
  }
}

class AskMe extends StatefulWidget {
  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];
  late MyApiData _apiData;

  List<String> questions = [
    "Hello! What symptoms are you experiencing?",
  ];

  int currentQuestionIndex = 0;
  List<String> userSymptoms = [];

  @override
  void initState() {
    super.initState();
    _apiData = MyApiData('http://127.0.0.1:5000/predict');
    _addBotResponse(questions[currentQuestionIndex]);
  }

  void _addMessage(String message, bool isUser) {
    setState(() {
      _chatMessages.add(ChatMessage(text: message, isUser: isUser));
    });

    if (!isUser) {
      // Don't send the message to the server if it's from the bot
      return;
    }

    // Split the user input by commas
    List<String> symptoms = message.split(',').map((symptom) => symptom.trim()).toList();

    _apiData.sendData(symptoms).then((response) {
      _addBotResponse(response);
    }).catchError((error) {
      _addBotResponse("Error: $error");
    });
  }

  void _addBotResponse(dynamic response) {
    setState(() {
      if (response is String) {
        // If the response is a string, simply add it to the chat messages
        _chatMessages.add(ChatMessage(text: response, isUser: false));
      } else if (response is List<dynamic>) {
        // If the response is a list, assume it's a list of disease information
        for (var info in response) {
          _chatMessages.add(ChatMessage(
            text: "Disease: ${info['disease']}\nDescription: ${info['Description']}\nAge: ${info['age']}\nGender: ${info['gender']}",
            isUser: false,
          ));
        }
      } else {
        // If the response is of an unexpected type, display an error message
        _chatMessages.add(ChatMessage(text: "Unexpected response from server", isUser: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFAF1E4),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: _chatMessages[index].isUser
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: _chatMessages[index].isUser
                              ? Color(0xFF3A818B)
                              : Color(0xFF3A818B),
                          child: Text(
                            _chatMessages[index].text,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your response...',
                        hintStyle: TextStyle(color: Color(0xFF3A818B)),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Color(0xFF3A818B),
                    onPressed: () {
                      String message = _messageController.text;
                      if (message.isNotEmpty) {
                        _addMessage(message, true);
                        _messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

void main() {
  runApp(MaterialApp(
    home: AskMe(),
  ));
}
