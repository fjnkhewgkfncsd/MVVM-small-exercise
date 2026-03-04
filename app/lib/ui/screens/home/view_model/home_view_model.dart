import 'package:app/data/repositories/songs/song_repository.dart';
import 'package:app/model/songs/song.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/user_history/user_history_repository.dart';
import '../../../states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final UserHistoryRepository _userHistoryRepo;
  final SongRepository _songRepo;
  final PlayerState _playerState;

  HomeViewModel({
    required UserHistoryRepository userHistoryRepo,
    required SongRepository songRepo,
    required PlayerState playerState,
  }) : _playerState = playerState,
       _songRepo = songRepo,
       _userHistoryRepo = userHistoryRepo {
    _playerState.addListener(onPlayerStateChanged);
  }

  late List<Song> _songs;
  late List<String> _recentListenedSongs;

  List<Song> get recentSongs => _songs;
  List<Song> get recentSong => convertToSongObject();
  List<Song> get suggestionSongs =>
      _songs.where((song) => song != _playerState.currentSong).toList();

  void init() {
    _songs = _songRepo.fetchSongs();
    _recentListenedSongs = _userHistoryRepo.fetchRecentListenedSongs();
    notifyListeners();
  }

  void toggleSong(Song song) {
    if (isPlaying(song)) {
      stop();
    } else {
      start(song);
    }
  }

  void onPlayerStateChanged() {
    notifyListeners();
  }

  bool isPlaying(Song song) {
    return _playerState.currentSong == song;
  }

  void start(Song song) {
    _playerState.start(song);
  }

  void stop() {
    _playerState.stop();
  }

  List<Song> convertToSongObject() {
    List<Song> recentSongs = [];
    for (String id in _recentListenedSongs) {
      for (Song song in _songs) {
        if (song.id == id) {
          recentSongs.add(song);
        }
      }
    }
    return recentSongs;
  }

  @override
  void dispose() {
    _playerState.removeListener(onPlayerStateChanged);
    super.dispose();
  }
}
