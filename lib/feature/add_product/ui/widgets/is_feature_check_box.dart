import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_hub_dashboard/core/themes/styles.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

// ignore: must_be_immutable

class IsFeatureCheckBox extends StatelessWidget {
  final void Function()? onTap;
  final bool isChecked;

  const IsFeatureCheckBox({super.key, this.onTap, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomCheckBox(isChecked: isChecked),
        ),

        Expanded(
          child: Text(
            S.current.isFeaturedItem,
            style: TextStyles.font13SemiBoldGray600,
          ),
        ),
      ],
    );
  }
}
