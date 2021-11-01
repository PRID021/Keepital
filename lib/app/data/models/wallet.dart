import 'package:keepital/app/data/models/base_model.dart';

class Wallet extends BaseModel {
  late String name;
  late double amount;
  late String currencyId;
  late String iconId;

  Wallet(String? id, {required this.name, required this.amount, required this.currencyId, required this.iconId}) : super(id);

  Wallet.fromMap(Map<String, dynamic> data) : super(data['id']) {
    name = data['name'];
    amount = data['amount'] ?? 0;
    currencyId = data['currencyId'];
    iconId = data['iconId'];
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'amount': amount, 'currencyId': currencyId, 'iconId': iconId};
  }

  bool checkIsValidInputDataToAdd() {
    if (name == "" || currencyId == "" || currencyId == "" || iconId == "") {
      return false;
    }
    return true;
  }
}
