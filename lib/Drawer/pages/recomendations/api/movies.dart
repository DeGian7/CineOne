import 'package:cine_one/Drawer/pages/recomendations/api/movie.dart';

class Movies {
  Movies();

  static List<Movie> fromJsonList(List<dynamic> jsonList) {
    List<Movie> listaPeliculas = [];
    // ignore: unnecessary_null_comparison
    if (jsonList != null) {
      for (var pelicula in jsonList) {
        final movie = Movie.fromJson(pelicula);
        listaPeliculas.add(movie);
      }
    }
    return listaPeliculas;
  }
}