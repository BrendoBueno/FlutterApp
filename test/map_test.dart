import 'package:flutter_test/flutter_test.dart';

Map<String, List<double>> alunos = {
 'Maria': [8.0, 9.0],
 'Bruna': [7.0, 7.0],
 'Carla': [10.0, 9.0],
};

void main() {
 test('Adicionar elemento', () {
   alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos['Elena'], [9.0, 8.0]);
 });
 test('Adicionar outro dicionário', () {
   alunos.addAll({
     'Elena': [9.0, 8.0],
     'Luiza': [8.0, 9.0],
   });
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos.containsKey('Luiza'), isTrue);
 });
 test('Remover elemento', () {
   alunos.remove('Bruna');
   expect(alunos.containsKey('Bruna'), isFalse);
 });
 test('Atualizar elemento', () {
   alunos.update('Carla', (value) => [9.0, 8.0]);
   expect(alunos['Carla'], [9.0, 8.0]);
   alunos['Carla'] = [8.0, 9.0];
   expect(alunos['Carla'], [8.0, 9.0]);
 });
 test('Testar percorrer dicionário', () {
   expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
   expect(alunos.values, [
     [8.0, 9.0],
     [8.0, 9.0],
     [9.0, 8.0],
     [8.0, 9.0],
   ]);
   double soma = 0;
   alunos.forEach((key, value) {
     for (double nota in value) {
       soma += nota;
     }
   });
   expect(soma, 68.0);
 });



test('Calcular médias', () {
   Map<String, double> medias = {};
   // CALCULAR A MEDIA APARTI DA QUI
    alunos.forEach((nome, notas) {
      double media = notas.reduce((a, b) => a + b) / notas.length;
      medias[nome] = media;
    });
    
   expect(medias, {'Maria': 8.5, 'Carla': 8.5, 'Elena': 8.5, 'Luiza': 8.5});
 });

}
 
 // usamos double para  utilizamos tipo como ponto flutuante, 1,6;5,59

// não usamod o int pois e so inteiro !

//(O método .reduce() em Dart é usado para reduzir uma lista a um único valor,
// aplicando uma operação entre os elementos. Use reduce() quando precisar 
//combinar todos os elementos de uma lista em um único resultado, como somar
// números, encontrar o maior valor,)

//(O notas.length retorna o número de elementos dentro da lista notas.
// Usamos notas.length para dividir a soma das notas pela quantidade total
// de notas, calculando a média.)