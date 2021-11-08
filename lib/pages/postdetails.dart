import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  final detailPost;

  PostDetails({
    Key? key,
    required this.detailPost,
  }) : super(key: key);
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                                IconData(57492, fontFamily: 'MaterialIcons')),
                            label: Text(
                              'Back',
                              style: TextStyle(fontSize: 15),
                            )),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 350,
                        height: 200,
                        color: Colors.blue,
                        child: Image.network(
                            widget.detailPost["image"].toString()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text("${widget.detailPost["title"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(IconData(57948,
                                          fontFamily: 'MaterialIcons')),
                                      iconSize: 28,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text(
                              "${widget.detailPost["description"]}",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
