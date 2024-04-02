import 'package:my_coffee_delivery/core/assets.dart';
import 'package:my_coffee_delivery/models/category.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat.currency(
  locale: 'eu',
  customPattern: '#,### \u00a4',
  symbol: '€',
  decimalDigits: 2,
);

List<Seller> sellers = [
  Seller(
    name: "Greet",
    description:
        "Benvenuti nel nostro accogliente pub, dove la birra è protagonista! Scegli tra una vasta selezione di birre artigianali e internazionali, tutte accuratamente selezionate per soddisfare i palati più esigenti. Goditi l'atmosfera conviviale mentre sorseggi la tua birra preferita e socializzi con amici vecchi e nuovi. Un'esperienza unica per gli amanti della birra!",
    img: Assets.pub,
    indirizzo: "Via giovanni porzio 4, 80143, NA",
    telefono: "123456678653",
    email: "greet@greet.com",
    priceConsegna: oCcy.format(3.00),
    minutes: 5,
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Tuborg",
        category: categories[2].name.toString(),
        categoryIcon: categories[2].icon,
        image: Assets.birraTuborg,
        description:
            "Tuborg, la birra danese dall'inconfondibile gusto fresco e bilanciato. Con la sua tradizione secolare di qualità e innovazione, Tuborg offre un'esperienza di bevuta rinfrescante e appagante. Gusta la sua leggerezza e la sua finezza in ogni sorso, perfetta per accompagnare i momenti conviviali e le serate speciali. Scopri il piacere della birra Tuborg e immergiti in un'esperienza unica di gusto nordico.",
        price: oCcy.format(5.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni",
        category: categories[2].name.toString(),
        categoryIcon: categories[2].icon,
        image: Assets.birraPeroniGran,
        description:
            "Peroni è l'epitome dell'eleganza italiana nel mondo della birra. Questa lager premium, dal carattere distintivo e dal gusto fresco e bilanciato, rappresenta l'eccellenza artigianale italiana da oltre 150 anni. Con la sua schiuma dorata e il suo aroma invitante, ogni sorso di Peroni è un viaggio sensoriale attraverso la tradizione e la qualità che solo l'Italia sa offrire",
        price: oCcy.format(5.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Nastro azzurro",
        category: categories[2].name.toString(),
        categoryIcon: categories[2].icon,
        image: Assets.nastro,
        description:
            "Birra Nastro Azzurro: una lager premium dall'Italia, caratterizzata da un gusto fresco e leggero con note di malto e luppolo. La sua schiuma bianca e persistente e il colore dorato la rendono un'icona di stile e qualità. Perfetta da gustare in compagnia o per celebrare momenti speciali, è la scelta ideale per chi cerca un'esperienza di birra raffinata e soddisfacente.",
        price: oCcy.format(5.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni Gran Riserva Rossa",
        category: categories[2].name.toString(),
        categoryIcon: categories[2].icon,
        image: Assets.peroniRossa,
        description:
            "Peroni Gran Riserva Rossa è una birra dal carattere distintivo, ricca e avvolgente. Con il suo colore ambrato e la schiuma persistente, offre un bouquet aromatico complesso con note di malto tostato e caramello. Il suo gusto rotondo e bilanciato, arricchito da sentori di frutta secca e una leggera speziatura, la rende l'ideale compagna per momenti di relax e convivialità",
        price: oCcy.format(5.00),
        quantity: 1,
      ),
    ],
  ),
  Seller(
    name: "Fresco",
    img: Assets.sodaShop,
    description:
        "Scopri il nostro locale dedicato alle bevande gassate, dove puoi deliziare il tuo palato con una vasta gamma di bibite frizzanti e rinfrescanti. Dai classici sodi ai gusti più innovativi, c'è qualcosa per tutti i gusti. Un luogo ideale per rinfrescarti e goderti un momento di puro piacere gassato!",
    indirizzo: "P.za Giuseppe Garibaldi, 80142, NA",
    telefono: "20224249339",
    email: "fresco@fresco.com",
    priceConsegna: oCcy.format(3.00),
    minutes: 15,
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Oran Soda",
        category: categories[4].name.toString(),
        categoryIcon: categories[4].icon,
        image: Assets.soda,
        description:
            "L'Oran Soda è una bibita gassata dalla dolcezza equilibrata e dal caratteristico sapore di arancia. Fresca e vivace, questa bevanda rinfrescante è perfetta per soddisfare la sete in qualsiasi momento della giornata. Con il suo gusto fruttato e la leggera effervescenza, l'Oran Soda è un'opzione deliziosa per chi cerca un'alternativa alle bevande tradizionali.",
        price: oCcy.format(3.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Coca Cola 33cl",
        category: categories[4].name.toString(),
        categoryIcon: categories[4].icon,
        image: Assets.cocaCola,
        description:
            "Coca-Cola: la bevanda iconica che ha conquistato il mondo con il suo gusto unico e rinfrescante. Con la sua ricetta segreta e la bolla perfetta, Coca-Cola porta gioia e felicità ad ogni sorso. Perfetta da sola o come accompagnamento a qualsiasi pasto, è la scelta preferita di milioni di persone in tutto il mondo. Scopri il piacere autentico di Coca-Cola e vivi un momento di freschezza e soddisfazione.",
        price: oCcy.format(3.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Sprite",
        category: categories[4].name.toString(),
        categoryIcon: categories[4].icon,
        image: Assets.sprite,
        description:
            "Sprite, la bevanda rinfrescante senza zucchero, con il suo gusto unico di limone e lime, ti regala una fresca esplosione di energia in ogni sorso. Con la sua formula leggera e frizzante, Sprite è la scelta perfetta per rinfrescarti in ogni momento della giornata, aggiungendo una spruzzata di vivacità al tuo mondo.",
        price: oCcy.format(3.00),
        quantity: 1,
      ),
    ],
  ),
  // aggiungere seller x bubble tea
  Seller(
    name: "12oz Bubble",
    img: Assets.bubbleTeaShop,
    description:
        "Benvenuti nel nostro incantevole locale dedicato al bubble tea! Esplora una varietà di deliziose bevande a base di tè, arricchite con divertenti perle di tapioca o altri gustosi topping. Con un'ampia selezione di sapori e opzioni personalizzabili, ogni sorso è un'avventura unica. Vieni a scoprire il perfetto equilibrio di gusto e divertimento nel nostro paradiso del bubble tea!",
    indirizzo: "Pzza Garibaldi, 80142, NA",
    telefono: "12345643",
    email: "bubble@bubble.com",
    minutes: 10,
    priceConsegna: "5.00",
    products: <Product>[
      Product(
        id: const Uuid().v4(),
        name: "Coco berry",
        category: categories[3].name.toString(),
        categoryIcon: categories[3].icon,
        image: Assets.berryTea,
        description:
            "Scopri il nostro delizioso bubble tea al gusto di bacche! Un'esplosione di freschezza e fruttuosità ti attende in ogni sorso. Gusta la dolcezza naturale delle bacche bilanciata dalla cremosità del tè, arricchita dalle morbide perle di tapioca. Un'esperienza frizzante e vibrante che ti porterà in un mondo di sapore e piacere!",
        price: oCcy.format(8.00),
        quantity: 1,
      ),
      Product(
        id: const Uuid().v4(),
        name: "Coco Peach",
        category: categories[3].name.toString(),
        categoryIcon: categories[3].icon,
        image: Assets.peachTea,
        description:
            "Esplora la freschezza del nostro bubble tea al gusto di pesca! Deliziati con un'esplosione di dolcezza e un tocco di frizzantezza in ogni sorso. Gusta la dolcezza naturale della pesca unita alla morbidezza delle perle di tapioca per un'esperienza irresistibile e rinfrescante. Scopri il lato più fruttato del bubble tea nel nostro locale, dove il gusto della pesca incontra la gioia delle bolle!",
        price: oCcy.format(8.00),
        quantity: 1,
      ),
    ],
  ),
  // aggiungere seller x caffe
  Seller(
    name: "Bar Alexander",
    img: Assets.coffeeBackground,
    description:
        "Entra nel nostro accogliente bar e lasciati avvolgere dall'aroma invitante del caffè appena macinato. Con una selezione curata di prelibatezze caffeinate, dal classico espresso italiano alle creazioni speciali, ogni tazza è un viaggio sensoriale. Goditi il momento con un caffè perfettamente preparato mentre ti rilassi in un'atmosfera calorosa e accogliente.",
    indirizzo: "Via arenaccia, 80141, NA",
    telefono: "123455538",
    email: "bar@bar.com",
    priceConsegna: oCcy.format(3.00),
    minutes: 2,
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Cappuccino",
        category: categories[1].name,
        categoryIcon: categories[1].icon,
        image: Assets.cappuccino,
        description:
            "Un'iconica bevanda italiana, il cappuccino è un equilibrio perfetto tra espresso intenso e latte cremoso, coronato da una soffice schiuma. Il suo gusto rotondo e avvolgente è arricchito dalla dolcezza naturale del latte, mentre la schiuma aggiunge una nota vellutata alla superficie. Un'esperienza di puro piacere per gli amanti del caffè, perfetta per iniziare la giornata con energia o concedersi un momento di relax",
        price: oCcy.format(2.00),
        quantity: 1,
      ),
    ],
  ),
];
