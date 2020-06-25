//
//  APIClient.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import Foundation

class APIClient {

    fileprivate let jsonDecoder = JSONDecoder()
    fileprivate let defaultSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Timeout.IntervalForRequest
        configuration.timeoutIntervalForResource = Timeout.IntervalForResource
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()

    var dataTask: URLSessionDataTask?

    func getUsers(withCompletion completion: @escaping ([User]?, Error?) -> Void) {
        let url = URL(string: API.BaseURL + API.UserURLExtension)!
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            } else if let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let messages = try self.jsonDecoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        completion(messages, nil)
                    }
                } catch {
                    print("Error on decoding messages : ", error)
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        dataTask?.resume()
    }



    func getPosts(withUserId userId: Int, withCompletion completion: @escaping ([Post]?, Error?) -> Void) {
        let url = URL(string: "\(API.BaseURL)user/\(userId)/posts")!
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            } else if let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let posts = try self.jsonDecoder.decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        completion(posts, nil)
                    }
                } catch {
                    print("Error on decoding messages : ", error)
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        dataTask?.resume()
    }


    func getCommentCount(withPostId postId: Int, withCompletion completion: @escaping (Int?, Error?) -> Void) {
        let url = URL(string: "\(API.BaseURL)posts/\(postId)/comments")!
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            } else if let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let comments = try self.jsonDecoder.decode([Comment].self, from: data)
                    DispatchQueue.main.async {
                        completion(comments.count, nil)
                    }
                } catch {
                    print("Error on decoding messages : ", error)
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        dataTask?.resume()
    }
}
