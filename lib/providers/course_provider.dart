import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:group5_tutorial/providers/storage.dart';

import '../data/model/course.dart';

class CourseProvider with ChangeNotifier{
  static final CourseProvider _instance = CourseProvider._internal();

  CourseProvider._internal();

  factory CourseProvider() {
    return _instance;
  }

  Course? course;
  final storage = StorageProvider();

  Future<Course?> getCourse()async{
  var data = await rootBundle.loadString("assets/jsons/courses.json");
  await storage.init();
  await storage.saveData("COURSE", data);
  var data2 = json.decode(data);
  print(data2);
  course = Course.fromJson(data2);
  notifyListeners();
  return course;
}

Future<bool> editCourse(Course update)async{
  await storage.init();
  var info = await storage.getData("COURSE", );
  if(info != null){
    storage.removeData('COURSE');
    storage.saveData("COURSE",json.encode(update.toJson()));
    course = update;
    notifyListeners();
    print(course?.review.map((e) => e?.toJson()).toList());
    return true;
  }
  return false;
}

}