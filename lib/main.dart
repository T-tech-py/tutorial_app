
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/utils/extensions.dart';
import 'package:group5_tutorial/providers/course_provider.dart';
import 'package:group5_tutorial/providers/storage.dart';
import 'package:group5_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'commot/core/navigator.dart';
import 'commot/core/singleton.dart';
import 'commot/shared/app_button.dart';
import 'commot/shared/custom_image_widget.dart';
import 'commot/utils/colors.dart';
import 'commot/utils/themes.dart';
import 'info_page.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return MultiProvider(
  providers: [
    ChangeNotifierProvider(
            create: (context) => StorageProvider(),),
    ChangeNotifierProvider(create: (context)=>UserProvider()),
    ChangeNotifierProvider(create: (context)=>CourseProvider()),
  ],
  child: MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: SingletonService().key,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const WelcomePage(title: 'Flutter Home Page'),
    ),
);
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.title});

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //33.height,
              const CustomImageWidget(
                imagePath: "assets/splash_bg.png",),
              40.height,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 32),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white
                ),
                child:  Column(
                  children: [
                    const  Text('Discover The Best Online Course Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),),
          
                  const  Text('Want to come up with your own unique phrase for your online course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),),
                    
                    35.height,
                    Row(
                      children: [
                        Expanded(child: AppButton(text: "Skip",
                            addBorder: true,
                            onTap: (){
                              pushToNextScreen(
                                  child: const InfoPage(),
                                  name: InfoPage.routeName);
                            })),
                        50.width,
                        Expanded(child: AppButton(text: "Next", onTap: (){
                          pushToNextScreen(
                              child: const InfoPage(),
                              name: InfoPage.routeName);
                        })),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}