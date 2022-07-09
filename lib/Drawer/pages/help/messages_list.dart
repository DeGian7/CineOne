import 'package:cine_one/Drawer/pages/help/data/message.dart';
import 'package:cine_one/Drawer/pages/help/data/message_firebase.dart';
import 'package:cine_one/Drawer/pages/help/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class MessagesList extends StatefulWidget {
  MessagesList({Key? key}) : super(key: key);
  final messageFirebase = MessageFirebase();

  @override
  MessagesListState createState() => MessagesListState();
}

class MessagesListState extends State<MessagesList> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollHaciaAbajo());

    return Scaffold(
        appBar: AppBar(title: const Text('Soporte técnico')),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
              _getListaMensajes(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextField(
                            keyboardType: TextInputType.text,
                            controller: _mensajeController,
                            onChanged: (text) => setState(() {}),
                            onSubmitted: (input) {
                              _enviarMensaje();
                            },
                            decoration: const InputDecoration(
                                hintText: 'Escribe un mensaje')))),
                IconButton(
                    icon: Icon(_puedoEnviarMensaje()
                        ? CupertinoIcons.arrow_right_circle_fill
                        : CupertinoIcons.arrow_right_circle),
                    onPressed: () {
                      _enviarMensaje();
                    })
              ]),
            ])));
  }

  void _enviarMensaje() {
    if (_puedoEnviarMensaje()) {
      final mensaje = Message(_mensajeController.text, DateTime.now());
      widget.messageFirebase.guardarMensaje(mensaje);
      _mensajeController.clear();
      setState(() {});
    }
  }

  bool _puedoEnviarMensaje() => _mensajeController.text.length > 0;

  Widget _getListaMensajes() {
    return Expanded(
        child: FirebaseAnimatedList(
      controller: _scrollController,
      query: widget.messageFirebase.getMensajes(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        final mensaje = Message.fromJson(json);
        return MessageWidget(mensaje.texto, mensaje.fecha);
      },
    ));
  }

  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}