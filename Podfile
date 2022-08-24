flutter_application_path = '../../Flutter/FlutterTest/bb_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'FlutterSample' do
  use_frameworks!
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)
  #target.build_configurations.each do |config|
   # config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    #config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'i386 arm64'
  #end
end
  
