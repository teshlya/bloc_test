import 'package:bloc_test/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'news_list.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: BlocProvider(
          create: (_) =>
              NewsBloc(httpClient: http.Client())..add(NewsFetched()),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 25, 178, 238),
                  Color.fromARGB(255, 21, 236, 229)
                ],
              ),
            ),
            child: NewsList(),
          )),
    );
  }
}
