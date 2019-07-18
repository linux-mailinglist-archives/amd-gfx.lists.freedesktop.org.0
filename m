Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A036C4C2
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 03:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EEE6E2E4;
	Thu, 18 Jul 2019 01:59:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680079.outbound.protection.outlook.com [40.107.68.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEFF6E2E3
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 01:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvTC8d9LxrUpkmszqIKqBprmR/oBdBVcLcxYuN2ByOrVDlDIDg9cY/k9Tc7NAU3I2WB15Rq0UiF9Q6FrYUJfNAkdlcmYcflrvcaPaNB+B6j/H/lbq3H73e2PhOcF1GcAQ8OzYK/+neW5r8i5mlT6KrTFbHJz6WbYRxjB+1BHtWuGBWliS2I1VOS5yX85lefrKtbcCW8+7/CJ78pI/ce9U9l1Dt/lnWDaC1AkoSAHZfALhnpVoZiPLkxEYIhtIezdc2WdaByxz2v99C1oADJ5Q7tJ4VjStocKqnpfI9Tn66B/UQVM455AOQIYA0OjofT5W3wWpXC6VVSjRHiLnvB3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqJWi6MvsWbIrJup7tUMXyvlrmhR3iUBa+feGaSJsaY=;
 b=G0mvTQ5Jj9MaGNnMsEF9hz4uggHpQ7XA0Y6tWm+M+TNng82SVwGUPzJWjEy2ol0iz4c46is7sgZLQDBGHIV3uvW8aod6v/LGJJD4idTuxhDYHtaFpJCiTD0Q7K7IOOL7bJ1bbQjeUy+0NuJrasNIUFsz5D5x6vBa0B6D6i2oQTIlP4xOuOWNzYGfVygSKYYDP0xIjCMaI+eGqds3GSqXsAKdvnkCgunJ5LB4Zkaqzy9WbSX1PPYdcD6Iy7JxrCYuGECw7dbriBuh9Ou9+U1jr5oxUkOMfwbgBW+uw2eWnvlxC3ZrAvf9CJzZM86tdN1DzzsJCMOvcII0/LebUlllpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3407.namprd12.prod.outlook.com (20.178.241.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 01:59:31 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 01:59:31 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/pm: remove check for pp funcs in freq sysfs
 handlers
Thread-Topic: [PATCH] drm/amdgpu/pm: remove check for pp funcs in freq sysfs
 handlers
Thread-Index: AQHVPMuna+Hvwqq4hUWzUxni6farHabPnzXg
Date: Thu, 18 Jul 2019 01:59:31 +0000
Message-ID: <MN2PR12MB33442668FD634813753F0491E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190717181527.6492-1-alexander.deucher@amd.com>
In-Reply-To: <20190717181527.6492-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cad1cc2d-ff22-4abe-3737-08d70b239348
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3407; 
x-ms-traffictypediagnostic: MN2PR12MB3407:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3407529FB160205260886A73E4C80@MN2PR12MB3407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(199004)(189003)(13464003)(74316002)(9686003)(7736002)(6246003)(486006)(53936002)(476003)(11346002)(229853002)(68736007)(446003)(478600001)(256004)(81156014)(5660300002)(66556008)(66476007)(76116006)(81166006)(52536014)(66946007)(66446008)(305945005)(8936002)(64756008)(2501003)(8676002)(86362001)(4326008)(99286004)(55016002)(6306002)(110136005)(6506007)(316002)(76176011)(7696005)(25786009)(26005)(53546011)(33656002)(71200400001)(2906002)(6116002)(3846002)(186003)(14454004)(966005)(6436002)(66066001)(71190400001)(102836004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3407;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zrw4U00sh5MaGRztjkjYvvKNIl0QhB1vMLo+cUGqAjpSD66XlhomF60iMWBkuxPIR9h1Aw6aguWpc/VLLNo83cW0jOGj2VOEgO8fTXbyPhh3SFklwonje0hhsXaV4keto5lW+7tz0FCy0lKAyVR7pSxHD06PG94e/awDtbbTNY0s0mp/GywDON9YIQhtHkkroVAHPtFIn/LhL600+QEyiMQNyyB6S2jCBOZOtBXmA2bF0sFEaEKRLRg42aapHjw2biGUzElwnQtTNlktMko6mRpflM3mq6JQR/xr1ko48hRtebdkbIQbSkFTfr1z9nVkZ/p3k4iEWzMx0WBnhcwrAqtM1sfYSrkFlJ6OuwcpmbuqBXafJ/7J70zhzUAYt+NP+ZH1nMJJ17bkrX61EaEDEBVXmK9eMWT3tgUwMW58Swc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1cc2d-ff22-4abe-3737-08d70b239348
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 01:59:31.7489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3407
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqJWi6MvsWbIrJup7tUMXyvlrmhR3iUBa+feGaSJsaY=;
 b=L2bLz88rGDRG9tGopPqDmV20toh9RfbCQB4tr2ezQfnPGFTy2rDlWLnQgtRMo+bzAmIQqZcVO5l1EGuTq7VGvImGNfWgfCcGBzuOSnZ6ex64KptwrbjH+uTp5N7MKGIwX6y0cgdUUxSIe7hFqRTms2Km5fWId87rJSv30vwe6EA=
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
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBU
aHVyc2RheSwgSnVseSAxOCwgMjAxOSAyOjE1IEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvcG06IHJlbW92ZSBjaGVjayBm
b3IgcHAgZnVuY3MgaW4gZnJlcSBzeXNmcw0KPiBoYW5kbGVycw0KPiANCj4gVGhlIGRwbSBzZW5z
b3IgZnVuY3Rpb24gYWxyZWFkeSBkb2VzIHRoaXMgZm9yIHVzLiAgVGhpcyBmaXhlcyB0aGUgZnJl
cSpfaW5wdXQNCj4gZmlsZXMgd2l0aCB0aGUgbmV3IFNNVSBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDEwIC0t
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IGluZGV4IDM5N2FmOTA5NGEzOS4u
OGI3ZWZkMGE3MDI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0u
Yw0KPiBAQCAtMjA3NywxMSArMjA3Nyw2IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9od21vbl9z
aG93X3NjbGsoc3RydWN0DQo+IGRldmljZSAqZGV2LA0KPiAgCSAgICAgKGRkZXYtPnN3aXRjaF9w
b3dlcl9zdGF0ZSAhPSBEUk1fU1dJVENIX1BPV0VSX09OKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7
DQo+IA0KPiAtCS8qIHNhbml0eSBjaGVjayBQUCBpcyBlbmFibGVkICovDQo+IC0JaWYgKCEoYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmDQo+IC0JICAgICAgYWRldi0+cG93ZXJwbGF5LnBwX2Z1
bmNzLT5yZWFkX3NlbnNvcikpDQo+IC0JICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gIAkv
KiBnZXQgdGhlIHNjbGsgKi8NCj4gIAlyID0gYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LA0K
PiBBTURHUFVfUFBfU0VOU09SX0dGWF9TQ0xLLA0KPiAgCQkJCSAgICh2b2lkICopJnNjbGssICZz
aXplKTsNCj4gQEAgLTIxMTIsMTEgKzIxMDcsNiBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfaHdt
b25fc2hvd19tY2xrKHN0cnVjdA0KPiBkZXZpY2UgKmRldiwNCj4gIAkgICAgIChkZGV2LT5zd2l0
Y2hfcG93ZXJfc3RhdGUgIT0gRFJNX1NXSVRDSF9QT1dFUl9PTikpDQo+ICAJCXJldHVybiAtRUlO
VkFMOw0KPiANCj4gLQkvKiBzYW5pdHkgY2hlY2sgUFAgaXMgZW5hYmxlZCAqLw0KPiAtCWlmICgh
KGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyAmJg0KPiAtCSAgICAgIGFkZXYtPnBvd2VycGxheS5w
cF9mdW5jcy0+cmVhZF9zZW5zb3IpKQ0KPiAtCSAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAtDQo+
ICAJLyogZ2V0IHRoZSBzY2xrICovDQo+ICAJciA9IGFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRl
diwNCj4gQU1ER1BVX1BQX1NFTlNPUl9HRlhfTUNMSywNCj4gIAkJCQkgICAodm9pZCAqKSZtY2xr
LCAmc2l6ZSk7DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
