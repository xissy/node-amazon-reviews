async = require 'async'

AllCustomerReviewsPage = require './page/AllCustomerReviewsPage'


#### retrieve review IDs by a productId.
module.exports = (options, callback) ->
  return callback new Error 'no options.productId'  if not options.productId?

  reviewIds = []

  isLastPage = false
  currentUrl = "http://www.amazon.com/product-reviews/#{options.productId}/ref=cm_cr_pr_top_recent?ie=UTF8&showViewpoints=0&sortBy=bySubmissionDateDescending"

  allCustomerReviewsPage = new AllCustomerReviewsPage
    url: currentUrl
  ,
    (err, $) ->
      return callback err  if err?

      allCustomerReviewsPage.$ = $
      reviewIds = reviewIds.concat allCustomerReviewsPage.getReviewIds()
      nextPageUrl = allCustomerReviewsPage.getNextPageUrl()
      lastPageNo = allCustomerReviewsPage.getLastPageNo()

      return callback null, reviewIds  if lastPageNo <= 1

      reviewPageNos = [ 2..lastPageNo ]

      async.forEachLimit reviewPageNos, 100
      ,
        (reviewPageNo, callback) ->
          allCustomerReviewsPage = new AllCustomerReviewsPage
            url: nextPageUrl.replace /pageNumber=[\d]*/g, "pageNumber=#{reviewPageNo}"
          ,
            (err, $) ->
              return callback err  if err?

              allCustomerReviewsPage.$ = $
              reviewIds = reviewIds.concat allCustomerReviewsPage.getReviewIds()
              
              callback null
      ,
        (err) ->
          return callback err  if err?

          callback null, reviewIds
