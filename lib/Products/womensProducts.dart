import 'package:match_test/userProfileData.dart';

class WomenProduct {
  static final List<Bundle> womensBundles = [agatha, agoy, blackPink, blanche, blink, chic, cofy, coureurRose, crema, dall, decontracte, ella, fast, fresh, gold, italy, light, lucy, luna, marron, modern, patronne, picnic, sapphire, sheep, urban, vagues, velvet];

  static List<Item> toItemList(){
    List<Item> lst = [];

    for(Bundle bundle in womensBundles)
      lst.add(bundle.toItem());

    return lst;
  }

  static final Bundle fresh = Bundle('Fresh', 179.94, [fresh_blazer, fresh_skirt, fresh_purse, fresh_bodySuit, fresh_shoes], "Inspired by Chanel, we have a matching set of jacket & skirt that are wearable to work. The name ‘Fresh’ comes from the color theme and the SS collection of bundles.",'assets/images/women/fresh.png');

  static final Item fresh_blazer = Item.overloader("Blazer", 39.99);
  static final Item fresh_skirt = Item.overloader("Skirt", 39.99);
  static final Item fresh_purse = Item.overloader("Purse", 19.99);
  static final Item fresh_bodySuit = Item.overloader("Body Suit", 19.99);
  static final Item fresh_shoes = Item.overloader("Shoes", 39.99);

  static final Bundle gold = Bundle('Gold', 179.94, [gold_blazer, gold_trousers, gold_highHeels, gold_tankTop, gold_purse], "‘Gold’ has color theme of beige and is FW collection business casual. We added black heel to give a more edgy look.",'assets/images/women/gold.png');

  static final Item gold_blazer = Item.overloader("Blazer", 39.99);
  static final Item gold_trousers = Item.overloader("Trousers", 39.99);
  static final Item gold_highHeels = Item.overloader("High Heels", 39.99);
  static final Item gold_tankTop = Item.overloader("Tank Top", 19.99);
  static final Item gold_purse = Item.overloader("Purse", 29.99);

  static final Bundle blackPink = Bundle('BlackPink', 179.94, [blackPink_purse, blackPink_trousers, blackPink_turtleNeck, blackPink_boots, blackPink_necklace], "‘BlackPink’ is a FW collection with color theme of black and point color of nude pink. The animal printed boots are in trend for this fall and winter.",'assets/images/women/blackpink.png');

  static final Item blackPink_purse = Item.overloader("Purse", 39.99);
  static final Item blackPink_trousers = Item.overloader("Trousers", 39.99);
  static final Item blackPink_turtleNeck = Item.overloader("Turtle Neck", 9.99);
  static final Item blackPink_boots = Item.overloader("Boots", 39.99);
  static final Item blackPink_necklace = Item.overloader("Necklace", 19.99);

  static final Bundle luna = Bundle('Luna', 179.94, [luna_trenchDress, luna_purse, luna_necklace, luna_highHeels], "‘Luna’ is Moon in Italian and the all black outfit including blazer dress and heels emphasize the night out on a full moon.",'assets/images/women/luna.png');

  static final Item luna_trenchDress = Item.overloader("Trench Dress", 39.99);
  static final Item luna_purse = Item.overloader("Purse", 39.99);
  static final Item luna_necklace = Item.overloader("Necklace", 9.99);
  static final Item luna_highHeels = Item.overloader("High Heels", 39.99);

  static final Bundle patronne = Bundle('Patronne', 179.94, [ patronne_blazer, patronne_trousers, patronne_highHeels, patronne_buttonDown, patronne_purse], "Patronne, in French, means a lady boss. With the black suit and white heels, we want uplift strong and independent females in workforce.",'assets/images/women/patronne.png');

  static final Item patronne_blazer = Item.overloader("Blazer", 39.99);
  static final Item patronne_trousers = Item.overloader("Trousers", 39.99);
  static final Item patronne_highHeels = Item.overloader("High Heels", 39.99);
  static final Item patronne_buttonDown = Item.overloader("Button Down", 19.99);
  static final Item patronne_purse = Item.overloader("Purse", 29.99);

  static final Bundle velvet = Bundle('Velvet', 179.94, [velvet_blazer, velvet_trousers, velvet_highHeels, velvet_bodySuit, velvet_purse], "The blue velvet suit gives the 90’s retro vibes. We matched with black bodysuit, heels and bags to tone down the overall colors.",'assets/images/women/velvet.png');

