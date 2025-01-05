import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/presentation/components/empty_tasks_warning.dart';
import 'package:todo_app/features/tasks/presentation/components/search_field.dart';

class SearchTasksTab extends StatelessWidget {
  const SearchTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 26),
      child: Column(
        children: [
          CustomSearchField(),
          SizedBox(height: 126),
          EmptyTasksWarning(),
        ],
      ),
    );
  }
}
