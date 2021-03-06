import '../../../SBURBSim.dart';
import 'Aspect.dart';
import "../../../Lands/FeatureTypes/QuestChainFeature.dart";
import "../../../Lands/Reward.dart";
import "../../../Lands/Quest.dart";
class Trucks extends Aspect {

  //what sort of quests rewards do I get?
  @override
  double itemWeight = 0.01;
  @override
  double fraymotifWeight = 0.5;
  @override
  double companionWeight = 1.00;

  @override
  //kazoo todo
  List<String> associatedScenes = <String>[
    //i have literally no idea how balanced these are but here we go anyway
    "[Founding Fathers Cry]:___ N4IgdghgtgpiBcIDaAxA9gVzAEwJZgHMACFCAFwAsYAnAZyIGFqBPAXRABoQAzAGwgBuaagBUYADzIIQIqkQDKDAKIA5JQH0A8gHU1AJXUqAggFklRCAAdLvXDHqUYuahdqWYAYzJEyaIiKM9AHElEUNTDU0DYzN5IgA6fypmIm4YGF4iKGEYIks0WlwyXAFciAAjTG8YCA8KIjRHakTOEDIIagIYMk0wOEQyagw4LkHcAi7qBjQcItwZ2gAZEvwCaSRgAB0QXCh86nawMm1hbG34bZUAeiNtjkvNEXPt7gheWhg77YA1PQBJeQAaVuCBebw+X3A0E+oJAf1oAAV+MwaJDdvtDmQ-kdniAAAzbAC+HCIWx2e2EmJO1DOsOuIPuIBUj1xr3eMMZvwBwNZ4I520gsFx8KMtlKaIpBwgR2xZFxBJAxNJ23RlOlx1OuPpkOZT1hg2GkK5QJBFx4fMhgphZvh8gy3AlGPVsvlRJJZNVUqO1NpZu1nAeerNbIhAZAxp5sJD-KhQth8L00uwaCgjrVMpxsIATArCexRtRxpNprNigtFkn1vmQDBuGkvLR0NRlgJVusPZKqZrYXoMuR5mBaBRcJZaJbobiGBRpV15O05WGI6awey016yCoMFByqjYQBGADMufdKs76p9uN7-DLg+Ho-HcbNU5nMDn5CN-xNuINMc9mM3267mah65tWtb1mQjbCBWOC0FWipAA",
    "[Jumpstart]:___ N4IgdghgtgpiBcIDaApArlADgZwC4QCdcBdEAGhADMAbCANwHsCAVGAD1wRGYAsYACAMoBhAKIA5UQH0A8gHVJAJSniAggFlR-PhGrZ+uPlGwxqlfhDAATA3wCWBC9Wp2Y2MvzthsmB14Dm-JgQ2Nh2DGD8AEYwuADuMDCRhjBQAHT85CD4BP6xMmBwiJS6Jlm4BHb+eQTCEVZ2uOHeADJ2dAFcSMAAOiB2WEz4YLhyTFZ98H3iAPSqfWTTMsyTfSV6MAt9AGqKAJKCANLzCH0VaJvkfZCwqyAAEiF1WJbN2Fv9g0SWuHsjdwAGPoAXw8vU+mCGPzGBAmpweMF0hg+4mWd3Ol0WIF2B2O6IIFw+N0uU24hDyuEE+F+2AA4gREbgYCweJZtrpCVcIVCRn9cHcAIwAZiBIGBpAoFSqNTq1kabxalisXQlIBglEoMAAxrhsAAxJhtDpgfxdcEDSHfEYwuGk+6I6jIrnEu7CVkmmDqACeVIg-K5OKOJ1JGI+Fp5uHEGBiBEFIpBYL64ato3Gd1mJyxLvhbsseRkvjAzRklHUmJ2+yDd3WJjDX2GkejzLuAFYE-xzfXoWn4YpTH63jw7DgidASX1cx7vb7-VjA3j4aGucmG1GoDG4yDVerNTr9YaldgVWKgA",
    "[On the Open Road]:___ N4IgdghgtgpiBcIDaB5MACALgCxulADjBgEoD2EAJgLogA0IAZgDYQBuZATgCowAemBCADquDDjwBnGJMkBLMhgBGMAMZlYk9AFcwuCMxwBPOllzoAygGEAogDkbAfRTCHJR3YCCAWRvoIBATMcjLoStqMjJKmkmRmMEboqhAYANIwMAT4GNyc2qoA1nJgAOQAdPQgmBCcAOYwmGhwiJh5cAytcrX1nFaKlHKYCmCSADJybMW1QkjAADogclAEXNVgmMJclAvwYNrMzHQLdijcOwut2jALRyAAaiQAkhapnudMBtI3C5Cw7xYyeSKAASMAMOAA4pwwZgYDxsClvotlqsUphHut3gBGAAMOIWAF9aB1OF0en0wAMhooxilKDNiSAYJE1JhJAAxLjjSZgaaIWYLJYrThrDZbd5I37XBALbxkAaMIwA2TDUHg7BIh7PV7vRifaW3IWo9Z2bRQFScd4AVjxhNM82RwtFm042xlIBIMFY1JG2DkBEkkug0vgCysCN5MAs1UwmqeLze7r1zC+9EFKJFaNN5rh2IAzHb0A6jZn1i63aGQHYAPSJ25S97eCAFGAQ+UAERkQzAMDdty1Cd1+qRJdF2Yt73xICJlWZjFZHK5dMkDOnQA",
    "[Rev the Engines]:___ N4IgdghgtgpiBcIDaAlGA3ABAFwBY0wFEwBzASzBgGcBdEAGhADMAbCdAewCcAVGAD2wIQASWwByKjjKwcHTDCgAjCFwDWmDmBz5MEACboYYbAFcuBPBGyYyUvAQDi0GAEJMPXQGUAwoQByhAD6APIA6oEoQf4AggCyhJgA7hAmUhgwXACeWpbyLGRqlvhQmFDcMAB0mAwg2KokMNghlMLYXKZwjO1kJI1cPlr6ZNhkWlQAMmToFCTCSMAAOiAyAA7c9SZh3PrL8Mv+APQxy-QHITx7y0wQLFQwp8sAaigiXgDSJwjXt-eP4C4riAeA0mgAJCBUEKrChjMAhJhxB4MZZrDapbAiExAgAMywAvnRulxev1BmBhqNxhNUvp5kSQDAmEwYABjbBUABi3CmM1I8yWKyg6y4m2w2y4u2+ICOXzOANgQJ8uFSjWhsK0CKR-xeb0+QJud2R8rRoox-lMykyQIArASGUyWeyuTzaVR6SB8UA"
  ];

