import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class News extends Equatable {
  final String title;
  final String abstract;
  final String caption;
  final String smallImage;
  final String fullImage;

  News(
      {@required this.title,
      @required this.abstract,
      @required this.caption,
      @required this.smallImage,
      @required this.fullImage});

  @override
  List<Object> get props => [title, abstract, caption, smallImage, fullImage];
}
