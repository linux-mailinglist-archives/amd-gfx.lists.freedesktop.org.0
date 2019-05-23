Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A828C83
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 23:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615FD6E088;
	Thu, 23 May 2019 21:42:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B989FE8
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 21:42:31 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3002.namprd12.prod.outlook.com (20.178.29.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 21:42:29 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Thu, 23 May 2019
 21:42:29 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVEZcV8GBOpu2OR0OpsD7tEQbTqaZ5PaaA
Date: Thu, 23 May 2019 21:42:29 +0000
Message-ID: <b1d3a3e5-7c1c-0f98-3a0a-bd5984c58fff@amd.com>
References: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
 <1558636843-9867-5-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558636843-9867-5-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a963f30-4c71-4d6c-9194-08d6dfc78da6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3002; 
x-ms-traffictypediagnostic: DM6PR12MB3002:
x-microsoft-antispam-prvs: <DM6PR12MB3002315806F7A175D0B5E7E192010@DM6PR12MB3002.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(54094003)(186003)(256004)(14444005)(26005)(86362001)(31696002)(65826007)(476003)(31686004)(68736007)(2501003)(486006)(65806001)(2616005)(446003)(11346002)(66066001)(65956001)(58126008)(229853002)(110136005)(3846002)(6116002)(4326008)(36756003)(6246003)(66946007)(73956011)(53546011)(386003)(25786009)(53936002)(64126003)(71190400001)(71200400001)(99286004)(6506007)(52116002)(76176011)(66476007)(6512007)(102836004)(81156014)(8936002)(305945005)(478600001)(66556008)(81166006)(5660300002)(6486002)(8676002)(2906002)(7736002)(72206003)(66446008)(64756008)(6436002)(316002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3002;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ygjduRUl3KCVjrAvmlWbM8XHrU/eXJDo4c8cZT5Lsvv8XVlFhB+AFpSPrpn8mP0FSH0O+uvgKhTDLq+2rQd4llDvxzEMthpnrFwXCyupUlAoiasJqNBZ+tQt7Y7qSMUGptnCZeTR+t3W6BJUg+OxLEiXhvADWUMkzw9Y2WxvduR/UeuSoP4Ccoib1XNKYzNekZRUdXPEUT5bXn8u1FNGpyfhcAd4n83ye5wV7i4YmWkySnJV5IcFZtOmEQ6QnVaFivGWFWiKZBwCeVEHd6r0AvU+Yu4qBVEukiB3W3nsNX/FpAuX8KETWVZNnTDJeW6bwkWsqKtrSc9ZmMXaMR6P8ZzkKT+lv4vk8lXbOlsfzT0/YpDkMTmm0H8WT8k6GlKs5/nAD9t4445tuB69FFdLWPg+Y3aM2yt6iktpFS491jM=
Content-ID: <F38F831D2ED0AD449BE027ED8B15A547@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a963f30-4c71-4d6c-9194-08d6dfc78da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 21:42:29.0876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3002
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdWQ8AQmuNiKp3Dw9q2YM4lNKa4uuERdw0Wz8zPTbiQ=;
 b=WJ6EHZ5yvYHFJmSYo2IZ5gc+n8yg3f2GIGOcc8MJDwO1CZ7U9yU4RC79+71Q7bqDAseLDY6di5LerxXzvyyRwtW8AoIFo7Ot62L3lleJ/Hulu8CxQfQWKDJtwRc9tDACFKi/WOipQWU2+G1QtAv12HQGUDgMI1PoVpawe1khpfs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMyAyOjQxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gQWRkIGZ1bmN0aW9u
cyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCj4gc2V0IHF1ZXVlIGd3cy4gQWxzbyBzZXQg
cHJvY2VzcydzIG51bWJlcg0KPiBvZiBnd3MgdXNlZC4gQ3VycmVudGx5IG9ubHkgb25lIHF1ZXVl
IGluDQo+IHByb2Nlc3MgY2FuIHVzZSBhbmQgdXNlIGFsbCBnd3MuDQo+DQo+IENoYW5nZS1JZDog
STAzZTQ4MGM4NjkyZGIzZWFiZmMzYTE4OGNjZTg5MDRkNWQ5NjJhYjcNCj4gU2lnbmVkLW9mZi1i
eTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgIHwgIDYgKysrDQo+ICAgLi4uL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCA1NiArKysrKysr
KysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBpbmRleCA1OTY5ZTM3Li40
MGE1YzY3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gQEAg
LTQ1NCw2ICs0NTQsOSBAQCBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyB7DQo+ICAgICoNCj4gICAg
KiBAZGV2aWNlOiBUaGUga2ZkIGRldmljZSB0aGF0IGNyZWF0ZWQgdGhpcyBxdWV1ZS4NCj4gICAg
Kg0KPiArICogQGd3czogUG9pbnRpbmcgdG8gZ3dzIGtnZF9tZW0gaWYgdGhpcyBpcyBhIGd3cyBj
b250cm9sIHF1ZXVlOyBOVUxMDQo+ICsgKiBvdGhlcndpc2UuDQo+ICsgKg0KPiAgICAqIFRoaXMg
c3RydWN0dXJlIHJlcHJlc2VudHMgdXNlciBtb2RlIGNvbXB1dGUgcXVldWVzLg0KPiAgICAqIEl0
IGNvbnRhaW5zIGFsbCB0aGUgbmVjZXNzYXJ5IGRhdGEgdG8gaGFuZGxlIHN1Y2ggcXVldWVzLg0K
PiAgICAqDQo+IEBAIC00NzUsNiArNDc4LDcgQEAgc3RydWN0IHF1ZXVlIHsNCj4gICANCj4gICAJ
c3RydWN0IGtmZF9wcm9jZXNzCSpwcm9jZXNzOw0KPiAgIAlzdHJ1Y3Qga2ZkX2RldgkJKmRldmlj
ZTsNCj4gKwl2b2lkICpnd3M7DQo+ICAgfTsNCj4gICANCj4gICAvKg0KPiBAQCAtODY4LDYgKzg3
Miw4IEBAIGludCBwcW1fdXBkYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIg
KnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gICAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAq
cCk7DQo+ICAgaW50IHBxbV9zZXRfY3VfbWFzayhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2Vy
ICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICAgCQkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMg
KnApOw0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBx
bSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3cyk7DQo+ICAgc3RydWN0IGtlcm5l
bF9xdWV1ZSAqcHFtX2dldF9rZXJuZWxfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdl
ciAqcHFtLA0KPiAgIAkJCQkJCXVuc2lnbmVkIGludCBxaWQpOw0KPiAgIGludCBwcW1fZ2V0X3dh
dmVfc3RhdGUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5j
DQo+IGluZGV4IGU2NTJlMjUuLmQ2OWUxN2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gQEAgLTI2
LDYgKzI2LDcgQEANCj4gICAjaW5jbHVkZSAia2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgiDQo+
ICAgI2luY2x1ZGUgImtmZF9wcml2LmgiDQo+ICAgI2luY2x1ZGUgImtmZF9rZXJuZWxfcXVldWUu
aCINCj4gKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQo+ICAgDQo+ICAgc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVfYnlfcWlkKA0KPiAgIAkJCXN0
cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCj4gQEAg
LTc0LDYgKzc1LDU0IEBAIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2RldmljZShzdHJ1
Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQpDQo+ICAgCXBkZC0+YWxyZWFkeV9kZXF1ZXVlZCA9
IHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1
ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3cykNCj4g
K3sNCj4gKwlzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gTlVMTDsNCj4gKwlzdHJ1Y3QgcHJvY2Vzc19x
dWV1ZV9ub2RlICpwcW47DQo+ICsJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KPiAr
CXN0cnVjdCBrZ2RfbWVtICptZW07DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCS8qIERvbid0IGFs
bG93IHVuc2V0IGd3cyAqLw0KPiArCWlmICghZ3dzKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCg0K
SSB3b25kZXIgaWYgaXQgd291bGQgYmUgdXNlZnVsIHRvIGFsbG93IHRoaXMgKGUuZy4gaWYgDQpr
ZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzIGlzIGNhbGxlZCB3aXRoIGFyZ3MtPm51bV9nd3MgPT0g
MCkuIE90aGVyd2lzZSANCnRoZSBvbmx5IHdheSB0byByZWxlYXNlIEdXUyByZXNvdXJjZXMgaXMg
dG8gZGVzdHJveSB0aGUgcXVldWUuDQoNCg0KPiArDQo+ICsJcHFuID0gZ2V0X3F1ZXVlX2J5X3Fp
ZChwcW0sIHFpZCk7DQo+ICsJaWYgKCFwcW4pIHsNCj4gKwkJcHJfZXJyKCJRdWV1ZSBpZCBkb2Vz
IG5vdCBtYXRjaCBhbnkga25vd24gcXVldWVcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4g
Kwl9DQo+ICsNCj4gKwlpZiAocHFuLT5xKQ0KPiArCQlkZXYgPSBwcW4tPnEtPmRldmljZTsNCj4g
KwlpZiAoV0FSTl9PTighZGV2KSkNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwlwZGQg
PSBrZmRfZ2V0X3Byb2Nlc3NfZGV2aWNlX2RhdGEoZGV2LCBwcW0tPnByb2Nlc3MpOw0KPiArCWlm
ICghcGRkKSB7DQo+ICsJCXByX2VycigiUHJvY2VzcyBkZXZpY2UgZGF0YSBkb2Vzbid0IGV4aXN0
XG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJLyogT25seSBhbGxv
dyBvbmUgcXVldWUgcGVyIHByb2Nlc3MgY2FuIGhhdmUgR1dTIGFzc2lnbmVkICovDQo+ICsJbGlz
dF9mb3JfZWFjaF9lbnRyeShwcW4sICZwcW0tPnF1ZXVlcywgcHJvY2Vzc19xdWV1ZV9saXN0KSB7
DQo+ICsJCWlmIChwcW4tPnEgJiYgcHFuLT5xLT5nd3MpDQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKwl9DQoNCkl0IHdvdWxkIGJlIGVhc2llciBhbmQgbW9yZSBlZmZpY2llbnQgdG8ganVzdCBj
aGVjayB0aGF0IA0KcGRkLT5xcGQubnVtX2d3cyBpcyAwLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4
DQoNCj4gKw0KPiArCXJldCA9IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHBkZC0+
cHJvY2Vzcy0+a2dkX3Byb2Nlc3NfaW5mbywNCj4gKwkJCWd3cywgJm1lbSk7DQo+ICsJaWYgKHVu
bGlrZWx5KHJldCkpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlwcW4tPnEtPmd3cyA9IG1l
bTsNCj4gKwlwZGQtPnFwZC5udW1fZ3dzID0gYW1kZ3B1X2FtZGtmZF9nZXRfbnVtX2d3cyhkZXYt
PmtnZCk7DQo+ICsNCj4gKwlyZXR1cm4gcHFuLT5xLT5kZXZpY2UtPmRxbS0+b3BzLnVwZGF0ZV9x
dWV1ZShwcW4tPnEtPmRldmljZS0+ZHFtLA0KPiArCQkJCQkJCXBxbi0+cSk7DQo+ICt9DQo+ICsN
Cj4gICB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9hbGxfZGV2aWNlcyhzdHJ1Y3Qga2Zk
X3Byb2Nlc3MgKnApDQo+ICAgew0KPiAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQ7
DQo+IEBAIC0zMzAsNiArMzc5LDEzIEBAIGludCBwcW1fZGVzdHJveV9xdWV1ZShzdHJ1Y3QgcHJv
Y2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQpDQo+ICAgCQkJaWYgKHJl
dHZhbCAhPSAtRVRJTUUpDQo+ICAgCQkJCWdvdG8gZXJyX2Rlc3Ryb3lfcXVldWU7DQo+ICAgCQl9
DQo+ICsNCj4gKwkJaWYgKHBxbi0+cS0+Z3dzKSB7DQo+ICsJCQlhbWRncHVfYW1ka2ZkX3JlbW92
ZV9nd3NfZnJvbV9wcm9jZXNzKHBxbS0+cHJvY2Vzcy0+a2dkX3Byb2Nlc3NfaW5mbywNCj4gKwkJ
CQlwcW4tPnEtPmd3cyk7DQo+ICsJCQlwZGQtPnFwZC5udW1fZ3dzID0gMDsNCj4gKwkJfQ0KPiAr
DQo+ICAgCQlrZnJlZShwcW4tPnEtPnByb3BlcnRpZXMuY3VfbWFzayk7DQo+ICAgCQlwcW4tPnEt
PnByb3BlcnRpZXMuY3VfbWFzayA9IE5VTEw7DQo+ICAgCQl1bmluaXRfcXVldWUocHFuLT5xKTsN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
