
// import 'dart:io';




//register username into the system
// void signIn() {
//   final username = stdin.readLineSync();
//   channel.sink.add({
//     "type": "sign_in",
//     "data": {"name": username}
//   });
//   channel.sink.close();
// }

//subscribe to Post Stream to get posts


// void createPost() {
//   final createTitle = stdin.readLineSync();
//   final createDescription = stdin.readLineSync();
//   final createImage = stdin.readLineSync();
//   channel.sink.add({
//     "type": "create_post",
//     "data": {
//       "title": createTitle,
//       "description": createDescription,
//       "image": createImage
//     }
//   });
// }

// void deletePost() {
//   final postId = stdin.readLineSync();
//   channel.sink.add({
//     "type": "delete_post",
//     "data": {"postId": postId}
//   });
// }

// void generalResponses() {
//   channel.sink.add(jsonEncode({"type": "ping", "data": {}, "errors": []}));
//   channel.sink.add(jsonEncode({
//     "type": "error",
//     "data": {},
//     "errors": ['An error occurred']
//   }));
// }

// @override
// void dispose() {
//   channel.sink.close();
//   dispose();
// }
