# Overview

This gem is used in addition to Mongoid gem (up to version 2.0.0.beta.20), to provide simple full text search function. It takes one or many string or array of strings fields. The strings will be cleaned up and transform into array so they can be indexed. Searching later on will simply partially matches the input keywords with the indexed keywords in the arrays.

## Installation
    
    gem "mongoid_text_search"

## Getting Started

Add the following into your model.

    include Mongoid::TextSearch

Specify which field(s) to be included as the keywords. Fields should be string or array of strings.

    text_search_for_fields :title, :description

The above will create a new field called keywords.

## Available Class Methods

Convert any string into an array of clean keywords.

    generate_clean_keywords(string)

Search documents with an array of keywords to match.
Use the previous method to generate an array of clean keywords from a string.

    with_keywords(array)