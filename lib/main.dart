import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:receitas/infra/repository/url/url.dart';
import 'package:receitas/models/meal/meal.dart';
import 'package:receitas/models/settings/settings.dart';
import 'package:receitas/presentation/presentation.dart';
import 'package:receitas/utils/app_routes/app_routes.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: Url().firebaseData());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingsFilter settings = SettingsFilter();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Meal> _listMeal = [];
  List<Meal> _availableMeals = [];
  List<Meal> _favoriteMeals = [];
  

  void _filterMeals(SettingsFilter settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = _listMeal.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    getFavorite();
  }

  void getFavorite() async {
    QuerySnapshot queryMeal = await db.collection("meal").get();
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
          if(isFavorite == true) {
            _favoriteMeals.add(
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
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'recipes app',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        AppRoutes.HOME: (ctx) => TabsPage(_favoriteMeals),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoryMealsPage(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailPage(),
        AppRoutes.SETTINGS: (ctx) => SettingsPage(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoryPage();
          },
        );
      },
    );
  }
}
