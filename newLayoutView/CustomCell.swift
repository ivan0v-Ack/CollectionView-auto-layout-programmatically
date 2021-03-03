//
//  CustomCell.swift
//  newLayoutView
//
//  Created by Ivan Ivanov on 3/3/21.
//

import UIKit

class CusomCell: UICollectionViewCell {
    
    var pages: Pages? {
        didSet{
            guard let CheckedPages = pages else {return}
            
            imageView.image = CheckedPages.image
            
            let attributedText = NSMutableAttributedString(string: CheckedPages.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(CheckedPages.text)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            textField.attributedText = attributedText
            textField.textAlignment = .center
        }
    }
    
    static let identifier = "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [wrapperView,textField].forEach({addSubview($0)})
        setItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var wrapperView:UIView = {
        let view = UIView()
//view.backgroundColor = .blue
        return view
    }()
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        return image
    }()
    
    private lazy var textField: UITextView = {
        let text = UITextView()
        
        let atributedText = NSMutableAttributedString(string: "Some Label", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        
        atributedText.append(NSAttributedString(string: "\n\n\njasjsajsdajdajdjadkja", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        text.attributedText = atributedText
        
        return text
    }()
    
    func setItems(){
        
        wrapperView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, centerX: nil, centerY: nil)
        wrapperView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true

        wrapperView.addSubview(imageView)
        imageView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: wrapperView.centerXAnchor, centerY: wrapperView.centerYAnchor)
        imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor, multiplier: 0.5).isActive = true
       
        textField.anchor(top: wrapperView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, centerX: nil, centerY: nil,padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
    }
}
