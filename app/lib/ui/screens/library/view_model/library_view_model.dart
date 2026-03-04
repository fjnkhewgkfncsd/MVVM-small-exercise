import 'package:flutter/widgets.dart';

import '../../../states/player_state.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepo;
  final PlayerState playerState;

  List<Song> _songs = [];

  List<Song> get songs => _songs;

  LibraryViewModel({required this.songRepo, required this.playerState}) {
    playerState.addListener(onPlayerStateChanged);
  }

  void init() {
    _songs = songRepo.fetchSongs();
    notifyListeners();
  }

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

  void start(Song song) {
    playerState.start(song);
  }

  void stop() {
    playerState.stop();
  }

  void onPlayerStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    playerState.removeListener(onPlayerStateChanged);
    super.dispose();
  }
}
