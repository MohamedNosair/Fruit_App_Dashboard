import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/supabase/data_services.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_end_points.dart';
import 'package:fruit_hub_dashboard/feature/add_product/data/model/add_product_model.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';

class AddProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  AddProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductEntity addProductEntity,
  ) async {
    try {
      await databaseService.addData(
        data: AddProductModel.fromEntity(addProductEntity).toJson(),
        path: BackendEndPoints.addProduct,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
