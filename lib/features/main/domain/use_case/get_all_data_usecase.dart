import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/domain/repository/data_repository.dart';

import '../../../../core/resorces/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/data_source/local/data.dart';

class GetAllDataUseCase implements UseCase<DataState<List<DataEntity>>,NoParams>{
  final DataRepository dataRepository;

  GetAllDataUseCase({required this.dataRepository});


  @override
  Future<DataState<List<DataEntity>>> call(NoParams noParams) {
    return dataRepository.getAll();

  }
}