  @override
  double difficulty = 0.0;

  @override
  AspectPalette palette = new AspectPalette()
    ..accent = "#1b25e4"
    ..aspect_light = '#ff0606'
    ..aspect_dark = '#ff0606'
    ..shoe_light = '#dbdcf7'
    ..shoe_dark = '#c7c7f3'
    ..cloak_light = '#2751bc'
    ..cloak_mid = '#0b077c'
    ..cloak_dark = '#030a20'
    ..shirt_light = '#ab3e18'
    ..shirt_dark = '#892810'
    ..pants_light = '#842d20'
    ..pants_dark = '#5e150d';

  @override
  List<String> landNames = new List<String>.unmodifiable(<String>["Hands", "Wheels", "Care", "Proximity", "Driving", "Intimacy", "Heartbeats", "Axles", "Unions"]);

  @override
  List<String> levels = new List<String>.unmodifiable(<String>["JUNIOR DRIVER", "SIXTEEN-WHEELER", "TENACIOUS TRUCKER"]);

  @override
  List<String> handles = new List<String>.unmodifiable(<String>["Trucker", "Teaser", "Timer", "Teller", "Tamer", "Tide", "Tone"]);

  @override
  List<String> fraymotifNames = new List<String>.unmodifiable(<String>["Trucks", "Axles", "Chain", "Wheel", "Gas", "Awakening", "Jam", "Friendship", "Bop", "Engine", "Union", "Emotional", "Passionate", "Close", "Understanding", "Intimate", "Positive", "Negative", "Gear", "Bed", "Wheel", "Iron", "Bop", "Exhaust", "Heat"]);

  @override
  String denizenSongTitle = "Jam";

  @override
  String denizenSongDesc = " A rumbling note is produced. It's the one Pining plays to remember its past. The OWNER is strengthened and healed. The ENEMY is weakened and hurt. And that is all there is to say on the matter. ";

