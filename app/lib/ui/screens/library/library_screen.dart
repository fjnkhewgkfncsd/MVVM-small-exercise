import 'package:app/data/repositories/songs/song_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/library_content.dart';
import './view_model/library_view_model.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LibraryViewModel(
        playerState: context.read<PlayerState>(),
        songRepo: context.read<SongRepository>(),
      )..init(),
      child: LibraryContent(),
    );
  }
}
