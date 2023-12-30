// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_product_bloc.dart';

@immutable
sealed class EditProductEvent {}

class EditProductSubmittedEvent extends EditProductEvent {
  final String name;
  final String description;
  final double price;
  final String status;
  final String ProductId;
  EditProductSubmittedEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.ProductId,
  });
}
