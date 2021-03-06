import "../../../../SBURBSim.dart";
import 'dart:html';

//has no sub form, just exists
class TargetHasTimeClones extends TargetConditionLiving {
    @override
    String name = "hasTimeClones";

    Item crown;

    @override
    String get importantWord => "N/A";

    @override
    String descText = "<b>Has Timeclones:</b><br>Target Entity must have time clones to help them in fights.<br><br>";
    @override
    String notDescText = "<b>Has No Timeclones:</b><br>Target Entity must be NOT have any Time Clones. <br><br>";

    //strongly encouraged for this to be replaced
    //like, "An ominous 'honk' makes the Knight of Rage drop the Juggalo Poster in shock. With growing dread they realize that shit is about to get hella rowdy, as the Mirthful Messiahs have rolled into town.

    TargetHasTimeClones(SerializableScene scene) : super(scene){
    }




    @override
    TargetCondition makeNewOfSameType() {
        return new TargetHasTimeClones(scene);
    }

    @override
    void syncFormToMe() {
        syncFormToNotFlag();
    }

    @override
    void syncToForm() {
        syncNotFlagToForm();
        scene.syncForm();
    }
    @override
    void copyFromJSON(JSONObject json) {
        //nothing to do
    }

    @override
    bool conditionForFilter(GameEntity actor, GameEntity item) {
        return item.doomedTimeClones.isEmpty;
    }
}