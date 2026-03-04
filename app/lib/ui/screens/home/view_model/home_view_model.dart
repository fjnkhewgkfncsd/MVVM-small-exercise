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

  List<Song> get songs => _songs;
  List<Song> get recentSong => convertToSongObject()
      .where((song) => song == _playerState.currentSong)
      .toList();

  void init() {
    _songs = _songRepo.fetchSongs();
    _recentListenedSongs = _userHistoryRepo.fetchRecentListenedSongs();
    notifyListeners();
  }

  void onPlayerStateChanged() {
    notifyListeners();
  }

  List<Song> convertToSongObject(){
    List<Song> recentSongs = [];
    for(String id in _recentListenedSongs){
      for(Song song in songs){
        if(song.id == id){
          recentSongs.add(song);
        }
      }
    }
    return recentSongs;
  }
}
