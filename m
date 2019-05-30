Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61A2FBA8
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 14:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3B6E330;
	Thu, 30 May 2019 12:38:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF56E330
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 12:38:55 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3222.namprd12.prod.outlook.com (20.179.92.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 30 May 2019 12:38:52 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 12:38:52 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu/display: Fix reload driver error
Thread-Topic: [PATCH v2] drm/amdgpu/display: Fix reload driver error
Thread-Index: AQHVFcxV7+uw96bw6UKxV6nOw8dyLKaDnaoA
Date: Thu, 30 May 2019 12:38:52 +0000
Message-ID: <d2464395-9ba7-9b75-2040-72bdd4ca3aba@amd.com>
References: <1559099525-9742-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1559099525-9742-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::44) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6c6ad50-8b5b-465a-66ca-08d6e4fbc59d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3222; 
x-ms-traffictypediagnostic: BYAPR12MB3222:
x-microsoft-antispam-prvs: <BYAPR12MB322233573718FFBE68009AA2EC180@BYAPR12MB3222.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(366004)(376002)(39860400002)(199004)(189003)(229853002)(66556008)(99286004)(64756008)(66446008)(53546011)(66476007)(14444005)(14454004)(386003)(256004)(73956011)(8936002)(72206003)(76176011)(478600001)(31686004)(6506007)(8676002)(6436002)(305945005)(52116002)(86362001)(316002)(6486002)(7736002)(2906002)(2501003)(81156014)(476003)(31696002)(6512007)(486006)(81166006)(11346002)(446003)(66066001)(25786009)(2616005)(36756003)(53936002)(6246003)(66946007)(3846002)(71190400001)(186003)(71200400001)(102836004)(26005)(6116002)(5660300002)(110136005)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3222;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x7ZvsiVFU4/TwC8SIoWm1v/vwvsckSugI3LPwJJ/MwvNCKeM0VrqFb8ZdbaSE0ONAyU7TFfBonKIqqbcgvFzI6NUo5P0U2xuGD1iv11fx6WRQgPPZg6XZgVLbIHRdBmMkMo/+5uL7lGmn6cAJvsUdyVt5aU5cweU3b1fRjFVatZB7uK3aEv1cmv+O9zBNk5eCrLT1ETTlvL8IbeK4jdgjpgWpOA1lCVj0m95vqVHzzcu7eZqlDXVk2CjYWyrat7Ej2XSBUVRsKD7gDhV6BzkkQ5QcLNjQFDsLv8CmbN6FTwtVCALMxY+Id5XlRkACF17zjh/tYf1XaBksGc7lkhC6hb0ly8zQl7tLA56ZdzOJOdU+BF9LLtDtJ5tRHutSaXd316I3L356lS+o7pCQUkoU5CwhPD1024d4FttCHIwqSI=
Content-ID: <3BF8188DD913384FA99016494EF04750@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c6ad50-8b5b-465a-66ca-08d6e4fbc59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 12:38:52.7172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TosBNhEV0ywjNLrNx7HmemqksgwESzqP4fu3e2n53mw=;
 b=ms0j5T10EpUXg7YRtIWBsazo5pOWyTKLbxOz3RNxp/mKu1oxeaX45BEuYwy3Cya3R6yS3+m5nV7x5QxbdxppIW1QVbkFCcAWZRadNc2Pd5SuOETuF70n4AhmHq04yM8094wvodDmLefPdNKFC/7NeeETJDiJxYQY2OAvxTjvDiY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNS8yOC8xOSAxMToxMiBQTSwgRW1pbHkgRGVuZyB3cm90ZToNCj4gSXNzdWU6DQo+IFdpbGwg
