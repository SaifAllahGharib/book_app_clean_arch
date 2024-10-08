import 'package:book_app_clean_arch/core/utils/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void intiBlocObserver() {
  Bloc.observer = SimpleBlocObserver();
}
