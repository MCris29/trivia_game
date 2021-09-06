import 'package:flutter/material.dart';
import 'package:trivia_game/src/models/categories_model.dart';
import 'package:trivia_game/src/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('categories'),
        ),
        body: _body());
  }

  Widget _body() {
    return Column(
      children: [
        Flexible(
          child: _listCategories(),
        )
      ],
    );
  }

  Widget _listCategories() {
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    return FutureBuilder(
      future: categoryProvider.getCategories(),
      builder: (_, AsyncSnapshot<List<Category>> snapshot) {
        if (snapshot.hasData) {
          final categories = snapshot.data;

          return ListView.builder(
            itemCount: categories!.length,
            itemBuilder: (_, int i) {
              return _card(categories[i]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _card(Category category) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(category.name),
      ),
    );
  }
}
