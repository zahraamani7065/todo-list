import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/main/data/data_source/local/data.dart';
import '../../domain/use_case/add_category_usecase.dart';
import '../../domain/use_case/get_category_usecase.dart';
import 'add_category_status.dart';
import 'get_category_status.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final AddCategoryUseCase addCategoryUseCase;
  final GetCategoryUseCase getCategoryUseCase;

  CategoryBloc(this.addCategoryUseCase, this.getCategoryUseCase)
      : super(CategoryState(addCategoryStatus: AddCategoryInitialState(), getCategoryStatus:GetCategoryInitialState() )) {


       on<AddCategoryEvent>((event,emit)async{
         emit(state.copywith(newAddCategoryStatus: AddCategoryInitialState()));
         final saveData=await addCategoryUseCase(event.categoryEntity);
         if(saveData is DataSuccess){
           emit(state.copywith(newAddCategoryStatus: AddCategoryCompleteState(saveData.data!)));
         }
         else if(saveData is DataFailed){
           emit(state.copywith(newAddCategoryStatus: AddCategoryErrorState(saveData.error!)));
         }

       });

       on<GetCategoryEvent>((event,emit)async{
         emit(state.copywith(newGetCategoryStatus:GetCategoryInitialState()));
         print("loading-state");
         final DataState response=await getCategoryUseCase(NoParams());
         if(response is DataSuccess){
           emit((state.copywith(newGetCategoryStatus: GetCategoryCompleteState(response.data))));

         }
         else if(response is DataFailed){
           emit((state.copywith(newGetCategoryStatus: GetCategoryErrorState(response.error!))));
         }
       });




  }
}
