import Testing
import Foundation
@testable import RestCodable

struct FixCodableTests {

	@Test
	func encodeModel_withAllDefaultValues_decodeSameModel() throws {
		// Given
		let model: ModelFull = .init()

		// When
		let dto: Data = model.toData(includeDefault: true)

		// Then
		let model2: ModelFull = try ModelFull.decode(from: dto)
		#expect(model == model2)
	}

	@Test
	func encodeModel_withoutDefaultValues_decodeSameModel() throws {
		// Given
		let model: ModelFull = .init()

		// When
		let dto: Data = model.toData()

		// Then
		let model2: ModelFull = try ModelFull.decode(from: dto)
		#expect(model == model2)
	}

	@Test
	func encodeModel_withAllAnyValues_decodeSameModel() throws {
		// Given
		var model: ModelFull = .init()
		model.idO = UUID()

		model.string = "string1"
		model.stringO = "stringO"

		model.bool = true
		model.boolO = true

		model.int = 1
		model.intO = 2

		model.uInt = 3
		model.uIntO = 4

		model.double = 5
		model.doubleO = 6

		let date: Date = .init()
		model.date = date
		model.dateO = date

		model.ids = [UUID(), UUID(), UUID()]
		model.strings = ["", "string"]
		model.bools = [false, false, true]
		model.ints = [2, -1, -3]
		model.uInts = [0, 1, 3]
		model.doubles = [0, 1, -83]
		model.dates = [Date(), Date(), Date()]

		// When
		let dto: Data = model.toData()
		let modelNew: ModelFull = try ModelFull.decode(from: dto)

		// Then
		#expect(model == modelNew)
	}

	@Test
	func encodeModel_withAllValues_decodeSameModel2() throws {
		// Given
		var model: ModelFull = .init()
		model.idO = UUID()

		model.string = ""
		model.stringO = ""

		model.bool = false
		model.boolO = false

		model.int = 0
		model.intO = 0

		model.uInt = 0
		model.uIntO = 0

		model.double = 0
		model.doubleO = 0

		model.date = Date(timeIntervalSince1970: 0)
		model.dateO = Date(timeIntervalSince1970: 0)

		// When
		let dto: Data = model.toData()
		let modelNew: ModelFull = try ModelFull.decode(from: dto)

		// Then
		#expect(model == modelNew)
	}

	@Test
	func encodeValue_int16_decodeSameValue() throws {
		// Given
		let int16: Int16 = -15

		// When
		let data: Data = int16.asData
		let value: Int16 = .init(from: data)

		// Then
		#expect(int16 == value)
	}
}
