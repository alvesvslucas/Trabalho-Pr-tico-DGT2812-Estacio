import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_travel_app/main.dart';

void main() {
  testWidgets('mostra o destino, avaliação e ações da agência sem abrir apps externos', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Destinos Turísticos'), findsOneWidget);
    expect(find.text('Praia de Copacabana'), findsOneWidget);
    expect(find.text('4.8'), findsOneWidget);
    expect(find.text('LIGAR'), findsOneWidget);
    expect(find.text('ROTA'), findsOneWidget);
    expect(find.text('COMPARTILHAR'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.drag(find.byType(ListView), const Offset(0, -200));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
