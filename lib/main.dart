import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/shared_pref_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'cubit/bloc_observer.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    debugPrint('windows');
    await DesktopWindow.setMinWindowSize(const Size(1200.0, 1200.0));
  }
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  SharedPrefHelper.init().then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusinessData()
        ..getSportsData()
        ..getScienceData(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeLayout(),
          themeMode:
              NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
        ),
      ),
    );
  }
}
