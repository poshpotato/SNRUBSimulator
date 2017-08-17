import "../../GameEntity.dart";
import "Interest.dart";


class Domestic extends InterestCategory {

    @override
    List<AssociatedStat> stats = new List<AssociatedStat>.unmodifiable(<AssociatedStat>[new AssociatedStat("sanity", 1, true), new AssociatedStat("RELATIONSHIPS", 1, true)]);
    @override
    List<String> handles1 = <String>["home", "motherly", "patient", "missing", "knitting", "rising", "stylish", "trendy", "homey", "baking", "recipe", "meddling", "mature"];

    @override
    List<String> handles2 = <String>["Baker", "Darner", "Mender", "Mentor", "Launderer", "Vegetarian", "Tailor", "Teacher", "Hestia", "Helper", "Decorator", "Sewer"];


    Domestic() :super(8, "Domestic", "domestic", "boring");

}