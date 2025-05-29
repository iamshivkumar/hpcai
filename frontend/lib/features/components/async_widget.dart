import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncWidget<T> extends StatelessWidget {
  const AsyncWidget(
      {super.key,
      required this.value,
      required this.data,
      this.retry,
      this.error});

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? retry;
  final Widget? error;
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, s) {
        print(e);
        return error ??
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$e"),
                    if (retry != null) ...[
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: retry,
                        child: Text("RETRY"),
                      ),
                    ]
                  ],
                ),
              ),
            );
      },
      loading: () => CenterLoading(),
    );
  }
}

class CenterLoading extends StatelessWidget {
  const CenterLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class AsyncPage<T> extends StatelessWidget {
  const AsyncPage(
      {super.key,
      required this.value,
      required this.data,
      this.retry,
      this.error,
      this.title});

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? retry;
  final Widget? error;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, s) =>
          error ??
          Scaffold(
            appBar: AppBar(
              title: Text(title ?? ''),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$e"),
                    if (retry != null) ...[
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: retry,
                        child: Text("RETRY"),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
      loading: () => Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
