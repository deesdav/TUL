const int PIN_RGB_R = 2;
const int PIN_RGB_B = 3;
const int PIN_PIEZO = 4;
const int PIN_TL1 = 11;
const int PIN_TL2 = 12;
const int PIN_TL3 = 13;

enum Stav
{
    STAV_0_KLID = 0,
    STAV_1_ODPOCET = 1,
    STAV_2_ALARM_CERVENA = 2,
    STAV_3_ALARM_MODRA = 3
};

Stav aktualniStav = STAV_0_KLID;
unsigned long casVstupuDoStavu = 0;

void setup()
{
    pinMode(PIN_RGB_R, OUTPUT);
    pinMode(PIN_RGB_B, OUTPUT);
    pinMode(PIN_PIEZO, OUTPUT);

    pinMode(PIN_TL1, INPUT);
    pinMode(PIN_TL2, INPUT);
    pinMode(PIN_TL3, INPUT);

    digitalWrite(PIN_RGB_R, LOW);
    digitalWrite(PIN_RGB_B, LOW);
    digitalWrite(PIN_PIEZO, LOW);
}

void loop()
{
    bool tl1 = (digitalRead(PIN_TL1) == HIGH);
    bool tl2 = (digitalRead(PIN_TL2) == HIGH);
    bool tl3 = (digitalRead(PIN_TL3) == HIGH);

    unsigned long aktualniCas = millis();
    unsigned long uplynulyCas = aktualniCas - casVstupuDoStavu;

    switch (aktualniStav)
    {
    case STAV_0_KLID:
        digitalWrite(PIN_RGB_R, LOW);
        digitalWrite(PIN_RGB_B, LOW);
        digitalWrite(PIN_PIEZO, LOW);

        if (tl1)
        {
            aktualniStav = STAV_1_ODPOCET;
            casVstupuDoStavu = millis();
        }
        break;

    case STAV_1_ODPOCET:
        digitalWrite(PIN_RGB_R, LOW);
        digitalWrite(PIN_RGB_B, LOW);
        digitalWrite(PIN_PIEZO, LOW);

        if (tl2)
        {
            aktualniStav = STAV_0_KLID;
        }
        else if (uplynulyCas >= 5000)
        {
            aktualniStav = STAV_2_ALARM_CERVENA;
            casVstupuDoStavu = millis();
        }
        break;

    case STAV_2_ALARM_CERVENA:
        digitalWrite(PIN_RGB_R, HIGH);
        digitalWrite(PIN_RGB_B, LOW);
        digitalWrite(PIN_PIEZO, HIGH);

        if (tl3)
        {
            aktualniStav = STAV_0_KLID;
        }
        else if (uplynulyCas >= 1000)
        {
            aktualniStav = STAV_3_ALARM_MODRA;
            casVstupuDoStavu = millis();
        }
        break;

    case STAV_3_ALARM_MODRA:
        digitalWrite(PIN_RGB_R, LOW);
        digitalWrite(PIN_RGB_B, HIGH);
        digitalWrite(PIN_PIEZO, HIGH);

        if (tl3)
        {
            aktualniStav = STAV_0_KLID;
        }
        else if (uplynulyCas >= 1000)
        {
            aktualniStav = STAV_2_ALARM_CERVENA;
            casVstupuDoStavu = millis();
        }
        break;
    }
}