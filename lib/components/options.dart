// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class Options extends StatelessWidget {
  const Options(
      {super.key, required this.options, required this.callBackFunction});

  final List options;
  final void Function() Function(dynamic)? Function(dynamic) callBackFunction;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: ElevatedButton(
              onPressed: () {
                callBackFunction(index);
              },
              child: Text(options[index]),
            ),
          );
        });
  }
}
