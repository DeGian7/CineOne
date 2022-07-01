import 'dart:ui';

import 'package:cine_one/Cinema/Models/movie_model_soon.dart';
import 'package:cine_one/Drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cine_one/Cinema/Models/movie_model.dart';
import 'package:cine_one/Cinema/Models/trailers_model.dart';
import 'package:cine_one/Cinema/details_movie_page.dart';
import 'package:cine_one/Cinema/Widgets/Widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeCinePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      drawer: NavigationDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff22222C),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 30),
              onPressed: () => _scaffoldKey.currentState!.openDrawer());}),
        elevation: 0,
        actions: [
          Icon(Icons.search, size: 30),
          SizedBox(width: 10.0),
          Icon(Icons.notifications_rounded, size: 30),
          SizedBox(width: 15.0),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/login/user.png')
              )
            ),
          ),
          SizedBox(width: 15.0),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        children: [
          _ItemTitle(title: 'Trailers'),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 200,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: TrailersMovie.listTrailers.length,
                itemBuilder: (context, i) =>
                    _ItemTrailers(trailers: TrailersMovie.listTrailers[i])),
          ),
          SizedBox(height: 20.0),
          _ItemTitle(title: 'En cartelera'),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length,
              itemBuilder: (context, i) =>
                  _ItemsNowCinemas(movieModel: MovieModel.listMovie[i]),
            ),
          ),
          SizedBox(height: 20.0),
          _ItemTitle(title: 'Próximos estrenos'),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, i) =>
                  _ItemsSoonMovie(movieModelSoon: MovieModelSoon.listMovie[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemsSoonMovie extends StatelessWidget {
  final MovieModelSoon movieModelSoon;

  const _ItemsSoonMovie({Key? key, required this.movieModelSoon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(movieModelSoon.image))),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 160,
              child: TextOne(text: movieModelSoon.name, color: Colors.black),
            ),
            SizedBox(height: 5.0),
            RatingBar.builder(
                itemSize: 22,
                initialRating: movieModelSoon.qualification,
                itemBuilder: (_, i) =>
                    Icon(Icons.star_rate_rounded, color: Colors.amber),
                onRatingUpdate: (_) {})
          ],
        ),
      ),
    );
  }
}

class _ItemsNowCinemas extends StatelessWidget {
  final MovieModel movieModel;

  const _ItemsNowCinemas({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsMoviePage(movieModel: movieModel))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'movie-hero-${movieModel.id}',
              child: Container(
                height: 210,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(movieModel.image))),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 160,
              child: TextOne(text: movieModel.name, color: Colors.black),
            ),
            SizedBox(height: 5.0),
            RatingBar.builder(
                itemSize: 22,
                initialRating: movieModel.qualification,
                itemBuilder: (_, i) =>
                    Icon(Icons.star_rate_rounded, color: Colors.amber),
                onRatingUpdate: (_) {})
          ],
        ),
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  final String title;

  const _ItemTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextOne(
                text: title,
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500),
            TextOne(text: 'Ver todo', color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _ItemTrailers extends StatelessWidget {
  final TrailersMovie trailers;

  const _ItemTrailers({Key? key, required this.trailers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(trailers.image))),
          ),
          Container(
            width: 300,
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white.withOpacity(0.3),
                    child: Icon(Icons.play_arrow_rounded,
                        color: Colors.white, size: 45)),
              ),
            )),
          )
        ],
      ),
    );
  }
}