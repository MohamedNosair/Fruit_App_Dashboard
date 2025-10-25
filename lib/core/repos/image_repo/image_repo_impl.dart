import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_services.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_end_points.dart';

class ImageRepoImpl implements ImageRepo {
  final SupabaseServices supabaseServices;
  ImageRepoImpl(this.supabaseServices);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final url = await supabaseServices.uploadImage(
        image,
        BackendEndPoints.image,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to upload image"));
    }
  }
}
