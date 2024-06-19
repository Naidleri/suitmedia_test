import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background@3x.png",
            scale: 2.0,
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
              height: screenHeight * 0.5,
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
                      child: Icon(Icons.person_add_alt_1)),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Palindrome',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 43, 99, 123),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "CHECK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 43, 99, 123),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "NEXT",
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
            ),
          ),
        ],
      ),
    );
  }
}
