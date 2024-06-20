import 'package:flutter/material.dart';
import 'package:suitmedia_test_intern/widgets/button.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String _namaScreen1 = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      setState(() {
        _namaScreen1 = args as String;
      });
    }
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_namaScreen1,
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
          PublicButton(label: 'Choose a user', onPressed: () {})
        ],
      ),
    );
  }
}
