import 'package:firebase_database/firebase_database.dart';
import 'message.dart';

class MessageFirebase {
  final DatabaseReference _messagesRef =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('mensajes');

  void guardarMensaje(Message message) {
    _messagesRef.push().set(message.toJson());
  }

  Query getMensajes() => _messagesRef;
}