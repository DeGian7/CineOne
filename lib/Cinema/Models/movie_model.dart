
class MovieModel {

  final String id;
  final String name;
  final String image;
  final double qualification;
  final int year;
  final String duration;
  final String genre;
  final String description;
  

  const MovieModel({
    required this.id,
    required this.name,
    required this.image,
    required this.qualification,
    required this.year,
    required this.duration,
    required this.genre,
    required this.description 
  });


  static List<MovieModel> listMovie = [

    MovieModel(
      id: '1',
        name: 'Morbius',
        image: 'Assets/cinema/movie1.jpg',
        qualification: 4,
        year: 2022,
        duration: '1h 49m',
        genre: 'Terror. Ciencia ficción. Acción',
        description:
            'Ambientada en el universo de Spider Man, se centra en uno de sus villanos más icónicos, Morbius, un doctor que tras sufrir una enfermedad en la sangre y fallar al intentar curarse, se convirtió en un vampiro.'),
    MovieModel(
        id: '2',
        name: 'Uncharted',
        image: 'Assets/cinema/movie2.jpg',
        qualification: 5,
        year: 2022,
        duration: '1h 55m',
        genre: 'Aventuras. Acción',
        description:
            'El cazador de tesoros Victor Sullivan recluta a Nathan Drake para que lo ayude a recuperar una fortuna de 500 años de antigüedad. Lo que comienza como un atraco se convierte en una competencia contra el despiadado Santiago Moncada.'),
    MovieModel(
        id: '3',
        name: 'Scream',
        image: 'Assets/cinema/movie3.jpg',
        qualification: 5,
        year: 2022,
        duration: '1h 52m',
        genre: 'Terror. Thriller. Intriga',
        description:
            '25 años después de que una racha de asesinatos brutales conmocionara a la tranquila ciudad de Woodsboro, un nuevo asesino imitador se ha puesto la máscara de Ghostface para resucitar secretos del pasado.'),
    MovieModel(
        id: '4',
        name: 'Sonic 2',
        image: 'Assets/cinema/movie4.jpg',
        qualification: 4,
        year: 2022,
        duration: '2h 02m',
        genre: 'Aventuras. Acción. Comedia',
        description:
            'Después de establecerse en Green Hills, Sonic quiere demostrar que tiene madera de héroe. La prueba de fuego llega con el retorno del malvado Robotnik, y su nuevo compinche, Knuckles, en busca de una esmeralda que destruye civilizaciones.'),
    MovieModel(
        id: '5',
        name: 'The Batman',
        image: 'Assets/cinema/movie5.jpg',
        qualification: 5,
        year: 2022,
        duration: '2h 55m',
        genre: 'Thriller. Intriga. Acción',
        description:
            'En su segundo año luchando contra el crimen, Batman explora la corrupción existente en la ciudad de Gotham y el vínculo de esta con su propia familia. Además, entrará en conflicto con un asesino en serie conocido como "el Acertijo".'),
    MovieModel(
        id: '6',
        name: 'Moonfall',
        image: 'Assets/cinema/movie6.jpg',
        qualification: 5,
        year: 2022,
        duration: '2h 10m',
        genre: 'Ciencia ficción',
        description:
            'Una fuerza misteriosa golpea a la Luna fuera de su órbita y la envía en choque directo contra la Tierra a toda velocidad.Pero solo el astronauta Brian Harper y el teórico conspiranoico KC Houseman la creen. Todos juntos montarán una misión fuera de lo común.'),
    MovieModel(
        id: '7',
        name: 'Doctor Strange:\n in the multiverse of madness',
        image: 'Assets/cinema/movie7.jpg',
        qualification: 5,
        year: 2022,
        duration: '2h 06m',
        genre: 'Fantástico. Acción. Terror',
        description:
            'El Dr. Stephen Strange abre un portal al multiverso al utilizar un hechizo prohibido. Ahora su equipo debe enfrentarse a una amenaza enorme.'),
    MovieModel(
        id: '8',
        name: "Top Gun: Maverick",
        image: 'Assets/cinema/movie8.jpg',
        qualification: 5,
        year: 2022,
        duration: '2h 11m',
        genre: 'Acción. Drama',
        description:
            'Tras más de 30 años de servicio como uno de los mejores aviadores de la Armada, Pete "Maverick" Mitchel se encuentra dónde siempre quiso estar, empujando los límites como un valiente piloto de prueba.'),
  ];
}