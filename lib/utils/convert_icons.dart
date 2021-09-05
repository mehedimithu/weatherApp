import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

Widget getWeatherIcons(
    {required String weatherDescription,
    required Color color,
    required double size}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, color: color, size: size);
      }
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }

    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }

    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowflake,
          color: color,
          size: size,
        );
      }

    default:
      {
        return Icon(
          FontAwesomeIcons.solidSun,
          color: color,
          size: size,
        );
      }
  }
}
