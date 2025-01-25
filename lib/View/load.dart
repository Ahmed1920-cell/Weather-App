import 'package:flutter/material.dart';

class load extends StatelessWidget {
  const load({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color(0xff060447),
      ),
    );
  }
}
