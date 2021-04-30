import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'widgets.dart';

class DonatePlasma extends StatefulWidget {
  @override
  _DonatePlasmaState createState() => _DonatePlasmaState();
}

class _DonatePlasmaState extends State<DonatePlasma> {
  String _sexDropDownVal;
  String _bloodGroupDropDownVal;
  DateTime _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: new DateTime.now().subtract(new Duration(days: 20)),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData(
                primaryColor: Colors.orangeAccent,
                disabledColor: Colors.brown,
                textTheme:
                    TextTheme(body1: TextStyle(color: Colors.blueAccent)),
                accentColor: Colors.yellow),
            child: child,
          );
        });
    if (picked != null && picked != _selectedDate)
      setState(
        () {
          _selectedDate = picked;
        },
      );
  }

  @override
  void initState() {
    _sexDropDownVal = "Male";
    _bloodGroupDropDownVal = "O+";
    _selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        width: screenWidth,
        height: screenHeight*0.85,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Donate Plasma, \nSave Lives!',
                  style: Styles.drawerTextStyle,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.blue,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              '* You can donate plasma if you are recovered within previouse 20 days from COVID-19!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: ListView(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: '*Name',
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: '*Age',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: '*Phone',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: '*Adress for Location',
                        ),
                        keyboardType: TextInputType.streetAddress,
                        minLines: 1,
                        maxLines: 2,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SimpleDropDown(
                            defaultVal: _sexDropDownVal,
                            allVal: [
                              'Male',
                              'Female',
                              'Others',
                            ],
                            color: Colors.red[300],
                            onChanged: (val) =>
                                setState(() => _sexDropDownVal = val),
                          ),
                          SimpleDropDown(
                            defaultVal: _bloodGroupDropDownVal,
                            allVal: [
                              'O+',
                              'O-',
                              'A+',
                              'A-',
                              'B+',
                              'B-',
                              'AB+',
                              'AB-'
                            ],
                            color: Colors.blue[300],
                            onChanged: (val) =>
                                setState(() => _bloodGroupDropDownVal = val),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('*Recovery Date'),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          TextButton(
                            onPressed: () => _selectDate(context),
                            child: Text(
                              "${_selectedDate.toLocal()}".split(' ')[0],
                            ),
                            style: TextButton.styleFrom(
                                primary: Colors.black, elevation: 0.1),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Any Medical History?',
                        ),
                        keyboardType: TextInputType.streetAddress,
                        minLines: 1,
                        maxLines: 2,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        '* Required!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Save!',
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
                onSurface: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
