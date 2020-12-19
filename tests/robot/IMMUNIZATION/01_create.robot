# Copyright (c) 2020 P. Wohlfarth (Appsfactory GmbH), Wladislaw Wagner (Vitasystems GmbH) &
# Dave Petzold (Appsfactory GmbH)
#
# This file is part of Project EHRbase
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



*** Settings ***
Resource                ${EXECDIR}/robot/_resources/suite_settings.robot

Test Setup              generic.prepare new request session    Prefer=return=representation
...															   Authorization=Basic bXl1c2VyOm15UGFzc3dvcmQ0MzI=

Force Tags              create



*** Variables ***




*** Test Cases ***
001 Create History of Vaccination (Immunization completed)
	[Documentation]    1. create new EHR Patient record
	...                2. update {{patient_id}} in example json
    ...                3. POST example json to Immunization endpoint
	...                4. validate the response status
    [Tags]             history-of-vaccination    valid    not-ready

    #ehr.create new ehr    000_ehr_status.json
    immunization.create history of vaccination    History of Vaccination (Immunization completed)    create-immunization-for-patient-complete.json
    immunization.validate response - 201


002 Create History of Vaccination (not done)
	[Documentation]    1. create new EHR Patient record
	...                2. update {{patient_id}} in example json
    ...                3. POST example json to Immunization endpoint
	...                4. validate the response status
    [Tags]             history-of-vaccination    valid    not-ready

    #ehr.create new ehr    000_ehr_status.json
    immunization.create history of vaccination    History of Vaccination (not done)    create-immunization-for-patient-not-done.json
    immunization.validate response - 201