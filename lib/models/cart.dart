import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
//singleton
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  //Catalog Fields
  late CatalogModel _catalog;

// collection of IDs - store IDs for each item
  final List<int> _itemIds = [];

//get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!);

  //add Item

  // void add(Item item) {
  //   _itemIds.add(item.id!);
  // }

  //remove
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item? item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item!.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item? item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item!.id!);
  }
}
