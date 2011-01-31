module Mongoid
  module TextSearch
    module KeywordGenerator
      Separator = " "
      StripPunctuationRegex = /[^a-zA-Z0-9]/
      PunctuationReplacement = ""
      IgnoredWords = [
      ]
      
      def clean_keywords(field)
        clean_keywords = []
        keywords = []
        if field.is_a?(String)
          keywords = field.squeeze(Separator).split(Separator)
        elsif field.is_a?(Array)
          keywords = field
        end
        for keyword in keywords
          if keyword.is_a?(String)
            keyword.downcase!
            keyword.strip!
            keyword.gsub!(StripPunctuationRegex, PunctuationReplacement)
            if keyword.size > 2 && !IgnoredWords.include?(keyword) && !clean_keywords.include?(keyword)
              clean_keywords << keyword
            end
          end
        end
        return clean_keywords
      end

      extend self
    end
  end
end
