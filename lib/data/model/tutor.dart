class Tutor{
  final String name;
  final String image;

  Tutor({required this.name,required this.image});

  factory Tutor.fromJson(Map<String,dynamic> json)=>Tutor(name: json['name'],
      image: json["image"]);

  Map<String,dynamic> toJson()=>{
    "name":name,
    "image":image,
  };
}