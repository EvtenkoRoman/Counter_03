//
//  ViewController.swift
//  Counter_Max
//
//  Created by Роман Евтенко on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusBotton: UIButton!
    
    @IBOutlet weak var resetBotton: UIButton!
    
    @IBOutlet weak var informatoinTextView: UITextView!
    
    @IBOutlet weak var valueCountLabel: UILabel!
    
    
    func viewDateTime () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        let informationDateTime = dateFormatter.string(from: Date())
        return informationDateTime
    }
    
    func minusLabel () {
        if startCount > 0 {
            print(valueCountLabel.text = ("Значение счётчика: \(String(startCount))"))
        } else {print(valueCountLabel.text = "Значение счётчика: 0")}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plusButton.tintColor = .red
        minusBotton.tintColor = .blue
        resetBotton.tintColor = .darkGray
    }
    
    private var startCount = 0
    //при успешном нажатии на кнопку «+» или «-» — «[дата и время]: значение изменено на -1/+1»
    //при сбросе: — «[дата и время]: значение сброшено»
    //при попытке уменьшить значение счётчика ниже 0 — «[дата и время]: попытка уменьшить значение счётчика ниже 0»
    
    @IBAction func addBotton(_ sender: Any) {
        startCount += 1
        print(valueCountLabel.text = ("Значение счётчика: \(String(startCount))"))
        print(informatoinTextView.text += ("\n\(viewDateTime()) значение изменено на +1"))
    }
    
    @IBAction func takeBotton(_ sender: Any) {
        if startCount > 0 {
            startCount -= 1
        } else {startCount = 0}
        minusLabel()
        if startCount > 0 {
            print(informatoinTextView.text += ("\n\(viewDateTime()) значение изменено на -1"))
        } else {print(informatoinTextView.text += "\n\(viewDateTime()) попытка уменьшить значение счётчика ниже 0")}
    }
    
    @IBAction func discardBotton(_ sender: Any) {
        print(informatoinTextView.text += "\n\(viewDateTime()) значение сброшено")
        print(valueCountLabel.text = "Значение счётчика: 0")
    }
    
}

