# Encoding: utf-8
#
# This is auto-generated code, changes will be overwritten.
#
# Copyright:: Copyright 2015, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License, Version 2.0.
#
# Code generated by AdsCommon library 0.9.9 on 2022-05-10 09:44:44.

require 'bing_ads_api/errors'

module BingAdsApi; module V13; module AdInsightService
  class AdInsightServiceRegistry
    ADINSIGHTSERVICE_METHODS = {:get_bid_opportunities=>{:input=>[], :output=>{:name=>"get_bid_opportunities_response", :fields=>[]}, :original_name=>"GetBidOpportunities"}, :get_budget_opportunities=>{:input=>[], :output=>{:name=>"get_budget_opportunities_response", :fields=>[]}, :original_name=>"GetBudgetOpportunities"}, :get_keyword_opportunities=>{:input=>[], :output=>{:name=>"get_keyword_opportunities_response", :fields=>[]}, :original_name=>"GetKeywordOpportunities"}, :get_estimated_bid_by_keyword_ids=>{:input=>[], :output=>{:name=>"get_estimated_bid_by_keyword_ids_response", :fields=>[]}, :original_name=>"GetEstimatedBidByKeywordIds"}, :get_estimated_position_by_keyword_ids=>{:input=>[], :output=>{:name=>"get_estimated_position_by_keyword_ids_response", :fields=>[]}, :original_name=>"GetEstimatedPositionByKeywordIds"}, :get_estimated_bid_by_keywords=>{:input=>[], :output=>{:name=>"get_estimated_bid_by_keywords_response", :fields=>[]}, :original_name=>"GetEstimatedBidByKeywords"}, :get_estimated_position_by_keywords=>{:input=>[], :output=>{:name=>"get_estimated_position_by_keywords_response", :fields=>[]}, :original_name=>"GetEstimatedPositionByKeywords"}, :get_bid_landscape_by_ad_group_ids=>{:input=>[], :output=>{:name=>"get_bid_landscape_by_ad_group_ids_response", :fields=>[]}, :original_name=>"GetBidLandscapeByAdGroupIds"}, :get_bid_landscape_by_keyword_ids=>{:input=>[], :output=>{:name=>"get_bid_landscape_by_keyword_ids_response", :fields=>[]}, :original_name=>"GetBidLandscapeByKeywordIds"}, :get_historical_keyword_performance=>{:input=>[], :output=>{:name=>"get_historical_keyword_performance_response", :fields=>[]}, :original_name=>"GetHistoricalKeywordPerformance"}, :get_historical_search_count=>{:input=>[], :output=>{:name=>"get_historical_search_count_response", :fields=>[]}, :original_name=>"GetHistoricalSearchCount"}, :get_keyword_categories=>{:input=>[], :output=>{:name=>"get_keyword_categories_response", :fields=>[]}, :original_name=>"GetKeywordCategories"}, :get_keyword_demographics=>{:input=>[], :output=>{:name=>"get_keyword_demographics_response", :fields=>[]}, :original_name=>"GetKeywordDemographics"}, :get_keyword_locations=>{:input=>[], :output=>{:name=>"get_keyword_locations_response", :fields=>[]}, :original_name=>"GetKeywordLocations"}, :suggest_keywords_for_url=>{:input=>[], :output=>{:name=>"suggest_keywords_for_url_response", :fields=>[]}, :original_name=>"SuggestKeywordsForUrl"}, :suggest_keywords_from_existing_keywords=>{:input=>[], :output=>{:name=>"suggest_keywords_from_existing_keywords_response", :fields=>[]}, :original_name=>"SuggestKeywordsFromExistingKeywords"}, :get_auction_insight_data=>{:input=>[], :output=>{:name=>"get_auction_insight_data_response", :fields=>[]}, :original_name=>"GetAuctionInsightData"}, :get_domain_categories=>{:input=>[], :output=>{:name=>"get_domain_categories_response", :fields=>[]}, :original_name=>"GetDomainCategories"}, :put_metric_data=>{:input=>[], :output=>{:name=>"put_metric_data_response", :fields=>[]}, :original_name=>"PutMetricData"}, :get_keyword_idea_categories=>{:input=>[], :output=>{:name=>"get_keyword_idea_categories_response", :fields=>[]}, :original_name=>"GetKeywordIdeaCategories"}, :get_keyword_ideas=>{:input=>[], :output=>{:name=>"get_keyword_ideas_response", :fields=>[]}, :original_name=>"GetKeywordIdeas"}, :get_keyword_traffic_estimates=>{:input=>[], :output=>{:name=>"get_keyword_traffic_estimates_response", :fields=>[]}, :original_name=>"GetKeywordTrafficEstimates"}}
    ADINSIGHTSERVICE_TYPES = {}
    ADINSIGHTSERVICE_NAMESPACES = []

    def self.get_method_signature(method_name)
      return ADINSIGHTSERVICE_METHODS[method_name.to_sym]
    end

    def self.get_type_signature(type_name)
      return ADINSIGHTSERVICE_TYPES[type_name.to_sym]
    end

    def self.get_namespace(index)
      return ADINSIGHTSERVICE_NAMESPACES[index]
    end
  end
end; end; end
