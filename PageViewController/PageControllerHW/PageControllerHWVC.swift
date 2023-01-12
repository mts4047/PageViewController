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
    let storyText: String
}

class PageControllerHWVC: UIViewController {
    
    
    var controllers: [UIViewController] = [UIViewController]()
    
    var pages: [PageObj] = [
        PageObj(text: "Story - 1", color: .systemMint, image: UIImage(named: "p1.jpeg"), storyText: "Once upon a time, there was a beautiful forest. There lived two trees, named Chintu and Pintu, who were brothers. Chintu and Pintu had many friends like the rabbit and his brothers, the group of monkeys, the family of birds, the Bunky bear and the wise old wolf.One day, all the friends were chatting. Suddenly Pintu saw a WOODCUTTER coming toward the forest. Pintu said “Hey look a WOODCUTTER is coming towards the forest! Run! Run!”chintu said to the animals. But no one ran. They said “You give us food, shelter, you give us fresh air to breathe. How can we leave you in danger and go?” Chintu and Pintu thanked them.”OK you all hide behind us” said the two brother trees."),
        PageObj(text: "Story - 2", color: .systemYellow, image: UIImage(named: "p2.jpeg"), storyText: "One day, all the friends were chatting. Suddenly Pintu saw a WOODCUTTER coming toward the forest. Pintu said “Hey look a WOODCUTTER is coming towards the forest! Run! Run!”chintu said to the animals. But no one ran. They said “You give us food, shelter, you give us fresh air to breathe. How can we leave you in danger and go?” Chintu and Pintu thanked them.”OK you all hide behind us” said the two brother trees. So the monkeys and the birds hid inside the leaves of the tree and the other animals hid behind the tree."),
        PageObj(text: "Story - 3", color: .systemCyan, image: UIImage(named: "p3.jpeg"), storyText: "Woodcutter was very confused because there were many trees to cut. Suddenly he saw Chintu and Pintu, the huge trees. He said “Be ready to be cut you trees.” The wise old wolf had already told his plan to animals. When the woodcutter came near the trees, the group of monkeys jumped on him and started imitating him, then the family of birds started pecking him, then the rabbit and his brothers started jumping around him and the Bunkey bear started roaring."),
        PageObj(text: "Story - 4", color: .systemTeal, image: UIImage(named: "p4.jpeg"), storyText: "When all animals were busy at their work, the wise old wolf ran to the lion king. The wise old wolf told the king what he had to do. So they ran to where all the animals were. The king roared and the woodcutter ran for his life. Chintu and Pintu said “thank you”."),
        PageObj(text: "Story - 5", color: .systemOrange, image: UIImage(named: "p5.jpeg"), storyText: "Later the woodcutter thought “I never thought that trees give animals so many things like food, shelter etc…” and decided not to cut trees.Friends this a message to not cut but plant more trees because there is less forest on our land and it is becoming less and less only. So please save forest.Moral of the Story: Save Tree, Save Forest, Think for the Nature. __END__"),
        PageObj(text: "Story - 6", color: .systemMint, image: UIImage(named: "p6.jpeg"), storyText: "In 2008, an article in Science1 argued that investments in hydrologic and other water planning need to account for anthropogenic climate change. For many involved in designing dams, dikes and water supply schemes the concept of accounting for climate change was new. In her compelling book Tree Story, Dr Valerie Trouet shows that in fact it was not new. "),
        PageObj(text: "Story - 7", color: .systemYellow, image: UIImage(named: "p7.jpeg"), storyText: "Already in 1976, dendrochronologists2 had used tree rings to reconstruct the Colorado River runoff record back to the year 1521. They found that the long-term average flow was more than 20% lower than the flow used for the allocation and division of the water that happened in 1922. They further found that the longest period of high flow in the 450-year record occurred in the early twentieth century, from 1907 to 1930, right when the 1922 agreement was drafted. The negotiators based their allocations on the couple of decades’ data that were available at the time, but that were not representative of long-term runoff."),
        PageObj(text: "Story - 8", color: .systemTeal, image: UIImage(named: "p8.jpeg"), storyText: "Notwithstanding its title,Tree Story is all about climate change and water. In the example above, tree rings were used to reconstruct the streamflow — both tree rings and streamflow are controlled by the same hydroclimatic factors, such as snowfall and evapotranspiration.In her very accessible book, Dr Trouet tells us how dendrochronology evolved into a primary tool for studying the interactions between trees, climate, water and humans. Generally speaking, in wet years, with lots of snow and rainfall, trees grow well and form wide rings. In dry years, they suffer and form narrow rings."),
        PageObj(text: "Story - 9", color: .systemOrange, image: UIImage(named: "p9.jpeg"), storyText: "By counting and combining this information with other (proxy) information, climatological records (tree-ring chronologies) have been established that are precise by the year and more than 10 000 years long. “The longest continuous tree-ring record, the German oak-pine chronology, covers the past 12 650 years without skipping a single year.”In a story line that follows her career from field work in Africa to research institutions in Switzerland and USA, the reader is taken on a journey through deserts, where trees are scarce but often old, along flooding rivers and changing hydrological regimes including mega-droughts that made ancient cultures disappear, to pirate ships that have benefited from a climatological optimum."),
        PageObj(text: "Story - 10", color: .systemMint, image: UIImage(named: "p10.jpeg"), storyText: "Trouet reveals how climate changes have impacted societies around the globe – including the Roman, Mongol and Khmer Empires, and how dendrochronology, together with hydrology and climatological teleconnections, has helped to discover these impacts. Many scales are covered: from wood cells smaller than the diameter of a strand of human hair to the winds that are triggered by the North Atlantic Oscillation. In passing we learn about the history of wood use and deforestation, big forest fires, and discover the provenance of old violins. Tree Story is a very timely book by a key scientist; its strong messages are based on high-level science, but it reads like a rollercoaster that is funny at times.")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        for item in pages {
            let vc = TextVC(with: item.text, bgColor: item.color, chImage: item.image!, myStoryText: item.storyText)
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
        let pageVC = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
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
