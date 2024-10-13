class HomeState {}

 class HomeInitial extends HomeState {}
//Category States
 class CategoryLoading extends HomeState {}
 class CategorySucces extends HomeState {}
 class CategoryFailure extends HomeState {
 final String errmsg;
 CategoryFailure({required this.errmsg});
 }

 //Top Selling States
class TopSellingLoading extends HomeState {}
class TopSellingSucces extends HomeState {}
class TopSellingFailure extends HomeState {
 final String errmsg;
 TopSellingFailure({required this.errmsg});
}

//New In States
class NewInLoading extends HomeState {}
class NewInSucces extends HomeState {}
class NewInFailure extends HomeState {
 final String errmsg;
 NewInFailure({required this.errmsg});
}