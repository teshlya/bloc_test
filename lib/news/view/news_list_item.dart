import 'package:bloc_test/news/models/news.dart';
import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({Key key, @required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
          height: 120,
          child: Stack(children: <Widget>[
            _getCard(news),
            _onTapCard(news),
          ])),
    );
  }

  Widget _getCard(News image) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: _getContainCard(image),
    );
  }

  Widget _onTapCard(News news) {
    return Positioned.fill(
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: () => _openNews(news),
            )));
  }

  _openNews(News news) {
    /*Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsScreen(
              news: news,
            )));*/
  }

  Widget _getContainCard(News news) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _getImage(news.smallImage),
        ),
        Expanded(
          flex: 2,
          child: _getTitle(news.title),
        ),
      ],
    );
  }


  Widget _getImage(String url) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Text(title != null ? title : ""))
        ]));
  }
}