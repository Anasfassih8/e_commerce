import 'package:e_commerce/core/animations/horizontal_animation.dart';
import 'package:e_commerce/core/animations/scale_animation.dart';
import 'package:e_commerce/core/app_assets.dart';
import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/data/product.dart';
import 'package:e_commerce/presentation/features/home/widgets/categories_list.dart';
import 'package:e_commerce/presentation/features/home/widgets/offers_card.dart';
import 'package:e_commerce/presentation/features/home/widgets/welcoming_row.dart';
import 'package:e_commerce/presentation/features/products/controller/prduct_controller.dart';
import 'package:e_commerce/presentation/features/products/view/widgets/product_item_card.dart';
import 'package:e_commerce/presentation/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:e_ecommerce_pharos/core/animations/horizontal_animation.dart';
// import 'package:e_ecommerce_pharos/core/animations/scale_animation.dart';
// import 'package:e_ecommerce_pharos/core/animations/size_animation.dart';
import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/managers/alerts_manager.dart';
import 'package:e_commerce/core/managers/theme_manager.dart';
import 'package:e_commerce/presentation/features/home/widgets/home_screen_container_content.dart';
import 'package:e_commerce/presentation/widgets/app_button.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController field = TextEditingController();
  final ProductController productListController = ProductController();

  bool isLoading = true;
  bool isValid = false;
  List<Product> products = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await productListController.getProducts();

    setState(() {
      products = results;
      isLoading = false;
    });
  }

  void poppingFromScreen() {
    ///calculation
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ThemeManager.themeNotifier.value == ThemeMode.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            const WelcomingRow(),
            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              //
              child: AppTextField(
                controller: field,
                hint: AppStrings.whatAreYouLookingFor,
                onChange: (value) {
                  setState(() {});
                },
                prefixIcon: InkWell(child: Transform.scale(scale: 0.5, child: SvgPicture.asset(AppAssets.search))),
              ),
            ),
            //
            const OffersCard(),
            //
            const CategoriesList(),

            isLoading
                ? Center(child: CircularProgressIndicator())
                : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  //
                  children: products.map((e) => ProductItemCard(product: e)).toList(),
                ),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       Switch(
    //         value: isDarkMode,
    //         //
    //         onChanged: (value) => ThemeManager.toggleTheme(),
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       spacing: 16,
    //       //
    //       children: [
    //         //
    //         HorizontalAnimation(
    //           child: HomeScreenContainerContent(
    //             //
    //             title: "UI Widgets: InkWell, ElevatedButton, IconButton",
    //             subtitle: "These are fundamental Flutter widgets for user interaction.",
    //             mainColor: AppColors.primary,
    //             child: Row(
    //               //
    //               spacing: 8,
    //               children: [
    //                 //
    //                 Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back1")),
    //                 Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back2")),
    //               ],
    //             ),
    //           ),
    //         ),
    //         ScaleAnimation(
    //           child: HomeScreenContainerContent(
    //             //
    //             title: "UI Widgets: InkWell, ElevatedButton, IconButton",
    //             subtitle: "These are fundamental Flutter widgets for user interaction.",
    //             mainColor: AppColors.primary,
    //             child: Row(
    //               //
    //               spacing: 8,
    //               children: [
    //                 //
    //                 Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back1")),
    //                 Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back2")),
    //               ],
    //             ),
    //           ),
    //         ),

    //         HomeScreenContainerContent(
    //           //
    //           title: "Dialogs, BottomSheets, SnackBars",
    //           subtitle: "These are common UI patterns for displaying temporary information or collecting input.",
    //           mainColor: AppColors.red,
    //           child: Row(
    //             //
    //             spacing: 8,
    //             children: [
    //               //
    //               Expanded(child: AppButton(onPressed: () => AlertsManager.showLoadingDialog(), title: "show Alert")),
    //               Expanded(
    //                 child: AppButton(
    //                   onPressed:
    //                       () => AlertsManager.showOptionalBottomSheet(
    //                         "Are Your You Want to Cancel",

    //                         onCancel: () {
    //                           AlertsManager.showLoadingDialog();
    //                         },
    //                       ),
    //                   title: "show Bottom Sheet",
    //                 ),
    //               ),
    //               Expanded(child: AppButton(onPressed: () => AlertsManager.showAppToastMessage("Toast Succes"), title: "show toast")),
    //             ],
    //           ),
    //         ),
    //         Text("mazen"),
    //       ],
    //       //
    //     ),
    //   ),
    // );
  }
}