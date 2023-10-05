import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEmpty extends StatelessWidget {
   CustomEmpty({Key? key, required this.title, required this.image}) : super(key: key);

  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage(image),
            width: 350,
            height: 350,
          ),
          Text(title,style: TextStyle(color: Colors.black,fontSize: 15),)
        ],
      ),
    );
  }
}
