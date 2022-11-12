

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,),
      body: (
          ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context,i){
                return Container(
                  height: 200,

                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 5.0,
                          color: Colors.purple
                      ),
                    ],
                  ),
                );
              })
      ),
    );
  }
}