  static final Item velvet_blazer = Item.overloader("Blazer", 39.99);
  static final Item velvet_trousers = Item.overloader("Trousers", 39.99);
  static final Item velvet_highHeels = Item.overloader("High Heels", 39.99);
  static final Item velvet_bodySuit = Item.overloader("Body Suit", 19.99);
  static final Item velvet_purse = Item.overloader("Purse", 29.99);

  static final Bundle fast = Bundle('Fast', 179.94, [fast_hoodie, fast_sportsPants, fast_sneakers, fast_cropTop], "Pieces that allow you to run as fast as possible while being in comfortable clothes.",'assets/images/women/fast.png');

  static final Item fast_hoodie = Item.overloader("Hoodie", 39.99);
  static final Item fast_sportsPants = Item.overloader("Sports Pants", 39.99);
  static final Item fast_sneakers = Item.overloader("Sneakers", 9.99);
  static final Item fast_cropTop = Item.overloader("Crop Top", 39.99);

  static final Bundle cofy = Bundle('Cofy', 179.94, [cofy_hoodie, cofy_shorts, cofy_sneakers, cofy_fannyPack], "The name COFY is shorten from comfy which represents the comfortable touch in this outfit.",'assets/images/women/cofy.png');

  static final Item cofy_hoodie = Item.overloader("Hoodie", 39.99);
  static final Item cofy_shorts = Item.overloader("Shorts", 9.99);
  static final Item cofy_sneakers = Item.overloader("Sneakers", 59.99);
  static final Item cofy_fannyPack = Item.overloader("Fanny Pack", 29.99);

  static final Bundle blink = Bundle('Blink', 179.94, [blink_sportsBra, blink_sneakers, blink_pants, blink_zipUpSweater], "The name Blink comes from the print of pants. With sports sport bra top, hoodie, and running shoes are suitable for a city run.",'assets/images/women/blink.png');

  static final Item blink_sportsBra = Item.overloader("Sports Bra", 39.99);
  static final Item blink_sneakers = Item.overloader("Sneakers", 39.99);
  static final Item blink_pants = Item.overloader("Pants", 9.99);
  static final Item blink_zipUpSweater = Item.overloader("Zip Up Sweater", 39.99);

  static final Bundle lucy = Bundle('Lucy', 179.94, [lucy_buttonDown, lucy_skirt, lucy_earrings, lucy_shoes, lucy_purse], "The name “Lucy” means daylight. We match up with gold earrings to stay consistent with colors in this outfit.",'assets/images/women/lucy.png');

  static final Item lucy_buttonDown = Item.overloader("Button Down", 39.99);
  static final Item lucy_skirt = Item.overloader("Skirt", 39.99);
  static final Item lucy_earrings = Item.overloader("Earrings", 9.99);
  static final Item lucy_shoes = Item.overloader("Shoes", 39.99);
  static final Item lucy_purse = Item.overloader("Purse", 29.99);

  static final Bundle agatha = Bundle('Agatha', 179.94, [agatha_jacket, agatha_dress, agatha_sneakers, agatha_purse], "Agatha means a goddess. The silk dress and gold jewels matches the name and to make overall outfit casual, we added sneakers and biker jacket.",'assets/images/women/agatha.png');

  static final Item agatha_jacket = Item.overloaderWithImage("Jacket", 39.99, 'assets/images/women/agathaImages/agatha_jacket.png');
  static final Item agatha_dress = Item.overloaderWithImage("Dress", 39.99, 'assets/images/women/agathaImages/agatha_dress.png');
  static final Item agatha_sneakers = Item.overloaderWithImage("Sneakers", 39.99, 'assets/images/women/agathaImages/agatha_shoes.png');
  static final Item agatha_purse = Item.overloaderWithImage("Purse", 29.99, 'assets/images/women/agathaImages/agatha_purse.png');

  static final Bundle dall = Bundle('Dall', 179.94, [dall_jacket, dall_bodySuit, dall_jeans, dall_highHeels, dall_belt], "The outfit ‘dall’ is inspired by Kendall Jenner. Kendall wears bodysuit with light blue jeans on daily basis. We added with fur jacket to and heels to give a mix match feel.",'assets/images/women/dall.png');

