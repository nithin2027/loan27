import 'package:flutter/material.dart';
import 'package:loan27/lastmessage.dart';

class LoanCalculator extends StatefulWidget {
  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  double loanAmount = 0;
  double interestRate = 0;
  int loanDuration = 0;
  int repaymentPeriod = 0;
  double totalAmount = 0;

  void calculateTotalAmount() {
    double interest = loanAmount * interestRate * loanDuration / 100;
    double principal = loanAmount;
    totalAmount = principal + interest;
    //double monthlyPayment = totalAmount / (repaymentPeriod * 12);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('LOAN CALCULATOR'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Loan Amount',
                  hintText: 'Enter the loan amount',
                ),
                onChanged: (value) {
                  setState(() {
                    loanAmount = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Interest Rate (%)',
                  hintText: 'Enter the interest rate',
                ),
                onChanged: (value) {
                  setState(() {
                    interestRate = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Loan Duration (in years)',
                  hintText: 'Enter the loan duration',
                ),
                onChanged: (value) {
                  setState(() {
                    loanDuration = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Repayment Period (in years)',
                  hintText: 'Enter the repayment period',
                ),
                onChanged: (value) {
                  setState(() {
                    repaymentPeriod = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                      .shade900, // Replace 'Colors.blue' with your desired color
                ),
                onPressed: () {
                  calculateTotalAmount();
                },
              ),
              ElevatedButton(
                child: Text('Confirm the bank'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                      .shade900, // Replace 'Colors.blue' with your desired color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProcessingPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Loan Amount: $loanAmount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Interest Rate: $interestRate%',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Loan Duration: $loanDuration years',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Repayment Period: $repaymentPeriod years',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                'Total Amount to be Repaid: $totalAmount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
