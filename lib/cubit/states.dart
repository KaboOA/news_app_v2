abstract class NewsState {}

class NewsInitState extends NewsState {}

class ChangeBottonNavIndexState extends NewsState {}

///////////////
class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessFailedState extends NewsState {
  String err;
  NewsGetBusinessFailedState({required this.err});
}

class NewsGetBusinessLoadingState extends NewsState {}

////////////////////////
class NewsGetSportsSuccessState extends NewsState {}

class NewsGetSportsFailedState extends NewsState {
  String err;
  NewsGetSportsFailedState({required this.err});
}

class NewsGetSportsLoadingState extends NewsState {}

//////////////////////////
class NewsGetScienceSuccessState extends NewsState {}

class NewsGetScienceFailedState extends NewsState {
  String err;
  NewsGetScienceFailedState({required this.err});
}

class NewsGetScienceLoadingState extends NewsState {}

//////////////////////////
class NewsGetSearchSuccessState extends NewsState {}

class NewsGetSearchFailedState extends NewsState {
  String err;
  NewsGetSearchFailedState({required this.err});
}

class NewsGetSearchLoadingState extends NewsState {}

class ChangeThemeModeState extends NewsState {}

class NewsClearSearcState extends NewsState {}
