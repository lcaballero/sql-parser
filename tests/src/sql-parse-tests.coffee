newNpm = require("../../src/sql-parse")

describe 'sql-parseTests =>', ->

  describe 'constructor =>', ->

    it 'should be able to call newly created package function without error', ->
      expect(-> newNpm).to.not.throw(Error)