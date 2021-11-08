import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:mobile_flutter_project/pages/postdetails.dart';

class PostCards extends StatefulWidget {
  PostCards({required this.channel, Key? key}) : super(key: key);
  final WebSocketChannel channel;
  @override
  _PostCardsState createState() => _PostCardsState();
}

class _PostCardsState extends State<PostCards> {
  late WebSocketChannel channel = widget.channel;
  List posts = [];
  void getPost() {
    channel.stream.listen((data) {
      final decodedPost = jsonDecode(data);
      if (decodedPost["data"] != null) {
        posts = decodedPost["data"]["posts"];
        print(posts);
      } else if (decodedPost["error"] != null) {
        print('There is error');
      }
      setState(() {});
    });
    channel.sink.add(jsonEncode({
      "type": "get_posts",
      // "data": {"limit": 20}
    }));
  }

  initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PostDetails(detailPost: posts[index]))),
              child: Card(
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64),
                    child: Image.network(posts[index]["image"],
                        errorBuilder: (context, error, stackTrace) {
                      return Container();
                    }, fit: BoxFit.cover),
                  ),
                  title: Text(posts[index]["title"]),
                  subtitle: Text(posts[index]["description"]),
                  trailing: Wrap(
                    children: [
                      //Delete Icon
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                              IconData(57787, fontFamily: 'MaterialIcons'))),
                      //Favorite Icon
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                              IconData(57948, fontFamily: 'MaterialIcons')))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
