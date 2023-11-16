import '../../tic_tac_toe_library.dart';

final kColorSchema = ColorScheme.fromSeed(
  seedColor: const Color(0xFF252B5C),
);

abstract class ThemeConfig {
  static ThemeData theme = ThemeData().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: kColorSchema.background,
    colorScheme: kColorSchema,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      titleSmall: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleMedium: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleLarge: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      labelSmall: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelMedium: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelLarge: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
