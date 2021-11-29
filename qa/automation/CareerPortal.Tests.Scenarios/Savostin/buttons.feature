Feature: 1.0.0 buttons lead to correct pages
Background: 
	Given "Career Quantori" page is opened

Scenario Outline: 1.0.0_01 All buttons of header lead to correct pages
	When user clicks on <button>
	Then <page> is opened

	Examples:
	|button            |page                                 |
	|About             |https://career.quantori.com/about    |
	|Open job positions|https://career.quantori.com/positions|
	|Contact           |https://career.quantori.com/contact  |

Scenario Outline: 1.0.0_02 All buttons of footer lead to correct pages
	When user clicks on <button>
	# VPN must be active
	Then <page> is opened

	Examples:
	|button         |page                                                                             |
	|planet         |https://www.quantori.com                                                         |
	|postal envelope|https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=career@quantori.com|
	|hh             |https://hh.ru/employer/3343960                                                   |
	|f              |https://www.facebook.com/quantoricom/                                            |
	|camera         |https://www.instagram.com/quantori_community/                                    |
	|vk             |https://vk.com/quantori                                                          |
	|in             |https://www.linkedin.com/company/quantori                                        |

Scenario Outline: 1.0.0_03 All the rest buttons of body lead to correct pages
	When user clicks on <button>
	Then <page> is opened

	Examples: 
	|button                 |page                                 |
	|More open job positions|https://career.quantori.com/positions|
	|Learn more             |https://career.quantori.com/about    |

Scenario Outline: 1.0.0_04 Buttons on "Hot open job positions"-table lead to position-pages with the same names
	When user clicks on <position>
	Then page with <name> is opened

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