import 'package:ai_school/core/models/user_session.dart';
import 'package:ai_school/core/providers/cache_provider.dart';
import 'package:ai_school/core/repositories/auth_repository.dart';
import 'package:ai_school/features/auth/providers/session_provider.dart';
import 'package:ai_school/features/components/loading_button_text_wrapper.dart';
import 'package:ai_school/features/components/pinput_field.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = useState('');
    final otp = useState('');
    final requestId = useState<String?>(null);
    final loading = useState(false);
    final formKey = useRef(GlobalKey<FormState>());

    return Scaffold(
      backgroundColor: context.scheme.primaryContainer,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth > 800 ? 800 : constraints.maxWidth,
              height: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.scheme.surfaceContainerLowest,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: context.scheme.surfaceContainerLow,
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child:  IntroView(),
                    //   ),
                    // ),
                    // const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: HookConsumer(
                          builder: (context, ref, child) {
                            final repo = ref.read(authRepositoryProvider);

                            Future<void> handleAuthResponse(UserSession session) async {
                              final cache =  ref.read(cacheProvider);
                              await cache.setSession(session);
                              ref.refresh(sessionProvider);
                              context.go('/');
                            }

                            return Form(
                              key: formKey.value,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    requestId.value == null ? 'Lets gets Started' : 'Verify OTP',
                                    style: context.style.headlineMedium,
                                  ),
                                  const SizedBox(height: 24),
                                  if (requestId.value == null) ...[
                                    const Text('Phone Number'),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      enabled: !loading.value,
                                      decoration: const InputDecoration(
                                        prefixText: '+91 ',
                                        hintText: 'Enter phone number',
                                      ),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      onChanged: (value) => phone.value = value.trim(),
                                      validator: (value) =>
                                          value!.length == 10 ? null : 'Enter valid phone number',
                                    ),
                                    const SizedBox(height: 24),
                                    FilledButton(
                                      onPressed: loading.value || phone.value.length != 10
                                          ? null
                                          : () async {
                                              if (formKey.value.currentState!.validate()) {
                                                try {
                                                  loading.value = true;
                                                  requestId.value = await repo.sendOtp(phone.value);
                                                } catch (e) {
                                                  context.error(e);
                                                } finally {
                                                  loading.value = false;
                                                }
                                              }
                                            },
                                      child: LoadingButtonTextWrapper(
                                        loading: loading.value,
                                        child: const Text('Send OTP'),
                                      ),
                                    ),
                                  ] else ...[
                                    const Text('Enter OTP sent to your phone'),
                                    const SizedBox(height: 16),
                                    PinPutField(
                                      enabled: !loading.value,
                                      onCompleted: (value) async {
                                        try {
                                          loading.value = true;
                                          final session = await repo.verifyOtp(value, requestId.value!);
                                          await handleAuthResponse(session);
                                        } catch (e) {
                                          context.error(e);
                                        } finally {
                                          loading.value = false;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextButton(
                                      onPressed: () => requestId.value = null,
                                      child: const Text('Back to Phone Number'),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}