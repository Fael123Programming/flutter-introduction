import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromMap(json.decode(str));

String commentToJson(Comment comment) => json.encode(comment.toMap());

class Comment {
    int postId;
    int id;
    String name;
    String email;
    String body;

    Comment({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });


    factory Comment.fromMap(Map<String, dynamic> map) => Comment(
        postId: map["postId"],
        id: map["id"],
        name: map["name"],
        email: map["email"],
        body: map["body"],
    );

    Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
