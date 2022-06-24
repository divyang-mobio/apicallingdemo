class User {
  int userId;
  int id;
  String title;
  String dis;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.dis});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        dis: json["body"],
      );

  // Map<String, dynamic> toJson() => {
  //       "userId": userId,
  //       "id": id,
  //       "title": title,
  //       "body": dis,
  //     };
}
