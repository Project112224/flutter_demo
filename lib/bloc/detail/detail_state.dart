part of 'detail_bloc.dart';

class DetailState {
  DetailState({
    this.category,
  });

  final List<SearchBean>? category;

  copyWith({
    List<SearchBean>? category,
  }) {
    return DetailState(
      category: category,
    );
  }
}
