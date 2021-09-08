import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
  Category(9,"Cultura General"),
  Category(10,"Libros"),
  Category(11,"Películas"),
  Category(12,"Musica"),
  Category(13,"Teatro"),
  Category(14,"Televisión"),
  Category(15,"Video Juegos"),
  Category(16,"Juegos de mesa"),
  Category(17,"Ciencia"),
  Category(18,"Computación"),
  Category(19,"Matemáticas"),
  Category(20,"Mitología"),
  Category(21,"Deportes"),
  Category(22,"Geografía"),
  Category(23,"Historia"),
  Category(24,"Política"),
  Category(25,"Arte"),
  Category(26,"Celebridades"),
  Category(27,"Animales"),
  Category(28,"Vehículos"),
  Category(29,"Comics"),
  Category(30,"Herramientas"),
  Category(31,"Anime"),
  Category(32,"Animación"),
];