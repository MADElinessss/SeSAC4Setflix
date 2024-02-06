//
//  NasaViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/6/24.
//
import SnapKit
import UIKit

class NasaViewController: UIViewController {
    
    // urlsession 담을 프로퍼티 - 화면 전환을 했거나, 앱을 종료했거나 등
    // 뷰가 사라지는 시점에 네트워크 통신에 관련된 리소스 정리
    // ex. 카톡 이미지 다운받다가 다른 톡방을 킨다면? 기획에 따라서 내용을 다르게 구현해주어야 한다
    var session: URLSession!
    
    // 버퍼 - 데이터 누적시킬 공간
    // 이미지를 나눠서 받게 된다면, 이를 모두 append
    var buffer: Data? {
        didSet {
            if let buffer = buffer {
                let result = Double(buffer.count) / total
                let intResult = Int(result*100)
                label.text = "\(intResult)%"
            } else {
                label.text = "0%"
            }
        }
    }
    
    var total: Double = 1
    
    let nasaImage = UIImageView()
    let label = UILabel()
    let progressVIew = UIProgressView()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 다운받고 있는 이미지를 무시하고 싶어
        session.invalidateAndCancel()
        // 화면이 사라진다면 네트워크 통신도 함께 중단
        // 실행중인(다운로드중인) 리소스도 무시
        
        session.finishTasksAndInvalidate()
        // 다운로드 될때까지 기다렸다가, 끝나면 정리하기
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buffer = Data()
        
        view.backgroundColor = .lightGray
        view.addSubview(nasaImage)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(100)
        }
        
        nasaImage.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(200)
        }
        
        label.backgroundColor = .white
        nasaImage.backgroundColor = .orange
        
        request()
    }
    
    func request() {

        // MARK: data task + delegate
        let url = URL(string: "https://apod.nasa.gov/apod/image/2402/Carina_Taylor_9714.jpg")!
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url).resume()
        
    }
}

extension NasaViewController: URLSessionDataDelegate {
    
    // MARK: didReceive URLResponse- 서버에서 최초로 응답받은 경우에 호출
    // response - status code에 대한 처리하기 좋음
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("DIDRECEIVE RESPONSE")
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            
            // HTTP Header에 content-length 갖다 써
            let contentLength = response.value(forHTTPHeaderField: "Content-Length") ?? "0"
            
            total = Double(contentLength) ?? 0
            
            
            return .allow
        } else {
            return .cancel
        }
    }
    
    // MARK: didReceive Data - 서버에서 데이터를 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DIDRECEIVE DATA \(data)")
        // 얘를 누적으로 더해줘
        buffer?.append(data)
    }
    
    // MARK: didCompleteWithError - 응답이 완료될 때 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("DIDCOMPLETEWITHERROR \(error)")
        } else {
            // completionHandler 시점
            print("SUCCESS")
            guard let buffer = buffer else {
                return
            }
            let image = UIImage(data: buffer)
            nasaImage.image = image
        }
    }
    
}
