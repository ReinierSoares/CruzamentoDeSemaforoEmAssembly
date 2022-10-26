void setup() {
  pinMode(2, OUTPUT); // vermelho_1
  pinMode(10, OUTPUT); // verde_2
  pinMode(9, OUTPUT); // amarelo_2
  pinMode(8, OUTPUT); // vermelho_2
  pinMode(4, OUTPUT); // verde_1
  pinMode(3, OUTPUT); // amarelo_1
}

void loop() {
  digitalWrite(2, HIGH);    // vermelho_1
  digitalWrite(10, HIGH);   // verde_2
  delay(15000);             // Esperar por 15000 milisegundos
  for (int i = 0; i <= 4; i++) {  //VERDE 2 PISCANDO
    digitalWrite(10, LOW);
    delay(1000);
    digitalWrite(10, HIGH);
  }
  digitalWrite(10, LOW);    // verde_2
  digitalWrite(9, HIGH);    // amarelo_2
  delay(5000);              // Esperar por 5000 milisegundos
  digitalWrite(9, LOW);     // amarelo_2
  digitalWrite(2, LOW);     // vermelho_1
  digitalWrite(8, HIGH);    // vermelho_2
  digitalWrite(4, HIGH);    // verde_1
  delay(15000);             // Esperar por 15000 milisegundos
  for (int i = 0; i <= 4; i++) {  // VERDE 1 PISCANDO
    digitalWrite(4, LOW);
    delay(1000);
    digitalWrite(4, HIGH);
  }
  digitalWrite(4, LOW);     // verde_1
  digitalWrite(3, HIGH);    // amarelo_1
  delay(5000);              // Esperar por 5000 milisegundos
  digitalWrite(3, LOW);     // amarelo_1
  digitalWrite(8, LOW);     // vermelho_2
}
