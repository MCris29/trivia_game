import 'dart:convert';

class Movie {
  int id;
  String name;
  String? posterPath;
  String? backdropPath;

  String? heroAnimationID;

  Movie({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  getPosterImg() {
    if (this.posterPath == null) {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    } else {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    }
  }

  getBackgroundImg() {
    if (this.backdropPath == null) {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    } else {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    }
  }
}
