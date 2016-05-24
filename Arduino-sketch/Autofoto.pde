// Codigo para AutoFoto Shield v1.0!!!
// Version: 1.0
// Jose Maria Urraca - jose.urraca@gmai.com - 2011

// PIN 9 -  Focus pin
// PIN 10 - Foto pin
// PIN 12 - Enable pin (on = 1)
// PIN 13 - "warning" led
         

  // ZONA CONFIGURABLE --------------------------
  int tiempo = 20;        // Segundos de ciclo completo
  // --------------------------------------------
  
  
  // NO TOCAR -----------------------------------
void setup() {       
  tiempo = tiempo -1;     // pq cada ciclo añade 1 seg mas aprox
  pinMode(9, OUTPUT);     // opto 1 - Focus
  pinMode(10, OUTPUT);    // opto 2 - Photo
  pinMode(13, OUTPUT);    // Warning Led
  pinMode(12, INPUT);     // On Photo
}

void loop() {
  if (digitalRead(12)) {
        digitalWrite(13, HIGH);  // Luz aviso de foto
        digitalWrite(9, HIGH);   // Focus
        delay(750);              // wait 3/4 sec
        digitalWrite(10, HIGH);  // Photo
        delay(250);              // wait 1/4 sec
        
        digitalWrite(9, LOW);    // off opto
        digitalWrite(10, LOW);   // off opto
        digitalWrite(13, LOW);   // off aviso
        delay( tiempo * 1000);    // Espera
  } else {
        // Hacemos flash con la luz de aviso
        digitalWrite(13, HIGH);   // aviso
        delay(100);
        digitalWrite(13, LOW);   // off aviso
        delay(100);
  }
}
