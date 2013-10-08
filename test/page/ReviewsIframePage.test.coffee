should = require 'should'

ReviewsIframePage = require '../../lib/page/ReviewsIframePage'


describe 'ReviewsIframePage', ->
  describe 'getAllCustomerReviewsPageUrl()', ->
    it 'should be done', (done) ->
      reviewsIframePage = new ReviewsIframePage
        # TODO: change this url.
        url: 'http://www.amazon.com/reviews/iframe?akid=AKIAIPG2BJRKIIQIKQ5Q&alinkCode=xm2&asin=B00DFFT76U&atag=PutYourAssociateTagHere&exp=2013-10-08T22%3A55%3A26Z&v=2&sig=3SSmSMbVRMlIgfRQjH5cfNnw1Pb%2Bp%2F%2Fr%2F8f7iEhsQZQ%3D'
      ,
        (err, $) ->
          should.not.exist err
          should.exist $

          allCustomerReviewsPageUrl = reviewsIframePage.getAllCustomerReviewsPageUrl()
          should.exist allCustomerReviewsPageUrl

          done()