  @override
  List<String> symbolicMcguffins = ["exhaust","passion", "muscle", "understanding", "blush", "flex", "muscle"];

  @override
  List<String> physicalMcguffins = ["truck","wheel", "pedal", "engine", "firework", "rubber band", "putty"];

  @override
  List<String> denizenNames = new List<String>.unmodifiable(<String>['Truck', 'Apollo', 'Eros', 'Aphrodite', 'Bagadix', 'Peitho', 'Bes', 'Min', 'Hathor', 'Frigg', 'Freyr', 'Freyja', 'Eostre', 'Hedone', 'Pan', 'Venus', 'Anteros', 'Eos', 'Bagadix']);


  @override
  //future kazoo itemtraitfactory is in scripts/alchemy/trait.dart
  void initializeItems() {
    items = new WeightedList<Item>()

      ..add(new Item("Fireworks in the Sky",<ItemTrait>[ItemTraitFactory.EXPLODEY,ItemTraitFactory.ROMANTIC, ItemTraitFactory.ASPECTAL, ItemTraitFactory.LOUD],shogunDesc: "THE FOUNDING FATHERS CRY"))
      ..add(new Item("Steering Wheel",<ItemTrait>[ItemTraitFactory.RUBBER,ItemTraitFactory.SICKNASTY, ItemTraitFactory.ASPECTAL, ItemTraitFactory.HAUNTED], shogunDesc: "Vroom vroom, motherfuckers."))
      ..add(new Item("Rubber Bands",<ItemTrait>[ItemTraitFactory.RUBBER,ItemTraitFactory.RESTRAINING, ItemTraitFactory.ASPECTAL, ItemTraitFactory.CHARGING, ItemTraitFactory.FIDGET],shogunDesc: "Strechhhhhh", abDesc:"Stretch."))
      ..add(new Item("Pillows",<ItemTrait>[ItemTraitFactory.FEATHER,ItemTraitFactory.COMFORTABLE, ItemTraitFactory.ASPECTAL, ItemTraitFactory.PALE,ItemTraitFactory.ROMANTIC, ItemTraitFactory.CALMING],shogunDesc: "when did this session become such a pale fuckpile?")) //shoutout to mutinyrails
      ..add(new Item("My Muscles, My Muscles",<ItemTrait>[ItemTraitFactory.FIST,ItemTraitFactory.FLESH, ItemTraitFactory.SHOOTY, ItemTraitFactory.VALUABLE, ItemTraitFactory.ASPECTAL, ItemTraitFactory.LEGENDARY],shogunDesc: "INVOLUNTARILY FLEX")); //yknow shooty?? cause guns???????
  }


  @override
  List<AssociatedStat> stats = new List<AssociatedStat>.unmodifiable(<AssociatedStat>[
    new AssociatedStat(Stats.RELATIONSHIPS, 3.0, true),
    new AssociatedStat(Stats.SANITY, 1.0, true),
    new AssociatedStat(Stats.ALCHEMY, -2.0, true) //items aren't people.
  ]);

  Trucks(int id) :super(id, "Trucks", isCanon: true); //its canon in my heart

  @override
  String activateCataclysm(Session s, Player p) {
    return s.mutator.trucks(s, p);
  }

