import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../home/home_controller.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        child: SfDateRangePicker(
          backgroundColor: theme.backgroundColor,
          selectionColor: theme.primaryColor,
          todayHighlightColor: theme.primaryColor,
          selectionTextStyle:
          TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.backgroundColor),
          minDate: controller.dateTimeNow,
          maxDate: controller.dateTimeNow.add(const Duration(days: 1000)),
          headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.left,
            textStyle:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor),
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            textStyle:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor),
            disabledDatesTextStyle:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: theme.primaryColor),
          ),
          onSelectionChanged: (selectedDate) {
            controller.eventDateTime.value = selectedDate.value;
          },
        ),
      );
    });
  }
}
