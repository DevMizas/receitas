import 'package:flutter/material.dart';
import 'package:receitas/models/models.dart';
import 'package:receitas/resources/resources.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritePage(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma receita marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
