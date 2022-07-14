import 'package:cine_one/Drawer/pages/Recomendations/ui/cajapelicula.dart';
import 'package:cine_one/Drawer/pages/Recomendations/ui/spinnerwidget.dart';
import 'package:flutter/material.dart';

import 'api/services.dart';

class MovieRecomend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff22222C),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          title: const Text('Películas destacadas'),
        ),
        body: FutureBuilder(
          //podría poner
          //initialData: [],
          future: TheMovieDBService.getTopRatedMovies(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var pelicula = snapshot.data![index];
                  return CajaPelicula(peli: pelicula);
                },
              );
            } else {
              return SpinnerWidget();
            }
          },
        ));
  }
}