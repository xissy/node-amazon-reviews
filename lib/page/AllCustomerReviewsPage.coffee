Page = require './Page'
urlModule = require 'url'


class AllCustomerReviewsPage extends Page

  #### get the product id.
  getProductId: ->
    parsedUrl = urlModule.parse @options.url
    path = parsedUrl.pathname
    path.split('/')[3]


  #### get next page url from the all customer reviews page document.
  getNextPageUrl: ->
    pageLinkTags = @$('.paging a')
    nextTag = pageLinkTags.eq(pageLinkTags.length - 1)
    nextText = pageLinkTags.eq(pageLinkTags.length - 1).text()

    if nextText is 'Next ›'
      nextUrl = nextTag.attr 'href'
    else
      nextUrl = null

    nextUrl


  #### get last page number from the all customer reviews page document.
  getLastPageNo: ->
    pageLinkTags = @$('.paging a')
    lastTag = pageLinkTags.eq(pageLinkTags.length - 2)
    lastText = pageLinkTags.eq(pageLinkTags.length - 2).text()

    if lastText isnt ''
      lastPageNo = parseInt lastText
    else 
      lastPageNo = 1

    lastPageNo


  #### get review id array.
  getReviewIds: ->
    reviewLinkTags = @$('#productReviews a')

    reviewIds = []
    reviewLinkTags.each (index, element) ->
      # there should be `name` attribute but no `style` attribute.
      name = @?.attr('name')
      style = @?.attr('style')
      
      if name? and name[...3] isnt 'oc-' and not style?
        reviewIds.push @?.attr('name')

    reviewIds



module.exports = AllCustomerReviewsPage
