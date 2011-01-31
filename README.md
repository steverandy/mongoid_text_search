# Overview

This gem is used in addition to Mongoid gem (up to version 2.0.0.beta.20), to provide simple search function.
It takes one or many string fields. Those strings will be cleaned up and transform into array so they can be indexed.
Searching later on will simply partially matches the input keywords with the indexed keywords in the arrays.

## Installation
    
    gem "mongoid-simple_search"

## Getting Started

Add the following into your model.

    include Mongoid::SimpleSearch

Specify which field(s) to be included as the keywords.

    simple_search_for_fields :title, :description

The above will create three new fields (array type): title_keywords, description_keywords, and keywords.

## Available Class Methods

Convert any string into an array of clean keywords.

    generate_clean_keywords(string)

Search documents with an array of keywords to match.
Use the previous method to generate an array of clean keywords from a string.

    with_keywords(array)

There are also dynamic search methods for each field that was passed in simple_search_for_fields method.

    with_title_keywords(array)
    with_description_keywords(array)