import 'package:book_app_clean_arch/constants.dart';
import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHive() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(BookEntityAdapter());

  try {
    await Future.wait([
      Hive.openBox<BookEntity>(topBooksDB),
      Hive.openBox<BookEntity>(bottomBooksDB),
    ]);
  } catch (e) {
    debugPrint('Error opening Hive box: $e');
  }
}
