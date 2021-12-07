//
//  NewsDetailController.swift
//  MinzyTable
//
//  Created by MINJI KIM on 2021/12/07.
//

import Foundation
import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    
    // 1. image URL
    // 2. description
    
    var imageUrl : String?
    var desc : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ok?
        if let img = imageUrl {
            // 이미지 가져와서 뿌린다 !
            // Data
            if let data = try? Data(contentsOf: URL(string: "")!){
                //Main Thread
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
            
        }
        if let d = desc {
            // 본문을 보여준다 !
            self.LabelMain.text = d
        }
    }
}
