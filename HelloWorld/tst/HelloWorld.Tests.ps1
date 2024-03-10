Describe "Test HelloWorld.ps1" {
    Context "Expected Name" {
        BeforeEach {
            # Mock the Invoke-RestMethod command
            Mock Invoke-RestMethod {
                # Simulate a successful API response (adjust data as needed)
                return @{
                    data = @{
                        id         = "1"
                        email      = "test@example.com"
                        first_name = "John"
                        last_name  = "Doe"
                        avatar     = "https://reqres.in/img/avatar.jpg"
                    }
                }
            }
            # Call your HelloWorld.ps1 script (assuming it makes the API call)
            .\.\src\HelloWorld.ps1 -userID 1
        }
    
        It "Should invoke the API call" {
            # Verify that the mocked Invoke-RestMethod was called
            Should -Invoke Invoke-RestMethod -Exactly 1
        }        

        It "Greets the user correctly" {
            # Arrange
            $expectedGreeting = "Hello, John Doe! Welcome to the World."
            # Act
            $actualGreeting = .\.\src\HelloWorld.ps1 -userID "1"
            # Assert
            $actualGreeting | Should -BeExactly $expectedGreeting
        }
    }
    Context "Unxpected Name" {
        BeforeEach {
            # Mock the Invoke-RestMethod command
            Mock Invoke-RestMethod {
                # Simulate a successful API response (adjust data as needed)
                return @{
                    data = @{
                        id         = "1"
                        email      = "test@example.com"
                        first_name = "Jane"
                        last_name  = "Doe"
                        avatar     = "https://reqres.in/img/avatar.jpg"
                    }
                }
            }
            # Call your HelloWorld.ps1 script (assuming it makes the API call)
            .\.\src\HelloWorld.ps1 -userID 1
        }
    
        It "Should invoke the API call" {
            # Verify that the mocked Invoke-RestMethod was called
            Should -Invoke Invoke-RestMethod -Exactly 1
        }        

        It "Greets the user correctly" {
            # Arrange
            $expectedGreeting = "Hello, John Doe! Welcome to the World."
            # Act
            $actualGreeting = .\.\src\HelloWorld.ps1 -userID "1"
            # Assert
            $actualGreeting | Should -BeExactly $expectedGreeting
        }
    }
}
