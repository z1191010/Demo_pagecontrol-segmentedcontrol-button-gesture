//
//  ViewController.swift
//  Demo
//
//  Created by Kai on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    let albums = ["Black Panther Wakanda Forever", "Black Adam", "The Post Truth World"]
    
    let info = [
"""
導演：萊恩庫格勒

演員：
莉蒂西亞·萊特、露琵塔·尼詠歐、達娜·古瑞拉、溫斯頓·杜克、佛羅倫絲·卡孫巴、多米妮克·索恩、麥可娜·柯爾、泰諾克·烏爾塔、馬丁·費里曼、安琪拉·貝瑟

類型：冒險、動作、劇情
片長：2 時 41 分
""",
"""
導演：梅寇勒特瑟拉

演員：
巨石強森、奧迪斯霍吉、諾亞森迪尼奧、莎拉夏希、馬文坎薩林、昆塔莎斯溫德爾、博迪薩邦圭、皮爾斯布洛斯南

類型：奇幻/科幻、冒險、動作、劇情
片長：2 時 5 分
""",
"""
導演：陳奕甫

演員：
張孝全、陳昊森、方郁婷、鍾瑶、安心亞、石知田、詹子萱

類型：犯罪、懸疑、驚悚、劇情
片長：2 時 0 分
"""
]
    
    var index = 0
    
    
    
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var movieSegmentControl: UISegmentedControl!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //同步功能的 function
    func updateUI() {
        //會由 album 的陣列取出 index 的圖片。
        movieImageView.image = UIImage(named: albums[index])
        //所選擇的 segment 會同 index，始圖片與 segment 同步。
        movieSegmentControl.selectedSegmentIndex = index
        //所選擇的 page 會同 index，使圖片與 currentPage 同步。
        moviePageControl.currentPage = index
        //由 info Array 中顯示對應圖片的內容。
        infoTextView.text = info[index]
    }
    //使用 SegmentControl 或  後，會將 index 值資料回傳至 updateUI function，讓圖片、文字、SegmentedControl 及 PageControl 會跳地其他比資料。
    @IBAction func selectTheater(_ sender: Any) {
        index = movieSegmentControl.selectedSegmentIndex
        updateUI()
    }
    
    @IBAction func changePageControl(_ sender: Any) {
        index = moviePageControl.currentPage
        updateUI()
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        index = (index + 1) % albums.count
        updateUI()
    }
    
    @IBAction func previous(_ sender: Any) {
        index = (index + albums.count - 1) % albums.count
        updateUI()
    }
}

