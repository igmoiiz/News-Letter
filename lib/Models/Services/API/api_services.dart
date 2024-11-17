import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_letter/Models/Consts/consts.dart';
import 'package:news_letter/Models/NewsModel.dart';

class ApiServices extends ChangeNotifier {
  //  variables
  late Future<NewsResponse> futureNews;

  // ! method for fetching news
  Future<NewsResponse> fetchNews() async {
    final response = await http.get(Uri.parse(ENDPOINT));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  // ! Method to refresh the news
  Future<void> refreshNews() async {
    futureNews = fetchNews();
    notifyListeners();
  }
}
