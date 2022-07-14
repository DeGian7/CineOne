import 'dart:convert';
import 'package:cine_one/Drawer/pages/recomendations/api/movie.dart';
import 'package:cine_one/Drawer/pages/recomendations/api/movies.dart';
import 'package:http/http.dart' as http;

class TheMovieDBService {
  // ignore: non_constant_identifier_names
  static const String API_url = "https://api.themoviedb.org/3";
  // ignore: constant_identifier_names
  static const String API_key = "76fe3238911f472b26b88252b2935699";

  static Future<List<Movie>> getTopRatedMovies() async {
    var url = API_url + "/movie/top_rated?api_key=" + API_key + "&language=es";
    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      final respuestaJSON = json.decode(respuesta.body);
      final peliculasMejorValoradas =
          Movies.fromJsonList(respuestaJSON['results']);
      return peliculasMejorValoradas;
    }
    return <Movie>[];
  }
}