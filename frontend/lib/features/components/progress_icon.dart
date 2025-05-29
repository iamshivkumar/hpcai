import 'package:flutter/material.dart';

class ProgressIcon extends StatelessWidget {
  const ProgressIcon(this.value,{super.key,});
  
  final bool? value;
  @override
  Widget build(BuildContext context) {
    print(value);
    return value == null? Icon(Icons.circle_outlined,color: Colors.grey): value == true? Icon(Icons.check_circle_outline_rounded,color: Colors.green): Icon(Icons.pending_outlined,color: Colors.amber,);
  }
}