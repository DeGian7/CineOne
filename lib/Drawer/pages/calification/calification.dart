import 'package:cine_one/Drawer/pages/calification/controlador.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'text_pdm.dart';

class Calification extends StatefulWidget {
  const Calification({Key? key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calification> {
  double _rating = 5.0;
  String _currentAnimation = '5+';
  SmileyController _smileyController = SmileyController();

  void _onChanged(double value) {
    if (_rating == value) return;

    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentAnimation = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(35),
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: 550,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 36),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(3, 12)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: FlareActor(
                                  'assets/login/happiness_emoji.flr',
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  controller: _smileyController,
                                  animation: _currentAnimation,
                                ),
                              ),
                              const TextPDM(
                                  text: 'Calificanos',
                                  color: Colors.white,
                                  fontSize: 20),
                              Slider(
                                value: _rating,
                                min: 1,
                                max: 5,
                                divisions: 4,
                                onChanged: _onChanged,
                              ),
                              Text(
                                '$_rating',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}