#Milestone Checker

This is a small script that accesses the closed milestones of a repository and returns the highest version number.  The script assumes that milestones are in the [semver](http://semver.org/) format.

##Usage

In `/helpers/uri_builder.rb` complete the `BASE` constant with the details of the repo you want to access.

Run the script using:
`ruby mile.rb <Token>` where `<Token>` is your GitHub personal access token.  This is what allows access to private repositories.

###A note on `MAX_PAGES`

The `MAX_PAGES` variable in `mile.rb` puts a cap on the maximum number of calls that can be made to the API in a single run.  The script will loop until an empty milestone page is reached or `MAX_PAGES` pages have been traversed.  This is to act as a failsafe to prevent the loop from iterating constantly (as using `while true` makes me nervous).  The [rate limit](https://developer.github.com/v3/#rate-limiting) for requests is set by GitHub to be 5000 requests per hour.
