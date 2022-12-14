import 'package:ah_store/view/siguup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  "WELCOME",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  'assets/images/chat.svg',
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 78, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(Signup());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple[100]),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                  width: 150,
                  child: Image.asset('assets/images/main_top.png'))),
          Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                  width: 100,
                  child: Image.asset('assets/images/main_bottom.png'))),
        ],
      ),
    ));
  }
}
