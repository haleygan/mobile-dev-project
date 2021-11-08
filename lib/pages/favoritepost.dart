import 'package:flutter/material.dart';


class FavoritePost extends StatefulWidget {
  @override
  _FavoritePostState createState() => _FavoritePostState();
}

//HomePage
class _FavoritePostState extends State<FavoritePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(IconData(57492,
                                      fontFamily: 'MaterialIcons')),
                                  label: Text(
                                    'Back',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'My Favorite Posts',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ),
                    ])))));
  }
}
