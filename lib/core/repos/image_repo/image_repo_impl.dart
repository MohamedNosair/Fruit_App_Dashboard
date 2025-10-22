import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
   throw UnimplementedError();
  }
}
