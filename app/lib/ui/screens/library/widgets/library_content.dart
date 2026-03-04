import 'package:app/ui/widgets/song_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import '../../../theme/theme.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryViewModel libraryViewModel = context.watch<LibraryViewModel>();
    // 2- Read the globbal settings state
    AppSettingsState settingsState = context.watch<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: libraryViewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: libraryViewModel.songs[index],
                isPlaying: libraryViewModel.isPlaying(libraryViewModel.songs[index]),
                onTap: () => libraryViewModel.toggleSong(libraryViewModel.songs[index])
              ),
            ),
          ),
        ],
      ),
    );
  }
}


