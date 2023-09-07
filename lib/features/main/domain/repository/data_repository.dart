import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/main/data/data_source/local/data.dart';

import '../entity/data_entity.dart';

abstract class DataRepository{

  Future<void> initDb();
  Future<DataState<List<DataEntity>>> getAll({String searchKeyword});
  Future<DataState<DataEntity>> findById(dynamic id);
  Future<void> deleteAll();
  Future<void>  delete(DataState data);
  Future<void> deleteById(dynamic id);
  Future<DataState<DataEntity>> createOrUpdate(DataEntity data);


}