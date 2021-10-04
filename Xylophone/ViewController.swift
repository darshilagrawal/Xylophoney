

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5 //sets the opacity to 50%
        //Code should execute after 0.2 second delay.
        //          print("Start")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //           print("End")//Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        UIView.transition(with: sender,
                          duration: 0.6,
                          options: .transitionFlipFromLeft,
                          animations: {
        }, completion: nil)
        playSound(soundName:sender.currentTitle!)
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
