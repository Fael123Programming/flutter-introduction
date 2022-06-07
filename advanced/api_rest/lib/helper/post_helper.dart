import 'package:api_rest/models/post.dart';
import 'package:api_rest/services/post_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHelper {
  Future<List<Post>> getPosts() async {
    PostService postService = PostService();
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('logged') != null) {
      return postService.get(sharedPreferences.getInt('userId'));
    }
    return <Post>[];
  }
}
