//
//  ViewController.swift
//  Destini
//
//  Created by VASILY IKONNIKOV on 12.04.2023.
//

import UIKit

class ViewController: UIViewController {

	var storyBrain = StoryBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		setBackgroundConstraints()
		setStackViewConstraints()
		setButtonConstraints()
		updateUI()
	}
	
	@objc func choiceMade(_ sender: UIButton) {
		guard let answer = sender.currentTitle else { return }
		storyBrain.nextStory(userChoice: answer)
		updateUI()
		
	}
	
	func updateUI() {
		let storyNumber = storyBrain.storyLine
		let story = storyBrain.stories
		storyText.text = story[storyNumber].title //storyBrain.stories[storyNumber].title
		answerOne.setTitle(story[storyNumber].choice1, for: .normal)
		answerTwo.setTitle(story[storyNumber].choice2, for: .normal)
		if answerOne.currentTitle == "The End" {
			answerTwo.isHidden = true
		} else {
			answerTwo.isHidden = false
		}
	}
	
	//MARK: - views
	
	lazy var answerOne = createButton(imageName: "choice1Background")
	lazy var answerTwo = createButton(imageName: "choice2Background")
	
	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.spacing = 10
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var background: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "background")
		imageView.image = image
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var storyText: UILabel = {
		let label = UILabel()
		label.text = "Test text"
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	func createButton(imageName: String) -> UIButton {
		let button = UIButton()
		let image = UIImage(named: imageName)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
		button.setBackgroundImage(image, for: .normal)
		button.layer.cornerRadius = 20
		button.addTarget(
			self,
			action: #selector(choiceMade),
			for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}
	
	// MARK: - Add view to subview
	func addSubviews() {
		view.addSubview(background)
		view.addSubview(stackView)
		stackView.addArrangedSubview(storyText)
		stackView.addArrangedSubview(answerOne)
		stackView.addArrangedSubview(answerTwo)
	}
	
	// MARK: - Constraints
	func setBackgroundConstraints() {
		NSLayoutConstraint.activate([
			background.topAnchor.constraint(equalTo: view.topAnchor),
			background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setStackViewConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func setButtonConstraints() {
		NSLayoutConstraint.activate([
			answerOne.heightAnchor.constraint(equalToConstant: 100),
			answerTwo.heightAnchor.constraint(equalToConstant: 100),
		])
	}
}

