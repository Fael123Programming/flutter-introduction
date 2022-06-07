import 'package:flutter/material.dart';
import 'package:api_rest/models/post.dart';
import 'package:api_rest/helper/post_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Post>>? posts;
  final PostHelper postHelper = PostHelper();

  @override
  void initState() {
    super.initState();
    posts = postHelper.getPostsByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
