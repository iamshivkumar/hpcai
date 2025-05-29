
// 2. Define the State Class for the Notifier
class ActivityGeneratorState {
  final bool isLoading;
  final Map? activity;
  final String? errorMessage; // Store error messages

  const ActivityGeneratorState({
    this.isLoading = false,
    this.activity,
    this.errorMessage,
  });

  // Helper for creating copies with modifications
  ActivityGeneratorState copyWith({
    bool? isLoading,
    Map? activity,
    String? errorMessage,
    bool clearError = false, // Flag to explicitly clear error
    bool clearActivity = false, // Flag to explicitly clear activity
  }) {
    return ActivityGeneratorState(
      isLoading: isLoading ?? this.isLoading,
      activity: clearActivity ? null : (activity ?? this.activity),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}