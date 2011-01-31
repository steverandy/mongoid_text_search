require "mongoid_text_search/keyword_generator"

module Mongoid
  module TextSearch
    extend ActiveSupport::Concern
    
    included do
      before_save :set_keywords
    end
    
    module ClassMethods
      def search_fields
        @search_fields ||= []
      end
      
      def text_search_for_fields(*fields)
        @search_fields = fields
                
        # Create keyword field that will store all the keywords.
        field :keywords, :type => Array
        index :keywords
        
        # Create a method for searching based on keywords of all specified field.
        singleton.send :define_method, "with_keywords" do |keywords|
          if !keywords.nil? && keywords.count > 0
            where(:keywords.all => keywords.collect!{ |keyword| /.*#{keyword}.*/ })
          else
            where() # Select everything.
          end
        end
      end
      
      def generate_clean_keywords(string)
        KeywordGenerator.clean_keywords(string)
      end
    end
    
    module InstanceMethods
      def set_keywords
        for field in self.class.search_fields
          self.keywords << KeywordGenerator.clean_keywords(send("#{field}"))
        end
      end
    end 
  end
end