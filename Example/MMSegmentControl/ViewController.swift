//
//  ViewController.swift
//  MMSegmentControl
//
//  Created by Mohsinali Matiya on 05/25/2017.
//  Copyright (c) 2017 Mohsinali Matiya. All rights reserved.
//

import UIKit
import MMSegmentControl

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: MMSegmentedControl!
    @IBOutlet weak var borderedSegmentControl: MMSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSegmentedControl()
        configureBorderedSegmentedControl()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureSegmentedControl() {
        let titleStrings = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
        let titles: [NSAttributedString] = {
          let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        let selectedTitles: [NSAttributedString] = {
          let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        self.segmentControl.setTitles(titles, selectedTitles: selectedTitles)
        self.segmentControl.backgroundColor = UIColor.blue
        self.segmentControl.delegate = self
        self.segmentControl.layoutPolicy = .dynamic
        self.segmentControl.segmentSpacing = 5
        self.segmentControl.selectionBoxHeight = 30
        self.segmentControl.selectionHorizontalPadding = 15
        self.segmentControl.selectionBoxStyle = .default
        self.segmentControl.selectionBoxCornerRadius = 15
        self.segmentControl.selectionBoxColor = UIColor.orange
        self.segmentControl.isLongPressEnabled = true
        self.segmentControl.isUnselectedSegmentsLongPressEnabled = true
        self.segmentControl.longPressMinimumPressDuration = 0.8
    }
    
    func configureBorderedSegmentedControl() {
        let titleStrings = ["1", "2", "3", "4", "5", "6"]
        let titles: [NSAttributedString] = {
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkText]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        let selectedTitles: [NSAttributedString] = {
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        self.borderedSegmentControl.setTitles(titles, selectedTitles: selectedTitles)
        self.borderedSegmentControl.backgroundColor = UIColor.white
        self.borderedSegmentControl.delegate = self
        self.borderedSegmentControl.layoutPolicy = .dynamic
        self.borderedSegmentControl.segmentSpacing = 8
        self.borderedSegmentControl.selectionBoxHeight = 50
        self.borderedSegmentControl.selectionHorizontalPadding = 20
        self.borderedSegmentControl.selectionBoxStyle = .default
        self.borderedSegmentControl.selectionBoxCornerRadius = 25
        self.borderedSegmentControl.selectionBoxColor = UIColor.orange
        self.borderedSegmentControl.isLongPressEnabled = true
        self.borderedSegmentControl.isUnselectedSegmentsLongPressEnabled = true
        self.borderedSegmentControl.longPressMinimumPressDuration = 0.8
        
        self.borderedSegmentControl.titleBorderStyle = .rounded
        self.borderedSegmentControl.titleBorderColor = UIColor.darkText
        self.borderedSegmentControl.titleBorderWidth = 1.0
    }
}

extension ViewController: MMSegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: MMSegmentedControl, didSelectIndex selectedIndex: Int) {
        print("Did select index \(selectedIndex)")
        switch segmentedControl.style {
        case .text:
            print("The title is “\(segmentedControl.titles[selectedIndex].string)”\n")
        case .image:
            print("The image is “\(segmentedControl.images[selectedIndex])”\n")
        }
    }
    
    func segmentedControl(_ segmentedControl: MMSegmentedControl, didLongPressIndex longPressIndex: Int) {
        print("Did long press index \(longPressIndex)")
    }
}
