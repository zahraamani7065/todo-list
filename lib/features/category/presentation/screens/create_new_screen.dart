import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:todo_list_app/features/category/presentation/widgets/category_dialog.dart';
import 'package:todo_list_app/features/category/presentation/widgets/icon_dialog.dart';

import '../../../../core/services/locator.dart';

class CreateNewCategory extends StatefulWidget {
  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory> {
  late TextEditingController _nameController;
  String selectedIcon = '';
   Color selectedColor=Colors.red;

  final List<Color> itemColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.grey,
    Colors.pinkAccent,
    Colors.redAccent,
    Colors.lightGreen,
    Colors.indigo,
    Colors.teal
  ];
  List<String> iconList = [
    'home',
    'music_note',
    'laptop_chromebook_outlined',
    'work',
    'sports_tennis'
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeColor = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context);
    return BlocProvider<CategoryBloc>(
        create: (context) => locator<CategoryBloc>(),
    child:
    BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
     return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: height / 20, right: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization!.categoryAppBar,
                        style: textTheme.headline5,
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Text(
                        localization.categoryName,
                        style: textTheme.headline2,
                      ),
                      SizedBox(height: height / 40),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: localization.enterName,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: themeColor.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 25),
                      Text(
                        localization.categoryIcon,
                        style: textTheme.headline2,
                      ),
                      SizedBox(height: height / 40),
                      PopupMenuButton(
                        onSelected: (String value) {
                          setState(() {
                            selectedIcon = value;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return iconList.map((icon) {
                            return PopupMenuItem<String>(
                              child: Icon(getIconData(icon)),
                              value: icon,
                            );
                          }).toList();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: themeColor.colorScheme.onSecondary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              localization.chooseCategory,
                              style: textTheme.headline1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 25),
                      Text(
                        localization.categoryColor,
                        style: textTheme.headline2,
                      ),
                      SizedBox(height: height / 40),
                      Container(
                        height: width / 13,
                        child: ListView.builder(
                          itemCount: itemColors.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = itemColors[index];
                                    });
                                  },
                                  child: Container(
                                    width: width / 13,
                                    height: width / 13,
                                    decoration: BoxDecoration(
                                      color: itemColors[index],
                                      borderRadius:
                                          BorderRadius.circular(width / 30),
                                      border: Border.all(
                                        color: selectedColor ==
                                                itemColors[index]
                                            ? themeColor.colorScheme
                                                .primary // Adjust border color
                                            : Colors.transparent,
                                        width:
                                            selectedColor == itemColors[index]
                                                ? 4.0
                                                : 2.0,
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        final category = CategoryEntity(
                            categoryColorEntity: selectedColor.value,
                            categoryNameEntity: _nameController.text,
                            categoryIconEntity: selectedIcon);
                        print("_________nameController.text: ${_nameController.text}");

                        BlocProvider.of<CategoryBloc>(context).add(AddCategoryEvent(category));
                        print("complete");
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return CategoryDialog();
                            }));

                      },
                      child: Text(localization.submit),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("_________nameController.text: ${_nameController.text}");
                      },
                      child: Text(localization.cancel),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          themeColor.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }));}

}

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'home':
      return Icons.home;
    case 'music_note':
      return Icons.music_note;
    case 'laptop_chromebook_outlined':
      return Icons.laptop_chromebook_outlined;
    case 'work':
      return Icons.work;
    case 'sports_tennis':
      return Icons.sports_tennis;
    default:
      return Icons
          .error; // You can choose a default icon or handle it differently
  }
}
