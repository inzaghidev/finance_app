import 'package:finance_app/widgets/category_list.dart';
import 'package:finance_app/widgets/tab_bar_view.dart';
import 'package:finance_app/widgets/timeline_month.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key});

  get category => 0;

  get monthYear => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensive'),
      ),
      body: Column(
        children: [
          TimelineMonth(
            onChanged: (String? value) {},
          ),
          CategoryList(
            onChanged: (String? value) {},
          ),
          TypeTabBar(
            category: category,
            monthYear: monthYear,
          ),
        ],
      ),
    );
  }
}
