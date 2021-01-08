part of 'news_bloc.dart';

enum NewsStatus { initial, success, failure }

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.news_list = const <News>[],
  });

  final NewsStatus status;
  final List<News> news_list;

  NewsState copyWith({
    NewsStatus status,
    List<News> news_list,
  }) {
    return NewsState(
      status: status ?? this.status,
      news_list: news_list ?? this.news_list,
    );
  }

  @override
  List<Object> get props => [status, news_list];
}
