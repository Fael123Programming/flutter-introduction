import 'dart:convert';
import 'dart:async';
import 'package:api_rest/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<List<Comment>> getComments(int postId) async {
    final String url =
        'https://jsonplaceholder.typicode.com/comments?postId=$postId';
    final response = await http.get(Uri.parse(url));
    List<Comment> comments = [];
    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      for (var map in responseList) {
        comments.add(Comment.fromMap(map));
      }
    }
    return comments;
  }
}
