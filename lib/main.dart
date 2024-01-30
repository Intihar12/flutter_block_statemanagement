import 'package:bloc_tutorials/Utils/image_picker_utils.dart';
import 'package:bloc_tutorials/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_tutorials/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_tutorials/bloc/favourite/favourite_event.dart';
import 'package:bloc_tutorials/bloc/form_validation_bloc/my_form_bloc.dart';
import 'package:bloc_tutorials/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorials/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_tutorials/repository/favourite_reposiotry.dart';
import 'package:bloc_tutorials/view/counter/counter_screen.dart';
import 'package:bloc_tutorials/view/favourite/favourite_screen.dart';
import 'package:bloc_tutorials/view/todo/post_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo/to_do_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => MyFormBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())..add(FetchFavouriteList())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: PostScreen(),
        ));
  }
}
