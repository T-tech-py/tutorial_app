
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/providers/user_provider.dart';

import 'commot/core/navigator.dart';
import 'commot/shared/app_button.dart';
import 'commot/shared/app_textfield.dart';
import 'commot/utils/colors.dart';
import 'data/model/user.dart';
import 'home_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});
  static const routeName = '/infoPage';
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String firstname = '';
  String surname = '';
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign-in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Let us get to know you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              40.height,
              AuthTextField(
                heading: "Firstname",
                onChanged: (val) {
                  setState(() {
                    firstname = val;
                  });
                },
                validator: (val){
                  if(val != null && val.length > 2){
                    return null;
                  }
                  return 'Please type-in your firstname';
                },
              ),
              20.height,
              AuthTextField(
                heading: "Surname",
                onChanged: (val) {
                  setState(() {
                    surname = val;
                  });
                },
                validator: (val){
                  if(val != null && val.length > 2){
                    return null;
                  }
                  return 'Please type-in your surname';
                },
              ),
              50.height,
              AppButton(text: "Proceed",
                  width: double.infinity,

                  onTap: () async{
                if(formKey.currentState!.validate()){
                await  UserProvider().addUser(User(firstName: firstname,
                      surname: surname, score: 0));
                  pushToNextScreen(child: const HomePage(), name: HomePage.routeName);
                }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
