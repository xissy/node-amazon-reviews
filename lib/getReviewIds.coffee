async = require 'async'

AllCustomerReviewsPage = require './page/AllCustomerReviewsPage'


#### retrieve review IDs by a productId.
module.exports = (options, callback) ->
  return callback new Error 'no options.productId'  if not options.productId?

  reviewIds = []

  isLastPage = false
  currentUrl = "http://www.amazon.com/product-reviews/#{options.productId}/ref=cm_cr_pr_top_recent?ie=UTF8&showViewpoints=0&sortBy=bySubmissionDateDescending"

  async.until ->
    isLastPage
  ,
    (callback) ->
      allCustomerReviewsPage = new AllCustomerReviewsPage
        url: currentUrl
      ,
        (err) ->
          return callback err  if err?

          reviewIds = reviewIds.concat allCustomerReviewsPage.getReviewIds()
          nextPageUrl = allCustomerReviewsPage.getNextPageUrl()

          if nextPageUrl?
            currentUrl = nextPageUrl
          else
            isLastPage = true

          callback null
  ,
    (err) ->
      return callback err  if err?

      callback null, reviewIds
