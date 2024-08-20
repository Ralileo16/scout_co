import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageTest3 extends StatelessWidget {
  final number = ValueNotifier(0);

  PageTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: number,
        builder: (context, value, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                number.value++;
              },
              child: MyWidget(number),
            ),
          );
        },
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final ValueListenable<int> number;

  const MyWidget(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(number.value.toString());
  }
}
