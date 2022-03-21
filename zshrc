gpgconf --launch gpg-agent
# Prompt for pin to make sure yubikey is working correctly
local serialno=$(gpg-connect-agent 'scd serialno' /bye | awk '{print $3}')
gpg-connect-agent "scd checkpin $serialno" /bye
