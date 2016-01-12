#Milestone Checker

This is a small script that accesses the closed milestones of a repository and returns the highest version number.  The script assumes that milestones are in the [semver](http://semver.org/) format.

##Usage

In `/helpers/uri_builder.rb` complete the `BASE` constant with the details of the repo you want to access.

Run the script using:
`ruby mile.rb <Token>` where `<Token>` is your GitHub personal access token.  This is what allows access to private repositories.
