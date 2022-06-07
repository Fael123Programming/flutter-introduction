import 'package:api_rest/models/comment.dart';
import 'package:api_rest/services/comment_service.dart';

class CommentHelper {
  late CommentService commentService;

  CommentHelper() {
    commentService = CommentService();
  }

  Future<List<Comment>> get(int postId) {
    return commentService.getComments(postId);
  }
}
