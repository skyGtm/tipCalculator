import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TipData extends ChangeNotifier {
  double _billAmount = 0.0;
  double _billAmountPerPerson = 0.0;
  int _noOfPerson = 1;

  int _tipPercentage = 10;
  double _tipAmount = 0.0;

  // Setters
  void setBillAmount(billAmount) {
    this._billAmount = billAmount;
    calculateBillAmountPerPerson();
    notifyListeners();
  }

  void setNoOfPerson(noOfPerson) {
    this._noOfPerson = noOfPerson;
    calculateBillAmountPerPerson();
    notifyListeners();
  }

  void setTipPercentage(tipPercentage) {
    this._tipPercentage = tipPercentage;
    calculateBillAmountPerPerson();
    notifyListeners();
  }

  //Getters
  get getBillAmount => _billAmount;
  get getBillAmountPerPerson => _billAmountPerPerson;
  get getNoOfPerson => _noOfPerson;
  get getTipPercentage => _tipPercentage;
  get getTipAmount => _tipAmount;

  void calculateTotalTipAmount() {
    _tipAmount = _billAmount * _tipPercentage / 100;
  }

  void calculateBillAmountPerPerson() {
    calculateTotalTipAmount();
    _billAmountPerPerson = (_billAmount + _tipAmount) / _noOfPerson;
  }
}
