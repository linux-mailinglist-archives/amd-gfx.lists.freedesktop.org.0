Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48310923
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF26891AB;
	Wed,  1 May 2019 14:32:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790043.outbound.protection.outlook.com [40.107.79.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33716891AB
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 14:32:49 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3759.namprd12.prod.outlook.com (10.255.236.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Wed, 1 May 2019 14:32:46 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 14:32:46 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Rearm IRQ in Vega10 SR-IOV if IRQ lost
Thread-Topic: [PATCH] drm/amdgpu: Rearm IRQ in Vega10 SR-IOV if IRQ lost
Thread-Index: AQHU/2d5NQHb1WjMpkuKAuTYw4XPOqZU8FuAgAFl0EA=
Date: Wed, 1 May 2019 14:32:46 +0000
Message-ID: <MN2PR12MB34082095AC98F500A93E1E69FE3B0@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1556637284-715-1-git-send-email-Trigger.Huang@amd.com>
 <c9c462e1-f73f-64f0-31f8-3bbceefbea60@gmail.com>
In-Reply-To: <c9c462e1-f73f-64f0-31f8-3bbceefbea60@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83ca3822-360a-4043-7b0b-08d6ce41e112
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3759; 
x-ms-traffictypediagnostic: MN2PR12MB3759:
x-microsoft-antispam-prvs: <MN2PR12MB3759DE16109015DB8D936447FE3B0@MN2PR12MB3759.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(366004)(136003)(376002)(13464003)(189003)(199004)(6436002)(5660300002)(99286004)(316002)(86362001)(110136005)(2501003)(478600001)(33656002)(6506007)(55016002)(8936002)(76176011)(256004)(102836004)(76116006)(14454004)(186003)(14444005)(72206003)(53546011)(11346002)(26005)(6116002)(81166006)(81156014)(446003)(66066001)(476003)(8676002)(2906002)(7696005)(66574012)(305945005)(74316002)(68736007)(66476007)(7736002)(25786009)(229853002)(71200400001)(66946007)(73956011)(6246003)(66446008)(66556008)(486006)(53936002)(71190400001)(3846002)(52536014)(9686003)(64756008)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3759;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VJhkpnnlTltgSTzDmg+epiTwHUgflaf3MHwjmJuNDMkKjP5346Z0kiY1soPk1wFzXr8dLwnT8JiKS2AnyWF3HtXGwhGA1Rvb3WAQI0lixyMH8GSxEgARwMVIxgRazqr+a/W24eYZdx0Gjrk4bbVfhNbdAvAFFtAf0UE7f/3pCN8osq/0RN8oNyLHHTaDAs/uiQLBS6zFSUogqZDIrAYaK4/PoG/u1P5380dbZtRI3M6RG78d86rd4vgkMFNPg/epw2GhnuLyxmMetWSkHBuawUTQSjGphiuJ4ntNTxuy67sq+d/yKHBMQurcENT3DUnzgW0P6d+4fDelmD7HOOUD33dSzCmrKyEh0DlpEAAudCzH5eyU3DAJRQaRLgc7xH6iETq7GVXsAbug6ro8k9btVhY6NrjFIzQFodRIHMwJ/Gc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca3822-360a-4043-7b0b-08d6ce41e112
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 14:32:46.3234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uJKvhCCfUqZCZNuWUHDh5LUmycYaU+Q3OnHzsiZfb4=;
 b=nEYTPz0Td+aazms4VwcintLru/6FhzPeYal88Z6gLeDczyhXBkSdmcXnDRDi37L0ElHXLJThV+df8BFQWLPztAZxpFJA6CiRUdX5g05IsVVew3muFY+Di4ElfzCHvtYwKoUdOisOGkNf2fiHEmpWRzcPTpiu2H1ofFfHmIQkBcY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KDQpZZXMsIGl0IGlzIHRoZSBIVyBndXlzIHdobyBzdWdnZXN0ZWQgdG8g
cmVhcm0gaXQuDQoNClRoYW5rcyAmIEJlc3QgV2lzaGVzLA0KVHJpZ2dlciBIdWFuZw0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXkgMDEsIDIwMTkg
MToxMCBBTQ0KVG86IEh1YW5nLCBUcmlnZ2VyIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdw
dTogUmVhcm0gSVJRIGluIFZlZ2ExMCBTUi1JT1YgaWYgSVJRIGxvc3QNCg0KW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KDQpBbSAzMC4wNC4xOSB1bSAxNzoxNCBzY2hyaWViIFRyaWdnZXIgSHVh
bmc6DQo+IEluIE11bHRpLVZGcyBzdHJlc3MgdGVzdCwgc29tZXRpbWVzIHdlIHNlZSBJUlEgbG9z
dCB3aGVuIHJ1bm5pbmcgDQo+IGJlbmNobWFyaywganVzdCByZWFybSBpdC4NCg0KV2VsbCBJIHRo
aW5rIEkgaGF2ZSBzZWVuIHRoYXQgb24gYmFyZSBtZXRhbCBhcyB3ZWxsLCBpdCB3b3VsZCBjZXJ0
YWlubHkgZXhwbGFpbiBzb21lIHZlcnkgb2RkIGJlaGF2aW9yIEkndmUgZ290IGZyb20gdGhlIElI
IGJsb2NrLg0KDQpIYXZlIHlvdSBwaW5nZWQgdGhlIGh3IGd1eXMgYWJvdXQgdGhhdCBhbHJlYWR5
Pw0KDQo+IFNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNv
bT4NCg0KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyB8
IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmVnYTEwX2loLmMNCj4gaW5kZXggMWIyZjY5YS4uOGQ4OWFiNyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMNCj4gQEAgLTMxLDcgKzMxLDcg
QEANCj4gICAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiDQo+ICAgI2luY2x1ZGUgInZlZ2ExMF9p
aC5oIg0KPg0KPiAtDQo+ICsjZGVmaW5lIE1BWF9SRUFSTV9SRVRSWSAxMA0KPg0KPiAgIHN0YXRp
YyB2b2lkIHZlZ2ExMF9paF9zZXRfaW50ZXJydXB0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNl
IA0KPiAqYWRldik7DQo+DQo+IEBAIC0zODIsNiArMzgyLDM4IEBAIHN0YXRpYyB2b2lkIHZlZ2Ex
MF9paF9kZWNvZGVfaXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgfQ0KPg0KPiAg
IC8qKg0KPiArICogdmVnYTEwX2loX2lycV9yZWFybSAtIHJlYXJtIElSUSBpZiBsb3N0DQo+ICsg
Kg0KPiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiArICoNCj4gKyAqLw0KPiAr
c3RhdGljIHZvaWQgdmVnYTEwX2loX2lycV9yZWFybShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2loX3Jpbmcg
KmloKSB7DQo+ICsgICAgIHVpbnQzMl90IHJlZ19ycHRyID0gMDsNCj4gKyAgICAgdWludDMyX3Qg
diA9IDA7DQo+ICsgICAgIHVpbnQzMl90IGkgPSAwOw0KPiArDQo+ICsgICAgIGlmIChpaCA9PSAm
YWRldi0+aXJxLmloKQ0KPiArICAgICAgICAgICAgIHJlZ19ycHRyID0gU09DMTVfUkVHX09GRlNF
VChPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUik7DQo+ICsgICAgIGVsc2UgaWYgKGloID09ICZhZGV2
LT5pcnEuaWgxKQ0KPiArICAgICAgICAgICAgIHJlZ19ycHRyID0gU09DMTVfUkVHX09GRlNFVChP
U1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMSk7DQo+ICsgICAgIGVsc2UgaWYgKGloID09ICZh
ZGV2LT5pcnEuaWgyKQ0KPiArICAgICAgICAgICAgIHJlZ19ycHRyID0gU09DMTVfUkVHX09GRlNF
VChPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMik7DQo+ICsgICAgIGVsc2UNCj4gKyAgICAg
ICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAgICAgLyogUmVhcm0gSVJRIC8gcmUtd3dyaXRlIGRv
b3JiZWxsIGlmIGRvb3JiZWxsIHdyaXRlIGlzIGxvc3QgKi8NCj4gKyAgICAgZm9yIChpID0gMDsg
aSA8IE1BWF9SRUFSTV9SRVRSWTsgaSsrKSB7DQo+ICsgICAgICAgICAgICAgdiA9IFJSRUczMl9O
T19LSVEocmVnX3JwdHIpOw0KPiArICAgICAgICAgICAgIGlmICgodiA8IGloLT5yaW5nX3NpemUp
ICYmICh2ICE9IGloLT5ycHRyKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIFdET09SQkVMTDMy
KGloLT5kb29yYmVsbF9pbmRleCwgaWgtPnJwdHIpOw0KPiArICAgICAgICAgICAgIGVsc2UNCj4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICB9DQo+ICt9DQo+ICsNCj4gKy8q
Kg0KPiAgICAqIHZlZ2ExMF9paF9zZXRfcnB0ciAtIHNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0
cg0KPiAgICAqDQo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KPiBAQCAtMzk1
LDYgKzQyNyw5IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9paF9zZXRfcnB0cihzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAvKiBYWFggY2hlY2sgaWYgc3dhcHBpbmcg
aXMgbmVjZXNzYXJ5IG9uIEJFICovDQo+ICAgICAgICAgICAgICAgKmloLT5ycHRyX2NwdSA9IGlo
LT5ycHRyOw0KPiAgICAgICAgICAgICAgIFdET09SQkVMTDMyKGloLT5kb29yYmVsbF9pbmRleCwg
aWgtPnJwdHIpOw0KPiArDQo+ICsgICAgICAgICAgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2
KSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIHZlZ2ExMF9paF9pcnFfcmVhcm0oYWRldiwgaWgp
Ow0KPiAgICAgICB9IGVsc2UgaWYgKGloID09ICZhZGV2LT5pcnEuaWgpIHsNCj4gICAgICAgICAg
ICAgICBXUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX1JQVFIsIGloLT5ycHRyKTsNCj4g
ICAgICAgfSBlbHNlIGlmIChpaCA9PSAmYWRldi0+aXJxLmloMSkgew0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
