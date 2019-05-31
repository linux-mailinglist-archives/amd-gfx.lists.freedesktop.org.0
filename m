Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E13131E
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECFF89745;
	Fri, 31 May 2019 16:54:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700048.outbound.protection.outlook.com [40.107.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6EE89745
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:54:11 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3621.namprd12.prod.outlook.com (20.178.54.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Fri, 31 May 2019 16:54:09 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1922.024; Fri, 31 May 2019
 16:54:09 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: Drop some new
 CONFIG_DRM_AMD_DC_DCN1_01 guards
Thread-Topic: [PATCH] drm/amdgpu/display: Drop some new
 CONFIG_DRM_AMD_DC_DCN1_01 guards
Thread-Index: AQHVF88de4bQeWfcAEKVcVy6aCbgEaaFc0wA
Date: Fri, 31 May 2019 16:54:09 +0000
Message-ID: <9797b12d-278e-8bf8-0656-eddea0041442@amd.com>
References: <20190531163707.21363-1-alexander.deucher@amd.com>
In-Reply-To: <20190531163707.21363-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0ab9578-a6bf-4d49-72d0-08d6e5e89982
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3621; 
x-ms-traffictypediagnostic: BYAPR12MB3621:
x-microsoft-antispam-prvs: <BYAPR12MB3621473797EC1D00F534EDD4EC190@BYAPR12MB3621.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(376002)(39860400002)(199004)(189003)(6506007)(386003)(53546011)(102836004)(8676002)(76176011)(81156014)(256004)(71190400001)(81166006)(8936002)(52116002)(26005)(305945005)(486006)(476003)(229853002)(99286004)(71200400001)(7736002)(6512007)(6246003)(11346002)(446003)(2616005)(6486002)(36756003)(6436002)(66066001)(316002)(31686004)(14454004)(5660300002)(73956011)(66556008)(186003)(64756008)(2906002)(53936002)(86362001)(66446008)(110136005)(66946007)(6116002)(4326008)(31696002)(68736007)(66476007)(2501003)(25786009)(478600001)(72206003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3621;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QP9mU2HDwMTkRWoLzYg3nHcPLjxIJ3W/VM9VE/8v3bXBx0jCU0qs8HbZdoh9+87qiDwJ9fCjwZV8JODQ8pkxvqrXTZK2cO4zAdMv48Hv0SZkIxlSFblLCFtjd5Xtn75lMs0K7WSNPvrYiAVHaawhgn0bJUeB20dPElAtfsd6Y3ojacJshfXcFBndvuj0I0WSIjms/xPhUiUmda4WLDf7cf/kSF7xzLeomfpzvf/FFuOTKGuhPUc/0B+F/mtUJIoBj8gsiOWz+3BCGfYyzPVsEbvSMWAMHAzGWDbD9FpDc0KVIDMC/MvAItL9DMEziLjLT/14UsIS+0lc2c8+OaaF8hTjJ6RaZRIRVt2JlUZlQNxT2Eu+xcW/p74RxXAOo2MFcwrMQgyZDOMHfAFZHbbeLYsZQqPoIkruJ6TK/i+vERY=
Content-ID: <D3238A485DAC424BA70608018D96E783@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ab9578-a6bf-4d49-72d0-08d6e5e89982
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 16:54:09.4028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3621
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48NTAVg1FAJ+2aVhoOF97vE0S3yI/ciTdaHZUrTmJZY=;
 b=z6FyLX6ZgG49tZs9AzRunlbYjSWlnrYYsT9xAKL4HOPBDOKUHyFJPq5q+Fp/n3UdZIZjCf8oFLVdrbHVQ8NNlr4WsD17p2ewj08f7IJwZhtxprbuZViUMIpp5H+elXSo3lE9BlPHhSyIgnBenURhPh4Ezi5M/CNSTUv34yD+30A=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNS8zMS8xOSAxMjozNyBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBUaGVzZSBnb3QgYWRk
ZWQgYmFjayBieSBzdWJzZXF1ZW50IG1lcmdlcyBhY2NpZGVudGx5Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpSZXZpZXdl
ZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCAyIC0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3Iv
Y2xrX21nci5jICB8IDQgLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYw0KPiBpbmRleCAzM2UzOTg4ODIxMWMuLmI1YTVjZmFlN2JhMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+
IEBAIC02NjUsMTMgKzY2NSwxMSBAQCBzdGF0aWMgaW50IGxvYWRfZG1jdV9mdyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCj4gICAJY2FzZSBDSElQX1ZFR0EyMDoNCj4gICAJCXJldHVybiAw
Ow0KPiAgIAljYXNlIENISVBfUkFWRU46DQo+IC0jaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9E
Q19EQ04xXzAxKQ0KPiAgIAkJaWYgKEFTSUNSRVZfSVNfUElDQVNTTyhhZGV2LT5leHRlcm5hbF9y
ZXZfaWQpKQ0KPiAgIAkJCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7DQo+ICAg
CQllbHNlIGlmIChBU0lDUkVWX0lTX1JBVkVOMihhZGV2LT5leHRlcm5hbF9yZXZfaWQpKQ0KPiAg
IAkJCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7DQo+ICAgCQllbHNlDQo+IC0j
ZW5kaWYNCj4gICAJCQlyZXR1cm4gMDsNCj4gICAJCWJyZWFrOw0KPiAgIAlkZWZhdWx0Og0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21n
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5jDQo+
IGluZGV4IDA4YjI3Yzc3NWNkNC4uZWIyMjA0ZDQyMzM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5jDQo+IEBAIC0xMDUsMTQg
KzEwNSwxMCBAQCBzdHJ1Y3QgY2xrX21nciAqZGNfY2xrX21ncl9jcmVhdGUoc3RydWN0IGRjX2Nv
bnRleHQgKmN0eCwgc3RydWN0IHBwX3NtdV9mdW5jcyAqcA0KPiAgIA0KPiAgICNpZiBkZWZpbmVk
KENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMCkNCj4gICAJY2FzZSBGQU1JTFlfUlY6DQo+IC0NCj4g
LSNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDEpDQo+ICAgCQlpZiAoQVNJQ1JF
Vl9JU19SQVZFTjIoYXNpY19pZC5od19pbnRlcm5hbF9yZXYpKSB7DQo+ICAgCQkJcnYyX2Nsa19t
Z3JfY29uc3RydWN0KGN0eCwgY2xrX21nciwgcHBfc211KTsNCj4gICAJCQlicmVhazsNCj4gICAJ
CX0NCj4gLSNlbmRpZgkvKiBEQ04xXzAxICovDQo+IC0NCj4gICAJCWlmIChBU0lDUkVWX0lTX1JB
VkVOKGFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSB8fA0KPiAgIAkJCQlBU0lDUkVWX0lTX1BJQ0FT
U08oYXNpY19pZC5od19pbnRlcm5hbF9yZXYpKSB7DQo+ICAgCQkJcnYxX2Nsa19tZ3JfY29uc3Ry
dWN0KGN0eCwgY2xrX21nciwgcHBfc211KTsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
