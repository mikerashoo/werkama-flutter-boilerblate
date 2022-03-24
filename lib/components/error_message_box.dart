import 'package:flutter/material.dart';

class ErrorTryAgainBox extends StatelessWidget {
  const ErrorTryAgainBox({Key? key, required this.onTryAgain})
      : super(key: key);
  final Function onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Something went wrong, please try again!'),
        TextButton(
            onPressed: () => {onTryAgain()}, child: const Text('Try Again'))
      ],
    );
  }
}
