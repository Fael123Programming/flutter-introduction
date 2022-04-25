import 'package:flutter/material.dart';
import 'package:ad_app/models/ad.dart';

import 'register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Ad> ads = []; //To save the ads.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ad App"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ads.isEmpty
          ? const Center(
              child: Text(
                "No ads yet",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            )
          : ListView.separated(
              itemCount: ads.length,
              itemBuilder: (context, position) {
                Ad ad = ads[position];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    //The background when we scroll it rightwards.
                    color: Colors.green,
                    child: const Align(
                      alignment: Alignment(-0.9, 0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    //The background when we scroll it leftwards.
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment(0.9, 0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      Ad editedAd = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(
                            ad: ad,
                            editing: true,
                          ),
                        ),
                      );
                      setState(
                        () {
                          ads.removeAt(position);
                          ads.insert(
                            position,
                            editedAd,
                          );
                        },
                      );
                      return false; //Do not delete it.
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Deleted"),
                          duration: Duration(
                            seconds: 1,
                          ),
                        ),
                      );
                      setState(() => ads.removeAt(position));
                      return true; //Do delete it.
                    }
                  },
                  child: ListTile();
                );
              },
            ),
    );
  }
}
