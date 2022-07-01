import 'package:cine_one/Drawer/drawer_item.dart';
import 'package:cine_one/Drawer/pages/settings.dart';
import 'package:cine_one/Drawer/pages/shopping.dart';
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
                  name: 'Mensajes',
                  icon: Icons.message_outlined,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Favoritos',
                  icon: Icons.favorite_outline,
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
                  name: 'Cerrar sesión',
                  icon: Icons.logout,
                  onPressed: ()=> onItemPressed(context, index: 5)
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopping()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopping()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopping()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopping()));
        break;  
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Shopping()));
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