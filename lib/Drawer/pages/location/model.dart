class DataModel {
  final String title;
  final String imageName;
  final String direction;
  final String price;

  DataModel(
    this.title,
    this.imageName,
    this.direction,
    this.price,
  );
}

List<DataModel> dataList = [
  
  DataModel("Cinemark Bellavista", "assets/establishment/cine1.jpg",
      "Jr. Loa 119, Cercado de Lima", "15:00 – 22:00"),

  DataModel("Cinemark Jockey Plaza", "assets/establishment/cine2.jpg",
      "Av. Javier Prado Este 4200", "15:00 – 22:00"),

  DataModel("Cineplanet Brasil", "assets/establishment/cine3.jpg", 
      "Av. Brasil 714, Lima", "15:00 – 22:00"),

  DataModel("Cineplanet Arequipa", "assets/establishment/cine4.jpg",
      "Av. Ejército Nro. 793, Cayma", "15:00 – 22:00"),

  DataModel("Cineplanet Mall del Sur", "assets/establishment/cine5.jpg", 
      "Carr. Atocongo, SJM","15:00 – 22:00"),

  DataModel("Cinépolis Plaza Norte", "assets/establishment/cine6.jpg", 
      "Plaza Norte, Av. Tomas Valle","15:00 – 22:00"),

  DataModel("Cinépolis Santa Anita", "assets/establishment/cine7.jpg", 
      "Av. Nicolás Ayllón, Santa Anita","15:00 – 22:00"),

  DataModel("Cine Star Breña", "assets/establishment/cine8.jpg", 
      "Iquique 315, Breña","15:00 – 22:00"),

  DataModel("Cine Star UNI", "assets/establishment/cine9.jpg", 
      "Rímac 15333","15:00 – 22:00"),
];