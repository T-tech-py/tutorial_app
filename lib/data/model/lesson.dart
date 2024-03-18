class Lesson {
  final String title;
  final String video;
  final String time;

  Lesson({required this.title,required this.video,
  required this.time});

  factory Lesson.fromJson(Map<String,dynamic> json)=>
      Lesson(title: json["title"], video: json["video"],
      time: json['time']);

  Map<String,dynamic> toJson()=>  {
    "title": title,
    "video": video,
    "time": time
  };
}