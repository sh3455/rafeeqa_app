import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../model/app_user_pref_model.dart';

class SettingsCubit extends HydratedCubit<AppUserPref>{
  SettingsCubit() : super(AppUserPref.standard());



void changeLanguage(String lang){

  emit(state.copyWith(lang:lang));
}

void changeTheme(ThemeMode theme){

  emit(state.copyWith(theme: theme));
}

void setFristTime(bool isFirstTime){

  emit(state.copyWith(isFirstTime: isFirstTime));
}

void setNotificationsEnabled(bool enabled){

  emit(state.copyWith(notificationsEnabled: enabled));
}


@override
  AppUserPref? fromJson(Map<String, dynamic> json) {
    return AppUserPref.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppUserPref state) {
    return state.toJson();
  }









}