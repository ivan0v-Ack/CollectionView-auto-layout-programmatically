//
//  SwipeCollectionView.swift
//  newLayoutView
//
//  Created by Ivan Ivanov on 3/3/21.
//

import UIKit

class SwipeCollectionView: UICollectionViewController {
    
    var pages:[Pages] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
              collectionView.backgroundColor = UIColor.white
        pages = fetchData()
        collectionView.register(CusomCell.self, forCellWithReuseIdentifier: CusomCell.identifier)
        constraints()
        collectionView.isPagingEnabled = true
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.transform = CGAffineTransform(scaleX: 1, y: 1)
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .purple
        return pc
    }()
    
    private lazy var prevBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PREV", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.gray, for: .normal)
       btn.addTarget(self, action: #selector(prevHandle), for: .touchUpInside)
        return btn
    }()
    @objc func prevHandle(){
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = prevIndex 
    }
    
    private lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("NEXT", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.gray, for: .normal)
       btn.addTarget(self, action: #selector(nextHandle), for: .touchUpInside)
        return btn
    }()
    
    @objc func nextHandle(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextIndex
    }
    
    func constraints(){
        let stackView = UIStackView(arrangedSubviews: [prevBtn,pageControl,nextBtn])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil, size: .init(width: 0, height: 50))
    }
    
   
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: {(_) in
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
                
            }else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: nil)
    }

   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CusomCell.identifier, for: indexPath) as! CusomCell
        cell.pages = pages[indexPath.item]
      //  cell.backgroundColor = indexPath.item % 2  == 0 ? .red : .green
        return cell
    }
    
   
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Clicked")
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
}

extension SwipeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
}

