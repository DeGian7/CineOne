import 'package:cine_one/Drawer/pages/recomendations/api/movie.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pelicula extends StatelessWidget {

  Movie movie;

  Pelicula({required this.movie}): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22222C),
        title: Text(this.movie.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Image.network(this.movie.getImage()),
          Text(this.movie.overview)
        ],
      )
    );
  }
}