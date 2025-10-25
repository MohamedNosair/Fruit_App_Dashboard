import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/supabase/data_services.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_services.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_storage.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_store.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupGetIt() {
  sl.registerSingleton<SupabaseServices>(SupabaseStorage());
  sl.registerSingleton<DatabaseService>(FirestoreService());
  //get image repo
  sl.registerSingleton<ImageRepo>(ImageRepoImpl(sl.get<SupabaseServices>()));

  // get it product repo
  sl.registerSingleton<ProductRepo>(
    AddProductRepoImpl(sl.get<DatabaseService>()),
  );
}
