import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'widgets.dart';

class ReportResources extends StatefulWidget {
  @override
  _ReportResourcesState createState() => _ReportResourcesState();
}

class _ReportResourcesState extends State<ReportResources> {
  String _resourceType;

  @override
  void initState() {
    _resourceType = "Oxy Concentrator";
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
        height: screenHeight*0.6,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share Info, \nBe a Hero!',
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
            Align(
              alignment: Alignment.topLeft,
              child:Text(
              'Thanks for being a Corona HERO!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.red,
              ),
            ),),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: ListView(
                    children: [
                      SimpleDropDown(
                            defaultVal: _resourceType,
                            allVal: [
                              'Oxygen',
                              'Oxy Concentrator',
                              'Ambulance',
                              'Bed Avliblty',
                              'ICU Avliblty',
                              'Remdesivir Avliblty',
                              'Food',
                              'Other Essentials'
                            ],
                            onChanged: (val) =>
                                setState(() => _resourceType = val),
                                color: Colors.green[300]
                          ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: '*Name or Org',
                        ),
                        keyboardType: TextInputType.name,
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
