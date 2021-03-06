import 'package:flutter/material.dart';
import 'package:api_rest/models/post.dart';
import 'package:api_rest/helper/post_helper.dart';
import 'package:api_rest/helper/sign_in_helper.dart';
import 'package:api_rest/screens/sign_in_screen.dart';
import 'package:api_rest/screens/comment_screen.dart';
import 'package:api_rest/models/user/user.dart';

class HomeScreen extends StatefulWidget {
  final User? userSignedIn;

  const HomeScreen({this.userSignedIn, Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Post>>? posts;
  final PostHelper postHelper = PostHelper();

  @override
  void initState() {
    super.initState();
    posts = postHelper.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Rest - Home'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sign Out',
            onPressed: () async {
              final signInHelper = SignInHelper();
              await signInHelper.signOut();
              if (!await signInHelper.isUserSignedIn()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: postHelper.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List posts = snapshot.data!;
            return ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentScreen(
                          postId: posts[index].id,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      posts[index].title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Text(
                      posts[index].body.replaceAll('\n', ' '),
                      textAlign: TextAlign.justify,
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.chevron_right,
                      semanticLabel: 'Comments',
                    ),
                  ),
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
      drawer: Drawer(
        semanticLabel: 'Profile Info',
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.userSignedIn!.username,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Arial',
                ),
              ),
              accountEmail: Text(
                widget.userSignedIn!.email,
                style: const TextStyle(fontFamily: 'Arial'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Name'),
              subtitle: Text(widget.userSignedIn!.name),
            ),
            ListTile(
              leading: const Icon(Icons.place),
              title: const Text('Address'),
              subtitle: Text(widget.userSignedIn!.address.toUniqueString()),
              isThreeLine: true,
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: Text(widget.userSignedIn!.phone),
            ),
            ListTile(
              leading: const Icon(Icons.web_sharp),
              title: const Text('Website'),
              subtitle: Text(widget.userSignedIn!.website),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Company'),
              subtitle: Text(widget.userSignedIn!.company.name),
            ),
          ],
        ),
      ),
    );
  }
}
