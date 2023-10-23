import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';
import 'package:todo_list_app/features/main/data/data_source/local/data.dart';
import 'package:todo_list_app/features/main/data/repository/data_repository_impl.dart';
import 'package:todo_list_app/features/main/domain/repository/data_repository.dart';
import 'package:todo_list_app/features/main/domain/use_case/save_task_usecase.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';

import '../../features/main/domain/use_case/get_all_data_usecase.dart';
import '../../main.dart';

 GetIt locator=GetIt.instance;
setUp() async{

  // locator.registerSingletonAsync<Box>(
  //       () async {
  //     final box = await Hive.openBox(taskBoxName);
  //     return box;
  //   },
  // );

  locator.registerFactory<CategoryDataAdapter>(()=> CategoryDataAdapter());

  locator.registerFactory<TaskAdapter>(() => TaskAdapter());

  //repository
  locator.registerSingleton<DataRepository>(DataRepositoryImpl());


  //usecase
  locator.registerSingleton<GetAllDataUseCase>(GetAllDataUseCase(dataRepository: locator()));
  locator.registerSingleton<SaveDataUseCase>(SaveDataUseCase(dataRepository: locator()));

  //
  //locator.registerSingleton<TaskListBloc>(TaskListBloc(locator(),locator()));


  // Register TaskListBloc
  locator.registerFactory(() => TaskListBloc(locator(),locator()
  ));

}

