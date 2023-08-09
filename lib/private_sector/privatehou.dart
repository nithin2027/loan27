import 'package:flutter/material.dart';
import 'package:loan27/loancalc.dart';

class BankTablePageho extends StatefulWidget {
  @override
  _BankTablePage1Stateho createState() => _BankTablePage1Stateho();
}

class _BankTablePage1Stateho extends State<BankTablePageho> {
  late String _selectedBank = '';

  List<Map<String, dynamic>> _banks = [
    {'name': 'Axis bank', 'rate': 12.00},
    {'name': 'ICICI bank', 'rate': 10.50},
    {'name': 'HDFC bank', 'rate': 9.80},
    {'name': 'Kotak mahindra bank', 'rate': 12.50},
    {'name': 'Indusind Bank', 'rate': 11.75},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('BANK INTEREST RATES'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select a Bank:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Theme(
                data: Theme.of(context).copyWith(
                  // Create a custom ThemeData
                  checkboxTheme: CheckboxThemeData(
                    fillColor: MaterialStateColor.resolveWith((states) {
                      return Colors.deepPurple
                          .shade900; // Change the checkbox color to purple here
                    }),
                  ),
                ),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Bank Name')),
                    DataColumn(label: Text('Interest Rate')),
                  ],
                  rows: _banks
                      .map(
                        (bank) => DataRow(
                          selected: _selectedBank == bank['name'],
                          onSelectChanged: (isSelected) {
                            setState(() {
                              _selectedBank = bank['name'];
                            });
                          },
                          cells: [
                            DataCell(Text(bank['name'])),
                            DataCell(Text('${bank['rate']}%')),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            ElevatedButton(
              onPressed: _selectedBank.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoanCalculator(),
                        ),
                      );
                      // Do something with selected bank
                    },
              style: ElevatedButton.styleFrom(
                primary:
                    Colors.deepPurple.shade900, // Change the button color here
              ),
              child: Text('Select Bank'),
            ),
          ],
        ),
      ),
    );
  }
}
