import 'package:bloc_test/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_list_item.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = context.read<NewsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        switch (state.status) {
          case NewsStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case NewsStatus.success:
            if (state.news_list.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return NewsListItem(news : state.news_list[index]);
              },
              itemCount: state.news_list.length
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}