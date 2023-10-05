
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/main/data/data_source/local/data.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/presentation/%20block/get_task_status.dart';
import 'package:todo_list_app/features/main/presentation/%20block/save_task_status.dart';

import '../../domain/use_case/get_all_data_usecase.dart';
import '../../domain/use_case/save_task_usecase.dart';

part 'task_list_event.dart';

part 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  GetAllDataUseCase getAllDataUseCase;
  SaveDataUseCase saveDataUseCase;

  TaskListBloc(this.getAllDataUseCase, this.saveDataUseCase)
      : super(TaskListState(
            getAllDataStatus: GetAllDataLoading(),
            saveDataStatus: SaveTaskLoading())) {
    on<GetAllDataEvent>((event, emit) async {
      emit(state.copywith(newGetAllDataStatus: GetAllDataLoading()));
      DataState dataState = await getAllDataUseCase(NoParams());

      print(getAllDataUseCase(NoParams()));

      if (dataState is DataSuccess) {
        emit(state.copywith(
            newGetAllDataStatus: GetAllDataCompleted(dataState.data)));
        print("Data fetched successfully.");
      }

      if (dataState is DataFailed) {
        emit(state.copywith(
            newGetAllDataStatus: GetAllDataError(dataState.error)));
      }
    });

    on<SaveDataEvent>((event, emit) async {
      emit(state.copywith(newSaveDataStatus: SaveTaskLoading()));
      print("loading");
      final saveResult = await saveDataUseCase(event.dataEntity);

      if (saveResult is DataSuccess) {
        // Data was saved successfully, update the state accordingly.
        emit(
          state.copywith(
              newSaveDataStatus: SaveTaskCompleted(saveResult.data!)),
        );
        print("save data");
        // Navigator.of(context).pop();

      } else if (saveResult is DataFailed) {
        // Handle the case where data saving failed.
        emit(
            state.copywith(newSaveDataStatus: SaveTaskError(saveResult.error)));
      }
    });
  }
}

// });
// emit(state.copywith(newSaveDataStatus: SaveTaskLoading()));
// final saveResult = await saveDataUseCase(event.dataEntity);
//
// if (saveResult is DataSuccess) {
//   // Data was saved successfully, update the state accordingly.
//   emit(state.copywith(
//       newSaveDataStatus: SaveTaskCompleted(saveResult.data!)));
// } else if (saveResult is DataFailed) {
//   // Handle the case where data saving failed.
//   emit(state.copywith(
//       newSaveDataStatus: SaveTaskError(saveResult.error)));
// }

// class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
//   GetAllDataUseCase getAllDataUseCase;
//   SaveDataUseCase saveDataUseCase;
//
//   TaskListBloc(this.getAllDataUseCase, this.saveDataUseCase)
//       : super(TaskListState(
//             getAllDataStatus: GetAllDataLoading(),
//             saveDataStatus: SaveTaskLoading()
//   )) {
//
//     on<TaskListEvent>((event,emit) {
//
//         on<GetAllDataEvent>((event,emit) async {
//
//         //emit loading state
//         emit(state.copywith(newGetAllDataStatus: GetAllDataLoading()));
//
//
//         DataState dataState = await getAllDataUseCase(NoParams());
//         print(getAllDataUseCase(NoParams()));
//
//         if (dataState is DataSuccess) {
//           emit(state.copywith(
//               newGetAllDataStatus: GetAllDataCompleted(dataState.data)));
//           print("Data fetched successfully.");
//         }
//
//         else if (dataState is DataFailed) {
//           emit(state.copywith(
//               newGetAllDataStatus: GetAllDataError(dataState.error)));
//         }
//
//         });
//
//       on< SaveDataEvent>(event,state) async{
//         // on<SaveDataEvent>((event, emit) async {
//         emit(state.copywith(newSaveDataStatus: SaveTaskLoading()));
//         final saveResult = await saveDataUseCase(event.dataEntity);
//
//         if (saveResult is DataSuccess) {
//           // Data was saved successfully, update the state accordingly.
//           emit(
//             state.copywith(
//                 newSaveDataStatus: SaveTaskCompleted(saveResult.data!)),
//           );
//           print("save data");
//         } else if (saveResult is DataFailed) {
//           // Handle the case where data saving failed.
//           emit(state.copywith(
//               newSaveDataStatus: SaveTaskError(saveResult.error)));
//         }
//       }
//       // });
//     });
//   }
// }