  static final Item dall_jacket = Item.overloader("Jacket", 39.99);
  static final Item dall_bodySuit = Item.overloader("Body Suit", 39.99);
  static final Item dall_jeans = Item.overloader("Jeans", 9.99);
  static final Item dall_highHeels = Item.overloader("High Heels", 39.99);
  static final Item dall_belt = Item.overloader("Belt", 19.99);

  static final Bundle ella = Bundle('Ella', 20.25, [ella_blouse, ella_trousers, ella_highHeels], "The name Ella comes from then over clean and origin look of this outfit. Three colors came from the same color scheme, make the outfit looks cohesive. ",'assets/images/women/ella.png');

  static final Item ella_blouse = Item.overloader("Blouse", 5.75);
  static final Item ella_trousers = Item.overloader("Trousers", 7.90);
  static final Item ella_highHeels = Item.overloader("High Heels", 6.60);

  static final Bundle italy = Bundle('Italy', 87.99, [italy_tshirt, italy_highHeels, italy_trousers], "Wearing this outfit would feel like walking on the Italy’s street. It’s a simple and classic look.",'assets/images/women/italy.png');

  static final Item italy_tshirt = Item.overloader("T-shirt", 18.00);
  static final Item italy_highHeels = Item.overloader("High Heels", 30.00);
  static final Item italy_trousers = Item.overloader("Trousers", 39.99);

  static final Bundle marron = Bundle('Marron', 32.70, [marron_sweater, marron_trousers, marron_boots], "The name Marron represents the fall in this look, consisting of dark brown sweater with a beige trouser. The boot with a mix of both colors make it more authentic with some heights.",'assets/images/women/marron.png');

  static final Item marron_sweater = Item.overloader("Sweater", 11.20);
  static final Item marron_trousers = Item.overloader("Trousers", 12.00);
  static final Item marron_boots = Item.overloader("Boots", 9.50);

  static final Bundle sheep = Bundle('Sheep', 32.96, [sheep_sweater, sheep_trousers, sheep_heels], "The sweater is made of 100% wool, so we name it “sheep”. The black heels make the outfit look more sexy.",'assets/images/women/sheep.png');

  static final Item sheep_sweater = Item.overloader("Sweater", 11.20);
  static final Item sheep_trousers = Item.overloader("Trousers", 12.00);
  static final Item sheep_heels = Item.overloader("Heels", 9.76);

  static final Bundle modern = Bundle('Modern', 39.01, [modern_jumpsuit, modern_blazer, modern_heels], "This business formal clothes is very modern and neat suits in any working environment. ",'assets/images/women/modern.png');

  static final Item modern_jumpsuit = Item.overloader("Jumpsuits", 8.95);
  static final Item modern_blazer = Item.overloader("Blazer", 20.30);
  static final Item modern_heels = Item.overloader("Heels", 9.76);

  static final Bundle sapphire = Bundle('Sapphire', 39.01, [sapphire_blazer, sapphire_trouser, sapphire_heels], "It’s a complete set of dark blue with a mid heels shoe. Sapphire since it’s the main element of this bundle. It’s an everyday work outfit. The main element, Sapphire shines while walking ",'assets/images/women/sapphire.png');

  static final Item sapphire_blazer = Item.overloader("Blazer", 8.95);
  static final Item sapphire_trouser = Item.overloader("Trouser", 20.30);
  static final Item sapphire_heels = Item.overloader("Heels", 9.76);

  static final Bundle blanche = Bundle('Blanche', 28.47, [blache_jumpsuit, blanche_blazer, blanche_heels], "'Blanche' means white in French. The jumpsuit goes well with the classic white high heels.",'assets/images/women/blanche.png');

  static final Item blache_jumpsuit = Item.overloader("Jumpsuits", 6.87);
  static final Item blanche_blazer = Item.overloader("Blazer", 15.00);
  static final Item blanche_heels = Item.overloader("Heels", 6.60);

  static final Bundle crema = Bundle('Crema', 28.65, [crema_heels, crema_blazer, crema_trousers], "The outfit ‘crema’ comes from the creamy color of our matching suit. We added pink low heel to give overall lovely finish .",'assets/images/women/crema.png');

  static final Item crema_heels = Item.overloader("Heels", 5.75);
  static final Item crema_blazer = Item.overloader("Blazer", 15.00);
  static final Item crema_trousers = Item.overloader("Trousers", 7.90);

