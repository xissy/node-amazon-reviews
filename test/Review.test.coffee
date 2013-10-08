should = require 'should'

Review = require '../lib/Review'


describe 'ReviewPage', ->
  describe 'constructor()', ->
    it 'should be done', (done) ->
      review = new Review
        productId: 'B00DFFT76U'
        reviewId: 'RDQO5C2XEPVPC'
      ,
        (err, data) ->
          should.not.exist err
          should.exist data
          
          data.title.should.equal 'Swaddlers vs Cruisers Size 4'
          data.starCount.should.equal 5
          should.exist data.descText
          data.profileName.should.equal 'Rebecca N'

          done()
