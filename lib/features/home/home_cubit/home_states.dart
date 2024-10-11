class HomeState {}

 class HomeInitial extends HomeState {}
//Category
 class CategoryLoading extends HomeState {}
 class CategorySucces extends HomeState {}
 class CategoryFailure extends HomeState {
 final String errmsg;
 CategoryFailure({required this.errmsg});
 }