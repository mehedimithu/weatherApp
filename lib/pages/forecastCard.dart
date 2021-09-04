import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/utils/convert_icons.dart';
import 'package:weather_app/utils/utils.dart';

import '../main.dart';

Widget forecastCard(AsyncSnapshot<ForcastModel?> snapshot, int index) {
  var dataList = snapshot.data!.daily;

  var fullDate = Util.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch(dataList![index].dt! * 1000));
  var dayOfWeek = "";
  var sunRize = "";

  dayOfWeek = fullDate!.split(",")[0]; //[Saturday, Set 1, 2021]

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(dayOfWeek)),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor: Colors.transparent,
              child: getWeatherIcons(
                  weatherDescription:
                      "${snapshot.data!.hourly![index].weather![0].main}",
                  color: Colors.grey,
                  size: 40),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                        "${snapshot.data!.hourly![index].feelsLike!.toStringAsFixed(1)}°F"),
                    Text(
                        "${snapshot.data!.hourly![index].humidity!.toStringAsFixed(1)}%"),
                    Text(
                      "${snapshot.data!.hourly![index].temp!.toStringAsFixed(1)}°F",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
