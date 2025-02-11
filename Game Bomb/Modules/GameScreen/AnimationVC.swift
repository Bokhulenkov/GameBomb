//
//  Animation.swift
//  Game Bomb
//
//  Created by Александр Семёнов on 11.02.2025.
//



import UIKit
import DotLottie

class AnimationViewController: UIViewController {
    // Создаем экземпляр DotLottieAnimation
    var animation: DotLottieAnimation?
    private var animationView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        // Загружаем анимацию
        loadAnimation()
    }

    private func loadAnimation() {

        // Создаем анимацию
        animation = DotLottieAnimation(webURL: "https://lottie.host/283b3c79-ebb6-4439-a235-5b54cc15f7ad/zlrIDXcPgo.lottie", config: AnimationConfig(autoplay: true, loop: false))

        // Создаем UIView для отображения анимации
        animationView = animation?.view()

        // Добавляем анимацию на экран
        if let animationView = animationView {
            view.addSubview(animationView)
            animationView.translatesAutoresizingMaskIntoConstraints = false

            // Устанавливаем констрейнты
            NSLayoutConstraint.activate([
                animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                animationView.topAnchor.constraint(equalTo: view.topAnchor),
                animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        } else {
            print("Failed to create Lottie view")
        }
    }
}

