import 'package:ai_school/core/models/school.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/core/repositories/school_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/bottom_button_wrapper.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/schools/providers/school_provider.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WriteSchoolPage extends HookConsumerWidget {
  const WriteSchoolPage({super.key, this.initial});

  final School? initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(sessionProvider)!;
    final school = useRef(
      initial ??
          School(
            id: '',
            name: '',
            udise: '',
            address: '',
            ownerId: user.id,
            board: 'CBSC',
          ),
    );

    final edit = initial != null;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final logo = useState<XFile?>(null);
    final sign = useState<XFile?>(null);


    

    final loading = useState(false);

    // loading.value = false;

    Future<String?> uploadFile(XFile? file, String path) async {
      if (file == null) return null;
      // final ref = FirebaseStorage.instance.ref().child(path);
      // await ref.putFile(File(file.path));
      // return await ref.getDownloadURL();
    }

    final repo = ref.read(schoolRepositoryProvider);

    Future<void> saveSchool() async {
      if (!formKey.currentState!.validate()) return;

      loading.value = true;

      try {
        // final docRef = FirebaseFirestore.instance
        //     .collection('schools')
        //     .doc(school.value.id.isEmpty ? null : school.value.id);

        // final logoUrl = await uploadFile(
        //   logo.value,
        //   'schools/${docRef.id}/logo.${logo.value!.name.split('').last}',
        // );
        // final signUrl = await uploadFile(
        //   sign.value,
        //   'schools/${docRef.id}}/sign.${sign.value!.name.split('').last}',
        // );

        // final updated = school.value.copyWith(logo: logoUrl, sign: signUrl);

        var updated = school.value;

        if (edit) {
          updated = await repo.updateSchool(updated.id, updated);
        } else {
          updated = await repo.createSchool(updated);

          ref.read(cacheProvider).setSession(user.copyWith(schoolId: updated.id));
          ref.refresh(sessionProvider);
        }

        ref.read(yourSchoolProvider.notifier).sync(updated);

        if (edit) {
          context.pop(updated);
        } else {
          context.go('/');
        }
      } catch (e) {
        context.error(e);
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${edit ? 'Edit' : 'Enter'} your school details'),
      ),
      bottomNavigationBar: BottomButtonWrapper(
        child: FilledButton(
          onPressed: loading.value ? null : saveSchool,
          child: LoadingButtonTextWrapper(
            loading: loading.value,
            child: Text('Save'),
          ),
        ),
      ),
      body: AbsorbPointer(
        absorbing: loading.value,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 16,
              children: [
                TextFormField(
                  initialValue: school.value.name,
                  decoration: const InputDecoration(labelText: 'School Name*'),
                  textCapitalization: TextCapitalization.words,
                  onChanged:
                      (value) =>
                          school.value = school.value.copyWith(
                            name: value.trim(),
                          ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? 'Required' : null,
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                ),
                TextFormField(
                  initialValue: school.value.udise,
                  decoration: const InputDecoration(labelText: 'UDISE Code*'),
                  keyboardType: TextInputType.number,
                  onChanged:
                      (value) =>
                          school.value = school.value.copyWith(
                            udise: value.trim(),
                          ),
                  validator:
                      (value) =>
                          value == null || value.length != 11
                              ? 'Invalid UDISE code'
                              : null,

                  inputFormatters: [LengthLimitingTextInputFormatter(11)],
                ),
                TextFormField(
                  initialValue: school.value.address,
                  decoration: const InputDecoration(labelText: 'Address*'),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged:
                      (value) =>
                          school.value = school.value.copyWith(
                            address: value.trim(),
                          ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? 'Required' : null,

                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                ),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   spacing: 8,
                //   children: [
                //     Text('School Logo'),
                //     ImagePickerView(
                //       size: 200,
                //       file: logo.value,
                //       url: school.value.logo,
                //       fit: BoxFit.contain,
                //       cropAspectRatio: 1,
                //       cropAspectRatio2: 16 / 9,
                //       onPick: (v) => logo.value = v,
                //       onRemove: () => logo.value = null,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
