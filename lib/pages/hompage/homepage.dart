import 'package:flutter/material.dart';
import 'package:mobile_flutter_project/pages/createpost.dart';
import 'package:mobile_flutter_project/pages/favoritepost.dart';
import 'package:mobile_flutter_project/pages/hompage/postcards.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  final WebSocketChannel channel;
  HomePage({required this.channel, Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

//HomePage
class _HomePageState extends State<HomePage> {
  late WebSocketChannel channel = widget.channel;
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
                        //Log Out Icon
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            IconData(63627, fontFamily: 'MaterialIcons'),
                          ),
                          iconSize: 25,
                        ),
                        //Create Post Icon
                        TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreatePost(
                                            channel: channel,
                                          )));
                            },
                            icon: Icon(
                              IconData(57415, fontFamily: 'MaterialIcons'),
                              size: 28,
                            ),
                            label: Text(
                              'Create post',
                              style: TextStyle(fontSize: 16),
                            )),

                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //Sort by Alpha Icon
                            IconButton(
                              onPressed: () {},
                              icon: Icon(IconData(983463,
                                  fontFamily: 'MaterialIcons')),
                              iconSize: 25,
                            ),
                            //Favourite List Icon
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FavoritePost()));
                              },
                              icon: Icon(
                                  IconData(57947, fontFamily: 'MaterialIcons')),
                              iconSize: 25,
                            )
                          ],
                        ))
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Home: All Posts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                PostCards(
                  channel: channel,
                ),
              ]))),
    ));
  }
}
