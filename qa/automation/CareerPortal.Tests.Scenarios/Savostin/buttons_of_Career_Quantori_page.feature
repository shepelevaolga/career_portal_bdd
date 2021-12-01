Feature: 1.0.0 All buttons of "Career Quantori" page lead to correct pages
Background: 
	Given https://career.quantori.com/ page is opened

Scenario Outline: 1.0.0_01 All buttons of header lead to correct pages
	When user clicks on <button>
	Then <page> should be opened

	Examples:
	|button            |page                                 |
	|Quantori          |https://career.quantori.com          |
	|About             |https://career.quantori.com/about    |
	|Open job positions|https://career.quantori.com/positions|
	|Contact           |https://career.quantori.com/contact  |

Scenario Outline: 1.0.0_02 All buttons of footer lead to correct pages
	When user clicks on <button>
	# VPN must be active to open linkedin
	Then <page> should be opened

	Examples:
	|button             |page                                                                             |
	|Quantori logo      |https://career.quantori.com                                                      |
	|Data Privacy Policy|https://career.quantori.com/static/Quantori_Web_Privacy_Policy.pdf               |
	|planet             |https://www.quantori.com                                                         |
	|postal envelope    |https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=career@quantori.com|
	|hh                 |https://hh.ru/employer/3343960                                                   |
	|f                  |https://www.facebook.com/quantoricom/                                            |
	|camera             |https://www.instagram.com/quantori_community/                                    |
	|vk                 |https://vk.com/quantori                                                          |
	|linkedin           |https://www.linkedin.com/company/quantori                                        |

Scenario Outline: 1.0.0_03 Buttons on body of the page lead to pages with correct titles
	When user clicks on <button>
	Then page with <title> should be opened

	Examples: 
	|position                                   |name                                       |
	|Cloud Python Engineer                      |Cloud Python Engineer                      |
	|Senior Linux Engineer                      |Senior Linux Engineer                      |
	|Senior QA Automation (JavaScript) Engineer |Senior QA Automation (JavaScript) Engineer |
	|Snowflake Data Warehouse Certified Engineer|Snowflake Data Warehouse Certified Engineer|
	|Senior Front End (React) Engineer          |Senior Front End (React) Engineer          |
	|Senior .NET (Full Stack) Engineer          |Senior .NET (Full Stack) Engineer          |
	|Senior AWS DevOps Engineer                 |Senior AWS DevOps Engineer                 |
	|Lead Big Data Engineer                     |Lead Big Data Engineer                     |
	|More open job positions                    |Quantori open job positions                |
	|Learn more                                 |About Quantori                             |