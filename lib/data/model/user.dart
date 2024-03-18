class User{
  final String firstName;
  final String surname;
  final int score;

  User({required this.firstName, required this.surname,
  required this.score});

  factory User.fromJson(Map<String,dynamic> json)=>User(
    firstName: json['firstName'],
    surname: json['surname'],
    score: json['score'],
  );

  Map<String,dynamic> toJson()=>{
    "firstName": firstName,
    "surname": surname,
    "score": score
  };
}