import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      var cubit = NewsCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                cubit.search = [];
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Search'),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  if (value.isEmpty) {
                    cubit.clearSerach();
                  }
                },
                onFieldSubmitted: (value) {
                  cubit.getSearchData(value);
                },
              ),
              const SizedBox(height: 25.0),
              ConditionalBuilder(
                condition: state is NewsGetSearchLoadingState,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                fallback: (context) => Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Constants.buildNewsItem(
                      image: cubit.search[index]['urlToImage'] ?? '',
                      title: cubit.search[index]['title'] ?? '',
                      disc: cubit.search[index]['description'] ?? '',
                      context: context,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20.0),
                    itemCount: cubit.search.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
