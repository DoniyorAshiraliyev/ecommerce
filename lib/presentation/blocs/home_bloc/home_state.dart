part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<ProductModel> products;
  const HomeState({required this.products});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.products});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.products});
}

class HomeSuccessProductState extends HomeState {
  final String category;
  const HomeSuccessProductState({required this.category,required super.products});
}

