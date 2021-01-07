library flutter_count_down;

class CountDown {
  String timeLeft(
    DateTime due,
    String finishedText, {
    bool longDateName = false,
  }) {
    String retVal;

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds - (_minUntil * 60);
    String s = _secUntil.toString().substring(_secUntil.toString().length - 2);

    if (_daysUntil > 0) {
      //Check whether to return longDateName date name or not
      if (longDateName == false) {
        retVal = _daysUntil.toString() +
            " d " +
            _hoursUntil.toString() +
            " h " +
            _minUntil.toString() +
            " m " +
            s.toString() +
            " s ";
      } else {
        retVal = _daysUntil.toString() +
            " days " +
            _hoursUntil.toString() +
            " hours " +
            _minUntil.toString() +
            " months " +
            s.toString() +
            " seconds ";
      }
    } else if (_hoursUntil > 0) {
      if (longDateName == false) {
        retVal = _hoursUntil.toString() +
            " h " +
            _minUntil.toString() +
            " m " +
            s.toString() +
            " s ";
      } else {
        retVal = _hoursUntil.toString() +
            " hours " +
            _minUntil.toString() +
            " minutes " +
            s.toString() +
            " seconds ";
      }
    } else if (_minUntil > 0) {
      if (longDateName == false) {
        retVal = _minUntil.toString() + " m " + s.toString() + " s ";
      } else {
        retVal =
            _minUntil.toString() + " minutes " + s.toString() + " seconds ";
      }
    } else if (_secUntil > 0) {
      retVal = "Almost there ";
    } else {
      retVal = finishedText;
    }
    return retVal;
  }
}
