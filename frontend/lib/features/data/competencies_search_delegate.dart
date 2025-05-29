// ignore_for_file: depend_on_referenced_packages

import 'package:ai_school/core/data.dart';
import 'package:ai_school/core/enums/area.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class CompetenciesSearchDelegate extends SearchDelegate {
  final List<String>? selected;
  CompetenciesSearchDelegate({
    this.selected,
    required this.area,
    required this.goals,
  });

  final Area area;

  final List<String> goals;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          showSuggestions(context);
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  Widget view(BuildContext context) {
    return Material(
      color: context.scheme.surfaceContainerLowest,
      child: SafeArea(
        child: HookConsumer(
          builder: (context, ref, child) {
            final selected = useState(this.selected ?? []);

            final bool selection = this.selected != null;

            final selectedTag = useState<String?>(null);


            final competencies = Data.getCompetencies(area, goals: goals);

            final tags =
                Data.tagMap.entries
                    .where(
                      (e) => competencies
                          .map((e) => e.split('-').first)
                          .contains('${e.key}C'),
                    )
                    .toList();
            
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (tags.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          spacing: 8,
                          children:
                              tags
                                  .map(
                                    (e) => ChoiceChip(
                                      label: Text(e.value),
                                      selected: selectedTag.value == e.key,
                                      onSelected: (value) {
                                        selectedTag.value =
                                            value ? e.key : null;
                                      },
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    Expanded(
                      child: ListView(
                        children:
                            
                                competencies.where(
                                  (e) => '$e:${Data.getCompetency(e)}'
                                      .toLowerCase()
                                      .contains(query.toLowerCase()),
                                )
                                .where(
                                  (e) =>
                                      selectedTag.value != null
                                          ? e.split('-').first ==
                                              '${selectedTag.value}C'
                                          : true,
                                )
                                .map((e) {
                                  final v = selected.value.contains(e);
                                  final value = Data.getCompetency(e);
                                  return ListTile(
                                    leading:
                                        v
                                            ? const Icon(
                                              Icons.check_circle_rounded,
                                            )
                                            : null,
                                    selected: v,
                                    selectedTileColor: context
                                        .scheme
                                        .primaryContainer
                                        .withValues(alpha: 0.3),
                                    title: RichText(
                                      text: TextSpan(
                                        // text: '${e.key}',
                                        text: '',
                                        style: context.style.titleSmall
                                            ?.copyWith(
                                              color: context.scheme.primary,
                                            ),
                                        children: [
                                          WidgetSpan(
                                            child: Material(
                                              color:
                                                  context
                                                      .scheme
                                                      .tertiaryContainer,
                                              shape: StadiumBorder(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 1,
                                                    ),
                                                child: Text(
                                                  e,
                                                  style: context
                                                      .style
                                                      .labelMedium
                                                      ?.copyWith(
                                                        color:
                                                            context
                                                                .scheme
                                                                .onTertiaryContainer,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' $value',
                                            style: context.style.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),

                                    onTap: () {
                                      if (selection) {
                                        selected.value =
                                            selected.value.contains(e)
                                                ? selected.value
                                                    .where((s) => s != e)
                                                    .toList()
                                                : [...selected.value, e];
                                      } else {
                                        close(context, e);
                                      }
                                    },
                                  );
                                })
                                .toList(),
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return view(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return view(context);
  }
}
