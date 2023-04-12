//
//  StoryBrain.swift
//  Destini
//
//  Created by VASILY IKONNIKOV on 12.04.2023.
//

import Foundation

struct StoryBrain {
	var storyLine = 0

	let stories = [
//		Story(title: "You can see a fork in the road", choice1: "Take a left.", choice2: "Take a right."),
//		Story(title: "You see a tiger", choice1: "Shout for help.", choice2: "Play dead."),
//		Story(title: "You find a treasure", choice1: "Open it.", choice2: "Check for traps."),
		
		Story(title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?\".",
			  choice1: "I'll hop in. Thanks for the help!",
			  choice2: "Well, I don't have many options. Better ask him if he's a murderer.",
			  destination1: 1,
			  destination2: 2),
		Story(title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
			  choice1: "I love Elton John! Hand him the cassette tape.",
			  choice2: "It’s him or me. Take the knife and stab him.", destination1: 3, destination2: 4),
		Story(title: "He nods slowly, unphased by the question.",
			  choice1: "At least he's honest. I'll climb in.",
			  choice2: "Wait, I know how to change a tire.", destination1: 1, destination2: 5),
		Story(title: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"",
			  choice1: "The End",
			  choice2: "",
			  destination1: 0,
			  destination2: 0),
		Story(title: " As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
			  choice1: "The End",
			  choice2: "",
			 destination1: 0,
			 destination2: 0),
		Story(title: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?",
			  choice1: "The End",
			  choice2: "",
			  destination1: 0,
			  destination2: 0)
	]
	
	mutating func nextStory(userChoice: String) {
		if userChoice == stories[storyLine].choice1 {
			storyLine = stories[storyLine].destination1
		} else if userChoice == stories[storyLine].choice2 {
			storyLine = stories[storyLine].destination2
		}
	}
	
	func getStoryText() -> String {
		stories[storyLine].title
	}
	
	func getAnswer1() -> String {
		stories[storyLine].choice1
	}
	
	func getAnswer2() -> String {
		stories[storyLine].choice2
	}
}
