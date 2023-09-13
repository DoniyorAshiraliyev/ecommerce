import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/product.dart';
import '../../../domain/repositories/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository repository;
  HomeBloc(this.repository) : super(HomeInitial(products: [])) {
    on<HomeEvent>((event, emit) => switch(event) {
      HomeGetAllProduct e => _getAllProduct(e, emit),
      HomeGetProductWithCategory e => _getProductWithCategory(e, emit),
      _ => () {
        print("Error Not Found Bloc Event");
      },
    });
  }


  void _getAllProduct(HomeGetAllProduct event, Emitter emit) async {
    emit(HomeLoadingState(products: state.products));
    final result = await repository.getProducts();
    emit(HomeSuccessProductState(products: result, category: 'all'));
  }

  void _getProductWithCategory(HomeGetProductWithCategory event, Emitter emit) async{
    emit(HomeLoadingState(products: state.products));
    final result = await repository.getProductWithCategory(event.category);
    emit(HomeSuccessProductState(products: result, category: event.category));
  }

}
