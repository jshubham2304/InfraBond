import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hella_infra_app/core/service/book_mark_service.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/entities/bond.dart';
import 'package:hella_infra_app/presentation/bloc/bookmark_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bookmark_state.dart';

class MockBookmarkService extends Mock implements BookmarkService {}

class MockHapticFeedbackHelper extends Mock implements HapticFeedbackHelper {}

void main() {
  late BookmarkCubit cubit;
  late MockBookmarkService mockBookmarkService;
  late MockHapticFeedbackHelper mockHapticFeedbackHelper;

  setUp(() {
    mockBookmarkService = MockBookmarkService();
    mockHapticFeedbackHelper = MockHapticFeedbackHelper();
    cubit = BookmarkCubit(
      bookmarkService: mockBookmarkService,
      hapticFeedback: mockHapticFeedbackHelper,
    );
  });

  tearDown(() {
    cubit.close();
  });

  final testBond = Bond(
    id: 'BOND123',
    companyName: 'Hella Infra',
    code: 'HINFRA',
    rating: 'AAA',
    tags: ['infra', 'construction'],
    logoUrl: '',
    isActive: true,
  );

  group('BookmarkCubit', () {
    test('initial state should be BookmarkState.initial()', () {
      expect(cubit.state, BookmarkState.initial());
    });

    test('loadBookmarks should emit loaded state', () async {
      when(() => mockBookmarkService.getBookmarkedBonds()).thenAnswer((_) async => [testBond]);

      await cubit.loadBookmarks();

      expect(
        cubit.state,
        BookmarkState(isLoading: false, bookmarkedBonds: [testBond], errorMessage: null),
      );
    });

    test('loadBookmarks should handle errors', () async {
      when(() => mockBookmarkService.getBookmarkedBonds()).thenThrow(Exception('Error loading'));

      await cubit.loadBookmarks();

      expect(cubit.state.errorMessage, contains('Failed to load bookmarks'));
    });

    test('toggleBookmark should add and remove bookmarks correctly', () async {
      when(() => mockBookmarkService.isBookmarked(testBond.id)).thenAnswer((_) async => false);
      when(() => mockBookmarkService.toggleBookmark(testBond)).thenAnswer((_) async {});
      when(() => mockBookmarkService.getBookmarkedBonds()).thenAnswer((_) async => [testBond]);

      await cubit.toggleBookmark(testBond);

      verify(() => mockBookmarkService.toggleBookmark(testBond)).called(1);
      verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.medium)).called(1);
    });

    test('removeBookmark should update state', () async {
      when(() => mockBookmarkService.removeBookmark(testBond.id)).thenAnswer((_) async {});
      when(() => mockBookmarkService.getBookmarkedBonds()).thenAnswer((_) async => []);

      await cubit.removeBookmark(testBond.id);

      expect(cubit.state.bookmarkedBonds, isEmpty);
      verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.medium)).called(1);
    });
  });
}
