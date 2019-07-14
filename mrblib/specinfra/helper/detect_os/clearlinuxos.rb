module Specinfra
  module Helper
    class DetectOs
      class Clearlinuxos < Specinfra::Helper::DetectOs
        def detect
          if (clearlinuxos_info = run_command('/usr/bin/swupd')) && clearlinuxos_info.success?
            distro = 'clearlinuxos'
            release = nil
            { family: distro, release: release }
          end
        end
      end
    end
  end
end
