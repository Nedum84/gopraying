import 'dart:convert';

Category categoryFromMap(String str) => Category.fromMap(json.decode(str));

String categoryToMap(Category data) => json.encode(data.toMap());

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryIcon,
    this.idx,
  });

  int categoryId;
  String categoryName;
  String categoryIcon;
  int idx;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryIcon: json["category_icon"],
        idx: json["idx"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_icon": categoryIcon,
        "idx": idx,
      };
}
