module Specinfra
  module Helper
    class DetectOs
      class Clearlinuxos < Specinfra::Helper::DetectOs
        def detect
          if run_command('swupd').success?
            distro  = nil
            release = nil
            os_release = run_command("cat /etc/os-release")
            if os_release.success?
              os_release.stdout.each_line do |line|
                distro  = line.split('=').last.strip if line =~ /^NAME=/
                release = line.split('=').last.strip if line =~ /^VERSION_ID=/
              end
            end
            distro ||= 'clearlinuxos'
            release ||= nil
            { family: distro.gsub(/[^[:alnum:]]/, '').downcase, release: release }
          end
        end
      end
    end
  end
end
