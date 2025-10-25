import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruit_hub_dashboard/core/themes/styles.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

// ignore: must_be_immutable

class IsOrganicCheckBox extends StatelessWidget {
  final void Function()? onTap;
  final bool isOrganic;

  const IsOrganicCheckBox({super.key, this.onTap, required this.isOrganic});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CustomCheckBox(isChecked: isOrganic),
        ),

        Expanded(
          child: Text(
            S.current.isOrganic,
            style: TextStyles.font13SemiBoldGray600,
          ),
        ),
      ],
    );
  }
}
