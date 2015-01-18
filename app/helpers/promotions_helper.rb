module PromotionsHelper
  # cut the sentence on whole words
  def truncate_description description, max_length
    if description.length < 1
      "Lorem ipsum dolor"
    end
    trunc = ""
    if description.length > max_length
      tokens = description.split
      tokens.each { |tok|
        if (trunc.length + tok.length) <= max_length
          trunc.concat(tok).concat(" ")
        end
      }
    end
    trunc
  end
end
