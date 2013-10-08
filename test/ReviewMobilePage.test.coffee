should = require 'should'

ReviewMobilePage = require '../lib/ReviewMobilePage'


describe 'ReviewMobilePage', ->
  describe 'parse()', ->
    it 'should be done', (done) ->
      reviewMobilePage = new ReviewMobilePage
        url: 'http://www.amazon.com/gp/aw/review/B00DFFT76U/RDQO5C2XEPVPC'
      ,
        (err, $) ->
          should.not.exist err
          should.exist $

          result = reviewMobilePage.parse()
          should.exist result

          done()
