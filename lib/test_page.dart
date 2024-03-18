
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/score_page.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_button.dart';
import 'commot/utils/colors.dart';
import 'data/model/test.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.test});
static const routeName = '/testPage';
final List<Test> test;
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int currentQuestion = 1;
  String correctAnswer = '';
  int correctIndex = -1;
  int score = 0;
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const  Text('Total questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),),
                      Text('$currentQuestion/${widget.test.length-1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),),
                  ],
                ),
                30.height,
                  Text(widget.test[currentQuestion].question??'',
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),),
                40.height,
                Column(
                  children: List.generate(widget.test[currentQuestion].options.length,
                          (index) {
                    return InkWell(
                      onTap:clicked?(){}: (){

                        correctAnswer= widget.test[currentQuestion].correctAnswer;
                        setState(() {
                          clicked= true;
                          correctIndex = index;
                        });
                        if(correctAnswer ==
                            widget.test[currentQuestion].options[index].option){
                        score++;
                     }

                      },
                      child: Padding(padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white,
                                border:correctIndex == -1? null: Border.all(
                                    color: correctAnswer ==
                                        widget.test[currentQuestion].options[index].option?
                                Colors.lightGreen:AppColor.redB6),
                              ),
                              child: Row(
                                children: [
                                  if(correctIndex > -1)
                                  Icon(correctAnswer ==
                                      widget.test[currentQuestion].options[index].option?
                                  Icons.check_circle_outline:Icons.close,
                                  color: correctAnswer ==
                                      widget.test[currentQuestion].options[index].option?
                                    Colors.green: AppColor.redB6,),
                                  20.width,
                                  Expanded(
                                    child: Text(widget.test[currentQuestion].options[index].option,
                                      textAlign: TextAlign.start,
                                      style:const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),),
                                  ),
                                ],
                              ),
                            ),),
                    );}),
                ),
                20.height,
                AppButton(text: "Next",
                    width: double.infinity,
                    onTap: (){
                  setState(() {
                    clicked = false;
                  });

                  if(currentQuestion == widget.test.length - 1){
                   pushToNextScreen(child: ScorePage(
                     total: widget.test.length - 1,
                     score: score,
                   ),
                       name: ScorePage.routeName);
                    return;
                  }
                  setState(() {
                    correctIndex = -1;
                  });
                  if(currentQuestion < widget.test.length){
                    setState(() {
                      currentQuestion++;
                    });
                  }
                })

              ],
            ),
          ),
      ),
    );
  }
}
