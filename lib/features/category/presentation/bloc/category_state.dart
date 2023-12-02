part of 'category_bloc.dart';

 class CategoryState extends Equatable {
  final AddCategoryStatus addCategoryStatus;
  final GetCategoryStatus getCategoryStatus;

  CategoryState({required this.getCategoryStatus,required this.addCategoryStatus});

  CategoryState copywith({AddCategoryStatus? newAddCategoryStatus,GetCategoryStatus? newGetCategoryStatus}) {
    return CategoryState(
        addCategoryStatus: newAddCategoryStatus ?? addCategoryStatus,
        getCategoryStatus: newGetCategoryStatus?? getCategoryStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[addCategoryStatus,getCategoryStatus];
}
