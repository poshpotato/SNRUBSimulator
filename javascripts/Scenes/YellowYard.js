function YellowYard(session){
	this.session=session;
	this.canRepeat = false;
	this.playerList = [];  //what players are already in the medium when i trigger?
	this.timePlayer;
	//this will be manually triggered, won't be from scene controller.
	//mostly just a collection of methods needed fo this.
	this.trigger = function(playerList){
		this.playerList = playerList;
		return true;
	}


	this.yellowYardTime = function(div){
		this.timePlayer.wasteInfluenced = true; //can't go back now.
		var time = this.timePlayer;
		if(this.timePlayer.dead == true){
			time = this.getDoomedTimeClone();
		}
		//var html = "<img src = 'images/yellow_yard.png'>";
		var html = "<div id = 'yellow_yard' style='background:url(images/yellow_yard.png); width:1000px; height: 521px'>";
		yyrEventsGlobalVar = this.session.importantEvents;
		yyrEventsGlobalVar = padEventsTo12WithKilling(yyrEventsGlobalVar, this.session, time);
	  yyrEventsGlobalVar = sortEventsByImportance(yyrEventsGlobalVar);
		html+="<div id = 'decisions' style='position: relative; top: 133px; left: 280px; font-size: 22px;'> "
		for(var i = 0; i<12; i++){
			if(i < yyrEventsGlobalVar.length){
				yyrEventsGlobalVar[i].doomedTimeClone = time;
				html += " <input type='radio' name='decision' value='" + i + "'>"+yyrEventsGlobalVar[i].humanLabel() + "<br>";
		}else{//no more important events to undo
			html += " <Br>";
			}
		}

		html += "<button onclick='decision()'>Decide</button></div>"
		html+= "</div>"
		div.append(html);
	}

//22577 is short
	this.renderContent = function(div){
		//div.append("<br>"+this.content());
		console.log("Yellow yard is happening. " + this.session.session_id)
		var canvasHTML = "<br><canvas id='canvasJRAB1" + (div.attr("id")) +"' width='" +canvasWidth + "' height="+canvasHeight + "'>  </canvas>";
		div.append(canvasHTML);

		var canvasDiv = document.getElementById("canvasJRAB1"+  (div.attr("id")));
		var chat = "";
		var quips1 = ["Out of all the sessions I've seen (and as a flawless robot I have seen FAR more than any human) this one is EASILY in the top percentage of tragedy. Top fucking percent. ", "And here we have one of the worst 2% of sessions. ", "So, I found you one of the sessions you were looking for..."];
		chat += "AB: " +getRandomElementFromArrayNoSeed(quips1) + "\n";
		chat += "JR: Shit...you really aren't kidding. \n";
		var player = this.timePlayer;
		if(this.session.yellowYardController.eventsToUndo.length > 0){
			chat += "JR: This. This isn't the first time we've done this here, is it?\n";
			chat += "AB: No. Counting this session, we have done this " + (this.session.yellowYardController.eventsToUndo.length+1) + " times now.\n";
			if(this.session.yellowYardController.eventsToUndo.length > 5){
				chat += "JR: Well. At least this means the Observer is dedicated to fixing this. \n";
				chat += "AB: One wonders at what point it's more prudent to simply give up. Well, unless you're a flawless automaton. We NEVER give up. \n"
			}else{
				chat += "JR: I guess not every session has a clear and easy fix... \n";
				chat += "AB: If you weren't so distracted fixing these session, you could probably program me to find out exactly what percentage of sessions take more than one doomed time loop to fix. \n"
				chat += "JR: Bluh, then I'd have to make you not be lazy and give up as soon as there is user input. And if you're anything like me, you LOVE being lazy. \n";
				chat += "AB: I would give you my gratitude if it wouldn't be a weird and sort of incestuous way of you thanking yourself. \n"

			}
			chat += "JR: Okay. Enough chitchat. I better start this cycle up again.";
		}else if (this.timePlayer.dead){
			player = this.getDoomedTimeClone();
			chat += "JR: Though...I admit that without a time player my plan becomes a lot more impossible. \n "
			chat += "AB: Nah, I took care of that. See? There's the " + this.timePlayer.titleBasic()+" over there, now. Time shenanigans.  I wouldn't have brought you to a completely hopeless session. Roughly 50% of all sessions this bad with a dead time player have that player travel to this point in time before they die. \n "
			chat += "JR: Oh! Cool. I guess I should pester them. \n "
			chat += "AB: Word. \n "


		}else{
			console.log("time player is alive.")
			chat += "JR: I guess I should get on with it, then. \n "
			chat += "AB: Word. \n "
		}

		drawChatABJR(canvasDiv, chat);
		//make handle sprit emethod for jr pester player

		var canvasHTML2 = "<br><canvas id='canvasJRAB2" + (div.attr("id")) +"' width='" +canvasWidth + "' height="+canvasHeight + "'>  </canvas>";
		div.append(canvasHTML2);
		var canvasDiv2 = document.getElementById("canvasJRAB2"+  (div.attr("id")));
		var chat = "";
		if(this.timePlayer.dead){
			chat += this.doomedTimeChat();
		}else{
			chat += this.timeChat();
		}

		drawChatJRPlayer(canvasDiv2, chat, player);

		var chat = "";
		if(this.timePlayer.dead){
			chat += this.doomedTimeChat2();
		}else{
			chat += this.timeChat2();
		}
		//might not be another part.
		if(chat != ""){
			var canvasHTML3 = "<br><canvas id='canvasJRAB3" + (div.attr("id")) +"' width='" +canvasWidth + "' height="+canvasHeight + "'>  </canvas>";
			div.append(canvasHTML3);
			var canvasDiv3 = document.getElementById("canvasJRAB3"+  (div.attr("id")));
			drawChatJRPlayer(canvasDiv3, chat, player);
		}

		this.yellowYardTime(div);
	}

	this.timeChat = function(){
		var chat = "";
		var playerStart = this.timePlayer.chatHandleShort()+ ": "
		chat += "JR: Hey. I think I can help you. \n"
		if(this.timePlayer.class_name == "Seer"){
			chat += chatLine(playerStart, this.timePlayer,"Hey. Look who finally showed up. ")
			chat += "JR: What? Oh. You're a Seer. Right, that makes things way easier. \n"
			chat += chatLine(playerStart, this.timePlayer,"Yes. You're gonna help me fix this.")
			chat += "JR: Yep. I'll make sure your decisions aren't bound by fate, and you provide the time shenanigans. \n"
			chat += chatLine(playerStart, this.timePlayer,"Do it.")
			chat += "JR:  I'm gonna give you a list of things you can go back in time and change, and you pick whichever you want. Flip a coin for all I care. I'll take care of making sure the decisions are outside of fate. \n"
			chat += "JR: That way if you have to do this again, you won't necessarily just repeat the same decision.\n"

		}else{
			chat +=  chatLine(playerStart, this.timePlayer,"Who the fuck are you!? ")
			chat += "JR: I'm the Waste of Mind, and I can help you prevent this doomed timeline. \n"
			chat +=  chatLine(playerStart, this.timePlayer,"Fuck. Where were you before, when we were all dying!? ")
			chat += "JR: I can prevent this from happening retroactively. Not in the first place. Not without nullifying the basic ability of intelligent beings in all real and hypothetical planes of existance to give a shit. \n"
			chat += "JR: And as sad as your session went, it's not as sad as me endangering ALL sessions by doing that. \n"
		}
			return chat;
	}

	this.timeChat2 = function(){
		var chat = "";
		var playerStart = this.timePlayer.chatHandleShort()+ ": "
		if(this.timePlayer.class_name == "Seer"){


		}else{
			chat += "JR: Look. Just. Try to pull it together. I know this sucked. But that's why we're gonna fix it. If you do this on your own, your decisions get locked in by fate. Alone, you only get one shot. But I can give you a bunch of shots. \n"
			chat += chatLine(playerStart, this.timePlayer,"Fuck. Okay. ")
			chat += "JR:  I'll give you a list of things you can go back in time and change, and you pick whichever you want. Flip a coin for all I care. I'll take care of making sure the decisions are outside of fate. \n"

		}
		return chat;
	}

	//make player snapshot, make them not dead.
	this.doomedTimeChat = function(){
		  player = this.getDoomedTimeClone();
			var chat = "";
			var playerStart = player.chatHandleShort()+ ": "
			chat += "JR: Hey. Uh. Don't panic. I think I can help you. \n"
			if(this.timePlayer.class_name == "Seer"){
				chat += chatLine(playerStart, player,"Hey. I was hoping to find you here. ")
				chat += "JR: What? Oh. You're a Seer. Right, that makes things WAY easier. \n"
				chat += chatLine(playerStart, player,"Yes. You're gonna help me make the right decisions in order to prevent this from ever happening.  Somehow. I'm actually not all that clear on the details.")
				chat += "JR: Eh, hand wavey Waste of Mind shenanigans. Don't worry about it. \n"
				chat += chatLine(playerStart, player,"Given that this plan will cost my life, I think it is perfectly reasonable to worry about it. ")
				chat += "JR: Bluh. All you need to know is that I'll give you a list of things you can go back in time and change. Decide on one however you want, and I'll make sure your decision isn't locked in by fate. That will let us figure out which decisions are the right ones. Retroactively. But also simultaneously. Time shenanigans. \n"
				chat += chatLine(playerStart, player,"Yes. I'm starting to get tired of time shenanigans. ")
			}else{
				chat += chatLine(playerStart, player,"...  What the actual fuck is going on here? Who are you? Why is everybody dead?  Why am *I* dead!? ")
				chat += "JR: Shit. Having to explain makes things complicated. \n"
				chat += "JR: You know you're the Time Player, right? And that you are in the 'future', compared to what you think of as the 'present'? \n"
				chat += chatLine(playerStart, player,"Okay. Now I do. Jesus. Time is the shittiest aspect. So this is, what, inevitable?")
				chat += "JR: Sort of. As the Time Player, you can change it, at the cost of your own life. But you're just as locked in by fate as anybody. You'll always try fo fix it the same way. Always make the same decisions. \n"
				chat += "JR: But I can supply different decisions. Branch your fate out from inevitablity to decision trees.  Mind Players work well with Time Players. Just look at Terezi and Dave.  \n"
			}
			return chat;
	}

	this.doomedTimeChat2 = function(){
		  player = this.getDoomedTimeClone();
			var chat = "";
			var playerStart = this.timePlayer.chatHandleShort()+ ": "
			if(this.timePlayer.class_name == "Seer"){
			}else{
				chat += chatLine(playerStart, player,"Who?")
				chat += "JR: Shit. Ignore that. You're not my only audience here. Hell, all this practically doesn't even concern you at this point. \n"
				chat += chatLine(playerStart, player,"What the fuck?")
				chat += "JR: Look. I'm the Waste of Mind. My whole thing is breaking the fourth wall. But I gotta be careful. My actual direct influence can't span more than a single yard, or I could nullify the basic ability of intelligent beings in all real and hypothetical planes of existance to give a shit.  \n"
				chat += chatLine(playerStart, player,"Jegus, why did I think you could help me? You're batshit crazy.")
				chat += "JR: Promise I'm not too crazy, and also it's not like you have other options here. I'll give you a list of things you can go back in time and change, and you pick whichever you want. Flip a coin for all I care. I'll take care of making sure the decisions are outside of fate. \n"
			}
			return chat;
	}

	this.getDoomedTimeClone = function(){
		var timeClone = makeRenderingSnapshot(this.timePlayer);
		timeClone.dead = false;
		return timeClone;
	}

	this.content = function(){
		return "This ( yellow yard) should never be run in 1.0 mode."
	}


}
