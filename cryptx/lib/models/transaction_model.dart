import 'package:wallet/models/wallet_model.dart';

class TransactionModel {
  final WalletModel? from;
  final WalletModel? to;
  final num amount;
  final String date;

  TransactionModel({
    required this.from,
    required this.to,
    required this.amount,
  }) : date = DateTime.now().toString();

  TransactionModel.fromString(String from, String to, this.amount)
      : from = WalletModel(publicKey: from),
        to = WalletModel(publicKey: to),
        date = DateTime.now().toString();

  TransactionModel.fromJson(Map<String, dynamic> json)
      : from = json['from'] != null ? WalletModel(publicKey: json['from']) : null,
        to = json['to'] != null ? WalletModel(publicKey: json['to']) : null,
        amount = json['amount'],
        date = json['date'];

  Map<String, dynamic> toJson() {
    return {
      'from': from?.getAddress ?? 'unknown',
      'to': to?.getAddress ?? 'unknown',     
      'amount': amount.toDouble(),
      'date': date,
    };
  }
}
