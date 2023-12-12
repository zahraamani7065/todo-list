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
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
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
              content: SizedBox(
                width: width ,
                height: height / 2.5,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < data.length; i += 3)
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    for (int j = i; j < i + 3 && j < data.length; j++)
                                       Padding(
                                         padding: EdgeInsets.only(right:width/50),
                                         child: InkWell(
                                           onTap: (){
                                             // print("category data is :"+ data[j].categoryNameEntity);
                                             Navigator.of(context).pop(data[j]);
                                           },
                                           child: Container(
                                              width: width/5.5,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(width/200),
                                                color: Color(data[j].categoryColorEntity),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Icon(getIconData(data[j].categoryIconEntity), size: height / 45),
                                                      Text(data[j].categoryNameEntity),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                         ),
                                       ),

                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return CreateNewCategory();
                          }),
                        );
                      },
                      child: Text(
                        localization.addCategory,
                        style: textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
