import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,FontWeight fontWeight,Color color,TextDecoration textDecoration){
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    decoration: textDecoration,
  );
}

// ultraLight style
TextStyle getUltraLightStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily,
      FontWeightManager.ultraLight,
      color,
      textDecoration);
}


// light style
TextStyle getLightStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily,
      FontWeightManager.light,
      color, textDecoration);
}

// regular style
TextStyle getRegularStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}){
  return _getTextStyle(
      fontSize, FontConstants.fontFamily,
      FontWeightManager.regular,
      color, textDecoration);
}


// medium text style
TextStyle getSemiBoldStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}){
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium,
    color, textDecoration,
  );
}


// semiBold text style
TextStyle getBoldStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}){
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    color, textDecoration,
  );
}


// bold text style
TextStyle getMediumStyle({required double fontSize,required Color color,TextDecoration textDecoration = TextDecoration.none}){
  return _getTextStyle(
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color, textDecoration);
}