import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_show_dialog.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_snackbar.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/add_products_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          customSnackBar(
            backgroundColor: Colors.green,
            context: context,
            icon: Icons.offline_bolt,
            message: 'add data success',
          );
        }

        if (state is AddProductFailure) {
           customSnackBar(
            backgroundColor: Colors.red,
            context: context,
            icon: Icons.offline_bolt,
            message: 'add data Error',
          );
        }
      },
      builder: (context, state) {
        return state is LoadingDialog
            ? CircularProgressIndicator()
            : const AddProductsBody();
      },
    );
  }
}
