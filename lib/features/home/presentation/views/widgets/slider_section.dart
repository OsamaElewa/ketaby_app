import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';

import '../../cubits/slider_cubit/slider_cubit.dart';
import '../../cubits/slider_cubit/slider_state.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if(state is SliderSuccessState){
          return CarouselSlider(
            items: SliderCubit.get(context).sliderModel!.data!.sliders!
                .map((e) =>
                CustomNetworkImage(
                    borderRadius: 10,
                    image: e.image!)
            )
                .toList(),
            options: CarouselOptions(
              //height: 180,
              aspectRatio: 2.7,
              enlargeCenterPage: true,
              viewportFraction: 0.80,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          );
        }else if(state is SliderFailureState){
          return const Text('error');
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
