defmodule ExKeypair do
  @doc
  '''
  Generate RSA key pair using openssl ports in Elixir.
  TODO: Skip FS and generate key pair in memory
  '''
  def keypair do

    destPath = "/tmp/"
    publicKey = "ExPublicKey.pem"
    privateKey = "ExPrivateKey.pem"
    {_, 0} = System.cmd "openssl", [ "genrsa", "-out", privateKey, "2048"]
    {_, 0} = System.cmd "openssl", [ "rsa", "-pubout", "-in" , privateKey, "-out", publicKey ]
    {:ok, priv} = File.read(privateKey)
    {:ok, pub} = File.read(publicKey)

    # Overwrite with random to ensure non-retrieval of keys
    File.copy("/dev/random", privateKey, byte_size(priv))
    File.copy("/dev/random", publicKey, byte_size(pub))

    {_, 0} = System.cmd "rm", ["-f", privateKey]
    {_, 0} = System.cmd "rm", ["-f", publicKey]

    # Return tuple for key pair
    {priv, pub}
  end

  def main(args) do
    IO.inspect keypair
  end
end
