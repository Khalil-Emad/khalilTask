import 'package:get_it/get_it.dart';
import 'package:task/domainLayer/cubit/app_cubit.dart';

import '../../dataLayer/repositry.dart';



final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => AppCubit(
      repository: sl(),
    ),
  );
  // Use cases

  // Repository
  sl.registerLazySingleton<Repository>(
    () => Repository(
      
    ),
  );

 

}
