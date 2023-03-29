import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';

class TextCounterSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          //SELECTOR ANTEs
          // Selector<Counter, int>(
          //   selector: (context, counter) => counter.count,
          //   builder: (context, int count, child) {
          //     return Text(
          //       // ANTES
          //       // Provider.of<Counter>(context).count.toString(),
          //       // context.watch<Counter>().count.toString(),
          //       count.toString(),
          //       style: Theme.of(context).textTheme.headlineMedium,
          //     );
          //   },
          // ),
          // SELECTOR AHORA
          Text(
            // ANTES
            // Provider.of<Counter>(context).count.toString(),
            // context.watch<Counter>().count.toString(),
            context.select((Counter counter) => counter.count.toString()),
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      );
  }
}