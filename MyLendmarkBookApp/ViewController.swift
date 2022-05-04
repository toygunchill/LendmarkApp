//
//  ViewController.swift
//  MyLendmarkBookApp
//
//  Created by Toygun Çil on 4.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lendmarkNames = [String]()
    var lendmarkImages = [UIImage]()
    var choosenLendmarkName = ""
    var choosenLendmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //self her zaman içerisinde bulunduğu sınıfı veya kapatmayı gösterir
        
        
        //Lendmark Data:
        lendmarkNames.append("Colosseum")
        lendmarkNames.append("Statue of Liberty")
        lendmarkNames.append("Stonehenge")
        lendmarkNames.append("Kremlin")
        lendmarkNames.append("Taj mahal")
        lendmarkNames.append("Great Wall")
        
        lendmarkImages.append(UIImage(named:"colosseum.jpeg")!)
        lendmarkImages.append(UIImage(named:"statueofliberty.jpeg")!)
        lendmarkImages.append(UIImage(named:"stonegenge.jpeg")!)
        lendmarkImages.append(UIImage(named:"kremlin.jpeg")!)
        lendmarkImages.append(UIImage(named:"tajmahal.jpeg")!)
        lendmarkImages.append(UIImage(named:"greatwall.jpeg")!)
        
        navigationItem.title = "My Landmark Book"
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            lendmarkNames.remove(at: indexPath.row)
            lendmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = lendmarkNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return lendmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLendmarkName = lendmarkNames[indexPath.row]
        choosenLendmarkImage = lendmarkImages[indexPath.row]
        performSegue(withIdentifier:"toImageViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            //segue olmadan önce yapılacak işlem.
            let destinationVC = segue.destination as! imageViewController// tanımla ve imageViewController olarak değişken içerisine kaydet.
            destinationVC.selectedLendmakName = choosenLendmarkName
            destinationVC.selectedLendmarkImage = choosenLendmarkImage
        }
    }
}

