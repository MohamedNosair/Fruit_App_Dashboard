import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/spacing_helper.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/is_feature_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddProductsBody extends StatefulWidget {
  const AddProductsBody({super.key});

  @override
  State<AddProductsBody> createState() => _AddProductsBodyState();
}

class _AddProductsBodyState extends State<AddProductsBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? image;
  late String name, code, description;
  late num price;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            spacing: 12.h,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: S.current.productName,
                textInputType: TextInputType.name,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: S.current.productPrice,
                textInputType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!;
                },
                hintText: S.current.productCode,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: S.current.productDescription,
                textInputType: TextInputType.multiline,
                maxLines: 5,
              ),
              GestureDetector(
                onTap: () {
                  isChecked = !isChecked;
                  setState(() {});
                },
                child: IsFeatureCheckBox(isChecked: isChecked),
              ),

              ImageField(
                onFileChange: (file) {
                  setState(() {});
                  image = file;
                },
              ),

              CustomButton(
                text: S.current.addProduct,
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductEntity addProductEntity = AddProductEntity(
                        name: name,
                        description: description,
                        price: price,
                        imageUrl: image?.path,
                        isFeatured: isChecked,
                        imageFile: image!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('please sellect image')),
                    );
                  }
                },
              ),
              heightSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
