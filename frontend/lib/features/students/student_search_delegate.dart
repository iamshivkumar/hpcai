import 'package:ai_school/features/components/async_widget.dart';
import 'package:ai_school/features/students/providers/students_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentSearchDelegate extends SearchDelegate {
  final String classId;
  final List<String>? selected;

  StudentSearchDelegate({required this.classId, this.selected});

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults();

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults();

  Widget _buildSearchResults() {
    return HookConsumer(
      builder: (context, ref, child) {
        final selected = useState(this.selected ?? []);

        final bool selection = this.selected != null;
        return AsyncWidget(
          value: ref.watch(studentsProvider(classId)),
          data: (students) {
            final results = students.where(
              (element) => '${element.rollNo}-${element.name}'
                  .toLowerCase()
                  .contains(query.toLowerCase()),
            );

            return Stack(
              children: [
                ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final student = results.elementAt(index);
                    final v = selected.value.contains(student.id);
                    return ListTile(
                      leading:
                          v ? const Icon(Icons.check_circle_rounded) : null,
                      selected: v,
                      title: Text(student.name),
                      onTap: () {
                        if (selection) {
                          selected.value = [...selected.value, student.id];
                        } else {
                          close(context, student);
                        }
                      },
                    );
                  },
                ),
                if (selected.value.isNotEmpty)
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        close(context, selected.value);
                      },
                      label: Text('Done'),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
