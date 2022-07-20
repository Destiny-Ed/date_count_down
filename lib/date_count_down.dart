library count_down_timer;

import 'dart:async';
import 'package:flutter/material.dart';

import 'countdown.dart';

///CountDownText : A simple text widget that display the countdown timer
///based on the dateTime given e.g DateTime.utc(2050)
class CountDownText extends StatefulWidget {
  CountDownText({
    Key? key,
    required this.due,
    required this.finishedText,
    this.longDateName = false,
    this.style,
    this.showLabel = false,
    this.collapsing = false,
    this.daysTextLong = " days ",
    this.hoursTextLong = " hours ",
    this.minutesTextLong = " minutes ",
    this.secondsTextLong = " seconds ",
    this.daysTextShort = " d ",
    this.hoursTextShort = " h ",
    this.minutesTextShort = " m ",
    this.secondsTextShort = " s ",
    this.endingText = 'left',
  }) : super(key: key);

  final DateTime? due;
  final String? finishedText;
  final bool? longDateName;
  final bool? showLabel;
  final TextStyle? style;
  final String daysTextLong;
  final String hoursTextLong;
  final String minutesTextLong;
  final String secondsTextLong;
  final String daysTextShort;
  final String hoursTextShort;
  final String minutesTextShort;
  final String secondsTextShort;

  /// Makes text to show only the biggest time unit. Starting from days left, then hours etc...
  final bool collapsing;

  /// Shows in the end of the text when its collapsing
  final String endingText;

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
      CountDown().timeLeft(
        widget.due!,
        widget.finishedText!,
        widget.daysTextLong,
        widget.hoursTextLong,
        widget.minutesTextLong,
        widget.secondsTextLong,
        widget.daysTextShort,
        widget.hoursTextShort,
        widget.minutesTextShort,
        widget.secondsTextShort,
        longDateName: widget.longDateName,
        showLabel: widget.showLabel,
        collapsing: widget.collapsing,
        endingText: widget.endingText,
      ),
      style: widget.style,
    );
  }
}
