import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_button.dart';
import 'commot/utils/colors.dart';
import 'home_page.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.total, required this.score});
  static const routeName = '/scorePage';
  final int total,score;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  late ConfettiController _controllerTopCenter;
  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
_controllerTopCenter.play();
    super.initState();
  }
  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.bg,
      body: ConfettiWidget(
        confettiController: _controllerTopCenter,
        blastDirection: pi / 2,
        maxBlastForce: 50, // set a lower max blast force
        minBlastForce: 10, // set a lower min blast force
        emissionFrequency: 0.05,
        numberOfParticles: 20, // a lot of particles at once
        gravity: 1,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.height,
                const  Text("Your Test Score",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                  ),),
                40.height,
                 SizedBox(
                   width:double.infinity ,
                   child: Stack(
                    alignment: Alignment.center,
                    children: [
                        CircularProgressIndicator(
                        value: widget.score/widget.total,
                        strokeAlign: 10,
                        color: AppColor.primary,
                        backgroundColor: AppColor.white,
                      ),
                      Text("${widget.score}/${widget.total}",
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),),
                    ],
                                 ),
                 ),
                40.height,
                 Text(widget.score<4?"You are trying just a little more practice "
                    "and you're on your way to becoming a champion":"You got a "
                     "perfect score",
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.blackE1
                  ),),
                40.height,
                AppButton(text: "Home", onTap: ()=>popUntil(name: HomePage.routeName))
                ,40.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
