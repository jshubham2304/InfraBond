import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/bond_hive_model.dart';
import '../../domain/entities/bond.dart';

abstract class BookmarkService {
  Future<List<Bond>> getBookmarkedBonds();
  Future<bool> isBookmarked(String bondId);
  Future<void> addBookmark(Bond bond);
  Future<void> removeBookmark(String bondId);
  Future<void> toggleBookmark(Bond bond);
}

@LazySingleton(as: BookmarkService)
class BookmarkServiceImpl implements BookmarkService {
  static const String _bookmarksBoxName = 'bookmarked_bonds';
  late Box<BondHiveModel> _bookmarksBox;
  bool _isInitialized = false;

  BookmarkServiceImpl() {
    // Initialize asynchronously but don't wait
    _initHive();
  }

  Future<void> _initHive() async {
    try {
      if (!Hive.isBoxOpen(_bookmarksBoxName)) {
        _bookmarksBox = await Hive.openBox<BondHiveModel>(_bookmarksBoxName);
      } else {
        _bookmarksBox = Hive.box<BondHiveModel>(_bookmarksBoxName);
      }
      _isInitialized = true;
    } catch (e) {
      print('Error initializing Hive box: $e');
      // Consider proper error handling here
      rethrow;
    }
  }

  @override
  Future<List<Bond>> getBookmarkedBonds() async {
    await _ensureBoxOpen();

    final bookmarks = _bookmarksBox.values.toList();
    // Sort by most recently bookmarked
    bookmarks.sort(BondHiveModel.sortByBookmarkedTimeDesc);

    return bookmarks.map((model) => model.toDomain()).toList();
  }

  @override
  Future<bool> isBookmarked(String bondId) async {
    await _ensureBoxOpen();
    return _bookmarksBox.containsKey(bondId);
  }

  @override
  Future<void> addBookmark(Bond bond) async {
    await _ensureBoxOpen();
    final bondModel = BondHiveModel.fromDomain(bond);
    await _bookmarksBox.put(bond.id, bondModel);
  }

  @override
  Future<void> removeBookmark(String bondId) async {
    await _ensureBoxOpen();
    await _bookmarksBox.delete(bondId);
  }

  @override
  Future<void> toggleBookmark(Bond bond) async {
    await _ensureBoxOpen();
    final isAlreadyBookmarked = await isBookmarked(bond.id);

    if (isAlreadyBookmarked) {
      await removeBookmark(bond.id);
      return;
    } else {
      await addBookmark(bond);
      return;
    }
  }

  Future<void> _ensureBoxOpen() async {
    // Wait for initialization if it's in progress
    if (!_isInitialized) {
      await _initHive();
    }

    // Double-check if box is open
    if (!Hive.isBoxOpen(_bookmarksBoxName)) {
      _bookmarksBox = await Hive.openBox<BondHiveModel>(_bookmarksBoxName);
    }
  }
}
