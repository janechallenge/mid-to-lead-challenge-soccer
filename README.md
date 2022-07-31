# mid-to-lead-challenge-soccer

## How to Run Program

Reading input from piped STDIN:
`echo "{input}" | ruby solver.rb`

or

Reading input from file:
`ruby solver.rb {filename}` (`ruby solver.rb sample-input.txt` for example).

[run_solver.webm](https://user-images.githubusercontent.com/110110727/182042863-12c00fe1-a9c6-4a2d-a084-4a552c66b32a.webm)

## How to Run Tests

`rake test` (or simply `rake` as test is the default task)

[rake_test.webm](https://user-images.githubusercontent.com/110110727/182042824-e70b7c40-26e2-4461-92ba-d9604c53f221.webm)

## Ruby Version

Supported Ruby version is `3.1.2`.

## Linting / Formatting

`rubocop` can be used to lint / format program code.

## Design Notes

When program is ran, it detects whether command-line arguments are present and should read from STDIN or specified filename.

On program start, a `Counter` class is instantiated.
`Counter` class keeps track of the matchday, teams who played in this matchday and global scoreboard.

On new game result, the string is passed to a new `Game` class to parse it, define teams playing and calculate score.
If teams haven't already played, program awaits for a new game result.
If teams have already played, scoreboard is displayed and current matchday and teams who played in this matchday are reset.
