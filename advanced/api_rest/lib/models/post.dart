import 'dart:convert';

Post postFromJson(String str) => Post.fromMap(json.decode(str));

String postToJson(Post data) => json.encode(data.toMap());

class Post {
    int userId;
    int id;
    String title;
    String body;
    
    Post({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });


    factory Post.fromMap(Map<String, dynamic> map) => Post(
        userId: map["userId"],
        id: map["id"],
        title: map["title"],
        body: map["body"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
