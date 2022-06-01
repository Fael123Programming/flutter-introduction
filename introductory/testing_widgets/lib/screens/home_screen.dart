import 'package:flutter/material.dart';
import 'package:testing_widgets/screens/message_screen.dart';
import 'package:testing_widgets/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: "Profile Information",
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Display side menu"),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text("Home Page"),
        actions: <Widget>[
          TextButton(
            style: style,
            child: const Text("Profile"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
          TextButton(
            style: style,
            child: const Text("Messages"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
