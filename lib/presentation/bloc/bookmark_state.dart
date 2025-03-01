import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hella_infra_app/domain/entities/bond.dart';

part 'bookmark_state.freezed.dart';

@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState({
    @Default(false) bool isLoading,
    @Default([]) List<Bond> bookmarkedBonds,
    String? errorMessage,
  }) = _BookmarkState;

  factory BookmarkState.initial() => const BookmarkState();
}
