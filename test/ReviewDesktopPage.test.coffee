should = require 'should'

ReviewDesktopPage = require '../lib/ReviewDesktopPage'


describe 'ReviewDesktopPage', ->
  describe 'parse()', ->
    it 'should be done', (done) ->
      reviewDesktopPage = new ReviewDesktopPage
        url: 'http://www.amazon.com/review/RDQO5C2XEPVPC'
      ,
        (err, $) ->
          should.not.exist err
          should.exist $

          result = reviewDesktopPage.parse()
          should.exist result

          done()
