# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9-large' do
  version '14,36'
  sha256 '773b4756a38ff61b1c2e3f4aee4a431bd66541b80e0f7e5982d3efcbf61f06df'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14%2B36_openj9-0.19.0/OpenJDK14-jdk_x64_mac_openj9_macosXL_14_36_openj9-0.19.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14-jdk_x64_mac_openj9_macosXL_14_36_openj9-0.19.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jdk'
end
