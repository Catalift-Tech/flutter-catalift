
import 'package:flutter/material.dart';

import '../constant/app_size.dart';
Widget buildsearchbar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey.shade400,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}
