import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/router/app_router.dart';
import '../../core/utils/constants.dart';

/// Lets the user choose a source photo to analyse.
///
/// Once an image is selected it is shown as a preview; confirming hands the
/// image off to the loading screen, which drives the analysis.
class UploadScreen extends StatefulWidget {
  /// Creates the upload screen.
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pick(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);
    if (picked != null && mounted) {
      setState(() => _image = picked);
    }
  }

  void _analyze() {
    final image = _image;
    if (image == null) return;
    context.pushNamed(AppRouter.loadingName, extra: image);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = _image;
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a photo')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: AppBorderRadius.lg,
                ),
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                child: image == null
                    ? Text(
                        'No photo selected',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    : Image.file(File(image.path), fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Gallery'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pick(ImageSource.camera),
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: const Text('Camera'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            FilledButton(
              onPressed: image == null ? null : _analyze,
              child: const Text('Analyze'),
            ),
          ],
        ),
      ),
    );
  }
}
