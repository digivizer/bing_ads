# Encoding: utf-8
#
# This is auto-generated code, changes will be overwritten.
#
# Copyright:: Copyright 2015, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License, Version 2.0.
#
# Code generated by AdsCommon library 0.9.9 on 2022-05-10 09:44:49.

require 'bing_ads_api/errors'

module BingAdsApi; module V13; module CustomerBillingService
  class CustomerBillingServiceRegistry
    CUSTOMERBILLINGSERVICE_METHODS = {:get_billing_documents_info=>{:input=>[], :output=>{:name=>"get_billing_documents_info_response", :fields=>[]}, :original_name=>"GetBillingDocumentsInfo"}, :get_billing_documents=>{:input=>[], :output=>{:name=>"get_billing_documents_response", :fields=>[]}, :original_name=>"GetBillingDocuments"}, :add_insertion_order=>{:input=>[], :output=>{:name=>"add_insertion_order_response", :fields=>[]}, :original_name=>"AddInsertionOrder"}, :update_insertion_order=>{:input=>[], :output=>{:name=>"update_insertion_order_response", :fields=>[]}, :original_name=>"UpdateInsertionOrder"}, :search_insertion_orders=>{:input=>[], :output=>{:name=>"search_insertion_orders_response", :fields=>[]}, :original_name=>"SearchInsertionOrders"}, :get_account_monthly_spend=>{:input=>[], :output=>{:name=>"get_account_monthly_spend_response", :fields=>[]}, :original_name=>"GetAccountMonthlySpend"}, :dispatch_coupons=>{:input=>[], :output=>{:name=>"dispatch_coupons_response", :fields=>[]}, :original_name=>"DispatchCoupons"}, :redeem_coupon=>{:input=>[], :output=>{:name=>"redeem_coupon_response", :fields=>[]}, :original_name=>"RedeemCoupon"}, :search_coupons=>{:input=>[], :output=>{:name=>"search_coupons_response", :fields=>[]}, :original_name=>"SearchCoupons"}}
    CUSTOMERBILLINGSERVICE_TYPES = {}
    CUSTOMERBILLINGSERVICE_NAMESPACES = []

    def self.get_method_signature(method_name)
      return CUSTOMERBILLINGSERVICE_METHODS[method_name.to_sym]
    end

    def self.get_type_signature(type_name)
      return CUSTOMERBILLINGSERVICE_TYPES[type_name.to_sym]
    end

    def self.get_namespace(index)
      return CUSTOMERBILLINGSERVICE_NAMESPACES[index]
    end
  end
end; end; end
