//
//  SecondViewController.swift
//  UpcommingMovies
//
//  Created by USER on 21/11/2564 BE.
//

import UIKit

class SecondViewController: UIViewController {
    var movie    : Movie?
   
    

    @IBOutlet weak var img_view: UIImageView!
    
    @IBOutlet weak var overview: UILabel!
    
    @IBOutlet weak var title_view: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overview.text = movie?.overview
        title_view.text = movie?.title
        
    }
    
    
    
}
