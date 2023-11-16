import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dataLayer/repositry.dart';
import '../../../main.dart';
import '../models/myModel.dart';

part 'app_state.dart';

AppCubit get appCubit => AppCubit.get(navigatorKey.currentContext!);

class AppCubit extends Cubit<AppState> {
  final Repository _repository;

  AppCubit({
    required Repository repository,
  })  : _repository = repository,
        super(Empty());

  static AppCubit get(context) => BlocProvider.of(context);

  MyModel? myModel;

 Future<void> getData() async {
    emit(GetDataLoadingState());
    final results = await _repository.getData();
    results.fold(
      (error) {
        debugPrint('-----error------');
        debugPrint(error.toString());
        emit(
          GetDataErrorState(
            error: error,
          ),
        );
      },
      (data) {
        debugPrint('----- Get Data ------');
        // myModel = data.Data![0];
        emit(GetDataSuccessState());
      },
    );
  }
}
