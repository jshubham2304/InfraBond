import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/service/book_mark_service.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/presentation/bloc/bookmark_state.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/bond.dart';

@injectable
class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkService bookmarkService;
  final HapticFeedbackHelper hapticFeedback;

  BookmarkCubit({
    required this.bookmarkService,
    required this.hapticFeedback,
  }) : super(BookmarkState.initial());

  Future<void> loadBookmarks() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final bookmarks = await bookmarkService.getBookmarkedBonds();
      emit(state.copyWith(
        isLoading: false,
        bookmarkedBonds: bookmarks,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load bookmarks: ${e.toString()}',
      ));
    }
  }

  Future<bool> isBookmarked(String bondId) async {
    return bookmarkService.isBookmarked(bondId);
  }

  Future<void> toggleBookmark(Bond bond) async {
    final wasBookmarked = await bookmarkService.isBookmarked(bond.id);

    try {
      await bookmarkService.toggleBookmark(bond);
      hapticFeedback.feedback(HapticFeedbackType.medium);

      // Refresh bookmarks list
      final bookmarks = await bookmarkService.getBookmarkedBonds();
      emit(state.copyWith(
        bookmarkedBonds: bookmarks,
      ));

      return;
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to ${wasBookmarked ? 'remove' : 'add'} bookmark: ${e.toString()}',
      ));
    }
  }

  Future<void> removeBookmark(String bondId) async {
    try {
      await bookmarkService.removeBookmark(bondId);
      hapticFeedback.feedback(HapticFeedbackType.medium);

      // Refresh bookmarks list
      final bookmarks = await bookmarkService.getBookmarkedBonds();
      emit(state.copyWith(
        bookmarkedBonds: bookmarks,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Failed to remove bookmark: ${e.toString()}',
      ));
    }
  }
}
