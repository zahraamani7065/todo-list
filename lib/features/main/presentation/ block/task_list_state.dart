part of 'task_list_bloc.dart';

class TaskListState extends Equatable {
  final GetAllDataStatus getAllDataStatus;
  final SaveDataStatus saveDataStatus;

  TaskListState({required this.getAllDataStatus, required this.saveDataStatus});

  TaskListState copywith({
    GetAllDataStatus? newGetAllDataStatus,
    SaveDataStatus? newSaveDataStatus,
  }) {
    return TaskListState(
        saveDataStatus: newSaveDataStatus ?? saveDataStatus,
        getAllDataStatus: newGetAllDataStatus ?? getAllDataStatus,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [saveDataStatus,getAllDataStatus];
}
