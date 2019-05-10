Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8AC1A3FF
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 22:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638766E7BB;
	Fri, 10 May 2019 20:28:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800082.outbound.protection.outlook.com [40.107.80.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBF96E7BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 20:28:21 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2840.namprd12.prod.outlook.com (20.177.126.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 20:28:19 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.016; Fri, 10 May 2019
 20:28:18 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 7/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVB0mmP6xj4xpzBkOnXHd4AkIrxqZkzzgA
Date: Fri, 10 May 2019 20:28:18 +0000
Message-ID: <c76522c2-115e-a6b6-f136-44fa2a45be2b@amd.com>
References: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
 <1557504063-1559-7-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557504063-1559-7-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b40bbc71-f9e4-4715-9e7c-08d6d58609b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2840; 
x-ms-traffictypediagnostic: BYAPR12MB2840:
x-microsoft-antispam-prvs: <BYAPR12MB2840B214CD413486C38FC8DA920C0@BYAPR12MB2840.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(36756003)(478600001)(68736007)(64126003)(53936002)(5660300002)(110136005)(81156014)(81166006)(25786009)(186003)(86362001)(2906002)(31696002)(26005)(72206003)(65826007)(2501003)(6246003)(8936002)(11346002)(8676002)(76176011)(386003)(14444005)(66556008)(66476007)(64756008)(102836004)(66446008)(53546011)(6506007)(486006)(2616005)(476003)(66946007)(229853002)(4326008)(31686004)(73956011)(6436002)(71190400001)(6116002)(6486002)(14454004)(71200400001)(6512007)(99286004)(256004)(316002)(65806001)(446003)(66066001)(65956001)(305945005)(7736002)(52116002)(3846002)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2840;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qJz0ckRfYHpn5sZjXdDn1aMJCtNoj+xtsFc1ORHFgbw+bb2QXeHhQkilF9Puc6ik5KSKjggTyvT8Z+wF8iLcFNFceiIXyicnHeoJNFsaCzQnR/tOcluOrtHBvJMa8+ZEF+l62Uuhgl8sNTiC33sVd4UyVEF/ZEXjCMc7oxsff/SJZZwjoBle7rMvatvn34XbAiNVv0J/96MIfnoWzlr4uTS/LKY0kHWPooBqqcIRo+59HY5gFIEJq3hIzYfqdKMVWOU4oAckbCvHa8AeKSr5c5+L6z1rOMPTJf5bG7UO/uhC42BNuveR/pjWoU3ao0SVcXRnKhz7xDiGvw/mwgrZ8i8K6+BxIvnwfzd1M/S3D5Zvz53VDoVZgpjKlRCdY4sij2rtYWF3TJgf4xmeY+9HqtHc4Z/9+tfuPc6IBMmmzwU=
Content-ID: <6EA2521F13CB76488E62DB207F7B3BCA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40bbc71-f9e4-4715-9e7c-08d6d58609b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 20:28:18.8346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2840
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rInzrRSXOPIPCv7bOgD0R+9i63dpt/imM7TX/60ZJfc=;
 b=fmp1uNasL7SefwwIcvT4lFRkw2c3jAzv8G5B2R092py3kKbm9E+ne3gamrzNKZ9eX6h3uTvRnCKpLkKhPBPRGfyNpuEd9rHZ9T3JAwbqHo3ngM85KnGoRZf8S31XlXYEVDyBk9VqMn4N13S1UJi6RbB020kENPP8kSeQoYvkgMI=
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

T24gMjAxOS0wNS0xMCAxMjowMSBwLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IEFkZCBhIG5ldyBr
ZmQgaW9jdGwgdG8gYWxsb2NhdGUgcXVldWUgR1dTLiBRdWV1ZQ0KPiBHV1MgaXMgcmVsZWFzZWQg
b24gcXVldWUgZGVzdHJveS4NCj4NCj4gQ2hhbmdlLUlkOiBJNjAxNTNjMjZhNTc3OTkyYWQ4NzNl
NDI5MmU3NTllNWMzZDViYmQxNQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdA
YW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJk
ZXYuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS91
YXBpL2xpbnV4L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKystDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBpbmRleCAzOGFlNTNmLi4x
N2RkOTcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hh
cmRldi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMN
Cj4gQEAgLTMzOCw2ICszMzgsMTEgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfZGVzdHJveV9xdWV1
ZShzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IGtmZF9wcm9jZXNzICpwLA0KPiAgIA0KPiAgIAlt
dXRleF9sb2NrKCZwLT5tdXRleCk7DQo+ICAgDQo+ICsJaWYgKHBxbV9nZXRfZ3dzKCZwLT5wcW0s
IGFyZ3MtPnF1ZXVlX2lkKSkgew0KPiArCQlhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9w
cm9jZXNzKHAtPmtnZF9wcm9jZXNzX2luZm8sDQo+ICsJCQkJcHFtX2dldF9nd3MoJnAtPnBxbSwg
YXJncy0+cXVldWVfaWQpKTsNCj4gKwkJcHFtX3NldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVldWVf
aWQsIE5VTEwpOw0KPiArCX0NCg0KSXQgd291bGQgYmUgbW9yZSByb2J1c3QgaWYgdGhpcyB3YXMg
ZG9uZSBpbnNpZGUgcHFtX2Rlc3Ryb3lfcXVldWUuIFRoYXQgDQp3YXkgeW91J2QgaGFuZGxlIG90
aGVyIHBvdGVudGlhbCBjb2RlIHBhdGhzIHRoYXQgZGVzdHJveSBxdWV1ZXMgKG5vdCANCnN1cmUg
dGhlcmUgYXJlIGFueSkgYW5kIHlvdSB3b3VsZG4ndCBuZWVkIHBxbV9nZXRfZ3dzIGV4cG9ydGVk
IGZyb20gUFFNLg0KDQoNCj4gICAJcmV0dmFsID0gcHFtX2Rlc3Ryb3lfcXVldWUoJnAtPnBxbSwg
YXJncy0+cXVldWVfaWQpOw0KPiAgIA0KPiAgIAltdXRleF91bmxvY2soJnAtPm11dGV4KTsNCj4g
QEAgLTE1NTksNiArMTU2NCw0NCBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF91bm1hcF9tZW1vcnlf
ZnJvbV9ncHUoc3RydWN0IGZpbGUgKmZpbGVwLA0KPiAgIAlyZXR1cm4gZXJyOw0KPiAgIH0NCj4g
ICANCj4gK3N0YXRpYyBpbnQga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3cyhzdHJ1Y3QgZmlsZSAq
ZmlsZXAsDQo+ICsJCXN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCj4gK3sNCj4g
KwlpbnQgcmV0dmFsOw0KPiArCXN0cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3Mg
KmFyZ3MgPSBkYXRhOw0KPiArCXN0cnVjdCBrZmRfZGV2ICpkZXYgPSBOVUxMOw0KPiArCXN0cnVj
dCBrZ2RfbWVtICptZW07DQo+ICsNCj4gKwlpZiAoYXJncy0+bnVtX2d3cyA9PSAwKQ0KPiArCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmICghaHdzX2d3c19zdXBwb3J0IHx8DQo+ICsJCWRl
di0+ZHFtLT5zY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpDQo+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiArDQo+ICsJZGV2ID0ga2ZkX2RldmljZV9ieV9pZChhcmdzLT5ncHVf
aWQpOw0KPiArCWlmICghZGV2KSB7DQo+ICsJCXByX2RlYnVnKCJDb3VsZCBub3QgZmluZCBncHUg
aWQgMHgleFxuIiwgYXJncy0+Z3B1X2lkKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dmFsID0gYW1kZ3B1X2FtZGtmZF9hZGRfZ3dzX3RvX3Byb2Nlc3MocC0+a2dk
X3Byb2Nlc3NfaW5mbywNCj4gKwkJCWRldi0+Z3dzLCAmbWVtKTsNCj4gKwlpZiAodW5saWtlbHko
cmV0dmFsKSkNCj4gKwkJcmV0dXJuIHJldHZhbDsNCj4gKw0KPiArCW11dGV4X2xvY2soJnAtPm11
dGV4KTsNCj4gKwlyZXR2YWwgPSBwcW1fc2V0X2d3cygmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCwg
bWVtKTsNCj4gKwltdXRleF91bmxvY2soJnAtPm11dGV4KTsNCj4gKw0KPiArCWlmICh1bmxpa2Vs
eShyZXR2YWwpKQ0KPiArCQlhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHAt
PmtnZF9wcm9jZXNzX2luZm8sIG1lbSk7DQo+ICsNCj4gKwkvKiBUaGUgZ3dzX2FycmF5IHBhcmFt
ZXRlciBpcyByZXNlcnZlZCBmb3IgZnV0dXJlIGV4dGVuc2lvbiovDQo+ICsJYXJncy0+Z3dzX2Fy
cmF5WzBdID0gMDsNCj4gKwlyZXR1cm4gcmV0dmFsOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGlu
dCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvKHN0cnVjdCBmaWxlICpmaWxlcCwNCj4gICAJCXN0
cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCj4gICB7DQo+IEBAIC0xNzYxLDYgKzE4
MDQsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0
bHNbXSA9IHsNCj4gICAJQU1ES0ZEX0lPQ1RMX0RFRihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYs
DQo+ICAgCQkJCWtmZF9pb2N0bF9pbXBvcnRfZG1hYnVmLCAwKSwNCj4gICANCj4gKwlBTURLRkRf
SU9DVExfREVGKEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dTLA0KPiArCQkJa2ZkX2lvY3RsX2Fs
bG9jX3F1ZXVlX2d3cywgMCksDQo+ICAgfTsNCj4gICANCj4gICAjZGVmaW5lIEFNREtGRF9DT1JF
X0lPQ1RMX0NPVU5UCUFSUkFZX1NJWkUoYW1ka2ZkX2lvY3RscykNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9j
dGwuaA0KPiBpbmRleCAyMDkxN2M1Li4xOTY0YWIyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvbGludXgva2ZkX2lvY3RsLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0
bC5oDQo+IEBAIC00MTAsNiArNDEwLDIwIEBAIHN0cnVjdCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5
X2Zyb21fZ3B1X2FyZ3Mgew0KPiAgIAlfX3UzMiBuX3N1Y2Nlc3M7CQkvKiB0by9mcm9tIEtGRCAq
Lw0KPiAgIH07DQo+ICAgDQo+ICsvKiBBbGxvY2F0ZSBHV1MgZm9yIHNwZWNpZmljIHF1ZXVlDQo+
ICsgKg0KPiArICogQGdwdV9pZDogICAgICBkZXZpY2UgaWRlbnRpZmllcg0KPiArICogQHF1ZXVl
X2lkOiAgICBxdWV1ZSdzIGlkIHRoYXQgR1dTIGlzIGFsbG9jYXRlZCBmb3INCj4gKyAqIEBudW1f
Z3dzOiAgICAgaG93IG1hbnkgR1dTIHRvIGFsbG9jYXRlDQo+ICsgKiBAZ3dzX2FycmF5OiAgIHVz
ZWQgdG8gcmV0dXJuIHRoZSBhbGxvY2F0ZWQgZ3dzDQo+ICsgKi8NCj4gK3N0cnVjdCBrZmRfaW9j
dGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3Mgew0KPiArCV9fdTMyIGdwdV9pZDsJCS8qIHRvIEtGRCAq
Lw0KPiArCV9fdTMyIHF1ZXVlX2lkOwkJLyogdG8gS0ZEICovDQo+ICsJX191MzIgbnVtX2d3czsJ
CS8qIHRvIEtGRCAqLw0KPiArCV9fdTMyICpnd3NfYXJyYXk7CS8qIGZyb20gS0ZEICovDQoNCkRv
bid0IHVzZSBwb2ludGVycyBpbiBpb2N0bCBzdHJ1Y3R1cmVzLiBVc2UgdWludDY0X3QuIEFjY2Vz
c2luZyB1c2VyIA0KbW9kZSBwb2ludGVycyByZXF1aXJlcyBjb3B5X3RvL2Zyb21fdXNlciBvciBz
aW1pbGFyLg0KDQpBbHNvIHByZWZlciB0byBtb3ZlIDY0LWJpdCBlbGVtZW50cyB0byB0aGUgZmly
c3QgZWxlbWVudCB0byBlbnN1cmUgDQpwcm9wZXIgYWxpZ25tZW50LCBhbmQgcGFkIHRoZSBzdHJ1
Y3R1cmUgdG8gNjQtYml0IGZvciBBQkkgY29tcGF0aWJpbGl0eS4NCg0KSSdtIG5vdCBzdXJlIHdo
YXQgeW91ciBwbGFuIGlzIGZvciB0aGF0IGd3c19hcnJheS4gSWYgaXQncyBhIHBvaW50ZXIgdG8g
DQphIHVzZXIgbW9kZSBhcnJheSwgdGhlbiB0aGF0IGFycmF5IG5lZWRzIGJlIGFsbG9jYXRlZCBi
eSB1c2VyIG1vZGUuIEFuZCANCnVzZXIgbW9kZSBzaG91bGQgcHJvYmFibHkgcGFzcyBkb3duIHRo
ZSBzaXplIG9mIHRoZSBhcnJheSBpdCBhbGxvY2F0ZWQgDQppbiBhbm90aGVyIHBhcmFtZXRlci4N
Cg0KVGhhdCBzYWlkLCBJIHRoaW5rIHdoYXQgd2Ugd2FudCBpcyBub3QgYW4gYXJyYXksIGJ1dCBq
dXN0IHRoZSBpbmRleCBvZiANCnRoZSBmaXJzdCBHV1MgZW50cnkgdGhhdCB3YXMgYWxsb2NhdGVk
IGZvciB0aGUgcXVldWUsIHdoaWNoIGlzIGN1cnJlbnRseSANCmFsd2F5cyAwLiBTbyBJJ20gbm90
IHN1cmUgd2h5IHlvdSdyZSBjYWxsaW5nIHRoaXMgYW4gImFycmF5Ii4NCg0KDQo+ICt9Ow0KPiAr
DQo+ICAgc3RydWN0IGtmZF9pb2N0bF9nZXRfZG1hYnVmX2luZm9fYXJncyB7DQo+ICAgCV9fdTY0
IHNpemU7CQkvKiBmcm9tIEtGRCAqLw0KPiAgIAlfX3U2NCBtZXRhZGF0YV9wdHI7CS8qIHRvIEtG
RCAqLw0KPiBAQCAtNTI5LDcgKzU0MywxMCBAQCBlbnVtIGtmZF9tbWlvX3JlbWFwIHsNCj4gICAj
ZGVmaW5lIEFNREtGRF9JT0NfSU1QT1JUX0RNQUJVRgkJXA0KPiAgIAkJQU1ES0ZEX0lPV1IoMHgx
RCwgc3RydWN0IGtmZF9pb2N0bF9pbXBvcnRfZG1hYnVmX2FyZ3MpDQo+ICAgDQo+ICsjZGVmaW5l
IEFNREtGRF9JT0NfQUxMT0NfUVVFVUVfR1dTCQlcDQo+ICsJCUFNREtGRF9JT1dSKDB4MUUsIHN0
cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3MpDQo+ICsNCg0KVGhpcyB3aWxsIGZv
cmNlIHVzIHRvIG1vdmUgc29tZSBpb2N0bCBudW1iZXJzIGluIGFtZC1rZmQtc3RhZ2luZyBhbmQg
dGhlIA0KREtNUyBicmFuY2gsIHdoaWNoIHdpbGwgYnJlYWsgdGhlIEFCSSBvZiBvdXIgUk9DbSBy
ZWxlYXNlcy4gTm90IHN1cmUgDQp0aGVyZSBpcyBhIGdvb2Qgd2F5IHRvIGF2b2lkIHRoYXQgb3Ro
ZXIgdGhhbiBsZWF2aW5nIGEgd2hvbGUgaW4gdGhlIA0KdXBzdHJlYW0gaW9jdGwgc3BhY2UuIEkg
Z290IHB1c2gtYmFjayBvbiB0aGF0IGtpbmQgb2YgdGhpbmcgd2hlbiBJIA0Kb3JpZ2luYWxseSB1
cHN0cmVhbWVkIEtGRC4gU28gdGhpcyBpcyBqdXN0IGFuIEZZSS4NCg0KUmVnYXJkcywNCiDCoCBG
ZWxpeA0KDQo+ICAgI2RlZmluZSBBTURLRkRfQ09NTUFORF9TVEFSVAkJMHgwMQ0KPiAtI2RlZmlu
ZSBBTURLRkRfQ09NTUFORF9FTkQJCTB4MUUNCj4gKyNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5E
CQkweDFGDQo+ICAgDQo+ICAgI2VuZGlmDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
