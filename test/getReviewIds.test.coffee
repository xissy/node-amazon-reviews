should = require 'should'

getReviewIds = require '../lib/getReviewIds'


describe 'getReviewIds(...)', ->
  it 'should be done', (done) ->
    getReviewIds
      productId: 'B00DFFT76U'
    ,
      (err, reviewIds) ->
        should.not.exist err
        should.exist reviewIds

        done()
