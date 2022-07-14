import 'package:cine_one/Cinema/details_payment_page.dart';
import 'package:cine_one/Drawer/drawer_item.dart';
import 'package:cine_one/Drawer/pages/Recomendations/recomendados.dart';
import 'package:cine_one/Drawer/pages/calification/calification.dart';
import 'package:cine_one/Drawer/pages/help/messages_list.dart';
import 'package:cine_one/Drawer/pages/location/home.dart';
import 'package:cine_one/Drawer/pages/settings.dart';
import 'package:cine_one/Drawer/pages/user/profile_page.dart';
import 'package:cine_one/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff22222C),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Mi cuenta',
                icon: Icons.account_box_rounded,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Mis compras',
                  icon: Icons.shop_two,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Recomendados',
                  icon: Icons.star_half_outlined,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Ubícanos',
                  icon: Icons.map_rounded,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Califícanos',
                  icon: Icons.emoji_emotions_sharp,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Ajustes',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 5)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Ayuda',
                  icon: Icons.help_outlined,
                  onPressed: ()=> onItemPressed(context, index: 6)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Cerrar sesión',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 7)
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPaymentPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieRecomend()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Location()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Calification()));
        break;  
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesList()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;

    }
  }

Widget headerWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final User? usuario = FirebaseAuth.instance.currentUser;
    String? email = "";

    if (usuario != null) {
      email = usuario.email;
    }
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/login/user.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          email!,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}