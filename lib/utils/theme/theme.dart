import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.cyan,
  hintColor: Colors.yellow,
  fontFamily: 'Raleway',
  canvasColor: const Color.fromRGBO(255, 254, 229, 1),
  textTheme: ThemeData.light().textTheme.copyWith(
        headlineSmall: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
);
