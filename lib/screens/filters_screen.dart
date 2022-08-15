import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

import '../models/trip.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRouate = 'filters';

  final Function _saveFilters;
  final Map<String, bool> curretFilters;

  FiltersScreen(this.curretFilters, this._saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isSummer = false;
  var _isWinter = false;
  var _isFamily = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSummer = widget.curretFilters['summer'] as bool;
    _isWinter = widget.curretFilters["winter"] as bool;
    _isFamily = widget.curretFilters['family'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('الفلترة'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _isSummer,
                'winter': _isWinter,
                'family': _isFamily,
              };
              widget._saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              SizedBox(
                height: 40,
              ),
              buildSwitchListTitle('الرحلات  الصيفية فقط',
                  'إظهار الرحلات الصيفية فقط', _isSummer, (newValue) {
                setState(() {
                  _isSummer = newValue;
                });
              }),
              Divider(
                thickness: 1,
                color: Colors.blue,
              ),
              buildSwitchListTitle('الرحلات  الشتوية  فقط',
                  'إظهار الرحلات الشتوية فقط', _isWinter, (newValue) {
                setState(() {
                  _isWinter = newValue;
                });
              }),
              Divider(
                thickness: 1,
                color: Colors.blue,
              ),
              buildSwitchListTitle(
                  'رحلات  عائلية فقط', 'إظهار رحلات عائلية فقط', _isFamily,
                  (newValue) {
                setState(() {
                  _isFamily = newValue;
                });
              }),
              Divider(
                thickness: 1,
                color: Colors.blue,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTitle(title, subTitle, newValue, updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: newValue,
      onChanged: updateValue,
    );
  }
}
