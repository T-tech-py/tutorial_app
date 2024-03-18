

import 'package:group5_tutorial/data/model/review.dart';
import 'package:group5_tutorial/data/model/test.dart';
import 'package:group5_tutorial/data/model/tutor.dart';

import 'lesson.dart';

class Course{
  final String name;
  final String code;
  final Tutor tutor;
  final List<Lesson> lesson;
  final List<Test> test;
  final List<Review> review;

  Course({required this.name,required this.code,
  required this.lesson, required this.review, required this.test,
  required this.tutor});

  factory Course.fromJson(Map<String,dynamic> json)=>Course(
      name: json['name'], code: json['code'],
    lesson: (json["lesson"] as List).map((e) => Lesson.fromJson(e)).toList(),
    review: (json["reviews"] as List).map((e) => Review.fromJson(e)).toList(),
    test: (json["test"] as List).map((e) => Test.fromJson(e)).toList(),
    tutor: Tutor.fromJson(json['tutor']),
  );

  Map<String,dynamic> toJson()=>{
    "name": name,
    "code":code,
    "test": test.map((e) => e.toJson()).toList(),
    "tutor":tutor.toJson(),
    "lesson": lesson.map((e) => e.toJson()).toList(),
    "reviews": review.map((e) => e.toJson()).toList(),


  };
}