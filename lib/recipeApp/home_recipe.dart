import 'package:day1/recipeApp/model/recipe_api.dart';
import 'package:day1/recipeApp/model/recipe_model.dart';
import 'package:day1/recipeApp/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class Homerecipe extends StatefulWidget {
  const Homerecipe({Key key}) : super(key: key);

  @override
  State<Homerecipe> createState() => _HomerecipeState();
}

class _HomerecipeState extends State<Homerecipe> {
  List<RecipeModel> _recipe;
  bool _isLoading = true;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // ignore: avoid_print
    print(_recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              const Icon(Icons.restaurant),
              10.widthBox,
              "Food Recipe".text.make()
            ],
          ),
        ),
        body: _isLoading
            ? Shimmer.fromColors(
                period: const Duration(seconds: 1),
                direction: ShimmerDirection.ltr,
                baseColor: Colors.transparent,
                highlightColor: Colors.white10,
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    cookTime: _recipe[index].totalTime,
                    rating: _recipe[index].rating.toString(),
                    title: _recipe[index].name,
                    thumbUrl: _recipe[index].images,
                  );
                }));
  }
}
