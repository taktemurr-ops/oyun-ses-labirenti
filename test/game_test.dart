import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ses_labirenti/oyun_ses_labirenti.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sesLabirentiConfig.title.length, 33);
    expect(sesLabirentiConfig.tagline.length, 33);
    for (final s in sesLabirentiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sesLabirentiConfig.gameId, sesLabirentiId);
    expect(sesLabirentiRules.gameId, sesLabirentiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sesLabirentiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sesLabirentiId, optionalMechanics: sesLabirentiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sesLabirentiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
