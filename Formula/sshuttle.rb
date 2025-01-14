class Sshuttle < Formula
  include Language::Python::Virtualenv

  desc "Proxy server that works as a poor man's VPN"
  homepage "https://github.com/sshuttle/sshuttle"
  url "https://github.com/sshuttle/sshuttle.git",
      tag:      "v1.0.4",
      revision: "abb48f199656f776be0f05601ff5746f36df3370"
  license "LGPL-2.1-or-later"
  revision 1
  head "https://github.com/sshuttle/sshuttle.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "41b9c52318318597e31403c66bc1fff91fd3da97047e6d82344f406118d06d17" => :catalina
    sha256 "5ee6b7d0f0afdd178a769213c1da1c1caea53228e8a21dcd4571b7fcc643deef" => :mojave
    sha256 "ddc86c2b17f9b3caedd813a8f2d11b9154637f5783b73a031276aef78909b1c1" => :high_sierra
  end

  depends_on "python@3.9"

  def install
    # Building the docs requires installing
    # markdown & BeautifulSoup Python modules
    # so we don't.
    virtualenv_install_with_resources
  end

  test do
    system bin/"sshuttle", "-h"
  end
end
