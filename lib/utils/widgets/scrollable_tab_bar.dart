import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

TabBar buildScrollableTabBar({
  required List<dynamic> menuOptions,
  required TabController tabController,
  Function(int)? onTap,
  Color indicatorColor = const Color.fromARGB(255, 38, 3, 198),
  Color unselectedLabelColor = Colors.black,
  Color labelColor = Colors.white,
}) {
  return TabBar(
    controller: tabController,
    isScrollable: true,
    dividerColor: Colors.transparent,
    onTap: onTap,
    indicator: RectangularIndicator(
      verticalPadding: 4.0, // Adjusted for better visual balance
      horizontalPadding: 4.0, // Added for consistent spacing
      color: indicatorColor,
      topLeftRadius: 12.0, // Rounded corners for indicator
      topRightRadius: 12.0,
      bottomLeftRadius: 12.0,
      bottomRightRadius: 12.0,
    ),
    unselectedLabelColor: unselectedLabelColor,
    labelColor: labelColor,
    tabs: [
      for (var item in menuOptions)
        Tab(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Container(
              width: 120.0, // Fixed width for consistent tab size
              height: 36.0, // Fixed height for consistent tab size
              decoration: BoxDecoration(
                border: Border.all(
                  color: indicatorColor, // Border color matches indicatorColor
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(
                  10.0,
                ), // Matches indicator radius
              ),
              alignment: Alignment.center, // Center the text
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
    ],
  );
}
