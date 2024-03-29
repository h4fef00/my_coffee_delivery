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
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Tuborg",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.birraTuborg,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.birraPeroniGran,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Nastro azzurro",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.nastro,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni Gran Riserva Rossa",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.peroniRossa,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
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
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Oran Soda",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.soda,
        description: "Una soda buonissima!",
        price: oCcy.format(3.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Coca Cola 33cl",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.cocaCola,
        description: "Una coca cola buonissima!",
        price: oCcy.format(3.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Sprite",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.sprite,
        description: "Una sprite buonissima!",
        price: oCcy.format(3.00),
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
    priceConsegna: "5.00",
    products: <Product>[
      Product(
        id: const Uuid().v4(),
        name: "Coco berry",
        category: categories[3].name.toString(),
        minutes: 10,
        image: Assets.berryTea,
        description: "description",
        price: oCcy.format(8.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Coco Peach",
        category: categories[3].name.toString(),
        minutes: 10,
        image: Assets.peachTea,
        description: "description",
        price: oCcy.format(8.00),
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
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Cappuccino",
        category: categories[1].name,
        minutes: 2,
        image: Assets.cappuccino,
        description: "descrizione",
        price: oCcy.format(2.00),
      ),
    ],
  ),
];
