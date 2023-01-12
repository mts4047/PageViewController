//
//  PageControllerHWVC.swift
//  PageViewController
//
//  Created by Myo Thandar soe on 12/01/2023.
//

import UIKit

struct PageObj {
    let text: String
    let color: UIColor
    let image: UIImage?
}

class PageControllerHWVC: UIViewController {
    
    
    var controllers: [UIViewController] = [UIViewController]()
    
    var pages: [PageObj] = [
        PageObj(text: "Chapter - 1", color: .systemPink, image: UIImage(named: "puppy.jpeg")),
        PageObj(text: "Chapter - 2", color: .green, image: UIImage(named: "puppy.jpeg")),
        PageObj(text: "Chapter - 3", color: .red, image: UIImage(named: "puppy.jpeg"))
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for item in pages {
            let vc = TextVC(with: item.text, bgColor: item.color, chImage: item.image!)
            controllers.append(vc)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.presentPageVC()
        })
    }
    
    
    
    func presentPageVC() {
        guard let first = controllers.first else {return}
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        pageVC.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        pageVC.modalPresentationStyle = .fullScreen
        present(pageVC, animated: true)
    }
    

}

extension PageControllerHWVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        return controllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil }
        let after = index + 1
        return controllers[after]
    }
    
    
}
