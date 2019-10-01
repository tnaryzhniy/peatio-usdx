module Peatio
  module Usdx
    module Hooks
      BLOCKCHAIN_VERSION_REQUIREMENT = "~> 1.0.0"
      WALLET_VERSION_REQUIREMENT = "~> 1.0.0"

      class << self
        def check_compatibility
          unless Gem::Requirement.new(BLOCKCHAIN_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Blockchain::VERSION))
            [
              "Usdx blockchain version requiremnt was not suttisfied by Peatio::Blockchain.",
              "Usdx blockchain requires #{BLOCKCHAIN_VERSION_REQUIREMENT}.",
              "Peatio::Blockchain version is #{Peatio::Blockchain::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end

          unless Gem::Requirement.new(WALLET_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Wallet::VERSION))
            [
              "Usdx wallet version requiremnt was not suttisfied by Peatio::Wallet.",
              "Usdx wallet requires #{WALLET_VERSION_REQUIREMENT}.",
              "Peatio::Wallet version is #{Peatio::Wallet::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:usdx] = Usdx::Blockchain.new
          Peatio::Wallet.registry[:usdx] = Usdx::Wallet.new
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/usdx/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
