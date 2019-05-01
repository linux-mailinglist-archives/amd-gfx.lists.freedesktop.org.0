Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C511092B
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F330892CF;
	Wed,  1 May 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F368882A9
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 14:35:56 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3422.namprd12.prod.outlook.com (20.178.243.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 14:35:54 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 14:35:54 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV
Thread-Topic: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV
Thread-Index: AQHU/y74LPgfrI9usUWTk6b5Ro5CLaZWV7ww
Date: Wed, 1 May 2019 14:35:54 +0000
Message-ID: <MN2PR12MB34085C4826BF8FD164A1B6A4FE3B0@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1556613013-8586-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556613013-8586-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95bbdf7c-2276-400c-b92a-08d6ce42513a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3422; 
x-ms-traffictypediagnostic: MN2PR12MB3422:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB342278B04D0F6F5E24AA610FFE3B0@MN2PR12MB3422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(136003)(396003)(346002)(189003)(199004)(13464003)(2351001)(76176011)(66066001)(3846002)(2501003)(6116002)(74316002)(7696005)(86362001)(72206003)(71200400001)(14454004)(478600001)(71190400001)(7736002)(305945005)(6506007)(99286004)(5660300002)(55016002)(486006)(68736007)(102836004)(53546011)(446003)(52536014)(186003)(11346002)(966005)(6246003)(476003)(8676002)(8936002)(256004)(5640700003)(6916009)(14444005)(53936002)(26005)(6306002)(6436002)(229853002)(9686003)(316002)(33656002)(25786009)(66446008)(2906002)(73956011)(76116006)(64756008)(66946007)(66476007)(66556008)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3422;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jcv+670JWHwGtmlPp1krpi2nJuJTAf6s4kg5h3jYk4X9l154pO5kM55WCku6sBKtAfVU8821PFd4PdC+uivUAuzRMrP091v7zGLNQLkGDye7w68Rmctv4iHXQEril0Pp3KHi9aABQxStetUjgMMGCnULOuu8DkL/T1Gcg8lgawiw0IOgkaEUU2sV7VFd6H4aYuum5zvkIufrpmjPOQ9S8RD5aJG8X5dOMOomRMPHArAvkxSLq0TqrU4LIvo+LVrY70vn+/6XrLXs36PHhmJvF/KgCbHH/TE/JJ8FcQDIRgp1/SY/848rsHGyirMhKA3rAHN9PUY9qPiS5TxW1eyrm832Dxd/HfTSHVCvujMOfNvQbbe3QZ+3ahsuqr/r6cIhjXXKimLluiJUYsqwrALJHOqbBBmmI2jOEKucYNh8ixc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bbdf7c-2276-400c-b92a-08d6ce42513a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 14:35:54.4089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/EpsS0CxB7lgqZhC3ksG1LpFMHdeAg+34qz+jdrcSY=;
 b=uFXBXVRM1Yi0d5YsO8oCBGO2NXQcS3R9w8NjmuHgwYQh+NjE6pZY+2IqlVTaHq9LncD1GeZFOCusaJ39JnjiTxR+RCdWKqKSAnUjdv5Z4O/nPvuQR95bUcxZ1q381ojTOXaQvDKVcDzTfJPxuYRdgYmD2mtsb+tivGml8RBO5fo=
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

SGkgR3V5cywNCg0KV291bGQgeW91IGhlbHAgb24gdGhpcyBwYXRjaD8NCg0KVGhhbmtzICYgQmVz
dCBXaXNoZXMsDQpUcmlnZ2VyIEh1YW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YgVHJpZ2dlciBIdWFuZw0KU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMTkgNDoz
MCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSHVhbmcsIFRyaWdn
ZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTog
QWRkIElESF9RVUVSWV9BTElWRSBldmVudCBmb3IgU1ItSU9WDQoNCltDQVVUSU9OOiBFeHRlcm5h
bCBFbWFpbF0NCg0KU1ItSU9WIGhvc3Qgc2lkZSB3aWxsIHNlbmQgSURIX1FVRVJZX0FMSVZFIHRv
IGd1ZXN0IFZNIHRvIGNoZWNrIGlmIHRoaXMgZ3Vlc3QgVk0gaXMgc3RpbGwgYWxpdmUgKG5vdCBk
ZXN0cm95ZWQpLiBUaGUgb25seSB0aGluZyBndWVzdCBLTUQgbmVlZCB0byBkbyBpcyB0byBzZW5k
IEFDSyBiYWNrIHRvIGhvc3QuDQoNClNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdn
ZXIuSHVhbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1
X2FpLmMgfCAzICsrKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuaCB8IDEg
Kw0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbXhncHVfYWkuYw0KaW5kZXggOGRiYWQ0OS4uMjQ3MWU3YyAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMNCkBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGljIGludCB4
Z3B1X2FpX21haWxib3hfcmN2X2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAgICAg
ICAgICAgICAgICBpZiAoYW1kZ3B1X3NyaW92X3J1bnRpbWUoYWRldikpDQogICAgICAgICAgICAg
ICAgICAgICAgICBzY2hlZHVsZV93b3JrKCZhZGV2LT52aXJ0LmZscl93b3JrKTsNCiAgICAgICAg
ICAgICAgICBicmVhazsNCisgICAgICAgICAgICAgICBjYXNlIElESF9RVUVSWV9BTElWRToNCisg
ICAgICAgICAgICAgICAgICAgICAgIHhncHVfYWlfbWFpbGJveF9zZW5kX2FjayhhZGV2KTsNCisg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIC8qIFJFQURZX1RP
X0FDQ0VTU19HUFUgaXMgZmV0Y2hlZCBieSBrZXJuZWwgcG9sbGluZywgSVJRIGNhbiBpZ25vcmUN
CiAgICAgICAgICAgICAgICAgKiBpdCBieWZhciBzaW5jZSB0aGF0IHBvbGxpbmcgdGhyZWFkIHdp
bGwgaGFuZGxlIGl0LA0KICAgICAgICAgICAgICAgICAqIG90aGVyIG1zZyBsaWtlIGZsciBjb21w
bGV0ZSBpcyBub3QgaGFuZGxlZCBoZXJlLg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L214Z3B1X2FpLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9h
aS5oDQppbmRleCAzOWQxNTFiLi4wNzdlOTFhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbXhncHVfYWkuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bXhncHVfYWkuaA0KQEAgLTQ5LDYgKzQ5LDcgQEAgZW51bSBpZGhfZXZlbnQgew0KICAgICAgICBJ
REhfRkxSX05PVElGSUNBVElPTl9DTVBMLA0KICAgICAgICBJREhfU1VDQ0VTUywNCiAgICAgICAg
SURIX0ZBSUwsDQorICAgICAgIElESF9RVUVSWV9BTElWRSwNCiAgICAgICAgSURIX0VWRU5UX01B
WA0KIH07DQoNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
