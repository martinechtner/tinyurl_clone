## TinyURL clone in Ruby on Rails

Allow users to submit a URL which will then be shortened and can be shared.

When users click on the short URL they are redirected to the long URL.

Track the IP address of each visit to a URL.

/             # home page where user can enter a URL

/:token       # redirects to full URL

/:token/info  # info about URL and visitor count

## Testing
The app can be tested at https://my-tiny-url-clone.herokuapp.com/
** Note this a free Heroku server so it may be slow to startup **
