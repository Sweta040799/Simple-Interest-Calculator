import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainFormState();
  }
}

class _MainFormState extends State<MainForm> {
  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var answerArea = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "S.I.   CALCULATOR",
          style: TextStyle(
            fontFamily: 'KaushanScript',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getImage(),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: principleController,
                decoration: InputDecoration(
                    labelText: 'PRINCIPLE VALUE',
                    hintText: 'Enter Money Taken as Loan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: roiController,
                decoration: InputDecoration(
                    labelText: 'RATE OF INTEREST',
                    hintText: 'in percentage',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    labelStyle: TextStyle(
                      fontFamily: 'KaushanScript',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: timeController,
                      decoration: InputDecoration(
                          labelText: 'TIME PERIOD',
                          hintText: 'in years',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          labelStyle: TextStyle(
                            fontFamily: 'KaushanScript',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: ButtonTheme(
                        buttonColor: Colors.black,
                        minWidth: 230.0,
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        child: RaisedButton(
                            child: Text(
                              'CALCULATE',
                              style: TextStyle(
                                fontFamily: 'KaushanScript',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                this.answerArea = _totalValue();
                              });
                            }),
                      ))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                this.answerArea,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'KaushanScript',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              ButtonTheme(
                  buttonColor: Colors.black87,
                  minWidth: 230.0,
                  height: 60.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  child: RaisedButton(
                      child: Text(
                        'RESET',
                        style: TextStyle(
                          fontFamily: 'KaushanScript',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();

                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget getImage() {
    AssetImage loanImage = AssetImage('images/keymoney.png');
    Image money = Image(
      image: loanImage,
      width: 180.0,
      height: 180.0,
    );

    return Container(
      child: money,
      margin: EdgeInsets.only(top: 40.0),
    );
  }

  String _totalValue() {
    double principle = double.parse(principleController.text);
    double rate = double.parse(roiController.text);
    double time = double.parse(timeController.text);

    double totalAmount = principle + (principle * rate * time) / 100;

    String answer = '$totalAmount';
    return answer;
  }

  void _reset()
  {
    principleController.text = '';
    roiController.text = '';
    timeController.text = '';
    answerArea = '';
  }
}
