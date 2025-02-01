import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: state is NewsGetBusinessLoadingState ||
              state is NewsGetSportsLoadingState ||
              state is NewsGetScienceLoadingState,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
          fallback: (context) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Constants.buildNewsItem(
                image: cubit.business[index]['urlToImage'] ?? '',
                title: cubit.business[index]['title'] ?? '',
                disc: cubit.business[index]['description'] ?? '',
                context: context,
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20.0),
              itemCount: cubit.business.length,
            ),
          ),
        );
      },
    );
  }
}
