import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart' show kAmountTextStyle;
import 'my_button.dart';

// Provider
import 'package:provider/provider.dart';
import '../models/tip_data.dart';

class MyCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TipData>(context, listen: false);
    int _noOfPerson = provider.getNoOfPerson;
    // int _noOfPerson = provider.getNoOfPerson;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyButton(
            iconData: Icons.remove,
            onTap: () {
              if (_noOfPerson > 1) {
                provider.setNoOfPerson(--_noOfPerson);
              }
            },
          ),
          Text(
            '   $_noOfPerson   ',
            style: kAmountTextStyle,
          ),
          MyButton(
            iconData: Icons.add,
            onTap: () {
              provider.setNoOfPerson(++_noOfPerson);
            },
          ),
        ],
      ),
    );
  }
}
