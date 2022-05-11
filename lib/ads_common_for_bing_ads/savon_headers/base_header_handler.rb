module AdsCommonForBingAds
  module SavonHeaders

    class BaseHeaderHandler

      DEFAULT_NAMESPACE = :v13

      # Generates SOAP headers with the default request header element.
      def generate_headers(request, soap)
        soap.header.merge!(generate_request_header())
      end

    end
  end
end