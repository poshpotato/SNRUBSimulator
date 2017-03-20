//okay, fine, yes, global variables are getting untenable.
function Session(session_id){
	this.session_id = session_id; //initial seed
	this.players = [];
	this.availa
	this.guardians = [];
	this.kingStrength = 100;
	this.queenStrength = 100;
	this.jackStrength = 50;
	this.hardStrength = 275;
	this.democracyStrength = 0;
	this.reckoningStarted = false;
	this.ectoBiologyStarted = false;
	this.doomedTimeline = false;
	this.scratched = false;
	this.timeTillReckoning = getRandomInt(10,30);
	this.sessionType = Math.seededRandom();;
	this.scenesTriggered = []; //this.scenesTriggered
	this.doomedTimelineReasons = [];
	this.currentSceneNum = 0;
	this.scenes = []; //scene controller initializes all this.
	this.reckoningScenes = [];
	this.deathScenes = [];
	this.available_scenes = [];
	this.availablePlayers = [];  //which players are available for scenes or whatever.

	
	this.makePlayers = function(){
		this.players = [];
		available_classes = classes.slice(0); //re-initPlayers available classes.
		available_aspects = nonrequired_aspects.slice(0);
		var numPlayers = getRandomInt(2,12);
		this.players.push(randomSpacePlayer());
		this.players.push(randomTimePlayer());

		for(var i = 2; i<numPlayers; i++){
			this.players.push(randomPlayer());
		}

		for(var j = 0; j<this.players.length; j++){
			var p = this.players[j];
			this.decideTroll(p);
			p.generateRelationships(this.players);
			if(p.isTroll){
				p.quirk = randomTrollSim(p)
			}else{
				p.quirk = randomHumanSim(p);
			}
		}
	}
	
	this.makeGuardians = function(){
		this.guardians = [];
		//console.log("Making guardians")
		available_classes = classes.slice(0);
		available_aspects = nonrequired_aspects.slice(0); //required_aspects
		available_aspects = available_aspects.concat(required_aspects.slice(0));
		for(var i = 0; i<this.players.length; i++){
			  var player = this.players[i];
				//console.log("guardian for " + player.titleBasic());
				var guardian = randomPlayer();
				guardian.isTroll = player.isTroll;
				if(guardian.isTroll){
					guardian.quirk = randomTrollSim(guardian)
				}else{
					guardian.quirk = randomHumanSim(guardian);
				}
				guardian.quirk.favoriteNumber = player.quirk.favoriteNumber;
				guardian.bloodColor = player.bloodColor;
				guardian.lusus = player.lusus;
				if(guardian.isTroll == true){ //trolls always use lusus.
					guardian.kernel_sprite = player.kernel_sprite;
				}
				guardian.hairColor = player.hairColor;
				guardian.aspect = player.aspect;
				guardian.leftHorn = player.leftHorn;
				guardian.rightHorn = player.rightHorn;
				guardian.level_index = 5; //scratched kids start more leveled up
				guardian.power = 50;
				guardian.leader = player.leader;
				if(Math.seededRandom() >0.5){ //have SOMETHING in common with your ectorelative.
					guardian.interest1 = player.interest1;
				}else{
					guardian.interest2 = player.interest2;
				}
				guardian.reinit();//redo levels and land based on real aspect
				this.guardians.push(guardian);
		}

		for(var j = 0; j<this.guardians.length; j++){
			var g = this.guardians[j];
			g.generateRelationships(this.guardians);
		}
	}
	
	this.randomizeEntryOrder = function(){
		this.players = shuffle(this.players);
		this.players[0].leader = true;
	}
	
	this.decideTroll = function decideTroll(player){
		if(this.getSessionType() == "Human"){
			return;
		}

		if(this.getSessionType() == "Troll" || (this.getSessionType() == "Mixed" &&Math.seededRandom() > 0.5) ){
			player.isTroll = true;
			player.triggerLevel ++;//trolls are less stable
			player.decideHemoCaste(player);
			player.decideLusus(player);
			player.kernel_sprite = player.lusus;
		}
	}

	
	this.getSessionType = function(){
		if(this.sessionType > .6){
			return "Human"
		}else if(this.sessionType > .3){
			return "Troll"
		}
		return "Mixed"
	}

	
	this.newScene = function(){
		this.currentSceneNum ++;
		var div = "<div id='scene"+this.currentSceneNum+"'></div>";
		$("#story").append(div);
		return $("#scene"+this.currentSceneNum);
	}
	
	this.summarize = function(scratchAvailable){
		var strongest = findStrongestPlayer(this.players)
		var str = "<Br><hr><a href = 'index2.html?seed="+ initial_seed +"'>Session: " + initial_seed + "</a> scenes: " + this.scenesTriggered.length + " Leader:  " + getLeader(this.players).title() + " MVP: " + strongest.htmlTitle()+ " with a power of: " + strongest.power;;
		if(scratchAvailable){
			str += "<b>&nbsp&nbsp&nbsp&nbspScratch Available</b>"
		}
		var tmp = "";
		tmp =  summarizeScene(this.scenesTriggered, "DoEctobiology")
		if(findSceneNamed(this.scenesTriggered,"DoEctobiology") != "No"){
			timesEcto ++;
		}
		str += tmp;

		tmp =  summarizeScene(this.scenesTriggered, "FaceDenizen")
		if(findSceneNamed(this.scenesTriggered,"FaceDenizen") != "No"){
			timesDenizen ++;
		}
		str += tmp;

		
		tmp =  summarizeScene(this.scenesTriggered, "PlanToExileJack")
		if(findSceneNamed(this.scenesTriggered,"PlanToExileJack") != "No"){
			timesPlanExileJack ++;
		}
		str += tmp;
		
		tmp =  summarizeScene(this.scenesTriggered, "ExileJack")
		if(findSceneNamed(this.scenesTriggered,"ExileJack") != "No"){
			timesExileJack ++;
		}
		str += tmp;


		tmp =  summarizeScene(this.scenesTriggered, "ExileQueen")
		if(findSceneNamed(this.scenesTriggered,"ExileQueen") != "No"){
			timesExileQueen ++;
		}
		str += tmp;


		tmp =  summarizeScene(this.scenesTriggered, "GiveJackBullshitWeapon")
		if(findSceneNamed(this.scenesTriggered,"GiveJackBullshitWeapon") != "No"){
			timesJackWeapon ++;
		}
		str += tmp;

		tmp =  summarizeScene(this.scenesTriggered, "JackBeginScheming")
		if(findSceneNamed(this.scenesTriggered,"JackBeginScheming") != "No"){
			timesJackScheme ++;
		}
		str += tmp;


		tmp =  summarizeScene(this.scenesTriggered, "JackPromotion")
		if(findSceneNamed(this.scenesTriggered,"JackPromotion") != "No"){
			timesJackPromotion ++;
		}
		str += tmp;

		tmp =  summarizeScene(this.scenesTriggered, "JackRampage")
		if(findSceneNamed(this.scenesTriggered,"JackRampage") != "No"){
			timesJackRampage ++;
		}
		str += tmp;


		tmp =  summarizeScene(this.scenesTriggered, "KingPowerful")
		if(findSceneNamed(this.scenesTriggered,"KingPowerful") != "No"){
			timesKingPowerful ++;
		}
		str += tmp;

		tmp =  summarizeScene(this.scenesTriggered, "QueenRejectRing")
		if(findSceneNamed(this.scenesTriggered,"QueenRejectRing") != "No"){
			timesQueenRejectRing ++;
		}
		str += tmp;


	  //stats for this will happen in checkDoomedTimeLines
		str += summarizeScene(this.scenesTriggered, "SaveDoomedTimeLine") + this.doomedTimelineReasons;

		tmp =  summarizeScene(this.scenesTriggered, "StartDemocracy")
		if(findSceneNamed(this.scenesTriggered,"StartDemocracy") != "No"){
			timesDemocracyStart ++;
		}
		str += tmp;
		
		tmp =  summarizeScene(this.scenesTriggered, "EngageMurderMode")
		if(findSceneNamed(this.scenesTriggered,"EngageMurderMode") != "No"){
			timesMurderMode ++;
		}
		str += tmp;
		
		tmp =  summarizeScene(this.scenesTriggered, "GoGrimDark")
		if(findSceneNamed(this.scenesTriggered,"GoGrimDark") != "No"){
			timesGrimDark ++;
		}
		str += tmp;
		
		var spacePlayer = findAspectPlayer(this.players, "Space");
		var result = "No Frog"
		
		if(spacePlayer.landLevel >= 6){
			if(spacePlayer.landLevel < 8){
				timesSickFrog ++;
				
			}else{
				timesFullFrog ++;
				result = "Sick Frog"
			}
		}else{
			timesNoFrog ++;
		}
		totalFrogLevel += spacePlayer.landLevel;
		str += "<br>&nbsp&nbsp&nbsp&nbspFrog Breeding: " + result +  " (" + spacePlayer.landLevel +")"

		checkDoomedTimelines();
		return(str)
		
	}
}

function summarizeScene(scenesTriggered, str){
	return "<br>&nbsp&nbsp&nbsp&nbsp" +str + " : " + findSceneNamed(scenesTriggered,str)
}

function findSceneNamed(scenesToCheck, name){
	for(var i = 0; i<scenesToCheck.length; i++){
		if(scenesToCheck[i].constructor.name == name){
			return scenesToCheck[i];
		}
	}
	return "No"
}