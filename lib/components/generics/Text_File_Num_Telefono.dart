

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../util/Styles.dart';

class TextFileNumTelefono {
  Widget GetTextFileNumTelefono (TextEditingController phoneController, {bool bolerro=false, String? err}){
    return IntlPhoneField(
      decoration: Styles.estilosBotonesRegistro("assets/icons/generic/Telefono.png", "Teléfono", null,  isError: bolerro, errorText: err,),
      style: const TextStyle(color: Colors.white),
      dropdownTextStyle: const TextStyle(color: Colors.white),
      initialCountryCode: 'ES',
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      disableLengthCheck: false,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: (phone) => phoneController.text = phone.number,
    );

  }

}