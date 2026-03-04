import './user_history_repository.dart';

class UserHistoryRepositoryMock extends UserHistoryRepository {
  @override
  List<String> fetchRecentListenedSongs() {
    return [];
  }
  @override
  void addToRecentListenedSongs(String songId) {
    print('added successfully to Recent listened songs');
  }
}
