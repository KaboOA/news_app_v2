import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Constants.buildNewsItem(
              image: cubit.sports[index]['urlToImage'] ?? '',
              title: cubit.sports[index]['title'] ?? '',
              disc: cubit.sports[index]['description'] ?? '',
              context: context,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20.0),
            itemCount: cubit.sports.length,
          ),
        );
      },
    );
  }
}
