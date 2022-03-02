import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class AttachmentFile extends Equatable {
  final String fileName;
  final String extension;
  final Uint8List data;
  final String? path;

  AttachmentFile({
    required this.fileName,
    required this.extension,
    required this.data,
    this.path,
  });

  String get fileNameWithExtension => fileName + '.' + extension;

  @override
  List<Object?> get props => [
        fileName,
        path,
      ];

  AttachmentFile clone() => AttachmentFile(
        fileName: fileName,
        extension: extension,
        data: data,
        path: path,
      );
}
