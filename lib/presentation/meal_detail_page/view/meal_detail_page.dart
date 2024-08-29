import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receitas/models/models.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({super.key});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _createSectionContainer(BuildContext context, Widget child) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 1.1,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  void initState() {
    super.initState();
    db.collection("meal").snapshots().listen((event) {});
  }

  void _sendFavorite(Meal meal) {
    setState(() {
      db.collection("meal").doc(meal.id).set({
        "id": meal.id,
        "categories": meal.categories,
        "title": meal.title,
        "imageUrl": meal.imageUrl,
        "ingredients": meal.ingredients,
        "steps": meal.steps,
        "duration": meal.duration,
        "isFavorite": meal.isFavorite == true ? false : true,
        "isGlutenFree": meal.isGlutenFree,
        "isLactoseFree": meal.isLactoseFree,
        "isVegan": meal.isVegan,
        "isVegetarian": meal.isVegetarian,
        "complexity": meal.complexity,
        "cost": meal.cost,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(meal.title),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).hintColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 92, 217, 255),
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 92, 217, 255),
        onPressed: () {
          setState(() {
            _sendFavorite(meal);
          });
        },
        child: Icon(
          meal.isFavorite == true ? Icons.favorite : Icons.favorite_border,
          color: Colors.pink,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
