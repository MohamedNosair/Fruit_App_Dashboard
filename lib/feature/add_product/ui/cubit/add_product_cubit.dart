import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductEntity.imageFile);
    result.fold(
      (failure) {
        emit(AddProductFailure(message: failure.message));
      },
      (url) async {
        addProductEntity.imageUrl = url;
        var resultProduct = await productRepo.addProduct(addProductEntity);
        resultProduct.fold(
          (left) {
            emit(AddProductFailure(message: left.message));
          },
          (right) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
