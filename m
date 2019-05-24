Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ABA29F55
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 21:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD86E0A2;
	Fri, 24 May 2019 19:48:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C2D6E0A2
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 19:48:23 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3323.namprd12.prod.outlook.com (20.178.31.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 19:48:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 19:48:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Topic: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
Thread-Index: AQHVEbimTTWAfIcqrkueX5oyj1CRRqZ6r9UA
Date: Fri, 24 May 2019 19:48:22 +0000
Message-ID: <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f5d4aae-0f1b-4e98-4614-08d6e080c713
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3323; 
x-ms-traffictypediagnostic: DM6PR12MB3323:
x-microsoft-antispam-prvs: <DM6PR12MB3323900727E041E069F0FD1292020@DM6PR12MB3323.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(486006)(11346002)(4326008)(476003)(76176011)(102836004)(386003)(6506007)(2616005)(31696002)(3846002)(6116002)(25786009)(53546011)(6512007)(53936002)(64126003)(65826007)(6436002)(229853002)(6246003)(5660300002)(6486002)(99286004)(446003)(2906002)(58126008)(110136005)(54906003)(52116002)(8676002)(68736007)(81156014)(81166006)(86362001)(8936002)(305945005)(14454004)(26005)(2501003)(72206003)(73956011)(65956001)(65806001)(71190400001)(14444005)(66066001)(186003)(31686004)(36756003)(64756008)(66556008)(66476007)(478600001)(66446008)(7736002)(66946007)(316002)(71200400001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3323;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5SVLpqrVyA5HHfPko71uxBDAcNCDyYzNuOzPh1KcX7rHRkzJfAlPhVISxYPBPLwIn9OsOLYHjfJdWemeDZdBJLxMCXdCV2Aqlpf9racIMgf+a8+WyIFzrnDjpcuvOeitbZPgUo6NB65CzLkenbABYIqOPjlIU/wGeF1kJ3JFcEty4dvM035sxHSoi3rLav2xjo0OusTibcTBItHltnB0bQWhQ2fZPbYf6zxqQhG/x9heXVU+YreqlehjliHYL87C5p4QDXY5sXJTRazBrl0r8zx98EmxsGarsFfVpMDeC564VwR+ZyJmCXXUaWul7DH5+YF7dd3okUULCoxXppuCMJ9nqpfTcULKcpW5b2YNZN0bKmbZQjeAXJIaqJACi3OvcpgvJSJ4QgNBAruOgEDL7L5cCatcwj3GC8sGBCBtYuY=
Content-ID: <2E9380A284F7214C82156DD65723BCE6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5d4aae-0f1b-4e98-4614-08d6e080c713
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 19:48:22.2620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3323
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot1qRbJ4Veu1/mA/cEjG/xG9PzKl4q3x0B7FVe7+Ofw=;
 b=xzX72xNdo2zBPSg9vs7E1d23kFqb21PA+aDOaSObwaODDvXLFMgNz55+agAGwxqFi38R3mda4x1cUU6a6cOBXPDTTbkff9IwIZ/XDPhvwdpn3BmIFi/gHFPvSreZazXRZhCp4jR1Xcba/4/ruR5VNsqoXClKgmEUxUaRePUyQ0M=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMyA2OjQxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gQWRkIGEgbmV3IGtm
ZCBpb2N0bCB0byBhbGxvY2F0ZSBxdWV1ZSBHV1MuIFF1ZXVlDQo+IEdXUyBpcyByZWxlYXNlZCBv
biBxdWV1ZSBkZXN0cm95Lg0KPg0KPiBDaGFuZ2UtSWQ6IEk2MDE1M2MyNmE1Nzc5OTJhZDg3M2U0
MjkyZTc1OWU1YzNkNWJiZDE1DQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hh
cmRldi5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS91YXBp
L2xpbnV4L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKystDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBpbmRleCAzOGFlNTNm
Li40NTVhM2RiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
Y2hhcmRldi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2
LmMNCj4gQEAgLTE1NTksNiArMTU1OSwzMSBAQCBzdGF0aWMgaW50IGtmZF9pb2N0bF91bm1hcF9t
ZW1vcnlfZnJvbV9ncHUoc3RydWN0IGZpbGUgKmZpbGVwLA0KPiAgIAlyZXR1cm4gZXJyOw0KPiAg
IH0NCj4gICANCj4gK3N0YXRpYyBpbnQga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3cyhzdHJ1Y3Qg
ZmlsZSAqZmlsZXAsDQo+ICsJCXN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCj4g
K3sNCj4gKwlpbnQgcmV0dmFsOw0KPiArCXN0cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dz
X2FyZ3MgKmFyZ3MgPSBkYXRhOw0KPiArCXN0cnVjdCBrZmRfZGV2ICpkZXYgPSBOVUxMOw0KPiAr
DQo+ICsJaWYgKCFod3NfZ3dzX3N1cHBvcnQgfHwNCj4gKwkJZGV2LT5kcW0tPnNjaGVkX3BvbGlj
eSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsN
Cj4gKwlkZXYgPSBrZmRfZGV2aWNlX2J5X2lkKGFyZ3MtPmdwdV9pZCk7DQo+ICsJaWYgKCFkZXYp
IHsNCj4gKwkJcHJfZGVidWcoIkNvdWxkIG5vdCBmaW5kIGdwdSBpZCAweCV4XG4iLCBhcmdzLT5n
cHVfaWQpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwltdXRleF9sb2Nr
KCZwLT5tdXRleCk7DQo+ICsJcmV0dmFsID0gcHFtX3NldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVl
dWVfaWQsIGFyZ3MtPm51bV9nd3MgPyBkZXYtPmd3cyA6IE5VTEwpOw0KPiArCW11dGV4X3VubG9j
aygmcC0+bXV0ZXgpOw0KPiArDQo+ICsJYXJncy0+Zmlyc3RfZ3dzID0gMDsNCj4gKwlyZXR1cm4g
cmV0dmFsOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9p
bmZvKHN0cnVjdCBmaWxlICpmaWxlcCwNCj4gICAJCXN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9p
ZCAqZGF0YSkNCj4gICB7DQo+IEBAIC0xNzYxLDYgKzE3ODYsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGtmZF9pb2N0bF9kZXNjIGFtZGtmZF9pb2N0bHNbXSA9IHsNCj4gICAJQU1ES0ZEX0lP
Q1RMX0RFRihBTURLRkRfSU9DX0lNUE9SVF9ETUFCVUYsDQo+ICAgCQkJCWtmZF9pb2N0bF9pbXBv
cnRfZG1hYnVmLCAwKSwNCj4gICANCj4gKwlBTURLRkRfSU9DVExfREVGKEFNREtGRF9JT0NfQUxM
T0NfUVVFVUVfR1dTLA0KPiArCQkJa2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3cywgMCksDQo+ICAg
fTsNCj4gICANCj4gICAjZGVmaW5lIEFNREtGRF9DT1JFX0lPQ1RMX0NPVU5UCUFSUkFZX1NJWkUo
YW1ka2ZkX2lvY3RscykNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9j
dGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KPiBpbmRleCAyMDkxN2M1Li4w
NzBkMWJjIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgNCj4g
KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oDQo+IEBAIC00MTAsNiArNDEwLDIx
IEBAIHN0cnVjdCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5X2Zyb21fZ3B1X2FyZ3Mgew0KPiAgIAlf
X3UzMiBuX3N1Y2Nlc3M7CQkvKiB0by9mcm9tIEtGRCAqLw0KPiAgIH07DQo+ICAgDQo+ICsvKiBB
bGxvY2F0ZSBHV1MgZm9yIHNwZWNpZmljIHF1ZXVlDQo+ICsgKg0KPiArICogQGdwdV9pZDogICAg
ICBkZXZpY2UgaWRlbnRpZmllcg0KPiArICogQHF1ZXVlX2lkOiAgICBxdWV1ZSdzIGlkIHRoYXQg
R1dTIGlzIGFsbG9jYXRlZCBmb3INCj4gKyAqIEBudW1fZ3dzOiAgICAgaG93IG1hbnkgR1dTIHRv
IGFsbG9jYXRlDQo+ICsgKiBAZmlyc3RfZ3dzOiAgIGluZGV4IG9mIHRoZSBmaXJzdCBHV1MgYWxs
b2NhdGVkLg0KPiArICogICAgICAgICAgICAgICBvbmx5IHN1cHBvcnQgY29udGlndW91cyBHV1Mg
YWxsb2NhdGlvbg0KPiArICovDQo+ICtzdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19h
cmdzIHsNCj4gKwlfX3UzMiBncHVfaWQ7CQkvKiB0byBLRkQgKi8NCj4gKwlfX3UzMiBxdWV1ZV9p
ZDsJCS8qIHRvIEtGRCAqLw0KPiArCV9fdTMyIG51bV9nd3M7CQkvKiB0byBLRkQgKi8NCj4gKwlf
X3UzMiBmaXJzdF9nd3M7CS8qIGZyb20gS0ZEICovDQo+ICt9Ow0KPiArDQo+ICAgc3RydWN0IGtm
ZF9pb2N0bF9nZXRfZG1hYnVmX2luZm9fYXJncyB7DQo+ICAgCV9fdTY0IHNpemU7CQkvKiBmcm9t
IEtGRCAqLw0KPiAgIAlfX3U2NCBtZXRhZGF0YV9wdHI7CS8qIHRvIEtGRCAqLw0KPiBAQCAtNTI5
LDcgKzU0NCwxMCBAQCBlbnVtIGtmZF9tbWlvX3JlbWFwIHsNCj4gICAjZGVmaW5lIEFNREtGRF9J
T0NfSU1QT1JUX0RNQUJVRgkJXA0KPiAgIAkJQU1ES0ZEX0lPV1IoMHgxRCwgc3RydWN0IGtmZF9p
b2N0bF9pbXBvcnRfZG1hYnVmX2FyZ3MpDQo+ICAgDQo+ICsjZGVmaW5lIEFNREtGRF9JT0NfQUxM
T0NfUVVFVUVfR1dTCQlcDQo+ICsJCUFNREtGRF9JT1dSKDB4MUUsIHN0cnVjdCBrZmRfaW9jdGxf
YWxsb2NfcXVldWVfZ3dzX2FyZ3MpDQo+ICsNCj4gICAjZGVmaW5lIEFNREtGRF9DT01NQU5EX1NU
QVJUCQkweDAxDQo+IC0jZGVmaW5lIEFNREtGRF9DT01NQU5EX0VORAkJMHgxRQ0KPiArI2RlZmlu
ZSBBTURLRkRfQ09NTUFORF9FTkQJCTB4MUYNCj4gICANCj4gICAjZW5kaWYNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
