Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547830B3F
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CD989292;
	Fri, 31 May 2019 09:19:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0389292
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 09:19:26 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 31 May 2019 09:19:24 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::748a:3b89:f005:2e8f]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::748a:3b89:f005:2e8f%5]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 09:19:23 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/sriov: Correct some register program method
Thread-Topic: [PATCH] drm/amdgpu/sriov: Correct some register program method
Thread-Index: AQHVF3tFovrnBq69kUSCNGdbjJkwoKaE9DIA
Date: Fri, 31 May 2019 09:19:23 +0000
Message-ID: <MN2PR12MB3408903F01233E9273F52BA2FE190@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1559284614-20932-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1559284614-20932-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eeb674cf-471e-49f7-4a17-08d6e5a9125f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB338912D0F734246C45E341CEFE190@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39860400002)(396003)(366004)(13464003)(199004)(189003)(66066001)(6306002)(9686003)(6506007)(11346002)(53546011)(68736007)(14454004)(305945005)(966005)(2501003)(74316002)(186003)(76176011)(76116006)(486006)(99286004)(7696005)(33656002)(2906002)(26005)(446003)(6116002)(66556008)(55016002)(7736002)(25786009)(3846002)(66476007)(478600001)(66446008)(8676002)(229853002)(52536014)(64756008)(8936002)(72206003)(476003)(4326008)(256004)(81166006)(66946007)(81156014)(73956011)(6436002)(316002)(53936002)(14444005)(71190400001)(6246003)(71200400001)(86362001)(5660300002)(102836004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9MR1rsYJfBiVv4eia9uGOAHUgoRFKZL4UN5n5CV6FD3frVeIHJxQkI7AIZW6mic3TfjveU01s8OIHc8NCjqsFnq2ALDXsHNUUm0ZI8bbyuhkoLaDy5pQ/J0seLvYtusa38r5Jdrz5AFHXa5kw9od72onqquYbQJmpRwZx+BdGMD+JsUlrggO6JmPBd5lIFbwPu+3yyfi7ESqo4wNoePr0nvLc11xmUstkfmOEuspRTbbQx023kDvoT5LWZ4WF7nzHA0fiJHulMmbwoGh36RUgouuW1Yeqp7i+cEjqNtYJ7zPnkikPh2InL73yzIpyxlE1Yq4z0+eRH3yVxC2nweJGCJq1f/BnIkfyD+pfEfH9BNF4EU6NfnaLl2YFDpADeNg+6kxlEUX5frTOUIdpKhSaB9VSQlEDEa5/yU/aPbcifQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb674cf-471e-49f7-4a17-08d6e5a9125f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 09:19:23.8743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: triggerh@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INbziQdk+tq0TIKChaLaHascjO1YX+ZYk213fdUMqiY=;
 b=ex4pxGgGaenPct2nDymJsd+uXO7azMBQITGFnSo02Uhz7YnOIdmfSAYXOdcE2gJM6N29hQ962/Lw8eHgHjj8Jpc/guBZH/7H2LmYNAb+9a5yO+OszHw8MSRjAMYNZFHQm/YcAA/CS/v4iv7F3AZbKyn4lMu1a3d1lxVy/gIRnoU=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPg0KDQoN
ClRoYW5rcyAmIEJlc3QgV2lzaGVzLA0KVHJpZ2dlciBIdWFuZw0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mIEVtaWx5IERlbmcNClNlbnQ6IEZyaWRheSwgTWF5IDMxLCAy
MDE5IDI6MzcgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERlbmcs
IEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUv
c3Jpb3Y6IENvcnJlY3Qgc29tZSByZWdpc3RlciBwcm9ncmFtIG1ldGhvZA0KDQpGb3IgdGhlIFZG
LCBzb21lIHJlZ2lzdGVycyBvbmx5IGNvdWxkIGJlIHByb2dyYW1tZWQgd2l0aCBSTEMuDQoNClNp
Z25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgfCAxMCArKysrKy0tLS0tDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyB8ICA4ICsrKystLS0tDQogMiBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KaW5kZXggY2M1YTM4Mi4uMmU5Y2FjMSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCkBAIC0xOTI3LDE3ICsxOTI3LDE3IEBA
IHN0YXRpYyB2b2lkIGdmeF92OV8wX2NvbnN0YW50c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KIAkJaWYgKGkgPT0gMCkgew0KIAkJCXRtcCA9IFJFR19TRVRfRklFTEQoMCwgU0hf
TUVNX0NPTkZJRywgQUxJR05NRU5UX01PREUsDQogCQkJCQkgICAgU0hfTUVNX0FMSUdOTUVOVF9N
T0RFX1VOQUxJR05FRCk7DQotCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9DT05GSUcs
IHRtcCk7DQotCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9CQVNFUywgMCk7DQorCQkJ
V1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1TSF9NRU1fQ09ORklHLCB0bXApOw0KKwkJCVdSRUcz
Ml9TT0MxNV9STEMoR0MsIDAsIG1tU0hfTUVNX0JBU0VTLCAwKTsNCiAJCX0gZWxzZSB7DQogCQkJ
dG1wID0gUkVHX1NFVF9GSUVMRCgwLCBTSF9NRU1fQ09ORklHLCBBTElHTk1FTlRfTU9ERSwNCiAJ
CQkJCSAgICBTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKTsNCi0JCQlXUkVHMzJfU09D
MTUoR0MsIDAsIG1tU0hfTUVNX0NPTkZJRywgdG1wKTsNCisJCQlXUkVHMzJfU09DMTVfUkxDKEdD
LCAwLCBtbVNIX01FTV9DT05GSUcsIHRtcCk7DQogCQkJdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBT
SF9NRU1fQkFTRVMsIFBSSVZBVEVfQkFTRSwNCiAJCQkJKGFkZXYtPmdtYy5wcml2YXRlX2FwZXJ0
dXJlX3N0YXJ0ID4+IDQ4KSk7DQogCQkJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFNIX01FTV9C
QVNFUywgU0hBUkVEX0JBU0UsDQogCQkJCShhZGV2LT5nbWMuc2hhcmVkX2FwZXJ0dXJlX3N0YXJ0
ID4+IDQ4KSk7DQotCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9CQVNFUywgdG1wKTsN
CisJCQlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbVNIX01FTV9CQVNFUywgdG1wKTsNCiAJCX0N
CiAJfQ0KIAlzb2MxNV9ncmJtX3NlbGVjdChhZGV2LCAwLCAwLCAwLCAwKTsNCkBAIC0zMDQ2LDcg
KzMwNDYsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2tpcV9pbml0X3JlZ2lzdGVyKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZykNCiAJCQkJCShhZGV2LT5kb29yYmVsbF9pbmRleC51c2VycXVldWVf
ZW5kICogMikgPDwgMik7DQogCX0NCiANCi0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX0hRRF9Q
UV9ET09SQkVMTF9DT05UUk9MLA0KKwlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbUNQX0hRRF9Q
UV9ET09SQkVMTF9DT05UUk9MLA0KIAkgICAgICAgbXFkLT5jcF9ocWRfcHFfZG9vcmJlbGxfY29u
dHJvbCk7DQogDQogCS8qIHJlc2V0IHJlYWQgYW5kIHdyaXRlIHBvaW50ZXJzLCBzaW1pbGFyIHRv
IENQX1JCMF9XUFRSL19SUFRSICovIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhodWJfdjFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3Yx
XzAuYw0KaW5kZXggMGRjODkyNi4uOWYwZjE4OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeGh1Yl92MV8wLmMNCkBAIC0xNDYsMTIgKzE0NiwxMiBAQCBzdGF0aWMgdm9pZCBnZnho
dWJfdjFfMF9pbml0X2NhY2hlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCXRt
cCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9MMl9DTlRMLCBQREVfRkFVTFRfQ0xBU1NJRklDQVRJ
T04sIDApOw0KIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTCwgQ09OVEVYVDFf
SURFTlRJVFlfQUNDRVNTX01PREUsIDEpOw0KIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1f
TDJfQ05UTCwgSURFTlRJVFlfTU9ERV9GUkFHTUVOVF9TSVpFLCAwKTsNCi0JV1JFRzMyX1NPQzE1
KEdDLCAwLCBtbVZNX0wyX0NOVEwsIHRtcCk7DQorCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1t
Vk1fTDJfQ05UTCwgdG1wKTsNCiANCiAJdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbVZNX0wy
X0NOVEwyKTsNCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0wyX0NOVEwyLCBJTlZBTElE
QVRFX0FMTF9MMV9UTEJTLCAxKTsNCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0wyX0NO
VEwyLCBJTlZBTElEQVRFX0wyX0NBQ0hFLCAxKTsNCi0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVZN
X0wyX0NOVEwyLCB0bXApOw0KKwlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbVZNX0wyX0NOVEwy
LCB0bXApOw0KIA0KIAl0bXAgPSBtbVZNX0wyX0NOVEwzX0RFRkFVTFQ7DQogCWlmIChhZGV2LT5n
bWMudHJhbnNsYXRlX2Z1cnRoZXIpIHsNCkBAIC0xNjMsMTIgKzE2MywxMiBAQCBzdGF0aWMgdm9p
ZCBnZnhodWJfdjFfMF9pbml0X2NhY2hlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQogCQl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTDMsDQogCQkJCSAgICBMMl9D
QUNIRV9CSUdLX0ZSQUdNRU5UX1NJWkUsIDYpOw0KIAl9DQotCVdSRUczMl9TT0MxNShHQywgMCwg
bW1WTV9MMl9DTlRMMywgdG1wKTsNCisJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1WTV9MMl9D
TlRMMywgdG1wKTsNCiANCiAJdG1wID0gbW1WTV9MMl9DTlRMNF9ERUZBVUxUOw0KIAl0bXAgPSBS
RUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTDQsIFZNQ19UQVBfUERFX1JFUVVFU1RfUEhZU0lD
QUwsIDApOw0KIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTDQsIFZNQ19UQVBf
UFRFX1JFUVVFU1RfUEhZU0lDQUwsIDApOw0KLQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tVk1fTDJf
Q05UTDQsIHRtcCk7DQorCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tVk1fTDJfQ05UTDQsIHRt
cCk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGdmeGh1Yl92MV8wX2VuYWJsZV9zeXN0ZW1fZG9tYWlu
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
