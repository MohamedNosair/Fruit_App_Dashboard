import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/core/utils/spacing_helper.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_buttom.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/is_feature_check_box.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/widgets/is_organic_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

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
  late num price, numberOfCalories, unitAmount, expirationsMonths;
  bool isChecked = false;
  bool isOrganic = false;
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
                  expirationsMonths = num.parse(value!);
                },
                hintText: S.current.expirationsMonths,
                textInputType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: S.current.numberOfCalories,
                textInputType: TextInputType.number,
              ),

              /// unit amount field
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: S.current.unitAmount,
                textInputType: TextInputType.number,
              ),

              /// product code field
              CustomTextFormField(
                onSaved: (value) {
                  code = value!;
                },
                hintText: S.current.productCode,
                textInputType: TextInputType.text,
              ),

              /// product description field
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: S.current.productDescription,
                textInputType: TextInputType.multiline,
                maxLines: 5,
              ),

              /// check box special item
              GestureDetector(
                onTap: () {
                  isChecked = !isChecked;
                  setState(() {});
                },
                child: IsFeatureCheckBox(isChecked: isChecked),
              ),

              /// check box organic item
              GestureDetector(
                onTap: () {
                  isOrganic = !isOrganic;
                  setState(() {});
                },
                child: IsOrganicCheckBox(isOrganic: isOrganic),
              ),

              //* add image
              ImageField(
                onFileChange: (file) {
                  setState(() {});
                  image = file;
                },
              ),
              //* button add product
              CustomButton(
                text: S.current.addProduct,
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductEntity addProductEntity = AddProductEntity(
                        reviews: [],
                        name: name,
                        description: description,
                        price: price,
                        imageUrl: image?.path,
                        isFeatured: isChecked,
                        imageFile: image!,
                        expirationsMonths: expirationsMonths.toInt(),
                        numberOfCalories: numberOfCalories,
                        unitAmount: unitAmount,
                        isOrganic: isOrganic,
                      );

                      context.read<AddProductCubit>().addProduct(
                        addProductEntity,
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
