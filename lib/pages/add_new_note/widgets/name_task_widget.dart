import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameTaskWidget extends StatelessWidget {
   NameTaskWidget({Key? key, required this.titleTaskController}) : super(key: key);

  var titleTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Container(
      height: 230.h,
      width: 350.w,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller:titleTaskController,
        style: theme.textTheme.headline4,
        maxLines: 50,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          //  hintText: "Task Name",
          hintStyle: theme.textTheme.headline4,
          border: InputBorder.none,
        ),
      ),
    );
  }


}
