def transform_letter(letter, n)
    n = n % 26
    if n >= 0
        if [*('a'..'z')].include? letter
            letter.ord + n <= 122 ? coded_letter = (letter.ord + n).chr : coded_letter = (letter.ord + n - 26).chr
        else
            letter.ord + n <= 90 ? coded_letter = (letter.ord + n).chr : coded_letter = (letter.ord + n - 26).chr
        end
    else
        if [*('a'..'z')].include? letter
            letter.ord + n >= 97 ? coded_letter = (letter.ord + n).chr : coded_letter = (letter.ord + n + 26).chr
        else
            letter.ord + n >= 65 ? coded_letter = (letter.ord + n).chr : coded_letter = (letter.ord + n + 26).chr
        end
    end
    return coded_letter
end

def transform_word(word, n)
    word_array = word.chars
    coded_word = word_array.map { |letter| transform_letter(letter, n) }.join
    return coded_word
end

def ceaser_cypher(string, n)
    string_array = string.split
    coded_string = string_array.map { |word| transform_word(word, n) }.join(" ")
    puts coded_string
    return coded_string
end

ceaser_cypher("The Hacking Project", 26)

