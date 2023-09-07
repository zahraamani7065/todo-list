import '../../../../core/resorces/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/data_source/local/data.dart';
import '../entity/data_entity.dart';
import '../repository/data_repository.dart';

class SaveDataUseCase implements UseCase <DataState<DataEntity>,DataEntity>{
  final DataRepository dataRepository;

  SaveDataUseCase({required this.dataRepository});


  @override
  Future<DataState<DataEntity>> call(DataEntity dataEntity) {
    return dataRepository.createOrUpdate(dataEntity);
  }
}