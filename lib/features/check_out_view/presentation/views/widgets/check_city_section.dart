import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';

import '../../../../../core/widgets/custom_dropdown.dart';
import '../../cubits/governorates_cubit/governorates_cubit.dart';
import '../../cubits/governorates_cubit/governorates_state.dart';

class CheckCitySection extends StatelessWidget {
  const CheckCitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernoratesCubit, GovernoratesState>(
      builder: (context, state) {
        if(state is GovernoratesSuccessState){
          return CustomDropdown(
              title: 'select city',
              hintText: 'select City',
              messageForValidate: 'Please choose a city',
              items: state.governoratesModel.data!.map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.governorateNameEn!),
                ),
              ).toList(),
              onChange: (value) {
                GovernoratesCubit.get(context).dropdownValue =
                    value.id;
                AppConstants.govid = value.id;
                print(value.id.toString());
              },
          );
        }else if(state is GovernoratesFailureState){
          return const Text('error');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
