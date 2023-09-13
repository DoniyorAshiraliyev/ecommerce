part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeGetAllProduct extends HomeEvent {
  const HomeGetAllProduct();
}

class HomeGetProductWithCategory extends HomeEvent {
  final String category;
  const HomeGetProductWithCategory({required this.category});
}