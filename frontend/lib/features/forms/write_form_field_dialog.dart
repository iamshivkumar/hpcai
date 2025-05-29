
import 'package:ai_school/core/models/flex_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WriteFormFieldDialog extends HookWidget {
  const WriteFormFieldDialog({super.key, this.initial});

  final FlexFormField? initial;

  @override
  Widget build(BuildContext context) {
    // Initialize field with default values or initial data
    final field = useRef(
      initial ??
          FlexFormField(
            type: 'shortAnswer',
            key: 'field_${DateTime.now().millisecondsSinceEpoch}',
            title: '',
          ),
    );

    // Form key for validation
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // State for text inputs
    final title = useState(field.value.title);
    final description = useState(field.value.description ?? '');
    final marks = useState(field.value.points?.toString() ?? '');

    // State for dropdowns and checkboxes
    final fieldType = useState(field.value.type);
    final required = useState(field.value.required);
    final choices = useState<List<String>>(field.value.choices ?? []);

    // Handle save
    void onSave() {
      if (formKey.currentState!.validate()) {
        Navigator.pop(context, field.value.copyWith(
          title: title.value,
          description: description.value.isEmpty ? null : description.value,
          points: int.tryParse(marks.value),
          type: fieldType.value,
          required: required.value,
          choices: choices.value.isNotEmpty ? choices.value : null,
        ));
      }
    }

    return AlertDialog(
      title: Text(initial == null ? 'Add Field' : 'Edit Field'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Field Title
                TextFormField(
                  initialValue: title.value,
                  decoration: const InputDecoration(
                    labelText: 'Field Title',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    title.value = value;
                    field.value = field.value.copyWith(title: value);
                  },
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Title is required' : null,
                ),
                const SizedBox(height: 12),
                // Field Type
                DropdownButtonFormField<String>(
                  value: fieldType.value,
                  decoration: const InputDecoration(
                    labelText: 'Field Type',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    'shortAnswer',
                    'essay',
                    'single-choice',
                    'multi-choice',
                    'number',
                    'date',
                    'true-false',
                  ]
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.replaceAll('-', ' ').capitalize()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    fieldType.value = value!;
                    field.value = field.value.copyWith(type: value);
                  },
                ),
                const SizedBox(height: 12),
                // Required Checkbox
                CheckboxListTile(
                  value: required.value,
                  title: const Text('Required'),
                  onChanged: (value) {
                    required.value = value!;
                    field.value = field.value.copyWith(required: value);
                  },
                ),
                // Description
                TextFormField(
                  initialValue: description.value,
                  decoration: const InputDecoration(
                    labelText: 'Description (Optional)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                  onChanged: (value) {
                    description.value = value;
                    field.value = field.value.copyWith(
                        description: value.isEmpty ? null : value);
                  },
                ),
                const SizedBox(height: 12),
                // Marks (for assessment/test)
                if (fieldType.value.contains('choice') ||
                    fieldType.value == 'shortAnswer')
                  TextFormField(
                    initialValue: marks.value,
                    decoration: const InputDecoration(
                      labelText: 'Marks (Optional)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      marks.value = value;
                      field.value = field.value.copyWith(
                          points: int.tryParse(value));
                    },
                    validator: (value) {
                      if (value?.isNotEmpty ?? false) {
                        if (int.tryParse(value!) == null) {
                          return 'Enter a valid number';
                        }
                      }
                      return null;
                    },
                  ),
                // Choices (for single-choice/multi-choice)
                if (fieldType.value.contains('choice')) ...[
                  const SizedBox(height: 12),
                  const Text(
                    'Choices',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  ...choices.value.asMap().entries.map((entry) {
                    final index = entry.key;
                    final choice = entry.value;
                    final choiceState = useState(choice);
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: choice,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter choice',
                              ),
                              onChanged: (value) {
                                choiceState.value = value;
                                choices.value = [
                                  for (int i = 0; i < choices.value.length; i++)
                                    i == index ? value : choices.value[i],
                                ];
                                field.value = field.value.copyWith(
                                    choices: choices.value.isNotEmpty
                                        ? choices.value
                                        : null);
                              },
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Choice required' : null,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              choices.value = [...choices.value]..removeAt(index);
                              field.value = field.value.copyWith(
                                  choices: choices.value.isNotEmpty
                                      ? choices.value
                                      : null);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      choices.value = [
                        ...choices.value,
                        'Option ${choices.value.length + 1}'
                      ];
                      field.value = field.value.copyWith(
                          choices:
                              choices.value.isNotEmpty ? choices.value : null);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Choice'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

// Extension to capitalize strings
extension StringExtension on String {
  String capitalize() {
    return isEmpty ? this : this[0].toUpperCase() + substring(1);
  }
}