import 'package:hive/hive.dart';
import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/domain/repository/data_repository.dart';

import '../../../../main.dart';
import '../data_source/local/data.dart';

class DataRepositoryImpl implements DataRepository {

  @override
  Future<DataState<DataEntity>> createOrUpdate(DataEntity data) async {

    final box = Hive.box<DataEntity>(taskBoxName);
    DataEntity dataEntity = DataEntity(
        name: data.name,
        description:data.description ,
        iscompleted: data.iscompleted,
        dateTime: data.dateTime,
        category: data.category,
        proirity: data.proirity);
    box.add(dataEntity);
    return DataSuccess(dataEntity);


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
    final box = Hive.box<DataEntity>(taskBoxName);
    List<DataEntity> data = box.values.cast<DataEntity>().toList();
    print("data is $data");
    try {
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
