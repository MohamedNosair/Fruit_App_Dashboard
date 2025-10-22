import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';

abstract class AddProductRepo {
  Future<void> addProduct(AddProductEntity addProductEntity);
}