  static final Bundle urban = Bundle('Urban', 96.99, [urban_jacket, urban_jeans, urban_boots], "'Urban' is inspired by urban outfitters. Mustang jackets and doctor Martens are very much popular within younger generation.",'assets/images/women/urban.png');

  static final Item urban_jacket = Item.overloader("Jacket", 25.99);
  static final Item urban_jeans = Item.overloader("Jeans", 21.00);
  static final Item urban_boots = Item.overloader("Boots", 50.00);

  static final Bundle picnic = Bundle('Picnic', 15.16, [picnic_jumpsuit, picnic_sneaker, picnic_purse], "‘Picnic’ has full on sky blue jumpsuit with bucket bag and comfortable white sneakers. This outfit is perfect for a spring picnic day.",'assets/images/women/picnic.png');

  static final Item picnic_jumpsuit = Item.overloader("Jumpsuit", 6.87);
  static final Item picnic_sneaker = Item.overloader("Sneakers", 7.00);
  static final Item picnic_purse = Item.overloader("Purse", 1.29);

  static final Bundle chic = Bundle('Chic', 15.07, [chic_turtleneck, chic_skirt, chic_boots], "The name 'chic' comes from the overall elegant and fashionable look of this outfit. This streetwear can be easily put on and head out the door with.",'assets/images/women/chic.png');

  static final Item chic_turtleneck = Item.overloader("Turtleneck", 3.80);
  static final Item chic_skirt = Item.overloader("Skirt", 4.77);
  static final Item chic_boots = Item.overloader("Boots", 6.50);

  static final Bundle vagues = Bundle('Vagues', 45.07, [vagues_jacket, vagues_pants, vagues_boots], "This outfit has more of a city vibe since it looks very trendy. It’s something that people can wear every day but never go out of fashion. A loose pants to match this up because of the comfortability while wearing high heels.",'assets/images/women/vagues.png');

  static final Item vagues_jacket = Item.overloader("Jacket", 13.80);
  static final Item vagues_pants = Item.overloader("Pants", 14.77);
  static final Item vagues_boots = Item.overloader("Boots", 16.50);

  static final Bundle agoy = Bundle('Agoy', 45.07, [agoy_shirt, agoy_legging, agoy_sneaker], "This outfit consists of a top with a sport pants and a pair of comfy sneaker. People can wear it to gym, yoga class, pilates or any type of work out.",'assets/images/women/agoy.png');

  static final Item agoy_shirt = Item.overloader("Shirt", 13.80);
  static final Item agoy_legging = Item.overloader("Legging", 14.77);
  static final Item agoy_sneaker = Item.overloader("Sneaker", 16.50);

  static final Bundle coureurRose = Bundle('Coureur Rose', 45.07, [coureurRose_jacket, coureurRose_legging, coureurRose_sneaker], "'Coureur' is 'runner' in French. The rosy color of leggings adds a little bite 'young' vibe to this outfit.'",'assets/images/women/coureur_rose.png');

  static final Item coureurRose_jacket = Item.overloader("Jacket", 13.80);
  static final Item coureurRose_legging = Item.overloader("Legging", 14.77);
  static final Item coureurRose_sneaker = Item.overloader("Sneaker", 16.50);

  static final Bundle light = Bundle('Light', 9.95, [light_sweater, light_shorts], "This look is very light and doesn’t add any extra weight to the person. Thus it’s a perfect outfit for running and doing sports.",'assets/images/women/light.png');

  static final Item light_sweater = Item.overloader("Sweater", 6.35);
  static final Item light_shorts = Item.overloader("Shorts", 3.60);

  static final Bundle decontracte = Bundle('Decontracte', 20.94, [decontracte_hoodie, decontracte_sweatpants, decontracte_sneakers], "Decintrate means relaxed and comfortable in French. To match the name, we bundled up with a free size black hoodie and black sweatpants for athletics to work out without the minimum distraction from clothes.",'assets/images/women/decontracte.png');

  static final Item decontracte_hoodie = Item.overloader("Hoodie", 7.59);
  static final Item decontracte_sweatpants = Item.overloader("Sweatpants", 6.35);
  static final Item decontracte_sneakers = Item.overloader("Sneaker", 7.00);
}