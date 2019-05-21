Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E9258DC
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 22:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C5E89415;
	Tue, 21 May 2019 20:29:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0789415
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 20:29:42 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3850.namprd12.prod.outlook.com (10.255.173.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 20:29:41 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 20:29:41 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVC14Wf2+vLi2Wok+mGqHV/KPpwqZ2EReA
Date: Tue, 21 May 2019 20:29:41 +0000
Message-ID: <f7f5cf3d-b91c-9ac9-6273-48afe88b3753@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
 <1557952664-12218-4-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-4-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8792712d-5161-4c1f-f30a-08d6de2b0d5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3850; 
x-ms-traffictypediagnostic: DM6PR12MB3850:
x-microsoft-antispam-prvs: <DM6PR12MB3850FE19D2DF67C2B0A195CF92070@DM6PR12MB3850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(68736007)(52116002)(76176011)(65826007)(6512007)(99286004)(4326008)(110136005)(58126008)(6436002)(6246003)(6486002)(316002)(31696002)(26005)(86362001)(186003)(53546011)(386003)(6506007)(102836004)(71200400001)(71190400001)(36756003)(229853002)(25786009)(486006)(446003)(11346002)(476003)(2616005)(5660300002)(31686004)(256004)(66446008)(14444005)(66476007)(66556008)(64756008)(73956011)(2501003)(2906002)(6116002)(66946007)(3846002)(305945005)(53936002)(81156014)(81166006)(66066001)(478600001)(8676002)(64126003)(7736002)(14454004)(65956001)(8936002)(72206003)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3850;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +foEzW8bJ5Ci3a2QzVoQjRCia02p9k2ytyHvBSepbsBHbPp5VbhHvbrc2+X1PrNuLBRHsLQ7iGNuWQy8UCywnse29P3jrdNjYMpSNGSEvFL5pEMectciXV2Z9A9LGjbudW+iuCxxpJwhSDlCT5qs6if5+K597ruPvEypNGu2OxVNiAkJA7/PGt3HnI/NZ0aX8b8Rh/Fa++RO4KEr6113AYQEIx+S+9/PCkqYalrVosm/7kZARQXsQfrjWZVQIWIqzSqeG5kkzyQTAlnKXlJlo5nZoyfcPjn+d+UELpLw1ymoGuxNF+UKfXH7qHsL13ak29LjtCGQCVFbulnsWURuHDPs8nsqahgv4mUu43vbcsjRjfvXoL2shOiVwt2EclfvUU6wzJq3E9Ufd1l2Et0loPDYmQ63akD1dnmA2LcmOLY=
Content-ID: <5A51CD8F74F1F54B9B7A89C7CFE96CF7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8792712d-5161-4c1f-f30a-08d6de2b0d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 20:29:41.1405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPZ0n3Bv3niJPbw5vJ3foj8LEF7wgP2Z2OOge3+RlT4=;
 b=xv8upSirWZan5R9AhpZrN6HrmMlLnPDm4ByEOGi3ekAf1yaZEw525ruZFoLBx3vNoXG5OTZW5t1ODj68TMpCZ0yVJUNaLTzVxGYwpML2j4j9Iu34PjSvX0nFE6eOpiPfagegZqkyCD4ib0KDAdkRr7nmpEQYuT9bDkIqwEgCEw8=
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

DQpPbiAyMDE5LTA1LTE1IDQ6MzcgcC5tLiwgWmVuZywgT2FrIHdyb3RlOg0KPiBBZGQgZnVuY3Rp
b25zIGluIHByb2Nlc3MgcXVldWUgbWFuYWdlciB0bw0KPiBzZXQvZ2V0IHF1ZXVlIGd3cy4gQWxz
byBzZXQgcHJvY2VzcydzIG51bWJlcg0KPiBvZiBnd3MgdXNlZC4gQ3VycmVudGx5IG9ubHkgb25l
IHF1ZXVlIGluDQo+IHByb2Nlc3MgY2FuIHVzZSBhbmQgdXNlIGFsbCBnd3MuDQo+DQo+IENoYW5n
ZS1JZDogSTAzZTQ4MGM4NjkyZGIzZWFiZmMzYTE4OGNjZTg5MDRkNWQ5NjJhYjcNCj4gU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgIHwgIDYgKysrDQo+ICAg
Li4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCA1MCAr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25z
KCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBpbmRleCA1OTY5
ZTM3Li40MGE1YzY3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJpdi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgN
Cj4gQEAgLTQ1NCw2ICs0NTQsOSBAQCBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyB7DQo+ICAgICoN
Cj4gICAgKiBAZGV2aWNlOiBUaGUga2ZkIGRldmljZSB0aGF0IGNyZWF0ZWQgdGhpcyBxdWV1ZS4N
Cj4gICAgKg0KPiArICogQGd3czogUG9pbnRpbmcgdG8gZ3dzIGtnZF9tZW0gaWYgdGhpcyBpcyBh
IGd3cyBjb250cm9sIHF1ZXVlOyBOVUxMDQo+ICsgKiBvdGhlcndpc2UuDQo+ICsgKg0KPiAgICAq
IFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgdXNlciBtb2RlIGNvbXB1dGUgcXVldWVzLg0KPiAg
ICAqIEl0IGNvbnRhaW5zIGFsbCB0aGUgbmVjZXNzYXJ5IGRhdGEgdG8gaGFuZGxlIHN1Y2ggcXVl
dWVzLg0KPiAgICAqDQo+IEBAIC00NzUsNiArNDc4LDcgQEAgc3RydWN0IHF1ZXVlIHsNCj4gICAN
Cj4gICAJc3RydWN0IGtmZF9wcm9jZXNzCSpwcm9jZXNzOw0KPiAgIAlzdHJ1Y3Qga2ZkX2RldgkJ
KmRldmljZTsNCj4gKwl2b2lkICpnd3M7DQo+ICAgfTsNCj4gICANCj4gICAvKg0KPiBAQCAtODY4
LDYgKzg3Miw4IEBAIGludCBwcW1fdXBkYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21h
bmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gICAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVy
dGllcyAqcCk7DQo+ICAgaW50IHBxbV9zZXRfY3VfbWFzayhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICAgCQkJc3RydWN0IHF1ZXVlX3Byb3Bl
cnRpZXMgKnApOw0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFn
ZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3cyk7DQo+ICAgc3RydWN0
IGtlcm5lbF9xdWV1ZSAqcHFtX2dldF9rZXJuZWxfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVf
bWFuYWdlciAqcHFtLA0KPiAgIAkJCQkJCXVuc2lnbmVkIGludCBxaWQpOw0KPiAgIGludCBwcW1f
Z2V0X3dhdmVfc3RhdGUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFu
YWdlci5jDQo+IGluZGV4IGU2NTJlMjUuLjhlNDUyOTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4g
QEAgLTI2LDYgKzI2LDcgQEANCj4gICAjaW5jbHVkZSAia2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmgiDQo+ICAgI2luY2x1ZGUgImtmZF9wcml2LmgiDQo+ICAgI2luY2x1ZGUgImtmZF9rZXJuZWxf
cXVldWUuaCINCj4gKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQo+ICAgDQo+ICAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVfYnlfcWlkKA0KPiAg
IAkJCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkN
Cj4gQEAgLTc0LDYgKzc1LDU1IEBAIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2Rldmlj
ZShzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQpDQo+ICAgCXBkZC0+YWxyZWFkeV9kZXF1
ZXVlZCA9IHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3
cykNCj4gK3sNCj4gKwlzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gTlVMTDsNCj4gKwlzdHJ1Y3QgcHJv
Y2Vzc19xdWV1ZV9ub2RlICpwcW47DQo+ICsJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRk
Ow0KPiArDQo+ICsJcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZChwcW0sIHFpZCk7DQo+ICsJaWYgKCFw
cW4pIHsNCj4gKwkJcHJfZXJyKCJRdWV1ZSBpZCBkb2VzIG5vdCBtYXRjaCBhbnkga25vd24gcXVl
dWVcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAocHFuLT5x
KQ0KPiArCQlkZXYgPSBwcW4tPnEtPmRldmljZTsNCj4gKwlpZiAoV0FSTl9PTighZGV2KSkNCj4g
KwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwlwZGQgPSBrZmRfZ2V0X3Byb2Nlc3NfZGV2aWNl
X2RhdGEoZGV2LCBwcW0tPnByb2Nlc3MpOw0KPiArCWlmICghcGRkKSB7DQo+ICsJCXByX2Vycigi
UHJvY2VzcyBkZXZpY2UgZGF0YSBkb2Vzbid0IGV4aXN0XG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5W
QUw7DQo+ICsJfQ0KPiArDQo+ICsJLyogT25seSBhbGxvdyBvbmUgcXVldWUgcGVyIHByb2Nlc3Mg
Y2FuIGhhdmUgR1dTIGFzc2lnbmVkICovDQo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShwcW4sICZw
cW0tPnF1ZXVlcywgcHJvY2Vzc19xdWV1ZV9saXN0KSB7DQo+ICsJCWlmIChwcW4tPnEgJiYgcHFu
LT5xLT5nd3MpDQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlwcW4tPnEt
Pmd3cyA9IGd3czsNCj4gKwlwZGQtPnFwZC5udW1fZ3dzID0gZ3dzID8gYW1kZ3B1X2FtZGtmZF9n
ZXRfbnVtX2d3cyhkZXYtPmtnZCkgOiAwOw0KDQpZb3UnbGwgaGF2ZSB0byBjYWxsIHBxbi0+cS0+
ZGV2aWNlLT5kcW0tPm9wcy51cGRhdGVfcXVldWUgc29tZXdoZXJlLCB0byANCm1ha2Ugc3VyZSB0
aGUgcnVubGlzdCBnZXRzIHVwZGF0ZWQgd2l0aCB0aGUgbmV3IEdXUyBwYXJhbWV0ZXJzLiBTZWUg
DQpwcW1fdXBkYXRlX3F1ZXVlIG9yIHBxbV9zZXRfY3VfbWFzayBmb3IgcmVmZXJlbmNlLg0KDQpS
ZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgdm9pZCAqcHFtX2dldF9nd3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1
bnNpZ25lZCBpbnQgcWlkKQ0KPiArew0KPiArCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBx
bjsNCj4gKw0KPiArCXBxbiA9IGdldF9xdWV1ZV9ieV9xaWQocHFtLCBxaWQpOw0KPiArCWlmICgh
cHFuKSB7DQo+ICsJCXByX2RlYnVnKCJObyBxdWV1ZSAlZCBleGlzdHMgZm9yIGdldCBnd3Mgb3Bl
cmF0aW9uXG4iLCBxaWQpOw0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1
cm4gcHFuLT5xLT5nd3M7DQo+ICt9DQo+ICsNCj4gKw0KPiAgIHZvaWQga2ZkX3Byb2Nlc3NfZGVx
dWV1ZV9mcm9tX2FsbF9kZXZpY2VzKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCkNCj4gICB7DQo+ICAg
CXN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZDsNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
