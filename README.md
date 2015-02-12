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

## Installation

__Install Required Software__

# Install [homebrew](http://brew.sh/)
# `brew install ruby`
# `brew install git`

__Install Spelling__

# `git clone https://github.com/buwilliams/spelling.git`
# `cd spelling`
# `ruby spelling.rb --words=words/01-week.txt`
