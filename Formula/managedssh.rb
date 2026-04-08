class Managedssh < Formula
  desc "Terminal-first SSH connection manager with encrypted credential storage"
  homepage "https://github.com/mylovelytools/managedssh"
  url "https://github.com/mylovelytools/managedssh/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "5007dee43b9f9570c6365ed5cd82b1c5e104a6dafb7949a86fd62eb7ab688048"
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
