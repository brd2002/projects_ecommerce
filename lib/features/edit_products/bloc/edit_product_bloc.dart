import 'dart:async';
// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitial()) {
    on<EditProductSubmittedEvent>(editProductSubmittedEvent);
  }

  FutureOr<void> editProductSubmittedEvent(
      EditProductSubmittedEvent event, Emitter<EditProductState> emit) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(event.ProductId)
          .update({
        'name': event.name,
        'description': event.description,
        'price': event.price,
        'status': event.status,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
