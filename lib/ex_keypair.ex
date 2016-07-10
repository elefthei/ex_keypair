defmodule ExKeypair do
  @doc
  '''
  Generate RSA key pair using openssl ports in Elixir.
  TODO: Skip FS and generate key pair in memory
  '''
  def keypair do
   {_, 0} = System.cmd "openssl", [ "genrsa", "-out", "ExPrivateKey.pem", "2048"]
    {_, 0} = System.cmd "openssl", [ "rsa", "-pubout", "-in" ,"ExPrivateKey.pem", "-out", "ExPublicKey.pem" ]
    {:ok, priv} = File.read("ExPrivateKey.pem")
    {:ok, pub} = File.read("ExPublicKey.pem")
    {_, 0} = System.cmd "rm", ["-f", "ExPrivateKey.pem"]
    {_, 0} = System.cmd "rm", ["-f", "ExPublicKey.pem"]

    # Return tuple for key pair 
    {priv, pub}
  end
end
