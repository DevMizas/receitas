import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receitas/models/category/category.dart';
import 'package:receitas/resources/resources.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Category> _listCategory = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    QuerySnapshot query = await db.collection("category").get();
    _listCategory = [];
    query.docs.forEach(
      (element) {
        String id = element.get("id");
        String title = element.get("title");
        String urlImage = element.get("urlImage");

        setState(() {
          _listCategory.add(
            Category(
              id: id,
              title: title,
              urlImage: urlImage,
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _listCategory.isEmpty
            ? const Center(
                child: Text(
                  "Sem receitas encontradas!",
                ),
              )
            : GridView.builder(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: _listCategory.length,
      itemBuilder: (context, index) {
        return CategoryItem(
                _listCategory[index],
              );
      },
    );
  }
}
