require 'spec_helper'

describe BingAdsApi do
  let(:customer_id) { ENV.fetch('CUSTOMER_ID') }
  let(:customer_account_id) { ENV.fetch('CUSTOMER_ACCOUNT_ID') }
  let(:developer_token) { ENV.fetch('DEVELOPER_TOKEN') }
  let(:oauth2_client_id) { ENV.fetch('OAUTH2_CLIENT_ID') }
  let(:oauth2_client_secret) { ENV.fetch('OAUTH2_CLIENT_SECRET') }
  let(:access_token) { ENV.fetch('ACCESS_TOKEN') }
  let(:refresh_token) { ENV.fetch('REFRESH_TOKEN') }

  let(:bing_ads) do
    BingAdsApi::Api.new(
      authentication: {
        method: :OAuth2,
        developer_token: developer_token,
        customer_id: customer_id,
        customer_account_id: customer_account_id,
        oauth2_client_id: oauth2_client_id,
        oauth2_client_secret: oauth2_client_secret,
        oauth2_token: {
          :access_token => access_token,
          :refresh_token => refresh_token
        }
      },
      service: { environment: 'PRODUCTION' },
      library: { log_level: 'DEBUG' }
    )
  end

  it 'comes from a module' do # simple test to init tests
    BingAdsApi.should be_a_kind_of(Module)
  end

  it 'authenticates' do
    expect { bing_ads }.to_not raise_error
  end

  let(:service) do
    bing_ads.service(svc, version)
  end

  context 'v13' do
    let(:version) { :v13 }

    context 'CampaignManagementService' do
      let(:svc) { :CampaignManagementService }

      it 'selects the service' do
        expect { service }.to_not raise_error
      end

      xit 'add_campaigns' do
        service.add_campaigns(
          account_id: customer_account_id,
          campaigns: {
            campaign: [
              {
                budget_type: 'DailyBudgetWithMaximumMonthlySpend',
                conversion_tracking_enabled: false,
                daily_budget: 5,
                daylight_saving: false,
                description: 'A perfect new campaign',
                monthly_budget: 50,
                name: 'perfectcampaign',
                time_zone: 'BrusselsCopenhagenMadridParis'
              }
            ]
          }
        ).should be_a_kind_of(Hash)
      end

      xit 'get_campaigns_by_account_id' do
        service.get_campaigns_by_account_id({ account_id: customer_account_id }).should be_a_kind_of(Hash)
      end
    end

    context 'CampaignManagementService' do
      let(:svc) { :CampaignManagementService }

      it 'get_campaigns_by_account_id' do
        VCR.use_cassette('CampaignManagementService') do
          campaigns = service.get_campaigns_by_account_id({ account_id: customer_account_id})
          #campaigns.should be_a_kind_of(Hash)
          puts "campaigns=#{campaigns}"
        end
      end
    end

    context 'ReportingService' do
      let(:svc) { :ReportingService }

      let(:message) do
        {
          :report_request => {
            :format => "Tsv",
            :language => "English",
            :report_name => "MyReport",
            :return_only_complete_data => false,
            :aggregation => "Daily",
            :columns => {
              :campaign_performance_report_column => [
                "AccountId",
                "AccountName",
                "CampaignId",
                "CampaignName",
                "DeliveredMatchType",
                "AverageCpc",
                "AdDistribution",
                "CurrencyCode",
                "Impressions",
                "Clicks",
                "Ctr",
                "CostPerConversion",
                "Spend",
                "AveragePosition",
                "TimePeriod",
                "CampaignStatus",
                "DeviceType"
              ],
            },
            :scope => {
              :account_ids => {'arr:long' => customer_account_id},
            },
            :time => {
              :custom_date_range_end => {
                :day => 3,
                :month => 3,
                :year => 2022,
              },
              :custom_date_range_start => {
                :day => 1,
                :month => 3,
                :year => 2022,
              },
            }
          },
          :attributes! => {
            :report_request => { 'xsi:type' => 'CampaignPerformanceReportRequest', 'xsi:nil' => false}
          }
        }
      end

      it 'submit_generate_report' do
        VCR.use_cassette('ReportingService') do
          report = service.submit_generate_report(message)
          puts "report=#{report}"
        end
      end
    end

    context 'CustomerManagementService' do
      let(:svc) { :CustomerManagementService }

      # get_account, add_account, update_account, delete_account
      # get_customers_info, get_customer, update_customer, signup_customer, delete_customer, get_customer_pilot_feature
      # add_user, update_user, update_user_roles, get_user, delete_user, get_users_info
      xit 'get_customer' do
        customer = service.get_customer({ customer_id: customer_id})
        customer.should be_a_kind_of(Hash)
        puts "customer=#{customer}"
      end

      xit 'get_user' do
        user = service.get_user({ user_id: '226562' })
        user.should be_a_kind_of(Hash)
      end

      xit 'get_accounts_info' do
        customer_accounts = service.get_accounts_info({ customer_id: customer_id})
        customer_accounts.should be_a_kind_of(Hash)
      end

      xit 'get_account' do
        customer_account = service.get_account({ account_id: $customer_accounts[:accounts_info][:account_info][:id] })
        customer_account.should be_a_kind_of(Hash)
      end

      xit "get_users_info" do #DOES NOT WORK IN SANDBOX
       users_info = service.get_users_info({:customer_id => customer_id})
       users_info.should be_a_kind_of(Hash)
      end

      xit "get customers info" do #DOES NOT WORK IN SANDBOX
       customers_infos = service.get_customers_info({})
       customers_infos.should be_a_kind_of(Hash)
      end

      xit "signup_customer" do #DOES NOT WORK IN SANDBOX
       service.signup_customer({:account => {},
                                       :application_scope => "Advertiser",
                                       :customer => {:id => c[:id], :customer_address => c[:customer_address], :industry => c[:industry], :market => c[:market], :name => c[:name], :time_stamp => c[:time_stamp]},
                                       :parent_customer_id => $customer[:customer][:id],
                                       :user => {}}).should be_a_kind_of(Hash)
      end

      xit "update_customer" do #DOES NOT WORK IN SANDBOX
       c = $customer[:customer]
       $customer_srv13.update_customer({:customer => {:id => c[:id], :customer_address => c[:customer_address], :industry => c[:industry], :market => c[:market], :name => c[:name], :time_stamp => c[:time_stamp]}}).should be_a_kind_of(Hash)
      end
    end
  end
end
