import 'package:flutter/material.dart';
import 'package:receitas/models/category/category.dart';
import 'package:receitas/utils/app_routes/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORY_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(category.urlImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 35,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(109, 0, 0, 0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
          ),
          child: Text(
            category.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
              ),
          ),
        ),
      ),
    );
  }
}
