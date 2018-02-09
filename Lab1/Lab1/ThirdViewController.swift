//
//  ThirdViewController.swift
//  Lab1
//
//  Created by CU Boulder on 2/3/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController , AVAudioPlayerDelegate, AVAudioRecorderDelegate{

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    let fileName = "audio.m4a"
    
    @IBAction func recordAudio(_ sender: UIButton) {
        //if not already recording, start recording
        if audioRecorder?.isRecording == false{
            playButton.isEnabled = false
            stopButton.isEnabled = true
            audioRecorder?.delegate = self
            audioRecorder?.record()
        }
    }
    @IBAction func playAudio(_ sender: UIButton) {
        //if not recording play audio file
        if audioRecorder?.isRecording == false{
            stopButton.isEnabled = true
            recordButton.isEnabled = false
            do {
                try audioPlayer = AVAudioPlayer(contentsOf:
                    (audioRecorder?.url)!)
                audioPlayer!.delegate = self
                audioPlayer!.prepareToPlay()//prepares the audio player for playback by preloading its buffers
                audioPlayer!.play() //plays audio file
            } catch let error as NSError {
                print("audioPlayer error: \(error.localizedDescription)")
            } }
    }
    @IBAction func stopAudio(_ sender: UIButton) {
        stopButton.isEnabled = false
        playButton.isEnabled = true
        recordButton.isEnabled = true
        //stop recording or playing
        if audioRecorder?.isRecording == true { audioRecorder?.stop()
        } else { audioPlayer?.stop()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //disable since there is no audio
        playButton.isEnabled = false;
        stopButton.isEnabled = false;
        
        //get path for the audio file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0] //documants directory
        let audioFileURL = docDir.appendingPathComponent(fileName)
        print(audioFileURL)
        
        //sharing audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // setting category for recording and playback
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch {
            print ("audio seesion error: \(error.localizedDescription)")
        }
        
        //recorder settings
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), //specifies audio code
            AVSampleRateKey: 1200, //sample rate in hertz
            AVNumberOfChannelsKey: 1, //number of channels
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue //audio bit rate
        ]
        
        do{
            //create AVAudioRecorder instance
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            audioRecorder?.prepareToRecord()
            print("audio recorder ready")
        } catch{
            print("audio recorded error: \(error.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
