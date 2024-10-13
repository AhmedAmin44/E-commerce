import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_style.dart';

class HomeHeader extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeHeader> {
  String _selectedText = "Men"; // Default text in the container

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Center the row content
        children: [
          CircleAvatar(
            //ToDo Add Profile photo here
            child: Image.asset("assets/images/auth_images/splash_photo.png"),
          ),
          SizedBox(
            width: 75.w,
          ),
          GestureDetector(
            onTap: () async {
              final RenderBox button = context.findRenderObject() as RenderBox;
              final Offset buttonPosition = button.localToGlobal(
                  Offset.zero); // Get the position of the "Men" container

              // Calculate the center X position based on the container's width
              double centerX = buttonPosition.dx + (button.size.width / 2) + 25;

              // Show the menu centered under the container
              await showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  centerX - (150 / 2),
                  // Align the center of the menu to the center of the container
                  buttonPosition.dy + button.size.height,
                  // Y-coordinate + height to appear directly under
                  centerX + (150 / 2) + 1,
                  // Set the right boundary for the popup menu
                  0, // Not used, but set to 0
                ),
                items: <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Women',
                    child: Text('Women'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Men',
                    child: Text('Men'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Kids',
                    child: Text('Kids'),
                  ),
                ],
                color: AppColors.gray,
                // Set background color for the menu
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)), // Set border radius for the menu
                ),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    _selectedText = value; // Update the selected text
                  });
                }
              });
            },
            child: Container(
              width: 100.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_selectedText, style: TextStyles.font16BlackW700),
                  // Use the selected text
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 60.w,
          ),
          GestureDetector(
            onTap: (){
              //ToDo Navigate to Chart Screen
            },
            child: CircleAvatar(
              child: Image.asset("assets/images/home_images/homeHeader.png"),
            ),
          ),
        ],
      ),
    );
  }
}