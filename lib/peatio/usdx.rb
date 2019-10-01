require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module Usdx
    require 'peatio/usdx/blockchain'
    require 'peatio/usdx/client'
    require 'peatio/usdx/wallet'

    require 'peatio/usdx/version'

    class Error < StandardError; end
  end
end


require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module Litecoin
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/litecoin/blockchain"
    require "peatio/litecoin/client"
    require "peatio/litecoin/wallet"

    require "peatio/litecoin/hooks"

    require "peatio/litecoin/version"
  end
end
