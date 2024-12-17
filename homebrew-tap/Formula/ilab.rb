class Ilab < Formula
  desc "InstructLab CLI"
  homepage "https://github.com/instructlab/instructlab"
  url "https://github.com/instructlab/instructlab.git", tag: "v0.21.0", revision: "5e234c5352bcfc1d2019d097ad4c64b7314e0102"
  license "Apache-2.0 AND MIT"

  depends_on "python@3.11"
  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
    # Use Python from Homebrew
    py = Formula["python@3.11"].opt_bin/"python3"

    # Upgrade pip and install wheel and setuptools-scm
    system py, "-m", "pip", "install", "--upgrade", "pip"
    system py, "-m", "pip", "install", "--no-cache-dir", "wheel", "setuptools-scm"

    # Install the package with pip
    system py, "-m", "pip", "install", "--no-cache-dir", "--prefix=#{prefix}", "."
  end

  test do
    # Basic test to ensure `ilab` is functional
    assert_match "InstructLab CLI", shell_output("#{bin}/ilab --help")
  end
end
