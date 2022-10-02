
part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  // enum
  final AppTheme theme;
  bool? isLoggedIn;
    ThemeState({
    required this.theme,
      this.isLoggedIn,
  });

  @override
  List<Object> get props => [theme, isLoggedIn.toString()];

  ThemeState copyWith({
    AppTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      isLoggedIn: isLoggedIn ?? isLoggedIn,
    );
  }
}
