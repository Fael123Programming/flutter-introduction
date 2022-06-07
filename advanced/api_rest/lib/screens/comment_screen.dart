import 'package:flutter/material.dart';
import 'package:api_rest/helper/comment_helper.dart';
import 'package:api_rest/models/comment.dart';

class CommentScreen extends StatefulWidget {
  final int postId;

  const CommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final commentHelper = CommentHelper();
  late Future<List<Comment>> commentsList;

  @override
  void initState() {
    super.initState();
    commentsList = commentHelper.get(widget.postId);
    //widget refers to the instance of the class above.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Rest - Post Comments'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: commentsList,
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.hasData) {
            List<Comment> comments = snapshot.data!;
            return ListView.separated(
              itemCount: comments.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index].name),
                  subtitle: Text(comments[index].body),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
