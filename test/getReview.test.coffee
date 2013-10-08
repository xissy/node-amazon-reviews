should = require 'should'

getReview = require '../lib/getReview'


describe 'getReview()', ->
    it 'should be done', (done) ->
      getReview
        productId: 'B00DFFT76U'
        reviewId: 'RDQO5C2XEPVPC'
      ,
        (err, review) ->
          should.not.exist err
          should.exist review
          
          review.title.should.equal 'Swaddlers vs Cruisers Size 4'
          review.starCount.should.equal 5
          should.exist review.descText
          review.profileName.should.equal 'Rebecca N'

          done()
