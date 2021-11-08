import 'package:bloc/bloc.dart';

class PostCubit extends Cubit<List> {
  PostCubit() : super([]);

  List favoriteList = [];

  //add post to favorite list
  void favoritePost() => emit(favoriteList);

  //delete post from favorite list
  void deletePost() => emit(state);
}
