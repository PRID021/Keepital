import 'package:firebase_auth/firebase_auth.dart';
import 'package:keepital/app/data/models/base_model.dart';
import 'package:keepital/app/data/models/wallet.dart';

class KeepitalUser extends BaseModel {
  String? name;
  String? currencyId;
  late double amount;
  String? currentWallet;
  List<Wallet> wallets = [];

  KeepitalUser(String id, {this.name, this.currencyId, this.amount = 0}) : super(id);

  KeepitalUser.fromMap(Map<String, dynamic>? data) : super(data?['id'] ?? '') {
    name = data?['name'] ?? '';
    currencyId = data?['currencyId'] ?? '';
    amount = data?['amount'] ?? 0;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'currencyId': this.currencyId,
      'amount': this.amount,
    };
  }

  bool get hasAnyWallet => wallets.isNotEmpty;
}
