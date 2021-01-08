import 'package:bloc_test/news/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final News news;

  NewsScreen({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
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
      child: _getNews(),
    );
  }

  Widget _getNews() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, //.horizontal
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _getTitle(),
            SizedBox(height: 10.0),
            _getAbstract(),
            SizedBox(height: 10.0),
            _getImage(),
            SizedBox(height: 10.0),
            _getCaption(),
          ],
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      news.title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _getAbstract() {
    return Text(
      news.abstract,
      style: TextStyle(fontSize: 18),
    );
  }

  Widget _getImage() {
    return Center(
      child: Image.network(
        news.fullImage,
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

  Widget _getCaption() {
    return Text(
      news.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
