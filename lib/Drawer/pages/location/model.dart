class DataModel {
  final String title;
  final String imageName;
  final String direccion;
  final String price;

  DataModel(
    this.title,
    this.imageName,
    this.direccion,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("Cinemark Bellavista", "assets/establishment/cine1.jpg",
      "Jr. Loa 119, Cercado de Lima 07011", "15:00 – 22:00"),
  DataModel("Cinemark Jockey Plaza", "assets/establishment/cine2.jpg",
      "Av. Javier Prado Este 4200, Santiago de Surco 15023", "15:00 – 22:00"),
  DataModel("Cineplanet Brasil", "assets/establishment/cine3.jpg", 
      "Av. Brasil 714, Lima 15083", "15:00 – 22:00"),
  DataModel("Cineplanet Arequipa", "assets/establishment/cine4.jpg",
      "Av. Ejército Nro. 793, Cayma 04014", "15:00 – 22:00"),
  DataModel("Cineplanet Mall del Sur", "assets/establishment/cine5.jpg", 
      "Carr. Atocongo, San Juan de Miraflores 15801","15:00 – 22:00"),
  DataModel("Cinépolis Plaza Norte", "assets/establishment/cine6.jpg", 
      "Plaza Norte, Av. Tomas Valle, Independencia 15311","15:00 – 22:00"),
  DataModel("Cinépolis Santa Anita", "assets/establishment/cine7.jpg", 
      "Av. Nicolás Ayllón, Santa Anita 15022","15:00 – 22:00"),
  DataModel("Cine Star Breña", "assets/establishment/cine8.jpg", 
      "Iquique 315, Breña 15082","15:00 – 22:00"),
  DataModel("Cine Star UNI", "assets/establishment/cine9.jpg", 
      "Rímac 15333","15:00 – 22:00"),
];