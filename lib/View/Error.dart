import 'package:flutter/material.dart';

class error extends StatelessWidget {
  const error({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Something Error",style: TextStyle(fontSize: 25,color: Colors.white)),
            Text("Try Again",style: TextStyle(fontSize: 25,color: Colors.white))
          ],
        )
    );
  }
}
