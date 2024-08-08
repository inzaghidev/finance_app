import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/utils/icons_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineMonth extends StatefulWidget {
  const TimelineMonth({super.key, required this.onChanged});
  final ValueChanged<String?> onChanged;

  @override
  State<TimelineMonth> createState() => _TimelineMonthState();
}

class _TimelineMonthState extends State<TimelineMonth> {
  String currentMonth = "";
  List<String> months = [];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    for (int i = 0; i >= -18; i--) {
      months.add(
          DateFormat('MMM y').format(DateTime(now.year, now.month + i, 1)));
    }
    currentMonth = DateFormat('MMM y').format(now);

    Future.delayed(Duration(seconds: 1), () {
      scrollToSelectedMonth();
    });
  }

  scrollToSelectedMonth() {
    final selectedMonthIndex = months.indexOf(currentMonth);
    if (selectedMonthIndex != -1) {
      final scrollOfset = (selectedMonthIndex * 100.0) - 170;
      scrollController.animateTo(scrollOfset,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          controller: scrollController,
          itemCount: months.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentMonth = months[index];
                  widget.onChanged(months[index]);
                });
                scrollToSelectedMonth();
              },
              child: Container(
                width: 100,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: currentMonth == months[index]
                        ? Colors.blue.shade900
                        : Colors.pink.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(months[index],
                        style: TextStyle(
                          color: currentMonth == months[index]
                              ? Colors.white
                              : Colors.purple,
                        ))),
              ),
            );
          }),
    );
  }
}
