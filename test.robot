*** Settings ***
Documentation                             Sorting laptop prices by most expensive
Library                                   SeleniumLibrary
Library                                   Collections
Library                                   String
Library                                   ../lib/convert.py
Test Setup                                Run Keywords                          Open Chrome Browser
Test Teardown                             Close Browser

*** Variables ***
${Select_Max_Price}                       //*[contains(text(), 'گران‌ترین')]
${Max_price_is_selected}                  //div[6][@class="pointer text-no-wrap text-body2-strong color-primary-700 sortAndStatsHeader_SortAndStatsHeader__SortOption__yqiM8"]
${Max_price_is_not_selected}              //div[6][@class="pointer text-no-wrap text-body-2 color-500 sortAndStatsHeader_SortAndStatsHeader__SortOption__yqiM8"]
${Max_Price_Item}                         (//div[@id="plpLayoutContainer"]//div[@class="d-flex ai-center jc-end gap-1 color-700 color-400 text-h5 grow-1"]/span)[1]
${Price_values}                           //div[@id="plpLayoutContainer"]//div[@class="d-flex ai-center jc-end gap-1 color-700 color-400 text-h5 grow-1"]/span

*** Test Cases ***
Sorting laptop prices by most expensive
  Select the most expensive button
  Scroll down the page
  The most expensive option must be selected
  Find the most expensive price
  Sorting the most expensive price

*** Keywords ***
Find the most expensive price
  ${Prices_list}                          Create List
  ${Max_price}                            Get Text                              ${Max_Price_Item}
  ${Max_price}                            convert number                        ${Max_price}
  Set Suite Variable                      ${Max_price}                          ${Max_price}
  Set Suite Variable                      ${Prices_list}                        ${Prices_list}

Sorting the most expensive price
  FOR    ${i}    IN RANGE   10
         ${Elements}                      Get WebElements                       ${Price_values}
         ${Price}                         Get Text                              ${Elements}[${i}]
         ${EN_price}                      convert number                        ${Price}
         Log To Console                   ${Max_price}
         ${Price}                         Run Keyword If                        '${EN_price}'<='${Max_price}'
         ...                              Convert To String                     ${EN_price}
         ...                              ELSE     Fail       Prices have not sort by most expensive price
         ${Max_price}                     Convert To String                     ${Price}
         Append to List                   ${Prices_list}                        ${Price}
  END

The most expensive option must be selected
  Wait Until Page Contains Element        ${Max_price_is_selected}              timeout=5s
  Sleep    2s

Scroll down the page
  Execute JavaScript                      window.scrollTo(0,400)

Select the most expensive button
  Wait Until Page Contains Element        ${Max_price_is_not_selected}          timeout=5s
  Click Element                           ${Select_Max_Price}

Open Chrome Browser
  Set Log Level                           trace
  Open Browser                            chrome://version                          browser=chrome
  Maximize Browser Window
  Go To                                   https://www.digikala.com/search/category-notebook-netbook-ultrabook/
  Wait Until Page Contains                 جدیدترین مدل‌های لپ تاپ                    timeout=5s
