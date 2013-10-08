should = require 'should'

AllCustomerReviewsPage = require '../lib/AllCustomerReviewsPage'


describe 'AllCustomerReviewsPage', ->
  it 'should be done', (done) ->
    allCustomerReviewsPage = new AllCustomerReviewsPage
      url: 'http://www.amazon.com/Pampers-Swaddlers-Diapers-Economy-Count/product-reviews/B00DFFT76U'
    ,
      (err, $) ->
        should.not.exist err
        should.exist $

        nextPageUrl = allCustomerReviewsPage.getNextPageUrl()
        should.exist nextPageUrl

        reviewIds = allCustomerReviewsPage.getReviewIds()
        (reviewIds.length > 10).should.be.true

        done()
