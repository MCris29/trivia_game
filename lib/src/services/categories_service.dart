import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trivia_game/src/models/categories_model.dart';

class CategoriesServices {
  Future<List<Category>> getAll() async {
    final response =
        await http.get(Uri.parse('https://opentdb.com/api_category.php'));

    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);

      var lst = <Category>[];

      for (var category in decoded['trivia_categories']) {
        var pl = new Category.fromJson(category);
        lst.add(pl);
      }
      return lst;
    }

    return [];
  }
}
