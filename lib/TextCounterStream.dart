import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';

class TextCounterStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          StreamProvider<int>(
            create: (context) => Counter().countForOneMinute(),
            initialData: 0,
            child: Column(
              children: [
                Consumer<int>(builder: (context, int count, _) {
                  return Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                })
              ],
            ),
          )
        ],
      );
  }
}