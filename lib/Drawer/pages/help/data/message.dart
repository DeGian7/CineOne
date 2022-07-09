class Message {
  final String texto;
  final DateTime fecha;

  Message(this.texto,this.fecha);

  Message.fromJson(Map<dynamic, dynamic> json)
    : fecha = DateTime.parse(json['fecha'] as String),
      texto = json['texto'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'fecha': fecha.toString(),
    'texto': texto,
  };
}