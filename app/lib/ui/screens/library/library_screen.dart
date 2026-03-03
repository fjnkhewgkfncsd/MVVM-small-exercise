import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/library_content.dart';
import './view_model/library_view_model.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LibraryViewModel(), 
      child: LibraryContent()
    );
  }
}
