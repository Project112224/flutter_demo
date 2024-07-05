part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class InitialEvent extends DetailEvent {
  final List<SearchBean>? category;

  InitialEvent({
    this.category,
  });

  copyWith({
    List<SearchBean>? category,
  }) {
    return InitialEvent(
      category: category ?? this.category,
    );
  }
}
