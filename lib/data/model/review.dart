class Review {
  final String name;
  final String comment;

  Review({required this.name,required this.comment});

  factory Review.fromJson(Map<String,dynamic> json)=>
      Review(name: json["name"], comment: json["comment"]);

  Map<String,dynamic> toJson()=> {
    "name": name,
    "comment":comment
  };
}