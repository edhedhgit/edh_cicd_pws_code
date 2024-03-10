Describe "HelloWorld" {
    $mockData = @(
        @{
            id = 1
            email = "test1@example.com"
            first_name = "John"
            last_name = "Doe"
            avatar = "https://reqres.in/img/avatar1.jpg"
        }
        
        @{
            id = 2
            email = "test2@example.com"
            first_name = "Bob"
            last_name = "Johnson"
            avatar = "https://reqres.in/img/avatar2.jpg"
        }
        # Add more examples as needed
        )
        
    It "Should invoke the API call" {
        Mock Invoke-RestMethod {
            #return $mockData[$TestNumber - 1]
            return $mockData[1]
        }
        
        # Call your HelloWorld.ps1 script (assuming it makes the API call)
        .\HelloWorld.ps1
        Should -Invoke Invoke-RestMethod -Exactly 1
    }
    
    It "Greets the user correctly" {
        # Arrange
        $expectedGreeting = "Hello, John Doe! Welcome to the World."
        # Act
        $actualGreeting = .\HelloWorld.ps1 -userID "1"
        # Assert
        $actualGreeting | Should -BeExactly $expectedGreeting
    }


}
