import 'package:flutter/material.dart';

class SimpleDropDown extends StatelessWidget {
  final List<String> allVal;
  final String defaultVal;
  final Function(String) onChanged;
  final Color color;

  const SimpleDropDown({
    @required this.defaultVal,
    @required this.allVal,
    @required this.onChanged,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: defaultVal,
          items: allVal
              .map(
                (e) => DropdownMenuItem(
                  child: Text(
                    e,
                  ),
                  value: e,
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
