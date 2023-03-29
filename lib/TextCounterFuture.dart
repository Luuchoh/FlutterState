import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';

class TextCounterFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          FutureProvider<String>(
            create: (context) => Counter().fetchName,
            initialData: "",
            child: Column(
              children: [
                Consumer<String>(builder: (context, String name, _) {
                  return Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                })
              ],
            )
          )
        ],
      );
  }
}