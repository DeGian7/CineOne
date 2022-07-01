import 'package:cine_one/Theme/blocs/preferences_bloc.dart';
import 'package:cine_one/Theme/models/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, Preferences>(
      builder: (context, preferences) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Color(0xff22222C),
            actions: [
              IconButton(
                icon: Icon(Icons.restore),
                onPressed: 
                    context.read<PreferencesCubit>().deleteAllPreferences,
              )
            ],
          ),
          body: ListView(
            children: [
              _buildThemeSelect(preferences, context),
            ],
          ),
        );
      },
    );    
  }

  Widget _buildThemeSelect(Preferences preferences, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              title: Text("Modo Oscuro"),
              value: ThemeMode.dark,
              groupValue: preferences.themeMode,
              onChanged: (s) {
                context.read()<PreferencesCubit>().changePreferences(
                    preferences.copyWith(themeMode: ThemeMode.light));
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text("Modo Claro"),
              value: ThemeMode.light,
              groupValue: preferences.themeMode, 
              onChanged: (s) {
                context.read()<PreferencesCubit>().changePreferences(
                  preferences.copyWith(themeMode: ThemeMode.dark));
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text("Sistema"),
              subtitle: Text("Modo automático del sistema"),
              value: ThemeMode.system,
              groupValue: preferences.themeMode, 
              onChanged: (s) {
                context.read()<PreferencesCubit>().changePreferences(
                  preferences.copyWith(themeMode: ThemeMode.system));
              },
            ),
          ],
        ),
      ),
    );
  }
}