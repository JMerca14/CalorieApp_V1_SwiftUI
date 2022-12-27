//
//  DataManager.swift
//  PaycheckApp
//
//  Created by Juan Mercado on 12/22/22.
//

import Foundation

class UtilityManager {
    // MARK: File Manager
    func saveData<T: Encodable>(data: T, to fileName: String) throws {
        let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = documentsUrl.appendingPathComponent(fileName)
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(data)
        try jsonData.write(to: fileUrl)
    }
    
    func loadData<T: Decodable>(from fileName: String, as type: T.Type) throws -> T {
        let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileUrl = documentsUrl.appendingPathComponent(fileName)
        let jsonData = try Data(contentsOf: fileUrl)
        let decoder = JSONDecoder()
        let data = try decoder.decode(type, from: jsonData)
        return data
    }
    
    // MARK: API Manager
    func makeAPIRequest(url: String, method: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: url) else {
            return completion(.failure(NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }

            guard let data = data else {
                return completion(.failure(NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            }

            do {
                let decodedObject = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                
                if let decodedObject = decodedObject {
                    completion(.success(decodedObject))
                } else {
                    completion(.failure(NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid data received"])))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    // MARK: MISC Manager
    func CalcBMI(weight: Double, height: Double) -> Double { // Kg | Meters
        let bmi = weight / pow(height, 2)
        return bmi
    }
    
    func calculateCalorieNeeds(weight: Double, height: Double, age: Int, gender: String, activityLevel: String) -> Double {
        let weightFactor: Double
        let heightFactor: Double
        let ageFactor: Double

        if gender == "male" {
            weightFactor = 13.397
            heightFactor = 4.799
            ageFactor = 5.677
        } else if gender == "female" {
            weightFactor = 9.247
            heightFactor = 3.098
            ageFactor = 4.330
        } else {
            return 0.0
        }

        let bmr = weightFactor * weight + heightFactor * height - ageFactor * Double(age) + 5.0
        let activityLevelFactor: Double
        
        switch activityLevel {
            case "sedentary":
                activityLevelFactor = 1.2
            case "lightly active":
                activityLevelFactor = 1.375
            case "moderately active":
                activityLevelFactor = 1.55
            case "very active":
                activityLevelFactor = 1.725
            case "extremely active":
                activityLevelFactor = 1.9
            default:
                return 0.0
        }

        let tdee = bmr * activityLevelFactor

        return tdee.rounded()
    }

    // MARK: Input/Output Manager
    func ReadString() -> String {
      return readLine()!
    }

    func PrintString(_ s: String) {
      print(s)
    }

    func ReadNumber() -> Int {
      return Int(readLine()!)!
    }

    func PrintNumber(_ n: Int) {
      print(n)
    }

    // MARK: String Manipulators
    func ConcatStrings(_ s1: String, _ s2: String) -> String {
      return s1 + s2
    }

    func FindSubstring(_ s: String, _ sub: String) -> Int {
      if let range = s.range(of: sub) {
        return s.distance(from: s.startIndex, to: range.lowerBound)
      } else {
        return -1
      }
    }

    func ToUppercase(_ s: String) -> String {
      return s.uppercased()
    }

    func ToLowercase(_ s: String) -> String {
      return s.lowercased()
    }

    // MARK: Mathematical Operators
    func Add(_ x: Int, _ y: Int) -> Int {
      return x + y
    }

    func Subtract(_ x: Int, _ y: Int) -> Int {
      return x - y
    }

    func Multiply(_ x: Int, _ y: Int) -> Int {
      return x * y
    }

    func Divide(_ x: Int, _ y: Int) -> Int {
      return x / y
    }

    // MARK: Data Manipulators
    func SortList(_ lst: [Int]) -> [Int] {
      return lst.sorted()
    }

    func FindItem(_ lst: [Int], _ item: Int) -> Bool {
      return lst.contains(item)
    }

    func AddItem(_ lst: inout [Int], _ item: Int) {
      lst.append(item)
    }

    func RemoveItem(_ lst: inout [Int], _ item: Int) {
      lst.removeAll(where: { $0 == item })
    }

    // MARK: Error Manager
    func HandleException(_ exception: Error) {
      print("An error occurred:", exception)
    }

    func Debug(_ x: Any) {
      print("Debug:", x)
    }
}
