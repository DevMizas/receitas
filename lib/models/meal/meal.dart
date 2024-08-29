import 'package:json_annotation/json_annotation.dart';
part 'meal.g.dart';

@JsonSerializable()

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isFavorite;
  final String complexity;
  final String cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
    required this.isFavorite,
  });

  factory Meal.fromJson(Map<String, dynamic> json) =>
			_$MealFromJson(json);
	Map<String, dynamic> toJson() => _$MealToJson(this);
}
