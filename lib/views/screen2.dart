import 'package:flutter/material.dart';
import 'package:suitmedia_test_intern/views/screen1.dart';
import 'package:suitmedia_test_intern/views/screen3.dart';
import 'package:suitmedia_test_intern/widgets/button.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String _namaScreen1 = '';
  String _selectedUserName = 'Nama belum dipilih';

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

  Future<void> _chooseUser(BuildContext context) async {
    final selectedUserName = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen3()),
    );

    if (selectedUserName != null) {
      setState(() {
        _selectedUserName = selectedUserName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/',
            );
          },
          child: Image.asset("assets/images/ic_back@3x.png"),
        ),
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
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome", style: TextStyle(fontSize: 14)),
                Text(_namaScreen1,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.6,
            child: Center(
              child: Text(
                _selectedUserName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
            ),
          ),
          PublicButton(
            label: 'Choose a user',
            onPressed: () => _chooseUser(context),
          ),
        ],
      ),
    );
  }
}
