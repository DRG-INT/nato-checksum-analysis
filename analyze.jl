using Printf, Statistics

const RAW_TEXT = """  peter@ALMA Intercom •refract % for alg in sha1 sha256 sha512; do echo "=== \$alg ==="; openssl dgst -\$alg NATO-logo-files-2021.zip NATO-logo-files-2021..zip; cat NATO-logo-files-2021.zip NATO-logo-files-2021..zip | openssl dgst -\$alg; done
  === sha1 ===
  SHA1(NATO-logo-files-2021.zip)= 27cee2652aaf19eac8cc7b24ec64bc2a0abd3086
  SHA1(NATO-logo-files-2021..zip)= 27cee2652aaf19eac8cc7b24ec64bc2a0abd3086
  SHA1(stdin)= e0a6bb2b3eec4bb8076fb07cfec39c9a504a4ada
  === sha256 ===
  SHA2-256(NATO-logo-files-2021.zip)= eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042
  SHA2-256(NATO-logo-files-2021..zip)= eddefda1c8f143b4adec8fc41e4aeaa89a210aaef157e07ba8aa4ea7c4b9b042
  SHA2-256(stdin)= 5e8f6f20603c5a8ebaf8772314820aa5ad6c2033b4bb8f8a9f97f0655b9824b1
  === sha512 ===
  SHA2-512(NATO-logo-files-2021.zip)= 10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1
  SHA2-512(NATO-logo-files-2021..zip)= 10f2da80ae9b8337122b9785156180528ed48654ffeb771058083623ad66bf56509ad48cd9a93878ff6ec6360f31b88c6240321b561b413e475b4bc23aa9a2c1
  SHA2-512(stdin)= 4376e28a0ce1198b2463b0b8d01caecfcf8ce435af59ae3f46cfa52a1abffa8443749dac4d83e873be0edbcaa1271cb190ac6fbc97fe1cbaa9f0dfa45e742221"""

function main()
    total_chars = length(RAW_TEXT)
    n_digits = count(isdigit, RAW_TEXT)
    n_letters = count(isletter, RAW_TEXT)
    n_alnum = n_digits + n_letters
    println("Total chars: $total_chars | Alphanumeric: $n_alnum | Digits: $n_digits | Letters: $n_letters")
end

main()
