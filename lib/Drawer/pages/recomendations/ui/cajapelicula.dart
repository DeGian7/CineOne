import 'package:cine_one/Drawer/pages/recomendations/api/movie.dart';
import 'package:cine_one/Drawer/pages/recomendations/ui/pelicula.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CajaPelicula extends StatelessWidget {
  
  Movie peli;
  
  CajaPelicula({required this.peli});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.peli.title),
      subtitle: Text(this.peli.voteAverage.toString() + " (" + this.peli.voteCount.toString() + ")"),
      trailing: Image.network(this.peli.getImage()),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:
        (context) => Pelicula (movie: this.peli)));
      },
    );
  }
}