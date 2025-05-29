import 'package:ai_school/core/enums/flex_form_type.dart';
import 'package:ai_school/core/models/flex_form.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'write_form_field_dialog.dart';

class WriteFormPage extends HookWidget {
  const WriteFormPage({super.key, this.initial});

  final FlexForm? initial;

  @override
  Widget build(BuildContext context) {
    // Initialize form with initial data or default values
    final form = useRef(
      initial ??
          FlexForm(
            id: '',
            key: '',
            title: '',
            type: FlexFormType.assessment,
            status: 'active',
          ),
    );

    // State for form fields
    final fields = useState<List<FlexFormField>>(initial?.fields ?? []);

    // Form key for validation
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Loading state for save button
    final loading = useState(false);

    // Edit mode flag
    final edit = initial != null;

    // State for form inputs
    final title = useState(form.value.title);
    final description = useState(form.value.description ?? '');
    final duration = useState(form.value.duration?.toString() ?? '');
    final formType = useState(form.value.type);
    final status = useState(form.value.status);

    // Function to open dialog for creating or editing a field
    Future<void> openFieldDialog({FlexFormField? field, int? index}) async {
      final result = await showDialog<FlexFormField>(
        context: context,
        builder: (_) => WriteFormFieldDialog(initial: field),
      );
      if (result != null) {
        if (index != null) {
          // Edit: Replace existing field
          fields.value = [
            for (int i = 0; i < fields.value.length; i++)
              i == index ? result : fields.value[i],
          ];
        } else {
          // Create: Add new field
          fields.value = [...fields.value, result];
        }
      }
    }

    // Function to remove a field
    void removeField(int index) {
      fields.value = [...fields.value]..removeAt(index);
    }

    // Function to handle save
    void onSave() {
      if (formKey.currentState!.validate()) {
        loading.value = true;
        // Update form with final values
        form.value = form.value.copyWith(
          title: title.value,
          description: description.value.isEmpty ? null : description.value,
          duration: int.tryParse(duration.value),
          type: formType.value,
          status: status.value,
          fields: fields.value,
        );
        // TODO: Integrate API call here
        // Example: await api.saveForm(form.value);
        loading.value = false;
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(edit ? 'Edit Form' : 'Create Form')),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton(
          onPressed: loading.value ? null : onSave,
          child: LoadingButtonTextWrapper(
            child: const Text('Save'),
            loading: loading.value,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              // Title
              TextFormField(
                initialValue: title.value,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  title.value = value;
                  form.value = form.value.copyWith(title: value);
                },
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              // Description
              TextFormField(
                initialValue: description.value,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) {
                  description.value = value;
                  form.value = form.value.copyWith(
                      description: value.isEmpty ? null : value);
                },
              ),
              const SizedBox(height: 16),
              // Form Type
              DropdownButtonFormField<FlexFormType>(
                value: formType.value,
                decoration: const InputDecoration(
                  labelText: 'Form Type',
                  border: OutlineInputBorder(),
                ),
                items: FlexFormType.values
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name.capitalize()),
                        ))
                    .toList(),
                onChanged: (value) {
                  formType.value = value!;
                  form.value = form.value.copyWith(type: value);
                },
              ),
              const SizedBox(height: 16),
              // Status
              DropdownButtonFormField<String>(
                value: status.value,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                items: ['active', 'inactive']
                    .map((s) => DropdownMenuItem(
                          value: s,
                          child: Text(s.capitalize()),
                        ))
                    .toList(),
                onChanged: (value) {
                  status.value = value!;
                  form.value = form.value.copyWith(status: value);
                },
              ),
              const SizedBox(height: 16),
              // Duration
              TextFormField(
                initialValue: duration.value,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes, Optional)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  duration.value = value;
                  form.value = form.value.copyWith(
                      duration: int.tryParse(value));
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
              const SizedBox(height: 24),
              // Fields Section
              const Text(
                'Fields',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // List of fields
              ...fields.value.asMap().entries.map((entry) {
                final index = entry.key;
                final field = entry.value;
                return ListTile(
                  title: Text(field.title ?? 'Untitled Field'),
                  subtitle: Text(field.type.replaceAll('-', ' ').capitalize()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => openFieldDialog(field: field, index: index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeField(index),
                      ),
                    ],
                  ),
                  onTap: () => openFieldDialog(field: field, index: index),
                );
              }),
              const SizedBox(height: 16),
              // Add Field Button
              OutlinedButton.icon(
                onPressed: () => openFieldDialog(),
                icon: const Icon(Icons.add),
                label: const Text('Add Field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
