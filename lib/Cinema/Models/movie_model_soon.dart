class MovieModelSoon {

  final String id;
  final String name;
  final String image;
  final double qualification;
  
  const MovieModelSoon({
    required this.id,
    required this.name,
    required this.image,
    required this.qualification,

  });

static List<MovieModelSoon> listMovie = [

    MovieModelSoon(
      id: '9', 
      name: 'Lightyear', 
      image: 'assets/cinema/movie9.jpg', 
      qualification: 5, 
    ),
    MovieModelSoon(
      id: '10', 
      name: 'El peso del Talento', 
      image: 'assets/cinema/movie10.jpg', 
      qualification: 5, 
    ),
    MovieModelSoon(
      id: '11', 
      name: 'Asesino sin \nmemoria', 
      image: 'assets/cinema/movie11.jpg', 
      qualification: 5, 
    ),
    MovieModelSoon(
      id: '12', 
      name: 'Thor: Love and \nThunder', 
      image: 'assets/cinema/movie12.jpeg', 
      qualification: 5, 
    ),
    MovieModelSoon(
      id: '13', 
      name: 'Jurasic World: \nDominion', 
      image: 'assets/cinema/movie13.jpg', 
      qualification: 5, 
    ),
    MovieModelSoon(
      id: '14', 
      name: 'Avatar 2', 
      image: 'assets/cinema/movie14.jpg', 
      qualification: 5, 
    ),

  ];

}