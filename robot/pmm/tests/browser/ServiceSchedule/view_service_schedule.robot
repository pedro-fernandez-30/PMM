*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServiceSchedulePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${contact}                      API Create Contact
    Set suite variable              ${contact}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}


*** Test Cases ***
View and Deliver Perm Test for Service Schedule
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Service Schedule(View and Deliver Perm Set)   
     [tags]                           unstable    perm:view    perm:deliver      feature:ServiceSchedule
     Go To Page                              Listing                               ${ns}ServiceSchedule__c
     Page Should Not Contain Button          New
     Go To Page                              Details              ServiceSchedule__c                    object_id=${service_schedule}[Id]
     Page Should Not Contain Button          Edit
     