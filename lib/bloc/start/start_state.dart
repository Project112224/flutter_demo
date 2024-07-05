part of 'start_cubit.dart';

@immutable
abstract class StartState {}

class StartInitial extends StartState {
  StartInitial({bool? jailBroken, bool? isLoading})
      : jailBroken = jailBroken ?? false,
        isLoading = isLoading ?? false;

  final bool jailBroken;
  final bool isLoading;

  copyWith({
    bool? jailBroken,
    bool? isLoading,
  }) {
    return StartInitial(
      jailBroken: jailBroken ?? this.jailBroken,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