aGF2ZSBmb2xsb3cgZXJyb3Igd2hlbiByZWxvYWQgZHJpdmVyOg0KPiBbIDM5ODYuNTY3NzM5XSBz
eXNmczogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9kZXZpY2VzL3BjaTAwMDA6
MDAvMDAwMDowMDowNy4wL2RybV9kcF9hdXhfZGV2Jw0KPiBbIDM5ODYuNTY3NzQzXSBDUFU6IDYg
UElEOiAxNzY3IENvbW06IG1vZHByb2JlIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAgICA1LjAu
MC1yYzEtY3VzdG9tICMxDQo+IFsgMzk4Ni41Njc3NDVdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3Rh
bmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIFVidW50dS0xLjguMi0xdWJ1bnR1
MSAwNC8wMS8yMDE0DQo+IFsgMzk4Ni41Njc3NDZdIENhbGwgVHJhY2U6DQo+IC4uLi4uLg0KPiBb
IDM5ODYuNTY3ODA4XSAgZHJtX2RwX2F1eF9yZWdpc3Rlcl9kZXZub2RlKzB4ZGMvMHgxNDAgW2Ry
bV9rbXNfaGVscGVyXQ0KPiAuLi4uLi4NCj4gWyAzOTg2LjU2OTA4MV0ga29iamVjdF9hZGRfaW50
ZXJuYWwgZmFpbGVkIGZvciBkcm1fZHBfYXV4X2RldiB3aXRoIC1FRVhJU1QsIGRvbid0IHRyeSB0
byByZWdpc3RlciB0aGluZ3Mgd2l0aCB0aGUgc2FtZSBuYW1lIGluIHRoZSBzYW1lIGRpcmVjdG9y
eS4NCj4gDQo+IFJlcHJvZHVjZSBzZXF1ZW5jZXM6DQo+IDEubW9kcHJvYmUgYW1kZ3B1DQo+IDIu
bW9kcHJvYmUgLXIgYW1kZ3B1DQo+IDMubW9kcHJvYmUgYW1kZ3B1DQo+IA0KPiBSb290IGNhdXNl
Og0KPiBXaGVuIHVubG9hZCBkcml2ZXIsIGl0IGRvZXNuJ3QgdW5yZWdpc3RlciBhdXguDQo+IA0K
PiB2MjogRG9uJ3QgdXNlIGhhc19hdXgNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcg
PEVtaWx5LkRlbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxu
aWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNCk9ubHkgYSBtaW5vciBuaXRwaWNrIGFib3V0
IG5vdCBtZW50aW9uaW5nIHRoYXQgeW91J3JlIGFsc28gcmVtb3ZpbmcgdGhlIA0KaTJjIHRoYXQg
d2UgYWRkZWQgb24gdGhlIGNvbm5lY3Rvciwgd2hpY2ggbG9va3MgY29ycmVjdCB0byBtZSwgYnV0
IGlzbid0IA0KcmVsYXRlZCB0byB0aGUgYXV4IHRoYXQgd2FzIHJlZ2lzdGVyZWQuDQoNCkxvb2tz
IGZpbmUgdG8gbWUgb3RoZXIgdGhhbiB0aGF0Lg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDE1ICsrKysrKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggOGZlMTY4NS4uOTQxMzEzYiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jDQo+IEBAIC0zNzYwLDYgKzM3NjAsMTMgQEAgaW50IGFtZGdwdV9kbV9jb25uZWN0b3Jf
YXRvbWljX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAg
IAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25u
ZWN0b3JfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiArew0K
PiArCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29ubmVjdG9yID0gdG9f
YW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3IpOw0KPiArDQo+ICsJZHJtX2RwX2F1eF91bnJl
Z2lzdGVyKCZhbWRncHVfZG1fY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4KTsNCj4gK30NCj4gKw0K
PiAgIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQ0KPiAgIHsNCj4gICAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0
b3IgKmFjb25uZWN0b3IgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+IEBA
IC0zNzg4LDYgKzM3OTUsMTEgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9kZXN0
cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICAgCWRybV9kcF9jZWNfdW5y
ZWdpc3Rlcl9jb25uZWN0b3IoJmFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgpOw0KPiAgIAlkcm1f
Y29ubmVjdG9yX3VucmVnaXN0ZXIoY29ubmVjdG9yKTsNCj4gICAJZHJtX2Nvbm5lY3Rvcl9jbGVh
bnVwKGNvbm5lY3Rvcik7DQo+ICsJaWYgKGFjb25uZWN0b3ItPmkyYykgew0KPiArCQlpMmNfZGVs
X2FkYXB0ZXIoJmFjb25uZWN0b3ItPmkyYy0+YmFzZSk7DQo+ICsJCWtmcmVlKGFjb25uZWN0b3It
PmkyYyk7DQo+ICsJfQ0KPiArDQo+ICAgCWtmcmVlKGNvbm5lY3Rvcik7DQo+ICAgfQ0KPiAgIA0K
PiBAQCAtMzg0Niw3ICszODU4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9y
X2Z1bmNzIGFtZGdwdV9kbV9jb25uZWN0b3JfZnVuY3MgPSB7DQo+ICAgCS5hdG9taWNfZHVwbGlj
YXRlX3N0YXRlID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZHVwbGljYXRlX3N0YXRlLA0K
PiAgIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
ZGVzdHJveV9zdGF0ZSwNCj4gICAJLmF0b21pY19zZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29u
bmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHksDQo+IC0JLmF0b21pY19nZXRfcHJvcGVydHkgPSBh
bWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRfcHJvcGVydHkNCj4gKwkuYXRvbWljX2dldF9w
cm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2dldF9wcm9wZXJ0eSwNCj4gKwku
ZWFybHlfdW5yZWdpc3RlciA9IGFtZGdwdV9kbV9jb25uZWN0b3JfdW5yZWdpc3Rlcg0KPiAgIH07
DQo+ICAgDQo+ICAgc3RhdGljIGludCBnZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
