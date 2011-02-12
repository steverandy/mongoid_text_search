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
            clean_keyword = keyword.downcase
            clean_keyword.strip!
            clean_keyword.gsub!(StripPunctuationRegex, PunctuationReplacement)
            if clean_keyword.size > 2 && !IgnoredWords.include?(clean_keyword) && !clean_keywords.include?(clean_keyword)
              clean_keywords << clean_keyword
            end
          end
        end
        return clean_keywords
      end

      extend self
    end
  end
end
