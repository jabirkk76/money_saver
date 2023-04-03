// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:money_saver/controller/language_controller.dart';
import 'package:provider/provider.dart';

class LocalizationWidget extends StatelessWidget {
  const LocalizationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      child: Consumer<LanguageController>(
        builder: (context, value, child) {
          return Center(
            child: Container(
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
              child: DropdownButton<String>(
                value: value.defineCurrentLanguage(context),
                icon: const Icon(
                  Icons.language,
                  color: Colors.blue,
                ),
                iconSize: 20,
                elevation: 0,
                style: const TextStyle(color: Colors.white),
                underline: Container(
                  height: 1,
                ),
                dropdownColor: Colors.white,
                onChanged: (newValue) {
                  print(newValue);
                  value.changeLanguage(newValue!);
                },
                items: value.languages.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
