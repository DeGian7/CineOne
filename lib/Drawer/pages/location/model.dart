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
  DataModel("Cine Star Breña", "assets/establishment/1.jpg",
      "Av. Iquique 315, Breña 15082", "15:00 – 22:00"),
  DataModel("Cine Star UNI", "assets/establishment/2.jpg", "Av. Rímac 15333",
      "15:00 – 22:00"),
  DataModel("Cine Planet", "assets/establishment/3.jpg",
      "Av. Sta. Cruz 814, Lima 15073", "Av. Rímac 15333"),
  DataModel("Jeans Skirt", "assets/establishment/4.jpg", "Av. Javier Prado Este 4200,",
      "15:00 – 22:00"),
];