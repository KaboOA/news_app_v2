import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/shared_pref_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitState());
  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int index = 0;

  void changeIndex(int ind) {
    index = ind;
    emit(ChangeBottonNavIndexState());
  }

  List business = [];
  void getBusinessData() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData('business').then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      emit(NewsGetBusinessFailedState(err: onError.toString()));
      debugPrint(onError.toString());
    });
  }

  List sports = [];
  void getSportsData() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData('sports').then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((onError) {
      emit(NewsGetSportsFailedState(err: onError.toString()));
      debugPrint(onError.toString());
    });
  }

  List science = [];
  void getScienceData() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData('science').then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((onError) {
      emit(NewsGetScienceFailedState(err: onError.toString()));
      debugPrint(onError.toString());
    });
  }

  List search = [];
  void getSearchData(String val) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getSearchData(val).then((value) {
      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      emit(NewsGetSearchFailedState(err: onError.toString()));
      debugPrint(onError.toString());
    });
  }

  void clearSerach() {
    search = [];
    emit(NewsClearSearcState());
  }

  bool isDark = SharedPrefHelper.getBoolean(key: 'isDark');

  void changeThemeMode() {
    isDark = !isDark;
    SharedPrefHelper.putBoolean(key: 'isDark', val: isDark).then((value) {
      emit(ChangeThemeModeState());
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
  }
}
