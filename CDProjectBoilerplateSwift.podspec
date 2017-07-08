Pod::Spec.new do |s|
  s.name             = 'CDProjectBoilerplateSwift'
  s.version          = '1.0.0'
  s.summary          = 'Framework containing boilerplate Swift classes for new projects.'
  s.description      = <<-DESC
This framework contains Swift classes found to be used among several projects.
                       DESC
  s.homepage         = 'https://github.com/chrisdhaan/CDProjectBoilerplateSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Christopher de Haan' => 'contact@christopherdehaan.me' }
  s.source           = { :git => 'https://github.com/chrisdhaan/CDProjectBoilerplateSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dehaan_solo'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
  s.resources = ['Resources/**/*']
  s.dependency 'Material', '~> 2.0'
  s.dependency 'NVActivityIndicatorView', '3.6.1'
  s.dependency 'SlideMenuControllerSwift', '~> 3.0'
  s.dependency 'SwiftyUserDefaults', '~> 3.0'
  s.dependency 'Toaster', '~> 2.0'
end
