import 'dart:async';
import 'dart:convert';

import 'package:bloc_test/news/models/news.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({@required this.httpClient}) : super(const NewsState());

  final http.Client httpClient;

  @override
  Stream<Transition<NewsEvent, NewsState>> transformEvents(
    Stream<NewsEvent> events,
    TransitionFunction<NewsEvent, NewsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsFetched) {
      yield await _mapNewsFetchedToState(state);
    }
  }

  Future<NewsState> _mapNewsFetchedToState(NewsState state) async {
    try {
      final news_list = await _fetchPosts();
      return state.copyWith(
        status: NewsStatus.success,
        news_list: List.of(state.news_list)..addAll(news_list),
      );
    } on Exception {
      return state.copyWith(status: NewsStatus.failure);
    }
  }

  Future<List<News>> _fetchPosts() async {
    final response = await httpClient.get(
      'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=QXKveGAutV0PGZ158jeI8UmuunS3QFIK',
    );
    if (response.statusCode == 200) {
      print (response.body);
      final body = json.decode(response.body)['results'] as List;
      return body.map((dynamic json) {
        return News(
            title: json['title'] as String,
            abstract: json['abstract'] as String,
            caption: json['multimedia'][0]['caption'] as String,
            smallImage: json['multimedia'][1]['url'] as String,
            fullImage: json['multimedia'][0]['url'] as String);
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
