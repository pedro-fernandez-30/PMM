/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class FeatureParameters_TEST {
    private static final BasicStub featureManagementStub = new BasicStub(
        FeatureManagement.class
    );

    @TestSetup
    static void generateData() {
        TestDataFactory.generateServiceData();
    }

    @IsTest
    private static void shouldReturnAllParameters() {
        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();

        System.assertEquals(
            FeatureParameters.DeveloperName.values().size(),
            allFeatureParameters.size(),
            'Expected all feature parameters to be returned.'
        );

        System.assert(
            !allFeatureParameters.isEmpty(),
            'Expected at least one feature parameter to be returned.'
        );

        System.assert(!allFeatureParameters.contains(null));
    }

    @IsTest
    private static void integrationTestSendAllParameters() {
        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureManagement.FeatureParameter currentParam;

        try {
            for (FeatureManagement.FeatureParameter param : allFeatureParameters) {
                currentParam = param;
                param.send();
            }
        } catch (Exception ex) {
            System.assert(false, 'Error occurred when sending: ' + currentParam);
        }
    }

    @IsTest
    private static void shouldReturnNullForUndefinedParameters() {
        FeatureManagement.FeatureParameter featureParameter = new FeatureParameters()
            .makeFeatureParameter(null);

        System.assertEquals(
            null,
            featureParameter,
            'Expected null to be returned when dev enum is null.'
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActivePrograms() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActivePrograms activeProgramsParameter = (FeatureParameters.ActivePrograms) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActiveServices() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_SERVICES.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_SERVICES.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActiveServices activeServicesParameter = (FeatureParameters.ActiveServices) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeServicesParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeServicesParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActiveProgramsWithEngagementsLast30() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActiveProgramsWithEngagementsLast30 activeProgramsWithEngagementsParameter = (FeatureParameters.ActiveProgramsWithEngagementsLast30) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsWithEngagementsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsWithEngagementsParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActiveProgramsWithActiveServices() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActiveProgramsWithActiveServices activeProgramsWithEngagementsParameter = (FeatureParameters.ActiveProgramsWithActiveServices) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsWithEngagementsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsWithEngagementsParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActiveProgramsWithCohorts() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_COHORTS.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_COHORTS.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActiveProgramsWithCohorts activeProgramsWithCohortsParameter = (FeatureParameters.ActiveProgramsWithCohorts) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsWithCohortsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsWithCohortsParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveProgramsWithCohorts() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE Status__c = 'Active' AND Id IN (SELECT Program__c FROM ProgramCohort__c)
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related program cohort.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_COHORTS.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithCohorts().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldCreateTheQueryBuilderOnDemand() {
        QueryBuilder queryBuilder = new FeatureParameters.ActivePrograms().queryBuilder;

        System.assertNotEquals(
            null,
            queryBuilder,
            'Expected the queryBuilder to auto create on demand.'
        );
    }

    @IsTest
    private static void shouldCreateTheFinderOnDemand() {
        Finder finder = new FeatureParameters.ActivePrograms().finder;

        System.assertNotEquals(
            null,
            finder,
            'Expected the finder to auto create on demand.'
        );
    }

    @IsTest
    private static void shouldPassActualActivePrograms() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE Status__c = 'Active'
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActivePrograms().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveServices() {
        List<Service__c> services = [
            SELECT Id
            FROM Service__c
            WHERE Status__c = 'Active'
        ];
        System.assert(
            !services.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_SERVICES.name()
            .remove('_');
        final Integer expectedValue = services.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveServices().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveProgramsWithEngagementsLast30() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE
                Status__c = 'Active'
                AND Id IN (
                    SELECT Program__c
                    FROM ProgramEngagement__c
                    WHERE CreatedDate = LAST_N_DAYS:30
                )
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related program engagement.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithEngagementsLast30().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveProgramsWithActiveServices() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE
                Status__c = 'Active'
                AND Id IN (SELECT Program__c FROM Service__c WHERE Status__c = 'Active')
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related active service.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithActiveServices().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveProgramsWithServiceDeliveriesLast30() {
        Set<Id> programIds = new Set<Id>();

        List<ProgramEngagement__c> programEngagements = [
            SELECT Program__c
            FROM ProgramEngagement__c
            WHERE
                ProgramEngagement__c.Program__r.Status__c = 'Active'
                AND Id IN (
                    SELECT ProgramEngagement__c
                    FROM ServiceDelivery__c
                    WHERE CreatedDate = LAST_N_DAYS:30
                )
        ];

        for (ProgramEngagement__c programEngagement : programEngagements) {
            programIds.add(programEngagement.Program__c);
        }

        System.assert(
            !programIds.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related program engagement.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_SERVICE_DELIVERIES_LAST30.name()
            .remove('_');
        final Integer expectedValue = programIds.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithServiceDeliveriesLast30().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldNotPassActiveProgramsWithoutServiceDeliveriesLast30() {
        Set<Id> programIds = new Set<Id>();

        List<ProgramEngagement__c> programEngagements = [
            SELECT Program__c
            FROM ProgramEngagement__c
            WHERE
                Program__r.Status__c = 'Active'
                AND Id IN (
                    SELECT ProgramEngagement__c
                    FROM ServiceDelivery__c
                    WHERE CreatedDate = LAST_N_DAYS:30
                )
        ];

        Id programEngagementId = programEngagements[0].Id;
        delete [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ProgramEngagement__c = :programEngagementId
        ];

        for (ProgramEngagement__c programEngagement : programEngagements) {
            if (programEngagement.Id == programEngagementId) {
                continue;
            }

            programIds.add(programEngagement.Program__c);
        }

        System.assert(
            !programIds.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related program engagement.'
        );

        System.assert(
            !programIds.contains(programEngagements[0].Program__c),
            'The program related to the first program engagement should not be included.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_SERVICE_DELIVERIES_LAST30.name()
            .remove('_');
        final Integer expectedValue = programIds.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithServiceDeliveriesLast30().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualPermSetDeliver() {
        deleteExistingPermissionAssignments();
        assignPermissionSet(FeatureParameters.DELIVER_PERMISSION);

        List<User> users = [
            SELECT Id
            FROM User
            WHERE
                Id IN (
                    SELECT AssigneeId
                    FROM PermissionSetAssignment
                    WHERE PermissionSet.Name = :FeatureParameters.DELIVER_PERMISSION
                )
                AND Id NOT IN (
                    SELECT AssigneeId
                    FROM PermissionSetAssignment
                    WHERE PermissionSet.Name = :FeatureParameters.MANAGE_PERMISSION
                )
        ];
        System.assert(
            !users.isEmpty(),
            'Sanity check: There should be at least 1 user found.'
        );

        final String expectedName = FeatureParameters.DeveloperName.PERM_SET_DELIVER_USERS.name()
            .remove('_');
        final Integer expectedValue = users.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.PermSetDeliverUsers().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualPermSetManage() {
        deleteExistingPermissionAssignments();
        assignPermissionSet(FeatureParameters.MANAGE_PERMISSION);
        List<User> users = [
            SELECT Id
            FROM User
            WHERE
                Id IN (
                    SELECT AssigneeId
                    FROM PermissionSetAssignment
                    WHERE PermissionSet.Name = :FeatureParameters.MANAGE_PERMISSION
                )
        ];
        System.assert(
            !users.isEmpty(),
            'Sanity check: There should be at least 1 user found.'
        );

        final String expectedName = FeatureParameters.DeveloperName.PERM_SET_MANAGE_USERS.name()
            .remove('_');
        final Integer expectedValue = users.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.PermSetManageUsers().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualAttendanceServiceDeliveriesLast30() {
        Set<Id> serviceDeliveryIds = new Set<Id>();
        List<String> attendanceStatusOptions = new List<String>{
            'Present',
            'Unexcused Absence',
            'Excused Absence'
        };

        List<ServiceDelivery__c> serviceDeliveries = [
            SELECT Id, AttendanceStatus__c
            FROM ServiceDelivery__c
            WHERE
                AttendanceStatus__c IN :attendanceStatusOptions
                AND CreatedDate = LAST_N_DAYS:30
        ];

        for (ServiceDelivery__c serviceDelivery : serviceDeliveries) {
            serviceDeliveryIds.add(serviceDelivery.Id);
        }

        System.assert(
            !serviceDeliveryIds.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 service delivery record with an attendance status.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ATTENDANCE_SERVICE_DELIVERIES_LAST30.name()
            .remove('_');
        final Integer expectedValue = serviceDeliveryIds.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.AttendanceServiceDeliveriesLast30().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    ////////// Helper Methods //////////
    private static void deleteExistingPermissionAssignments() {
        delete [
            SELECT Id
            FROM PermissionSetAssignment
            WHERE
                AssigneeId = :System.UserInfo.getUserId()
                AND (PermissionSet.Name = :FeatureParameters.MANAGE_PERMISSION
                OR PermissionSet.Name = :FeatureParameters.DELIVER_PERMISSION)
        ];
    }

    private static void assignPermissionSet(String permissionSetName) {
        PermissionSet permission = [
            SELECT Id
            FROM PermissionSet
            WHERE Name = :permissionSetName
            LIMIT 1
        ];

        insert new PermissionSetAssignment(
            AssigneeId = System.UserInfo.getUserId(),
            PermissionSetId = permission.Id
        );
    }
}
