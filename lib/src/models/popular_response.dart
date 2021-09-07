import 'dart:convert';
import 'package:trivia_game/src/models/models.dart';

class PopularResponse {
  List<Movie> results;

  PopularResponse({
    required this.results,
  });

  factory PopularResponse.fromJson(String str) =>
      PopularResponse.fromMap(json.decode(str));

  factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        results: List<Movie>.from(
            json["trivia_categories"].map((x) => Movie.fromMap(x))),
      );
}
