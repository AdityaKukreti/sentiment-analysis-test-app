import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sentiment_test/api.dart';
import 'package:sentiment_test/controllers.dart';
import 'package:sentiment_test/resultScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1c30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Sentiment Analysis",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "San Fransisco",
                      fontSize: 58,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            child: Image(
              image: AssetImage(
                'images/welcome.gif',
              ),
              width: 200,
              height: 200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 580,
                child: TextField(
                  controller: textFieldController,
                  cursorColor: Colors.black,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          APICaller apiCaller =
                              APICaller(text: textFieldController.text);
                          try {
                            Response<dynamic> apiData =
                                await apiCaller.getSentiment();
                            print(apiData);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  image: apiData.data['image'],
                                  mood: apiData.data['mood'],
                                  score: apiData.data['score'],
                                  emotion: apiData.data['emotion'],
                                ),
                              ),
                            );
                            textFieldController.clear();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "An error occured, check your text or try again later",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.black,
                        ),
                        splashColor: Colors.transparent,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter your text here',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff7f7bd1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
