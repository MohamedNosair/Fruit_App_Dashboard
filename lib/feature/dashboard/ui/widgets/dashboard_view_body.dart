import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';
import 'package:fruit_hub_dashboard/core/utils/extension.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: S.current.addProduct,
            onPressed: () {
              context.pushNamed(Routes.addProduct);
            },
          ),
          
        ],
      ),
    );
  }
}
