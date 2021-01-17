int fullPaybackWithNis({int fullNispayment, int nisTotal, int payBackTotal}) {
  final nisReminder = fullNispayment - nisTotal;
  return nisReminder + payBackTotal;
}
