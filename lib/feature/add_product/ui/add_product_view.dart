import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/add_products_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(S.current.addProduct),

      body: const AddProductsBody(),
    );
  }
}
