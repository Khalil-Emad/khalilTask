import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/domainLayer/cubit/app_cubit.dart';

import '../widgets/listItem.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Doctors and Patients'),
          ),
          body: state is GetDataLoadingState
              ? Center(child: CupertinoActivityIndicator())
              : state is GetDataErrorState
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.error),
                    )
                  : ListView.builder(
                      itemCount: appCubit.myModel!.results.length,
                      itemBuilder: (context, index) {
                        return DoctorListItem(item: appCubit.myModel!.results[index]);
                      },
                    ),
        );
      },
    );
  }
}
