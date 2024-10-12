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