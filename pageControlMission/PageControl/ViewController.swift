//
//  ViewController.swift
//  pageControl
//
//  Created by DH on 5/16/24.
//

import UIKit

let numPage = 10

class ViewController: UIViewController {
    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        pageControl.numberOfPages = numPage
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lblPageNumber.text = String(pageControl.currentPage + 1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNumber.text = String(pageControl.currentPage+1)
    }
    
}

