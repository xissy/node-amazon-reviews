ReviewMobilePage = require './ReviewMobilePage'
ReviewDesktopPage = require './ReviewDesktopPage'


class Review
  #### retrieve review data by productId and reviewId.
  constructor: (@options, callback) ->
    return callback new Error 'no options.productId'  if not options?.productId?
    return callback new Error 'no options.reviewId'  if not options?.reviewId?

    options.url = "http://www.amazon.com/gp/aw/review/#{@options.productId}/#{@options.reviewId}"

    @reviewMobilePage = new ReviewMobilePage options, (err) =>
      return callback err  if err?

      @data = @reviewMobilePage.parse()

      options.url = "http://www.amazon.com/review/#{@options.reviewId}"

      @reviewDesktopPage = new ReviewDesktopPage options, (err) =>
        return callback err  if err?

        for k, v of @reviewDesktopPage.parse()
          @data[k] = v

        callback null, @data



module.exports = Review
