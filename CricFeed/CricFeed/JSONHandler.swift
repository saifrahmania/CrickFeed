// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jSONHandler = try? JSONDecoder().decode(JSONHandler.self, from: jsonData)

import Foundation
/*
 // MARK: - JSONHandler
 struct JSONHandler: Codable {
 var data: [Datum]?
 var links: Links?
 var meta: Meta?
 }
 
 // MARK: - Datum
 struct Datum: Codable {
 var resource: DatumResource?
 var id: Int?
 var note: String?
 var weatherReport: [JSONAny]?
 var localteam, visitorteam: Team?
 
 enum CodingKeys: String, CodingKey {
 case resource, id, note
 case weatherReport = "weather_report"
 case localteam, visitorteam
 }
 }
 
 // MARK: - Team
 struct Team: Codable {
 var resource: LocalteamResource?
 var id: Int?
 var name, code: String?
 var imagePath: String?
 var countryID: Int?
 var nationalTeam: Bool?
 var updatedAt: UpdatedAt?
 
 enum CodingKeys: String, CodingKey {
 case resource, id, name, code
 case imagePath = "image_path"
 case countryID = "country_id"
 case nationalTeam = "national_team"
 case updatedAt = "updated_at"
 }
 }
 
 enum LocalteamResource: String, Codable {
 case teams = "teams"
 }
 
 enum UpdatedAt: String, Codable {
 case the20181129T114720000000Z = "2018-11-29T11:47:20.000000Z"
 case the20190129T110704000000Z = "2019-01-29T11:07:04.000000Z"
 case the20191209T064502000000Z = "2019-12-09T06:45:02.000000Z"
 case the20191219T122602000000Z = "2019-12-19T12:26:02.000000Z"
 case the20221213T104100000000Z = "2022-12-13T10:41:00.000000Z"
 case the20221213T104107000000Z = "2022-12-13T10:41:07.000000Z"
 }
 
 enum DatumResource: String, Codable {
 case fixtures = "fixtures"
 }
 
 // MARK: - Links
 struct Links: Codable {
 var first, last: String?
 var prev, next: JSONNull?
 }
 
 // MARK: - Meta
 struct Meta: Codable {
 var currentPage, from, lastPage: Int?
 var links: [Link]?
 var path: String?
 var perPage, to, total: Int?
 
 enum CodingKeys: String, CodingKey {
 case currentPage = "current_page"
 case from
 case lastPage = "last_page"
 case links, path
 case perPage = "per_page"
 case to, total
 }
 }
 
 // MARK: - Link
 struct Link: Codable {
 var url: String?
 var label: String?
 var active: Bool?
 }
 
 // MARK: - Encode/decode helpers
 
 class JSONNull: Codable, Hashable {
 
 public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
 return true
 }
 
 public var hashValue: Int {
 return 0
 }
 
 public func hash(into hasher: inout Hasher) {
 // No-op
 }
 
 public init() {}
 
 public required init(from decoder: Decoder) throws {
 let container = try decoder.singleValueContainer()
 if !container.decodeNil() {
 throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
 }
 }
 
 public func encode(to encoder: Encoder) throws {
 var container = encoder.singleValueContainer()
 try container.encodeNil()
 }
 }
 
 class JSONCodingKey: CodingKey {
 let key: String
 
 required init?(intValue: Int) {
 return nil
 }
 
 required init?(stringValue: String) {
 key = stringValue
 }
 
 var intValue: Int? {
 return nil
 }
 
 var stringValue: String {
 return key
 }
 }
 
 class JSONAny: Codable {
 
 let value: Any
 
 static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
 let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
 return DecodingError.typeMismatch(JSONAny.self, context)
 }
 
 static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
 let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
 return EncodingError.invalidValue(value, context)
 }
 
 static func decode(from container: SingleValueDecodingContainer) throws -> Any {
 if let value = try? container.decode(Bool.self) {
 return value
 }
 if let value = try? container.decode(Int64.self) {
 return value
 }
 if let value = try? container.decode(Double.self) {
 return value
 }
 if let value = try? container.decode(String.self) {
 return value
 }
 if container.decodeNil() {
 return JSONNull()
 }
 throw decodingError(forCodingPath: container.codingPath)
 }
 
 static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
 if let value = try? container.decode(Bool.self) {
 return value
 }
 if let value = try? container.decode(Int64.self) {
 return value
 }
 if let value = try? container.decode(Double.self) {
 return value
 }
 if let value = try? container.decode(String.self) {
 return value
 }
 if let value = try? container.decodeNil() {
 if value {
 return JSONNull()
 }
 }
 if var container = try? container.nestedUnkeyedContainer() {
 return try decodeArray(from: &container)
 }
 if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
 return try decodeDictionary(from: &container)
 }
 throw decodingError(forCodingPath: container.codingPath)
 }
 
 static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
 if let value = try? container.decode(Bool.self, forKey: key) {
 return value
 }
 if let value = try? container.decode(Int64.self, forKey: key) {
 return value
 }
 if let value = try? container.decode(Double.self, forKey: key) {
 return value
 }
 if let value = try? container.decode(String.self, forKey: key) {
 return value
 }
 if let value = try? container.decodeNil(forKey: key) {
 if value {
 return JSONNull()
 }
 }
 if var container = try? container.nestedUnkeyedContainer(forKey: key) {
 return try decodeArray(from: &container)
 }
 if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
 return try decodeDictionary(from: &container)
 }
 throw decodingError(forCodingPath: container.codingPath)
 }
 
 static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
 var arr: [Any] = []
 while !container.isAtEnd {
 let value = try decode(from: &container)
 arr.append(value)
 }
 return arr
 }
 
 static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
 var dict = [String: Any]()
 for key in container.allKeys {
 let value = try decode(from: &container, forKey: key)
 dict[key.stringValue] = value
 }
 return dict
 }
 
 static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
 for value in array {
 if let value = value as? Bool {
 try container.encode(value)
 } else if let value = value as? Int64 {
 try container.encode(value)
 } else if let value = value as? Double {
 try container.encode(value)
 } else if let value = value as? String {
 try container.encode(value)
 } else if value is JSONNull {
 try container.encodeNil()
 } else if let value = value as? [Any] {
 var container = container.nestedUnkeyedContainer()
 try encode(to: &container, array: value)
 } else if let value = value as? [String: Any] {
 var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
 try encode(to: &container, dictionary: value)
 } else {
 throw encodingError(forValue: value, codingPath: container.codingPath)
 }
 }
 }
 
 static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
 for (key, value) in dictionary {
 let key = JSONCodingKey(stringValue: key)!
 if let value = value as? Bool {
 try container.encode(value, forKey: key)
 } else if let value = value as? Int64 {
 try container.encode(value, forKey: key)
 } else if let value = value as? Double {
 try container.encode(value, forKey: key)
 } else if let value = value as? String {
 try container.encode(value, forKey: key)
 } else if value is JSONNull {
 try container.encodeNil(forKey: key)
 } else if let value = value as? [Any] {
 var container = container.nestedUnkeyedContainer(forKey: key)
 try encode(to: &container, array: value)
 } else if let value = value as? [String: Any] {
 var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
 try encode(to: &container, dictionary: value)
 } else {
 throw encodingError(forValue: value, codingPath: container.codingPath)
 }
 }
 }
 
 static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
 if let value = value as? Bool {
 try container.encode(value)
 } else if let value = value as? Int64 {
 try container.encode(value)
 } else if let value = value as? Double {
 try container.encode(value)
 } else if let value = value as? String {
 try container.encode(value)
 } else if value is JSONNull {
 try container.encodeNil()
 } else {
 throw encodingError(forValue: value, codingPath: container.codingPath)
 }
 }
 
 public required init(from decoder: Decoder) throws {
 if var arrayContainer = try? decoder.unkeyedContainer() {
 self.value = try JSONAny.decodeArray(from: &arrayContainer)
 } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
 self.value = try JSONAny.decodeDictionary(from: &container)
 } else {
 let container = try decoder.singleValueContainer()
 self.value = try JSONAny.decode(from: container)
 }
 }
 
 public func encode(to encoder: Encoder) throws {
 if let arr = self.value as? [Any] {
 var container = encoder.unkeyedContainer()
 try JSONAny.encode(to: &container, array: arr)
 } else if let dict = self.value as? [String: Any] {
 var container = encoder.container(keyedBy: JSONCodingKey.self)
 try JSONAny.encode(to: &container, dictionary: dict)
 } else {
 var container = encoder.singleValueContainer()
 try JSONAny.encode(to: &container, value: self.value)
 }
 }
 }
 */
