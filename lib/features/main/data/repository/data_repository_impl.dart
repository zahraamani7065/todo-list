import 'package:hive/hive.dart';
import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/domain/repository/data_repository.dart';

import '../../../../main.dart';
import '../data_source/local/data.dart';

class DataRepositoryImpl implements DataRepository {
  final box = Hive.box<Task>(taskBoxName);
  @override
  Future<DataState<DataEntity>> createOrUpdate(DataEntity data) async {

    // Convert DataEntity to Task using the constructor
    Task task = Task.fromDataEntity(data);

    // Add the Task object to the Hive box
    await box.add(task);
    print(task);
    // await box.clear();
    return DataSuccess(data);


  }

  @override
  Future<void> delete(DataState data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<void> deleteById(id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<DataState<DataEntity>> findById(id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<DataEntity>>> getAll({String? searchKeyword}) async {

    List<Task> tasks = box.values.toList();
    print("data is $tasks");

    try {
      List<DataEntity> data = tasks.map((task) => DataEntity(
        name: task.name,
        iscompleted: task.isComleted,
        proirity: task.proirity,
        dateTime: task.dateTime,
        description: task.description,
        category: CategoryEntity(categoryColorEntity: task.category.color, categoryNameEntity: task.category.name, categoryIconEntity: task.category.icon), // You should handle this conversion if needed
      )).toList();
      return DataSuccess(data);
    }
    catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<void> initDb() async {
    final box =await Hive.openBox<DataEntity>(taskBoxName);
  }

}