  @override
  void initializeThemes() {
    addTheme(new Theme(<String>["Wheels","Axles","Engines", "Exhaust", "Driving", "Cargo", "Cabs"])
      ..addFeature(FeatureFactory.OILSMELL, Feature.HIGH)
      ..addFeature(FeatureFactory.CLANKINGSOUND, Feature.HIGH)
      ..addFeature(FeatureFactory.DANGEROUSFEELING, Feature.MEDIUM)

      ..addFeature(new PreDenizenQuestChain("Load the Truck", [
        new Quest("The ${Quest.PLAYER1} finds a village of ${Quest.CONSORT}s attempting to load cargo for trade in another village. The ${Quest.CONSORT}s are struggling to determine what cargo to load and enlist the aid of the ${Quest.PLAYER1}."),
        new Quest("The ${Quest.PLAYER1} takes inventory of the cargo and decides which is the most important. The ${Quest.CONSORT}s offer their varied opinions on the process."),
        new Quest("The ${Quest.PLAYER1} begins loading the cargo for the consorts. They must take into account the fragility and importance of each item when loading it."),
        new Quest("The traders take off, excited to trade their cargo. What exactly were they trading again? It doesn't matter, at any rate. A grateful ${Quest.CONSORT} hands the ${Quest.PLAYER1} a ${Quest.PHYSICALMCGUFFIN} and some boondollars in compensation.")
      ], new ItemReward(items), QuestChainFeature.playerIsHelpfulClass), Feature.WAY_LOW)

      ..addFeature(new DenizenQuestChain("Unjam the Wheels", [
        new Quest("The land hosts a complicated system of wheels and engines. A wise old ${Quest.CONSORT} stops ${Quest.CONSORTSOUND}ing enough to explain that it is the hero's destiny to reverse the damage to the system inflicted by ${Quest.DENIZEN}. Evidently, the wheels used to spin quickly across the land, and now they have slowed down dramatically."),
        new Quest("The ${Quest.PLAYER1} begins to examine the wheels and the bands that connect them. It seems that each wheel represents a consort and that they must interview each consort in order to discover the connections between the wheels."),
        new Quest("The ${Quest.PLAYER1}, unravelling the complex system, notices that some parts seem to stop after they have been examined. Is the ${Quest.DENIZEN} interfering?"),
        new DenizenFightQuest("It is time for the ${Quest.PLAYER1}  to finally face the ${Quest.DENIZEN}. The wheel system is too complicated to be stopped again safely.","The ${Quest.DENIZEN} lies slain by the ${Quest.PLAYER1}'s ${Quest.WEAPON}. The ${Quest.PLAYER1} has won! The world's wheels spin away smoothly.","The tyranny of ${Quest.DENIZEN} continues with the defeat of the ${Quest.PLAYER1}.")
      ], new DenizenReward(), QuestChainFeature.defaultOption), Feature.WAY_LOW)
        ,  Theme.HIGH);
    addTheme(new Theme(<String>["Rubber", "Bands", "Passion", "Flexes", "Fireworks", "Tears", "Emotion"])
      ..addFeature(FeatureFactory.LAUGHINGSOUND, Feature.HIGH)
      ..addFeature(FeatureFactory.JAZZSOUND, Feature.LOW)
      ..addFeature(FeatureFactory.ROMANTICFEELING, Feature.LOW)
      ..addFeature(FeatureFactory.SNAKECONSORT, Feature.HIGH)
      ..addFeature(FeatureFactory.SPICYSMELL, Feature.LOW)

      ..addFeature(new DenizenQuestChain("Wield the Power of Love", [
        new Quest("The ${Quest.PLAYER1}  and the ${Quest.PLAYER2} are investigating a dungeon. Suddenly, a rubber band snaps out of nowhere and ties them together. They recognize that they can use this band as a weapon in their favor."),
        new Quest("The ${Quest.PLAYER1}  and the ${Quest.PLAYER2} are separated in a dungeon, and each find a mirror that reflects into each others rooms. Using communication and teamwork, they manage to open a lock with careful maneuvering of the mirrors."),
        new DenizenFightQuest("The ${Quest.PLAYER1}  and the ${Quest.PLAYER2} trust each other to have their backs.  So when the ${Quest.DENIZEN} starts trying to turn them against each other, there is no question of believing its lies. They team up to strife the ${Quest.DENIZEN}.","Slaying the ${Quest.DENIZEN} proves the POWER OF TEAMWORK!","The ${Quest.PLAYER1} and ${Quest.PLAYER2} end up getting distracted bickering after one of the ${Quest.DENIZEN}'s slanderous barbs hits home. Whoops, their love wasn't strong enough!")
      ], new DenizenReward(), QuestChainFeature.twoPlayers), Feature.WAY_HIGH)


      ..addFeature(new DenizenQuestChain("Set the Fireworks", [
        new Quest("The ${Quest.PLAYER1} beholds a hold of grounded fireworks, dusty with age. A wise old ${Quest.CONSORT}s explains that before  ${Quest.DENIZEN} arrived, the fireworks were regularly sent to the sky as a communication between villages. Now the ${Quest.CONSORT}s are isolated from each other, and grow more yearnful by the day.  The ${Quest.PLAYER1} vows to help. "),
        new Quest("The ${Quest.PLAYER1} delves in dungeons until they discover the correct timings for one cache of fireworks. The first cache is firing again, and the timekeeping and communication is restored. The local ${Quest.CONSORT}s connect with their lost brethren for the first time in their lifetimes, to much joy."),
        new Quest("The ${Quest.PLAYER1} has been working tirelessly to determine the ancient firework schedules for each area of the land, only to discover that their notes have been mysteriously destroyed once again. There is no getting around it, ${Quest.DENIZEN} needs to be stopped. "),
        new DenizenFightQuest("The ${Quest.PLAYER1} has tracked down ${Quest.DENIZEN}. There can be no mercy. ","The ${Quest.DENIZEN} lies slain by the ${Quest.PLAYER1}'s ${Quest.WEAPON}. The ${Quest.PLAYER1} is finally free to restore the firework signals, bringing connection and love to the land. ","The tyranny and isolation of ${Quest.DENIZEN} continues with the defeat of the ${Quest.PLAYER1}.")
      ], new DenizenReward(NPCHandler.JACK), QuestChainFeature.defaultOption), Feature.WAY_LOW)

      ..addFeature(new DenizenQuestChain("Slow the Tears", [
        new Quest("The ${Quest.PLAYER1} learns of the ${Quest.MCGUFFIN} Well, said to hold back the ${Quest.DENIZEN}'s tears from flooding the land. A quaking ${Quest.CONSORT} explains that the ${Quest.DENIZEN}'s rage is cracking the well, causing their tears to flood through the land, bumming all the consorts out.  "),
        new Quest("The ${Quest.PLAYER1} hears of a fantastical weapon kept sunken at the bottom of the ${Quest.MCGUFFIN} Well. It is said that the ${Quest.DENIZEN}, imprisoned alongside it, seeks to escape and study it. Perhaps the ${Quest.PLAYER1} can persist through the denizens saddening tears long enough to claim it for themselves?"),
        new Quest("The ${Quest.PLAYER1} defeats a fearsome ${Quest.DENIZEN} minion, whose death causes the a tunnel descending around the ${Quest.MCGUFFIN} Well to appear. "),
        new DenizenFightQuest("The ${Quest.PLAYER1} has crossed the threshold. They toot their horn. There can be no mercy. It is time to face the ${Quest.DENIZEN}. ","The ${Quest.DENIZEN} lies slain by the ${Quest.PLAYER1}'s ${Quest.WEAPON}. The ${Quest.PLAYER1} is finally able to see what lies at the bottom of the ${Quest.MCGUFFIN} Well. Oh. Huh. That's....actually kind of disappointing, actually. Oh well, at least they saved the planet, right? ","The ${Quest.MCGUFFIN} Well is more at risk of collapsing than ever before.")
      ], new DenizenReward(), QuestChainFeature.defaultOption), Feature.WAY_LOW)

      ..addFeature(new PostDenizenQuestChain("360 Degrees of Separation", [
        new Quest("They say it can't be done, but the ${Quest.PLAYER1} is confident that they can ship every single ${Quest.CONSORT} on ${Quest.MCGUFFIN}book. AAAAAAAALLLLLLLL of them. They start small, just setting up any ${Quest.PLAYER1}'s that wanders by on a randomly quadranted date. They know they can do this!"),
        new Quest("Oh god. Less than 10% of the ${Quest.PLAYER1} population have been shipped. The ${Quest.PLAYER1} is starting to think that maybe they understimated how hard this would be. "),
        new Quest("Oh god. It's all so simple. They see it now. Relationships are like a chain, or a web. All they need to do is find the most connected nodes and....yes. Those 6 ${Quest.CONSORT}s are all they need to indirectly gain access to the remaining 90% of the population. The ${Quest.PLAYER1} schmoozes the right few ${Quest.CONSORT}s and finally acomplishes the impossible. They now have AAAAAAAALL the ships!")
      ], new FraymotifReward("Shipping party", "The ${Fraymotif.OWNER} has so many ships, they have to assume everyone in this fight is already in one of theirs."), QuestChainFeature.playerIsSmartClass), Feature.HIGH)

      ..addFeature(new PostDenizenQuestChain("Steal The Ships", [
        new Quest("They say it can't be done, but the ${Quest.PLAYER1} is confident that they can ship every single ${Quest.CONSORT} on ${Quest.MCGUFFIN}book. AAAAAAAALLLLLLLL of them. They start small, just setting up any ${Quest.PLAYER1}'s that wanders by on a randomly quadranted date. They know they can do this!"),
        new Quest("Oh god. Less than 10% of the ${Quest.PLAYER1} population have been shipped. The ${Quest.PLAYER1} is starting to think that maybe they understimated how hard this would be. "),
        new Quest("The ${Quest.PLAYER1} decides that doing things the hard way is for chumps and just hacks into ${Quest.MCGUFFIN}book to change their relationships to a humongous polyamory. Yay, they win! They are the best! ")
      ], new FraymotifReward("Ship Stealer", "The ${Fraymotif.OWNER} has shipped you and all your allies already."), QuestChainFeature.playerIsSneakyClass), Feature.HIGH)



      ..addFeature(new DenizenQuestChain("Flushed Shipping Dungeon", [
        new Quest("The ${Quest.PLAYER1}  and the ${Quest.PLAYER2} seem to be a good complement. The noodly appendages of the Horror Terrors do not fail to notice this.  "),
        new DenizenFightQuest("The ${Quest.PLAYER1}  and the ${Quest.PLAYER2} have come across a strange dungeon with a heart symbol on the door. They ignore all common sense and venture inside. Flowers and chocolates abound. There is a romcom playing somewhere in the dungeon. Huh. Oh shit, what is ${Quest.DENIZEN} doing here!?","Slaying the ${Quest.DENIZEN} proves to be the thing that finally pushes the ${Quest.PLAYER1} and ${Quest.PLAYER2} together.","The ${Quest.PLAYER1} and ${Quest.PLAYER2} are stubbornly refusing this ship by getting their asses handed to them by the ${Denizen}.")
      ], new FlushedRomanceReward(), QuestChainFeature.twoPlayers), Feature.WAY_HIGH)
        , Theme.HIGH);

    addTheme(new Theme(<String>["Quests","Hunger","Sympathy", "Highways", "Gas Stations"])
      ..addFeature(FeatureFactory.CONTEMPLATATIVEFEELING, Feature.HIGH)
      ..addFeature(FeatureFactory.WHISTLINGGSOUND, Feature.LOW)
      ..addFeature(FeatureFactory.SWEATSMELL, Feature.MEDIUM)

      ..addFeature(new PostDenizenQuestChain("Make the Journey", [
        new Quest("In the wake of the defeat of the ${Quest.DENIZEN} it becomes really how isolated the individual ${Quest.CONSORT} villages are. No ${Quest.CONSORT} has made a journey longer than a day in generations. The ${Quest.PLAYER1} does not stand for this."),
        new Quest("The ${Quest.PLAYER1} is working hard to restore roads to working order. Their journies get longer and longer. "),
        new Quest("All those hours of hard work have paid off; the ${Quest.PLAYER1} has managed to visit every ${Quest.CONSORT} village in a single journey. The consorts are inspired, and several ${Quest.CONSORT} children have been inspired to make such a journey in the future.")
      ], new FraymotifReward("Marathon", "No matter how you attempt to avoid the ${Fraymotif.OWNER} away, they'll search until they find you."), QuestChainFeature.playerIsHelpfulClass), Feature.HIGH)


      ..addFeature(new DenizenQuestChain("Make the Waystations", [
        new Quest("The ${Quest.PLAYER1} learns that the route between two ${Quest.CONSORT} cities is run down and unusable. This makes the journey harsh and unforgiving. The cities have minimal contact now."),
        new Quest("The ${Quest.PLAYER1} begins to create comfortable rest stops along the route, making the journey safer. A few brave consorts attempt the journey."),
        new Quest("In a dramatic reveal, the ${Quest.PLAYER1} discovers that ${Quest.DENIZEN} destroyed the route. There used to be rest stops and regular transportation, but all of it was crushed long ago. The Denizen must be defeated!"),
        new DenizenFightQuest("The ${Quest.PLAYER1} confronts ${Quest.DENIZEN}. The beast admits to destroying the route, and reveals that it intends to destroy the Hero's work. Will the ${Quest.PLAYER1} be able to defend themself?", "The ${Quest.DENIZEN} lies slain by the ${Quest.PLAYER1}'s ${Quest.WEAPON}. The route is safe and consorts move along it regularly. The cities are connected!","The destruction of ${Quest.DENIZEN} continues with the defeat of the ${Quest.PLAYER1}.")
      ], new DenizenReward(), QuestChainFeature.defaultOption), Feature.WAY_LOW)
        , Theme.HIGH); // end theme
  }

}
