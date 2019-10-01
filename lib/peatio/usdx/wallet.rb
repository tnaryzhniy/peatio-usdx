module Peatio
  module Usdx
    class Wallet < Peatio::Wallet::Abstract

      def initialize(settings = {})
        @settings = settings
      end

      def configure(settings = {})
        # Clean client state during configure.
        @client = nil

        @settings.merge!(settings.slice(*SUPPORTED_SETTINGS))

        @wallet = @settings.fetch(:wallet) do
          raise Peatio::Wallet::MissingSettingError, :wallet
        end.slice(:uri, :address)

        @currency = @settings.fetch(:currency) do
          raise Peatio::Wallet::MissingSettingError, :currency
        end.slice(:id, :base_factor, :options)
      end

      def create_address!(_options = {})
        { address: SecureRandom.uuid }
      end

      private

      def client
        uri = @wallet.fetch(:uri) { raise Peatio::Wallet::MissingSettingError, :uri }
        @client ||= Client.new(uri)
      end
    end
  end
end
