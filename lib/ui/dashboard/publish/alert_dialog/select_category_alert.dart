import 'package:flutter/material.dart';
import 'package:gopraying/model/category.dart';
import 'package:gopraying/repository/category_repo.dart';
import 'package:gopraying/utils/colors.dart';

class SelectCategoryAlert extends StatefulWidget {
  final Category category;
  final Function(Category) onSelect;

  SelectCategoryAlert({this.category, @required this.onSelect});
  @override
  _SelectCategoryAlertState createState() => _SelectCategoryAlertState();
}

class _SelectCategoryAlertState extends State<SelectCategoryAlert> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    //animations
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut); //easeInOutExpo, linearToEaseOut, fastLinearToSlowEaseIn, linearToEaseOut, bounceOut

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  _onSelect(Category sub) {
    widget.onSelect(sub);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            padding: EdgeInsets.all(20.0),
            height: 250.0,
            width: double.infinity,
            decoration: ShapeDecoration(
                // color: Color.fromRGBO(41, 167, 77, 10),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Category>>(
                future: CategoryRepo.getCategories(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(width: 50, height: 50, alignment: Alignment.center, child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) {
                      Category category = snapshot.data[position];

                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: (widget.category != null && widget.category.categoryId == category.categoryId) ? kColorPrimary : Colors.blueGrey.withOpacity(.3),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(6)),
                        child: ListTile(
                          title: Text(category.categoryName),
                          onTap: () => _onSelect(category),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
