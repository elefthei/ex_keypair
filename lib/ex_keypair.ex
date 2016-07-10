defmodule ExKeypair do
  def keypair do
    @doc
    '''
    Generate RSA key pair using openssl ports in Elixir.
    TODO: Skip FS and generate key pair in memory
    '''
    {_, 0} = System.cmd "openssl", [ "genrsa", "-out", "privateKey.pem", "2048"]
    {_, 0} = System.cmd "openssl", [ "rsa", "-pubout", "-in" ,"privateKey.pem", "-out", "publicKey.pem" ]
    {:ok, priv} = File.read("privateKey.pem")
    {:ok, pub} = File.read("publicKey.pem")
    {_, 0} = System.cmd "rm", ["-f", "privateKey.pem"]
    {_, 0} = System.cmd "rm", ["-f", "publicKey.pem"]

    # Return tuple for key pair 
    {priv, pub}
  end
end
