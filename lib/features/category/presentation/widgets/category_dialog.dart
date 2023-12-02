import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/category/presentation/bloc/category_bloc.dart';
import 'package:todo_list_app/features/category/presentation/bloc/get_category_status.dart';
import 'package:todo_list_app/features/category/presentation/screens/create_new_screen.dart';

import '../../../../core/services/locator.dart';

class CategoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final localization = AppLocalizations.of(context);
    return BlocProvider<CategoryBloc>(
        create: (context) => locator<CategoryBloc>(),
        child:
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state.getCategoryStatus is GetCategoryInitialState) {
            BlocProvider.of<CategoryBloc>(context).add(GetCategoryEvent());
          } else if (state.getCategoryStatus is GetCategoryCompleteState) {
            print('Current state: $state');
            GetCategoryCompleteState? getCategoryCompleteState =
                state.getCategoryStatus as GetCategoryCompleteState?;
            List<CategoryEntity> data =
                getCategoryCompleteState!.categoryEntities;
            return AlertDialog(
                title: Text(localization!.chooseCategory),
                content: Container(
                  width: width / 1.5,
                  height: height / 2.5,
                  child: Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final CategoryEntity category = data[index];
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: width/20,
                                  height: height/20,
                                  decoration: BoxDecoration(
                                      color:
                                      Color(   category.categoryColorEntity) ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Icon(getIconData(category.categoryIconEntity)),
                                          Text(category.categoryNameEntity)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return CreateNewCategory();
                        }));
                      },
                      child: Text(
                        localization.addCategory,
                        style: textTheme.headline1,
                      ),
                    ),
                  ]),
                ));
          }
          return Container();
        }));
    // );
  }
}
