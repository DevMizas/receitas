// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      duration: (json['duration'] as num).toInt(),
      isGlutenFree: json['isGlutenFree'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
      complexity: json['complexity'] as String,
      cost: json['cost'] as String,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'duration': instance.duration,
      'isGlutenFree': instance.isGlutenFree,
      'isLactoseFree': instance.isLactoseFree,
      'isVegan': instance.isVegan,
      'isVegetarian': instance.isVegetarian,
      'isFavorite': instance.isFavorite,
      'complexity': instance.complexity,
      'cost': instance.cost,
    };
