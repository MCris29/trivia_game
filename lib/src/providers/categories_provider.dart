import 'package:flutter/material.dart';
import 'package:trivia_game/src/models/categories_model.dart';
import 'package:trivia_game/src/services/categories_service.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];

  Future<List<Category>> getCategories() async {

    var service = new CategoriesServices();
    this.categories = await service.getAll();
    notifyListeners();
    return categories;
  }

  Future<List<Category>> refreshCategories() async {
    var service = new CategoriesServices();
    this.categories = await service.getAll();
    notifyListeners();
    return categories;
  }
}
