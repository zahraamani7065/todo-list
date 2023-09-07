part of 'task_list_bloc.dart';

@immutable
abstract class TaskListEvent {}
class GetAllDataEvent extends TaskListEvent{}
class SaveDataEvent extends TaskListEvent{
  final DataEntity dataEntity;

  SaveDataEvent(this.dataEntity);


}