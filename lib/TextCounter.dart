import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';
import 'package:state_flutter/Counter2.dart';

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Text(
            // ANTES
            // Provider.of<Counter>(context).count.toString(),
            // context.watch<Counter>().count.toString(),
            context.watch<Counter2>().count2.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          );
  }
  
}