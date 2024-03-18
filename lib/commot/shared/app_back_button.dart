import 'dart:io';

import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(
        Platform.isIOS?Icons.arrow_back_ios: Icons.arrow_back));
  }
}
