import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/di/get_it.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/add_product_view_body_bloc_consumer.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(S.current.addProduct),
      /// bloc provider for add product cubit
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(sl.get<ImageRepo>(), sl.get<ProductRepo>()),
        child: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}
