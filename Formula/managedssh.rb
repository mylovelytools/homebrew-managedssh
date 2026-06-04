class Managedssh < Formula
  desc "Terminal-first SSH connection manager with encrypted credential storage"
  homepage "https://github.com/mylovelytools/managedssh"
  url "https://github.com/mylovelytools/managedssh/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "bded94815a69d4ff4dc3fe85d5e81272f78abcfa60e7054f8097b19cb601799c"
  license "AGPL-3.0-or-later"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args(output: "managedssh", ldflags: "-s -w")

    bin.install "managedssh"
    man1.install "managedssh.1"
    doc.install "LICENSE"
  end

  test do
    assert_match "manage, organize, and connect to your SSH hosts", shell_output("#{bin}/managedssh --help")
  end
end
