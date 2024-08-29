import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receitas/models/models.dart';
import 'package:receitas/resources/resources.dart';

class CategoryMealsPage extends StatefulWidget {
  final List<Meal> meals;

  const CategoryMealsPage(this.meals, {super.key});

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  List<Meal> _listMeal = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  

  void refresh() async {
    QuerySnapshot queryMeal = await db.collection("meal").get();
    _listMeal = [];
    queryMeal.docs.forEach(
      (element) {
        String id = element.get("id");
        List<String> categories = element.get("categories").cast<String>();
        String title = element.get("title");
        String imageUrl = element.get("imageUrl");
        List<String> ingredients = element.get("ingredients").cast<String>();
        List<String> steps = element.get("steps").cast<String>();
        int duration = element.get("duration");
        bool isFavorite = element.get("isFavorite");
        bool isGlutenFree = element.get("isGlutenFree");
        bool isLactoseFree = element.get("isLactoseFree");
        bool isVegan = element.get("isVegan");
        bool isVegetarian = element.get("isVegetarian");
        String complexity = element.get("complexity");
        String cost = element.get("cost");

        setState(() {
          _listMeal.add(
            Meal(
              id: id,
              categories: categories,
              title: title,
              imageUrl: imageUrl,
              ingredients: ingredients,
              steps: steps,
              duration: duration,
              isGlutenFree: isGlutenFree,
              isLactoseFree: isLactoseFree,
              isVegan: isVegan,
              isVegetarian: isVegetarian,
              isFavorite: isFavorite,
              complexity: complexity,
              cost: cost,
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = _listMeal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: categoryMeals.isEmpty
          ? const Center(
              child: Text(
                "Sem receitas encontradas!",
              ),
            )
          : ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) {
                return MealItem(categoryMeals[index]);
              },
            ),
    );
  }
}
