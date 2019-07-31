Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089137B854
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755DD6E665;
	Wed, 31 Jul 2019 03:49:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700041.outbound.protection.outlook.com [40.107.70.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9096E665
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:49:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRzef1RnYpGAjYYFA+Lsewynn2dzO7DyPYXczRtWzH8Tie5mnNjAW2WSg8urgJdJTQDw/+UUHVs7mEnPdG/3sQbxuOHZ2QLy52EFbFqZ+eGSoSPeGIG+y13fXU3oG0pd24ziWtSINfnD3FCexghlNHDu2aBHqM7dT6ugVD4T+dEJZIF8B3tyLgo7TVby7YomWx4NIPvlWo9xbSWlOpXan8UGkfjmXgh4WwX5VtVRE9wrPh4y35gsPRLzDgMIEgqZfPNyuFqvuC+MqMS0O5TZNjacO1QWE25VR3/BRHKONrD+V7f0pG2wWWyCrRwbajcpfFRlDiU98rWr3fxHMTCieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+FirOGa0BW6TxzLpMcqt1LABl+i0O7REStQteqkQQA=;
 b=BJEHQaTofyDrRw9V4TORGRDQxigyuwcMGemNIUK8BgrGevwXDBt5RPv7SSpCoKEsmv5KrNeQvWHvgJPnhdQun64KMEixIGQOZ6AQROQ/JXa9EoJ9XQIB7AK88SJDljqm/ELwRWrATT9XsRTAXxNNsCbGcRGbqXprlS90BluRzokXpXh5oGxWLYXSGP2RJaJ70NLeiocLEV0ARYPLbqzP7S69rM3dGxgtRm4YMRovQbRYoxrfFi/SFD5Huf6Dir3Pt9wpDmzQFE6DR/21amNvoX8Z5TM61izVlLQCT3I1Bv+babxI+tEjlwRS+/WOZBlSA3BvFogOB0hHXd+2TeBjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3327.namprd12.prod.outlook.com (20.178.243.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 03:48:58 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 03:48:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: return success if set_mp1_state is
 not set
Thread-Topic: [PATCH] drm/amdgpu/powerplay: return success if set_mp1_state is
 not set
Thread-Index: AQHVR0f8vFRqgsuapUCaiM+4ZEpb+KbkFvcA
Date: Wed, 31 Jul 2019 03:48:58 +0000
Message-ID: <MN2PR12MB334457091037FE5605D54ECDE4DF0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190731023044.6828-1-alexander.deucher@amd.com>
In-Reply-To: <20190731023044.6828-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0eee22c-7705-44bb-ce39-08d7156a04a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3327; 
x-ms-traffictypediagnostic: MN2PR12MB3327:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB33273EE2B346C4CE9C09D5F8E4DF0@MN2PR12MB3327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(13464003)(199004)(189003)(66476007)(53936002)(66946007)(64756008)(478600001)(26005)(11346002)(86362001)(102836004)(486006)(110136005)(2501003)(446003)(66556008)(476003)(76116006)(53546011)(5660300002)(7736002)(6506007)(7696005)(966005)(99286004)(76176011)(66446008)(186003)(229853002)(68736007)(6436002)(25786009)(2906002)(6246003)(71200400001)(3846002)(52536014)(4326008)(316002)(33656002)(81166006)(8936002)(8676002)(305945005)(256004)(81156014)(6116002)(74316002)(9686003)(55016002)(6306002)(66066001)(71190400001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3327;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o0iNCcgMYMoMrZWzeKjf8HPoG6Lo46/4lu1OpXyawbTs7poOVRDbbALzGkq73juOe7Z5PhY0ujPvfQjgGcoNA1HOPLFAYir+4TbmtSqQxSE757M7zlfIP3VRUuOe87kCAE0Sw9LbiHqIk/EWY5knCUOusC76mm4rO+ZdcSMs3bEQhijSR0+Y2zVEabTB/7R69pf9CzK5BP+JiGtbjWWWLBXzOaMbUFvJncPbGJQgHENmR5dqz0wJNQqIqEs6JnxKScwD+DtWddlLF4t58eJjWrV0o3QmYi01i2TM2LanGvYFy1ILOLnydZ32X3zXdBz1FUFXLH2IcVFu8j34HeSfH0GR6jLc8Q82taMrUcui+wYmpKhqUwTQja88bMflrIP9NP++fR3JckkE7Bvl+fA6/U5Kn2Ex15hs7VEByKLCots=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eee22c-7705-44bb-ce39-08d7156a04a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 03:48:58.3533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3327
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+FirOGa0BW6TxzLpMcqt1LABl+i0O7REStQteqkQQA=;
 b=ZCb0QlOHBY+N3FZDWTi+g9+Dk/7ZpFX7yLSmjyfF+Pv1C/hS8z9wnAvgKuxz8FTVgU8xhGkSOJjZ8W+Hhqf+o6ABYDZntW30NyuRYal7n8+pEGEBr9qwnLbZbtEPRJjmvuXz5bQ1895rEZyeK59BbhMugsFd6PIq+fIfVH6DIIA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBX
ZWRuZXNkYXksIEp1bHkgMzEsIDIwMTkgMTA6MzEgQU0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9wb3dlcnBsYXk6IHJldHVy
biBzdWNjZXNzIGlmIHNldF9tcDFfc3RhdGUNCj4gaXMgbm90IHNldA0KPiANCj4gU29tZSBhc2lj
cyAoQVBVcykgZG9uJ3QgaGF2ZSB0aGlzIGNhbGxiYWNrIHNvIHdlIHdhbnQgdG8gcmV0dXJuIHN1
Y2Nlc3MuDQo+IEF2b2lkcyBzcHVyaW91cyBlcnJvciBtZXNzYWdlcyBvbiBBUFVzLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyB8
IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kX3Bvd2VycGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bv
d2VycGxheS5jDQo+IGluZGV4IDg4YTJlZjc1YjdlMS4uMmUzZDllZjYyNWJmIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jDQo+IEBAIC05
MzEsMTIgKzkzMSwxMCBAQCBzdGF0aWMgaW50IHBwX2RwbV9zZXRfbXAxX3N0YXRlKHZvaWQgKmhh
bmRsZSwNCj4gZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKQ0KPiAgCWlmICghaHdtZ3IgfHwg
IWh3bWdyLT5wbV9lbikNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAtCWlmIChod21nci0+
aHdtZ3JfZnVuYy0+c2V0X21wMV9zdGF0ZSA9PSBOVUxMKSB7DQo+IC0JCXByX2luZm9fcmF0ZWxp
bWl0ZWQoIiVzIHdhcyBub3QgaW1wbGVtZW50ZWQuXG4iLA0KPiBfX2Z1bmNfXyk7DQo+IC0JCXJl
dHVybiAtRUlOVkFMOw0KPiAtCX0NCj4gKwlpZiAoaHdtZ3ItPmh3bWdyX2Z1bmMtPnNldF9tcDFf
c3RhdGUpDQo+ICsJCXJldHVybiBod21nci0+aHdtZ3JfZnVuYy0+c2V0X21wMV9zdGF0ZShod21n
ciwNCj4gbXAxX3N0YXRlKTsNCj4gDQo+IC0JcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5zZXRf
bXAxX3N0YXRlKGh3bWdyLCBtcDFfc3RhdGUpOw0KPiArCXJldHVybiAwOw0KPiAgfQ0KPiANCj4g
IHN0YXRpYyBpbnQgcHBfZHBtX3N3aXRjaF9wb3dlcl9wcm9maWxlKHZvaWQgKmhhbmRsZSwNCj4g
LS0NCj4gMi4yMC4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
