library count_down_timer;

import 'dart:async';
import 'package:flutter/material.dart';

import 'countdown.dart';

///CountDownText : A simple text widget that display the countdown timer
///based on the dateTime given e.g DateTime.utc(2050)
class CountDownText extends StatefulWidget {
  CountDownText(
      {Key? key,
      required this.due,
      required this.finishedText,
      this.longDateName = false,
      this.style,
      this.showLabel = false})
      : super(key: key);

  final DateTime? due;
  final String? finishedText;
  final bool? longDateName;
  final bool? showLabel;
  final TextStyle? style;

  @override
  _CountDownTextState createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      CountDown().timeLeft(widget.due!, widget.finishedText!,
          longDateName: widget.longDateName, showLabel: widget.showLabel),
      style: widget.style,
    );
  }
}
