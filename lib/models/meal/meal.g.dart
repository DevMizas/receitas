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
      complexity: $enumDecode(_$ComplexityEnumMap, json['complexity']),
      cost: $enumDecode(_$CostEnumMap, json['cost']),
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
      'complexity': _$ComplexityEnumMap[instance.complexity]!,
      'cost': _$CostEnumMap[instance.cost]!,
    };

const _$ComplexityEnumMap = {
  Complexity.simple: 'simple',
  Complexity.medium: 'medium',
  Complexity.difficult: 'difficult',
};

const _$CostEnumMap = {
  Cost.cheap: 'cheap',
  Cost.fair: 'fair',
  Cost.expensive: 'expensive',
};
