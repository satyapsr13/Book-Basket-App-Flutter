import 'package:book_basket/Constants/enums.dart';
// import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState(theme: AppTheme.lightTheme));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];

    AppTheme currentTheme =
        AppTheme.values.firstWhere((e) => e.toString() == theme);

    return state.copyWith(theme: currentTheme);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    final theme = {
      'theme': state.theme.toString(),
    };

    return theme;
  }

  void toggleTheme() => emit(state.copyWith(
      theme: (state.theme == AppTheme.lightTheme)
          ? AppTheme.darkTheme
          : AppTheme.lightTheme));
}
