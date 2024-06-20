import 'package:flutter/material.dart';
import 'package:suitmedia_test_intern/widgets/button.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  static bool isPalindrome(String text) {
    final processedText = text.replaceAll(' ', '');
    for (int i = 0; i < processedText.length / 2; i++) {
      if (processedText[i] != processedText[processedText.length - i - 1]) {
        return false;
      }
    }
    return true;
  }

  void _showPalindromeDialog(BuildContext context, bool isPalindrome) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Palindrome Check'),
          content: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _checkPalindrome(BuildContext context) {
    if (_palindromeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check palindrome tidak boleh kosong')),
      );
      return;
    }
    String text = _palindromeController.text;
    bool result = isPalindrome(text);
    _showPalindromeDialog(context, result);
  }

  void _validateAndNavigate(BuildContext context) {
    if (_namaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong')),
      );
      return;
    }
    if (_palindromeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check palindrome tidak boleh kosong')),
      );
      return;
    }
    Navigator.pushReplacementNamed(context, '/screen2');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background@3x.png",
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          // membuat background secara manual
          // Container(color: Color.fromARGB(255, 75, 164, 170)),
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: RadialGradient(
          //       colors: [
          //         Color.fromARGB(255, 86, 109, 239),
          //         Colors.transparent,
          //       ],
          //       focal: Alignment(-1.5, -0.5),
          //       radius: 1.3,
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: RadialGradient(
          //       colors: [
          //         Color.fromARGB(142, 255, 201, 251),
          //         Colors.transparent,
          //       ],
          //       focal: Alignment(-1.4, 0.5),
          //       radius: 1.0,
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: RadialGradient(
          //       colors: [
          //         Color.fromARGB(191, 3, 255, 188),
          //         Colors.transparent,
          //       ],
          //       focal: Alignment(1.2, -0.5),
          //       radius: 1.5,
          //     ),
          //   ),
          // ),
          Center(
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      //untuk responsif dari aplikasi saya lebih menggunakan mediaquery daripada pixel
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: const Icon(Icons.person_add_alt_1)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _palindromeController,
                      decoration: InputDecoration(
                        hintText: 'Palindrome',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  PublicButton(
                      label: 'CHECK',
                      onPressed: () {
                        _checkPalindrome(context);
                      }),
                  PublicButton(
                      label: 'NEXT',
                      onPressed: () {
                        _validateAndNavigate(context);
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
