import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
                width: 1, color: Color.fromARGB(179, 182, 182, 182))),
        title: const Text(
          "Second Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.amber,
            padding: EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("John",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: screenHeight * 0.6,
            child: const Center(
                child: Text(
              "Selected User Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 99, 123),
                ),
                onPressed: () {},
                child: const Text(
                  "Choose a User",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
