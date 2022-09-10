import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class Preferences{
  static late RxSharedPreferences preferences;

  static void init()  {
    preferences = RxSharedPreferences.getInstance();
    preferences.reload();
  }

  void pickCountry(BuildContext context) {
    showCountryPicker(
      countryListTheme: CountryListThemeData(
        inputDecoration: InputDecoration(
          hintText: 'Pick a country',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      context: context,
      onSelect: (Country country) {
        preferences.setStringList('country',[country.name,country.flagEmoji]);
      },
    );
  }

  Stream<List<String>?> loadCountry(BuildContext context) {
    return preferences.getStringListStream('country');
  }

}