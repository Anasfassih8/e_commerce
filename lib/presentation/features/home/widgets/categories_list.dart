import 'package:e_commerce/presentation/features/home/controller/home_controller.dart';
import 'package:e_commerce/presentation/features/home/widgets/category_card.dart';
import 'package:flutter/material.dart';

import 'category_list_loading.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final HomeController homeController = HomeController();

  bool isLoading = true;
  List<String> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await homeController.getCategories();

    setState(() {
      categories = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CategoryListLoading()
        : SizedBox(
          height: 32,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                //
                child: GestureDetector(
                  onTap: () {},
                  //
                  child: CategoryCard(categories: categories, index: index, isSelected: false),
                ),
              );
            },
          ),
        );
  }
}