import 'package:cine_one/Theme/models/preferences.dart';
import 'package:cine_one/Theme/services/preferences.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreferencesCubit extends Cubit<Preferences> {
  final PreferencesService _service;

  PreferencesCubit(
    this._service,
    Preferences initialState,
  ) :super(initialState);

  Future<void> deleteAllPreferences() async {
    await _service.clear();
    emit(Preferences.defaultValue());
  }
}