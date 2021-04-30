import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';

const textStyle = TextStyle(
  fontFamily: 'Avenir',
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.08,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.15,
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/drawer_logo.png'),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          //StateDropdown(states: , state: 'MH', onChanged: )
          FlatButton.icon(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            onPressed: () => _reportResources(context),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            icon: const Icon(
              Icons.verified,
              color: Colors.white,
            ),
            label: Text(
              'Report Resource',
              style: Styles.buttonTextStyle,
            ),
            textColor: Colors.white,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          ListTile(
            title: Text(
              'Disclaimer',
              textAlign: TextAlign.center,
              style: Styles.drawerTextStyle,
            ),
            onTap: () => _disclaimer(context, screenHeight, screenWidth),
          ),
          ListTile(
            title: Text(
              'About Us',
              textAlign: TextAlign.center,
              style: Styles.drawerTextStyle,
            ),
            onTap: () => _aboutUs(context, screenHeight, screenWidth),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Keep Updating the App!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Palette.primaryColor,
                child: Center(
                  child: Text(
                    'v1.0.1',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _aboutUs(BuildContext context, double screenHeight, double screenWidth) {
    Navigator.of(context).pop();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ), //this right here
          child: Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Us!',
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
                    height: screenHeight * 0.08,
                  ),
                  Text(
                    'We are students of college trying to help others in need in the best way we can!',
                  ),
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: team
                        .map((e) => Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        e.keys.first,
                                        height: screenHeight * 0.12,
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Text(
                                        e.values.first,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _disclaimer(BuildContext context, double screenHeight, double screenWidth) {
    Navigator.of(context).pop();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Disclaimer!',
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
                    height: screenHeight * 0.08,
                  ),
                  Text(
                      '# We are Not Affiliated to any governmental organisation nor we have contact with anyone. \n# We provide data when someone report it or We collect from social media.\n# Some Data might be false.\n# Use this app on your own Risk!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _reportResources(BuildContext context) {
    Navigator.of(context).pop();

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ReportResources(),
    );
  }
}
