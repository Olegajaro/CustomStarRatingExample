//
//  ViewController.swift
//  CustomStarRatingExample
//
//  Created by Олег Федоров on 22.01.2022.
//

import UIKit
import Cosmos

class ViewController: UIViewController {
        
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
//        view.settings.updateOnTouch = false
        view.settings.filledImage = UIImage(
            named: "RatingStarFilled"
        )?.withRenderingMode(.alwaysOriginal)
        view.settings.emptyImage = UIImage(
            named: "RatingStarEmpty"
        )?.withRenderingMode(.alwaysOriginal)
        
        view.settings.totalStars = 10
        view.settings.starSize = 20
        view.settings.starMargin = 4
        view.settings.fillMode = .precise
        
        view.text = "Rate me"
        view.settings.textColor = .red
        view.settings.textMargin = 10
        
        return view
    }()
    
    var ratingLabel = UILabel()
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        test()
    }
}

extension  ViewController {
    private func style() {
        view.backgroundColor = .white
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.rating = StorageManager.rating
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        ratingLabel.text = "Rating: \(String(format: "%.2f", cosmosView.rating))"
    }
    
    private func layout() {
        view.addSubview(cosmosView)
        view.addSubview(ratingLabel)
        
        cosmosView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cosmosView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingLabel.topAnchor.constraint(
            equalTo: cosmosView.bottomAnchor, constant: 30
        ).isActive = true
    }
    
    private func test()  {
        cosmosView.didFinishTouchingCosmos = { rating in
            
            StorageManager.rating = rating
            self.ratingLabel.text = "Rating: \(String(format: "%.2f", rating))"
            self.cosmosView.rating = StorageManager.rating
        }
    }
}
