import 'package:cine_one/Cinema/details_payment_page.dart';
import 'package:cine_one/Drawer/drawer_item.dart';
import 'package:cine_one/Drawer/pages/calification/calification.dart';
import 'package:cine_one/Drawer/pages/help/messages_list.dart';
import 'package:cine_one/Drawer/pages/location/home.dart';
import 'package:cine_one/Drawer/pages/settings.dart';
import 'package:cine_one/Drawer/pages/user/profile_page.dart';
import 'package:cine_one/Login/login.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff22222C),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
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
                  name: 'Ubícanos',
                  icon: Icons.map_rounded,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Califícanos',
                  icon: Icons.emoji_emotions_sharp,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Ajustes',
                  icon: Icons.settings,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Ayuda',
                  icon: Icons.help_outlined,
                  onPressed: ()=> onItemPressed(context, index: 5)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Cerrar sesión',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 6)
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Calification()));
        break;  
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesList()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/login/user.png'),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Nombre de usuario', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('correo@email.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}