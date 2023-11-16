import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../dataLayer/repositry.dart';
import '../../models/myModel.dart';

part 'my_cubit_state.dart';

class MyCubitCubit extends Cubit<MyCubitState> {
  MyCubitCubit() : super(MyCubitInitial());

   MyModel? myModel;

  Repositry? repo;

   getDate() async{
  myModel= await repo!.getData();
  }

  
}
