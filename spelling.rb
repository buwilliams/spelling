def clear()
    system("clear")
end

def say(str, isPrint=true)
    if(isPrint == true)
        puts "#{str}"
    end
    system("say \"#{str}\" --voice=Samantha")
end

def say_file(path)
    f = File.open(path, "r")
    f.each_line do |line|
      say(line)
    end
    f.close
end

def say_list(ary)
    ary.each do | word |
        say(word, true)
    end
end

def say_letters(word, isPrint=true)
    word.each_byte do | byte |
        say(byte.chr, isPrint)
    end
end

def get_words(path)
    words = []
    f = File.open(path, "r")
    f.each_line do |line|
      words.push(line.delete!("\n"))
    end
    f.close
    return words
end

def say_and_spell(words)
    words.each do | word |
        say("I am going to spell #{word}, say it with me. Here we go:")
        say_letters(word)
    end
end

def pause
    begin
      system("stty raw -echo")
      str = STDIN.getc
    ensure
      system("stty -raw echo")
    end
    if str.chr != ' '
        pause()
    end
end

def quiz(words)
    quiz_words = []
    words.each do | word |
        say("Spell #{word}.", false)
        print "> "
        input = STDIN.gets.chomp
        # puts "Received: #{input}, Wanted: #{word}"
        if input.eql? word
            say("Great job!", false)
        else
            say("Oops! It's spelled:", false)
            say_letters(word)
            quiz_words.push(word)
        end
    end
    return quiz_words
end

def main()

    clear()

    ### Process Command Line Arguments
    cmd = {
        'skip_intro' => false,
        'words' => 'words/01-week.txt'
    }

    ARGV.each do|a|
        split_a = a.split('=')
        key = split_a[0].gsub('--', '').gsub('-', '_')
        value = split_a[1]
        cmd[key] = value
    end

    ### LOAD WORDS
    words = get_words(cmd['words'])

    ### INTRO
    if cmd['skip_intro'] == false
        say_file("scripts/01-intro.txt")
        pause()
        say_file("scripts/02-this-week.txt")
        say_list(words)
        say_and_spell(words)
        say_file("scripts/03-quiz.txt")
        pause()
    end

    ### QUIZ
    clear()
    say("Let's practice spelling.")
    quiz_words = words
    while quiz_words.length != 0
        quiz_words = quiz(quiz_words)
        clear()
        if quiz_words.length != 0
            say("You missed some of the words. Let's work on those.")
            say_and_spell(quiz_words)
            say("Okay, let's practive spelling again.")
            clear()
        end
    end
    say_file("scripts/04-done.txt")

end

trap :INT do
  say("Goodbye!")
  exit
end

main()
