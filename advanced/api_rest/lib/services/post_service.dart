import 'dart:convert';
import 'dart:async';
import 'package:api_rest/models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  
  ///Get all posts of the user that has the corresponding userId.
  ///If userId is null it fetchs all posts from all users.
  Future<List<Post>> get(int? userId) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    if (userId != null) {
      url += '?userId=$userId';
    }
    final response = await http.get(Uri.parse(url));
    List<Post> posts = [];
    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      for (var map in responseList) {
        posts.add(Post.fromMap(map));
      }
    }
    return posts;
  }

  Future<Post?> post(Post post) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(post.toMap()),
    );
    if (response.statusCode == 201) {
      return post;
    }
    return null;
  }

  Future<Post?> put(Post post) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/${post.id}';
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode(post.toMap()),
    );
    if (response.statusCode == 200) {
      return post;
    }
    return null;
  }

  Future<Post?> delete(int postId) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$postId';
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Post.fromMap(json.decode(response.body));
    }
    return null;
  }
}
