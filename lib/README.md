
## Class Hierarchy
  * Page
    * ReviewsIframePage
    * AllCustomerReviewsPage
    * ReviewMobilePage
    * ReviewDesktopPage

Refer to [Amazon Product Advertising API](https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html), customer reviews are not proveded directly. Instead of that, the API provides an url to redirect IFrame page which has customer reviews about an item.

## Basic flow
  1. Get an `IFrame page url` from Amazon Product Advertising API
  1. Find `All Customer Reviews Page url` and load it
  1. Find ID array of the reviews on the page
    1. Load the `Review page` and crawl it
  1. Find `Next page url`
    1. Repeat crawling until the end page
