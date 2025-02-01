import 'package:flutter/material.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

class Constants {
  static String baseUrl = 'https://newsapi.org/v2/';
  static String method = 'top-headlines';
  static String searchMethod = 'everything';

  static List screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  static Widget buildNewsItem(
          {required String image,
          required String title,
          required String disc,
          required BuildContext context}) =>
      Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  disc,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      );
}
