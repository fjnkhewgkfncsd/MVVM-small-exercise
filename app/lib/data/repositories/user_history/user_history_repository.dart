import '../../../model/songs/song.dart';

abstract class UserHistoryRepository {
  List<Song> fetchRecentListenedSongs();

  void addToRecentListenedSongs(Song song);
}
