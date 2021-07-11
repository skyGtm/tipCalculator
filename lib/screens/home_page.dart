import 'package:flutter/material.dart';
import 'package:tip_calculator/constants.dart';
import '../widgets/my_counter.dart';
import '../widgets/my_slider.dart';

// Provider
import '../models/tip_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TipData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context, builder: (context) => showAlertDialog()),
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Amount Per Person', style: kHeaderTextStyle),
                  SizedBox(height: 10),
                  Text(
                    '\$ ${provider.getBillAmountPerPerson.toStringAsFixed(2)}',
                    style: kHeaderAmountTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Bill Amount', style: labelTextStyle),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          style: kAmountTextStyle,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.attach_money,
                              color: kTextColor,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: kTextColor,
                          textAlign: TextAlign.right,
                          cursorHeight: 25,
                          onChanged: (value) {
                            var _provider = Provider.of<TipData>(
                              context,
                              listen: false,
                            );
                            try {
                              _billAmount = double.parse(value);
                            } catch (exception) {
                              _billAmount = 0.0;
                            }
                            _provider.setBillAmount(_billAmount);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split Among', style: labelTextStyle),
                      MyCounter(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip', style: labelTextStyle),
                      Text(
                        '\$ ${provider.getTipAmount.toStringAsFixed(2)}',
                        style: kAmountTextStyle,
                      ),
                    ],
                  ),
                  MySlider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog showAlertDialog() => AlertDialog(
        title: Text(
          'Tip Calculator',
          style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            'Consider a situation:\nIf you are having launch or dinner with friends. At the time of payment, you want to calculate the share of payment of each one of the group, but other calculator apps are unable to deal with current situation, then this app comes to the rescue. This app helps to calculate tip for the given amount and split the bill amount among friends.\n Just start by adding Bill Amount, Adjust the slider for tip percentage. All tedious calculations are handled by the app itself.',
          ),
        ),
        actions: [
          TextButton(
              child: Text(
                'Understood',
                style: TextStyle(color: kTextColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
}
