Pod::Spec.new do |s|
  s.name             = 'BigRational'
  s.version          = '0.1.0'
  s.summary          = 'An arbitrary-precision number library'
  s.description      = s.summary

  s.homepage         = 'https://github.com/CoinbaseWallet/BigRational'
  s.license          = { :type => "AGPL-3.0-only", :file => 'LICENSE' }
  s.author           = { 'Coinbase' => 'developer@toshi.org' }
  s.source           = { :git => 'https://github.com/CoinbaseWallet/BigRational.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/coinbase'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'BigRational/**/*.swift'

  s.dependency 'BigInt',  '~> 3.1.0'
end
