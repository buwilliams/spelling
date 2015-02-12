# Spelling

This project is written in Ruby. It uses the `say` command on
Macs to say and spell words that my daughter needs to learn
for school.

## Features

- Uses `say` command on Macs
- Spelling words are kept in a words directory so it's easy to add new ones
- Very simple interface for kids
- Only repeats words that are missed
- Makes it easier on us (my wife and I) to work on spelling with our daughter
- Some of the speaking scripts are customizable
- Ability to skip introductory scripts

## Usage

For all these commands you need to open a terminal:
- Use default settings: `ruby spelling.rb`
- Specifiy words: `ruby spelling.rb --words=words/02-week.txt`
- Skip Intro (recommended after first day of practice): `ruby spelling.rb --words=words/02-week.txt --skip-intro=true`

## Install Spelling

__Install Required Software__

1. Install [homebrew](http://brew.sh/)
1. `brew install ruby`
1. `brew install git`

__Install Spelling__

1. `git clone https://github.com/buwilliams/spelling.git`
1. `cd spelling`
1. `ruby spelling.rb --words=words/01-week.txt`
