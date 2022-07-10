import 'package:cine_one/Drawer/pages/location/model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22222C),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Text(
              widget.data.title,
              style: const TextStyle(
                  color: Color(0xff22222C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0.0, left: 40.0, right: 40.0, bottom: 60.0,
                ),
                child: Hero(
                  tag: widget.data.imageName,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff22222C),
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.data.imageName,
                            ),
                            fit: BoxFit.fill),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color(0xff22222C))
                        ]),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                widget.data.direction,
                style: const TextStyle(
                    color: Color(0xff22222C),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                widget.data.price,
                style: const TextStyle(
                    color: Color(0xff22222C),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}