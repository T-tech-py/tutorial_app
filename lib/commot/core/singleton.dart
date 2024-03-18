import 'package:flutter/material.dart';

class SingletonService {
  SingletonService._internal();
  static final SingletonService _instance = SingletonService._internal();
  factory SingletonService() => _instance;

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get key => _navKey;
  
  BuildContext get context => _navKey.currentState!.context;
  
}