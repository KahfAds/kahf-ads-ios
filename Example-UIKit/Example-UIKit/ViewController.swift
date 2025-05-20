//
//  ViewController.swift
//  Example-UIKit
//
//  Created by MD RUBEL on 5/16/25.
//

import UIKit
import Combine
import KahfAdSDK

class ViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    
    private let adConfig = KahfAdConfig(
        adType: .BANNER_AD,
        divId: "under-saalat-time",
        screenName: "home-page-ios",
        autoHide: false
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        let adView = KahfAdProvider.shared.getUIView(for: adConfig)
        adView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(adView)
        
        NSLayoutConstraint.activate([
            adView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            adView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            adView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Must call this to get an ad.
        KahfAdProvider.shared.refreshAd(for: adConfig)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Stop refreshing the ad when the view disappears.
        KahfAdProvider.shared.stopAutoRefresh(for: adConfig)
    }
    
    private func setupBindings() {
        KahfAdProvider.shared.listener
            .receive(on: DispatchQueue.main)
            .sink { listener in
                // handle firebase log or othrer events here.
                switch listener {
                case .onAdLoaded:
                    print("Ad loaded successfully")
                    
                case .onAdFailedToLoad(let message):
                    print("Ad failed to load with message: \(String(describing: message))")
                    
                case .onAdClicked:
                    print("Ad clicked")
                    
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
}

