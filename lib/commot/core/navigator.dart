import 'package:flutter/material.dart';
import 'package:group5_tutorial/commot/core/singleton.dart';

Future<dynamic> pushToNextScreen(
    {BuildContext? context,
      required Widget child,
      required String name,
      bool fullscreenDialog = false,
      bool rootNavigator = false,
      Object? arguments}) {
  context = context ??
      SingletonService().key.currentState!.context;
  return Navigator.of(context, rootNavigator: rootNavigator).push(
      MaterialPageRoute(
          builder: (context) => child,
          fullscreenDialog: fullscreenDialog,
          settings: RouteSettings(name: name, arguments: arguments)));
}

Future<dynamic> pushReplacementToNextScreen(
    {BuildContext? context,
      required Widget child,
      required String name,
      bool fullscreenDialog = false,
      bool rootNavigator = false,
      Object? arguments}) {
  context = context ??
       SingletonService().key.currentState!.context;
  return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      MaterialPageRoute(
          builder: (context) => child,
          fullscreenDialog: fullscreenDialog,
          settings: RouteSettings(name: name, arguments: arguments)));
}

popUntil(
    {BuildContext? context, required String name, bool rootNavigator = false}) {
  context = context ??
       SingletonService().key.currentState!.context;
  Navigator.of(context, rootNavigator: rootNavigator)
      .popUntil(ModalRoute.withName(name));
}

pop({BuildContext? context, bool rootNavigator = false, resultToSendBack}) {
  context = context ??
       SingletonService().key.currentState!.context;
  Navigator.of(context, rootNavigator: rootNavigator).pop(resultToSendBack);
}

///below are pagesDirectRoute
// gotoLanding() async {
//   pushToNextScreen(child: const LandingPage(), name: LandingPage.routeName);
// }
//
// gotoSignup() {
//   pushToNextScreen(child: const SignUpPage(), name: SignUpPage.routeName);
// }

// gotoLogin({bool existingUser = false, bool doBiometricLoginOnLoad = false}) {
//   pushToNextScreen(
//       child: LoginPage(
//           existingUser: existingUser,
//           doBiometricLoginOnLoad: doBiometricLoginOnLoad),
//       name: LoginPage.routeName);
// }
//
// gotoHomePage() {
//   popUntil(name: LoginPage.routeName);
//   pushToNextScreen(child: const HomePage(), name: HomePage.routeName);
//}
