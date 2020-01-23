class Transferencia {
  double value;
  int numberAccount;
  DateTime date;

  Transferencia(double value,int numberAccount) {
    this.value = value;
    this.numberAccount = numberAccount;
    this.date= DateTime.now();
  }

  @override
  String toString() {
    return 'Transferencia{value: $value, numberAccount: $numberAccount, date: $date}';
  }
}