import 'dart:convert';
import 'package:day1/recipeApp/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "651a67a8bdmsh961bed0fb438d08p19df5djsn2f87da16e3d7",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return RecipeModel.recipesFromSnapshot(_temp);
  }
}
