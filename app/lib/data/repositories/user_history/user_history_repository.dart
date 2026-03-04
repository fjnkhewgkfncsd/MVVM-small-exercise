abstract class UserHistoryRepository {
  List<String> fetchRecentListenedSongs();

  void addToRecentListenedSongs(String songId);
}
