import 'package:ad_app_enhanced/models/encoder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/ad.dart';
import 'register_screen.dart';
import 'dart:io';

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
        title: const Text(
          "Ad App",
          style: TextStyle(
            fontFamily: "Arial",
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ads.isEmpty
          ? const Center(
              child: Text(
                "No ads yet",
                style: TextStyle(fontSize: 40),
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
                      try {
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
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Canceled"),
                            duration: Duration(
                              seconds: 1,
                            ),
                          ),
                        );
                        setState(() {});
                      }
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
                  child: ListTile(
                    title: Text(
                      ad.title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      ad.description + "\n" + "\$" + ad.price.toString(),
                    ),
                    isThreeLine: true,
                    dense: true,
                    leading: ad.image != null
                        ? Container(
                            child: Image.file(
                              File(ad.image!.path),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                          )
                        : Container(
                            child: const Icon(Icons.add_a_photo),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                          ),
                    trailing: const Icon(
                      Icons.shopping_cart,
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (_) => Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.email),
                                title: const Text("Share via e-mail"),
                                onTap: () async {
                                  Navigator.pop(context); //Closes the sheet.
                                  final Uri uri = Uri(
                                    scheme: "mailto",
                                    path: " ",
                                    query: Encoder().encodeQueryParameters(
                                      <String, String>{
                                        "subject":
                                            "Sharing with you a product/service",
                                        "body": ad.toShareMsg(),
                                      },
                                    ),
                                  );
                                  if (!await launchUrl(uri)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Could not access e-mail resources"),
                                      ),
                                    );
                                  }
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.sms),
                                title: const Text("Share via sms"),
                                onTap: () async {
                                  Navigator.pop(context);
                                  final Uri uri = Uri(
                                    scheme: "sms",
                                    path: "",
                                    query: Encoder().encodeQueryParameters(
                                      <String, String>{
                                        "body": ad.toShareMsg(),
                                      },
                                    ),
                                  );
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Could not access sms resources"),
                                      ),
                                    );
                                  }
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.whatsapp),
                                title: const Text("Share via WhatsApp"),
                                onTap: () async {
                                  Navigator.pop(context);
                                  openWhatsApp(
                                    ad.toShareMsg(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onLongPress: () async {
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
                          ads.insert(position, editedAd);
                        },
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, position) => const Divider(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Ad ad = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
            //An exception is thrown if not an Ad instance is returned from Navigator.push(), that is, a try of assigning a non-nullable variable with null.
            setState(() => ads.add(ad));
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Canceled",
                ),
                duration: Duration(
                  seconds: 1,
                ),
              ),
            );
          }
        },
        child: const Icon(
          Icons.add_circle,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void openWhatsApp(String msg) async {
    final url = Platform.isAndroid
        ? "whatsapp://send?text=$msg"
        : "https://wa.me/?text=$msg";
    if (!await launchUrl(Uri.parse(url))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Could not open WhatsApp"),
          duration: Duration(
            seconds: 1,
          ),
        ),
      );
    }
  }
}
