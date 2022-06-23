
class DateTimeModel {

  final String day;
  final String number;

  DateTimeModel({ required this.day, required this.number});


  static List<DateTimeModel> listDate = [

    DateTimeModel(day: 'Mie', number: '08'),
    DateTimeModel(day: 'Vie', number: '10'),
    DateTimeModel(day: 'Sab', number: '11'),
    DateTimeModel(day: 'Dom', number: '12'),
    DateTimeModel(day: 'Lun', number: '13'),

  ];

  static List<String> listTime = [
    '17:30 PM',
    '18:50 PM',
    '19:20 PM',
    '20:00 PM',
    '21:30 PM',
    '22:15 PM',
    '22:50 PM',
  ];

}