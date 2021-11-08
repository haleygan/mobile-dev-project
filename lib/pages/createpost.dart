import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CreatePost extends StatefulWidget {
  CreatePost({required this.channel, Key? key}) : super(key: key);
  final WebSocketChannel channel;
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
  late WebSocketChannel channel = widget.channel;
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();
  TextEditingController _imageURLcontroller = TextEditingController();

  void submitPost() {
    if (_titlecontroller.text.isNotEmpty &&
        _descriptioncontroller.text.isNotEmpty &&
        _imageURLcontroller.text.isNotEmpty) {
      channel.sink.add(
          '{"type": "create_post","data": {"title": "${_titlecontroller.text}", "description": "${_descriptioncontroller.text}", "image": "${_imageURLcontroller.text}"}}');
      print(_titlecontroller.text);
      print(_descriptioncontroller.text);
      print(_imageURLcontroller.text);
      print("Your New Post is Created");
      _titlecontroller.clear();
      _descriptioncontroller.clear();
      _imageURLcontroller.clear();
      submitPost();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Title',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                              controller: _titlecontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Title of your post',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              )),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            child: TextFormField(
                                controller: _descriptioncontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter description';
                                  }
                                  return null;
                                },
                                maxLines: 9,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Description of your post',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic),
                                )),
                          ),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Image URL',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                              controller: _imageURLcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter image url';
                                }
                                return null;
                              },
                              maxLines: 2,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Image url of your post',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              )),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                submitPost();
                              } else
                                return null;
                            },
                            child: Text('CREATE POST')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('CANCEL')),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
