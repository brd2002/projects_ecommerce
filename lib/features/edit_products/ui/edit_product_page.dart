import 'package:ecommerce_project/features/add_products/bloc/add_product_bloc.dart';
import 'package:ecommerce_project/features/edit_products/bloc/edit_product_bloc.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  final String name;
  final String description;
  final double price;
  final String status;
  final String ProductId;
  const EditProductPage(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.status,
      required this.ProductId});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  String name = "";
  String description = "";
  double price = 0;
  String status = '';
  TextEditingController nameControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  TextEditingController priceControler = TextEditingController();
  TextEditingController statusControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final AddProductBloc addProductBloc = AddProductBloc();
  final EditProductBloc editProductBloc = EditProductBloc();
  @override
  Widget build(BuildContext context) {
    nameControler.text = widget.name;
    descriptionControler.text = widget.description;
    statusControler.text = widget.status;
    priceControler.text = widget.price.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit a Product"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                key: ValueKey("name"),
                controller: nameControler,
                decoration: InputDecoration(
                  hintText: "Enter Product Name",
                ),
                onSaved: (newval) {
                  setState(() {
                    name = newval ?? '';
                  });
                },
                validator: (val) {
                  if (val.toString().length < 1) {
                    return "please enter a real name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: ValueKey("description"),
                controller: descriptionControler,
                decoration: InputDecoration(
                  hintText: "Enter Product description",
                ),
                onSaved: (val) {
                  setState(() {
                    description = val ?? '';
                  });
                },
                validator: (val) {
                  if (val.toString().length < 2) {
                    return "Please give a perfect description";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: ValueKey("price"),
                controller: priceControler,
                decoration: InputDecoration(
                  hintText: "Enter Product Price",
                ),
                onSaved: (newValue) {
                  setState(() {
                    price = double.parse(newValue ?? '0');
                  });
                },
              ),
              TextFormField(
                key: ValueKey("Status"),
                controller: statusControler,
                decoration: InputDecoration(
                  hintText: "Enter Product Status",
                ),
                onSaved: (newValue) {
                  setState(() {
                    status = newValue ?? '';
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        editProductBloc.add(EditProductSubmittedEvent(
                            name: name,
                            description: description,
                            price: price,
                            status: status,
                            ProductId: widget.ProductId));
                      }
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
