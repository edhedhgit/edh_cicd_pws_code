param (
    [string]$userID
)

# Make an HTTP request to ReqRes API
$response = Invoke-RestMethod -Uri https://reqres.in/api/users/$userID
 
# Extract user details
$user = $response.data
$firstName = $user.first_name
$lastName = $user.last_name
 
# Construct the greeting
$greeting = "Hello, $firstName $lastName! Welcome to the World."
 
# Write the greeting to a file
$greeting | Out-File -FilePath "HelloWorldOutput.txt"
 
# Display the greeting in the console
Write-Host $greeting

return $greeting