import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductDataEvent>(addProductDataEvent);
  }

  FutureOr<void> addProductDataEvent(
      AddProductDataEvent event, Emitter<AddProductState> emit) async {
    try {
      await FirebaseFirestore.instance.collection('products').add({
        'name': event.productName,
        'description': event.description,
        'price': event.price,
        'status': event.status,
      });
      print("product added");
    } catch (e) {
      print(e.toString());
    }
  }
}
