class Test {
  final String question;
  final List<Options> options;
  final String correctAnswer;

  Test({required this.question,required this.options,
    required this.correctAnswer});

  factory Test.fromJson(Map<String,dynamic> json)=>
      Test(question: json["question"],
          options: (json["options"] as List).map((e) => Options.fromJson(e)).toList(),
          correctAnswer: json['correctAnswer']);

  Map<String,dynamic> toJson()=>   {
    "question": question,
    "options":options.map((e) => e.toJson()).toList(),
    "correctAnswer": correctAnswer
  };
}

class Options{
  final String option;

  Options({required this.option,});

 factory Options.fromJson(Map<String,dynamic> json)=>Options(
     option: json['key'],
 );

  Map<String,dynamic> toJson()=>{
    "options":
      {
        "A":option,
      },

  };
}