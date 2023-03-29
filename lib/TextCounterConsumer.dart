import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';

class TextCounterConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<Counter>(builder: (context, counter, _) {
      return Column(
        children: [
          Text(
            // ANTES
            // Provider.of<Counter>(context).count.toString(),
            // context.watch<Counter>().count.toString(),
            counter.count.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            counter.add.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            counter.multiply.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      );
    });
  }
  
}