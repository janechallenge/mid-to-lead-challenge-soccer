# mid-to-lead-challenge-soccer

## Ruby Version

Supported Ruby version is 3.1.2

## Design Notes

Will use IO to read from either file or stdin.
Defined a class per game.

## How to Run Program

Reading input from piped STDIN:
`echo "{input}" | ruby solver.rb`

or

Reading input from file:
`ruby solver.rb {filename}` (`ruby solver.rb sample-input.txt` for example).

Or by making the script an executable:
- `chmod +x solver.rb`
- `./solver.rb`

## How to Run Tests

`rake test` (or simply `rake` as test is the default task)
