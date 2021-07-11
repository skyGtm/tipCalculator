import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart' show kPercentTextStyle;

// Provider
import 'package:provider/provider.dart';
import '../models/tip_data.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TipData>(context);
    var _tipPercent = provider.getTipPercentage;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: Column(
        children: [
          Text(
            '$_tipPercent %',
            style: kPercentTextStyle,
          ),
          Slider(
              min: 0,
              max: 100,
              divisions: 10,
              activeColor: Colors.purple,
              inactiveColor: Colors.grey,
              value: _tipPercent.toDouble(),
              onChanged: (value) {
                provider.setTipPercentage(value.round());
              }),
        ],
      ),
    );
  }
}
