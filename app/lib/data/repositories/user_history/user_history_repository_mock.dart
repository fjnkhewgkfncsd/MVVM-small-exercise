import './user_history_repository.dart';
import '../../../model/songs/song.dart';

class UserHistoryRepositoryMock extends UserHistoryRepository {
  @override
  List<Song> fetchRecentListenedSongs() {
    return [];
  }

  @override
  void addToRecentListenedSongs(Song song) {
    print('added successfully to Recent listened songs');
  }
}
