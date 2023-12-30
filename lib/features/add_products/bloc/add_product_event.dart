// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_product_bloc.dart';

@immutable
sealed class AddProductEvent {}

class AddProductDataEvent extends AddProductEvent {
  final String productName;
  final String description;
  final double price;
  final String status;
  AddProductDataEvent({
    required this.productName,
    required this.description,
    required this.price,
    required this.status,
  });
}
