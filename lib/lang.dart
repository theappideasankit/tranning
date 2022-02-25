import 'package:flutter/material.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Choose Your language",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          "A",
                          style:
                              TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: 170.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                              "A",
                              style:
                              TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 170.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                              "A",
                              style:
                              TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: 170.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                              "A",
                              style:
                              TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
