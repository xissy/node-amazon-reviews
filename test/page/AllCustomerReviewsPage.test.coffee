should = require 'should'

AllCustomerReviewsPage = require '../../lib/page/AllCustomerReviewsPage'


describe 'AllCustomerReviewsPage', ->
  it 'should be done', (done) ->
    allCustomerReviewsPage = new AllCustomerReviewsPage
      url: 'http://www.amazon.com/Pampers-Swaddlers-Diapers-Economy-Count/product-reviews/B00DFFT76U'
    ,
      (err, $) ->
        should.not.exist err
        should.exist $

        productId = allCustomerReviewsPage.getProductId()
        should.exist productId
        productId.should.equal 'B00DFFT76U'

        nextPageUrl = allCustomerReviewsPage.getNextPageUrl()
        should.exist nextPageUrl

        reviewIds = allCustomerReviewsPage.getReviewIds()
        reviewIds.should.length 10

        done()
