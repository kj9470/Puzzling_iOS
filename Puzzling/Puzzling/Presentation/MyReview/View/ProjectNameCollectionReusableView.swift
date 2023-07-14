//
//  ProjectNameCollectionReusableView.swift
//  Puzzling
//
//  Created by Minjoo Kim on 2023/07/14.
//

import UIKit

import SnapKit
import Then

protocol buttonTappedProtocol: AnyObject {
    func passButtonEvent()
}

final class ProjectNameCollecionReusableView: UICollectionReusableView {
    
    weak var delegate: buttonTappedProtocol?
    
    let button = UIButton()
    private let projectNameLabel = UILabel()
    private let chevronDownImageView = UIImageView()

    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setAddTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension ProjectNameCollecionReusableView {
    
    private func setUI() {
        button.do {
            $0.makeRounded(radius: 16)
            $0.backgroundColor = .background050
        }
        
        projectNameLabel.do {
            $0.font = .fontGuide(.body1_bold_kor)
            $0.sizeToFit()
        }
        
        chevronDownImageView.do {
            $0.image = Image.chevronDown
        }
    }
    
    private func setLayout() {
        self.addSubview(button)
        button.addSubviews(projectNameLabel, chevronDownImageView)
        
        button.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(4)
            $0.height.equalTo(36)
        }
        
        projectNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.equalTo(chevronDownImageView.snp.leading).offset(-2)
            $0.centerY.equalToSuperview()
        }
        
        chevronDownImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(6)
            $0.size.equalTo(36)
        }
    }
 
    private func setAddTarget() {
        button.addTarget(self, action: #selector(projectButtonTapped), for: .touchUpInside)
    }
}

extension ProjectNameCollecionReusableView {
    
    @objc
    func projectButtonTapped() {
        self.delegate?.passButtonEvent()
    }
}

extension ProjectNameCollecionReusableView {
    func setDataBind(projectName: String) {
        projectNameLabel.text = projectName
    }
}
