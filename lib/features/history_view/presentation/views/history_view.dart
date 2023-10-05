
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/history_view/data/models/history_model.dart';
import 'package:ketaby/features/history_view/data/repository/history_repository_implementation.dart';

import '../cubits/history_cubit.dart';
import '../cubits/history_state.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        title: Text('History',style: TextStyle(color: Colors.indigo,fontSize: 18),),
        centerTitle: true,
      ),
      body: BlocProvider(
  create: (context) => HistoryCubit(HistoryRepositoryImplementation(ApiServicesImplementation()))..getHistory(),
  child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if(state is HistorySuccessState){
            return ConditionalBuilder(
              condition:HistoryCubit.get(context).historyModel!.data!.orders!.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => buildHistoryListItem(HistoryCubit.get(context).historyModel!.data!.orders![index]),
                          separatorBuilder: (context, index) => const SizedBox(height: 15,),
                          itemCount: HistoryCubit.get(context).historyModel!.data!.orders!.length
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => Text('empty'),
            );
          }else if(state is HistoryFailureState){
            return const Text('error');
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
),
    );
  }

  Container buildHistoryListItem(Orders orders) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('data :',style: TextStyle(color: Colors.black),),
                  Text(orders.orderDate!,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Text('total :',style: TextStyle(color: Colors.black),),
                  Text(orders.total!,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orders.status!,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text('order code :',style: TextStyle(color: Colors.black),),
                  Text(orders.orderCode!,style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
