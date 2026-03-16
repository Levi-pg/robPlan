***Settings***
Library    Selenium2Library
Library    Collections

*** Keywords ***
Login To Space
    Open Browser   https://demo.testim.io   firefox
    Click element    //*[@id="app"]/div/header/div/div[2]/ul/li/button


*** Test Cases ***
Test Valid Login To Space
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]

*** Test Cases ***
Test Invalid Login To Space
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    '   
    
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]

*** Test Cases ***
Test Null Login To Space
    Login To Space
    ${user}=    Get Value    xpath=//*[@id="login"]/div[1]/input
    Sleep    1s
    Run Keyword If    '${user}' == ''    Input Text    xpath=//*[@id="login"]/div[1]/input    John
    ${pass_temp}=    Get Value    xpath=//*[@id="login"]/div[2]/input
    Sleep    1s
    Run Keyword If    '${pass_temp}' == ''    Input Text    xpath=//*[@id="login"]/div[2]/input    password
    Sleep    1s
    ${pass}=    Get Value    xpath=//*[@id="login"]/div[2]/input
    Run Keyword If    '${pass}' == ''    Input Text    xpath=//*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]


*** Test Cases ***
Space Logout
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Sleep    1s
    Click element    //*[@id="app"]/div/header/div/div[2]/ul/div/button/span[1]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/ul/li/a

*** Test Cases ***
Load space page
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Location Should Be    https://demo.testim.io/

*** Test Cases *** 
Space Item Menu Navigation
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
   Click Element    //*[@id="app"]/div/section[2]/div[4]/div/div/div[3]/div[4]/button
    Page Should Contain    Checkout

*** Test Cases *** 
Space Top Navigation
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
   Click Element    //*[@id="app"]/div/section[2]/div[4]/div/div/div[3]/div[4]/button
    Page Should Contain    Checkout
    Sleep    1s
    Click Element    //*[@id="app"]/div/footer/div[2]/div[2]/span

*** Test Cases ***
Space Item List
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    ${count}=    Get Element Count    xpath=//*[@id="app"]/div/section[2]/div[4]/div/div/div
    Should Be Equal As Integers    ${count}    6
    
*** Test Cases ***
Space Item ilter
    Login To Space
    Input Text    //*[@id="login"]/div[1]/input    John
    Input Text    //*[@id="login"]/div[2]/input    password
    Click element    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[2]/div
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[2]/ul/li[2]