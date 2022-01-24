class Transaction{
  final String transId;
  final double total;
  final DateTime date;

  Transaction.fromJson(Map json):
            transId = json['TransId'],
            total = json['Total'],
            date = DateTime.tryParse(json['Date']);
}