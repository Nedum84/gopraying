import 'dart:convert';

import 'package:gopraying/model/category.dart';
import 'package:gopraying/utils/constants.dart';
import 'package:gopraying/utils/url.dart';
import 'package:http/http.dart' as http;

class CategoryRepo {
  static Future<Category> getCategory({int categoryId}) async {
    String param = (categoryId != null) ? '&category_id=$categoryId' : '';

    String url = GET_CATEGORY + param;

    http.Response response = await http.get(url);

    return categoryFromMap(response.body);
  }

//GET ALL THE Category UNDER A CLASS
  static Future<List<Category>> getCategories() async {
    // CategoryDb categoryDb = CategoryDb();

    String url = GET_CATEGORY;
    List<Category> _categoryList;
    http.Response response = await http.get(url).timeout(Duration(seconds: MEDIUM_OPERATIONS_DELAY), onTimeout: () {
      return;
    }).catchError((err) => null);

    if (response?.statusCode == 200) {
      try {
        _categoryList = (jsonDecode(response.body) as List).map((data) => Category.fromMap(data)).toList();

        //ADD TO DATABASE
        // await categoryDb.insertCategory(_categoryList);
      } catch (e) {
        print(e);
        try {
          //GET ITEMS FROM DATABASE
          // _categoryList = await categoryDb.getAll();
        } catch (e) {
          print(e);
        }
      }
    } else {
      print(response?.statusCode);
      try {
        //GET ITEMS FROM DATABASE
        // _categoryList = await categoryDb.getAll();
      } catch (e) {
        print(e);
      }
    }

    return _categoryList;
  }
}
