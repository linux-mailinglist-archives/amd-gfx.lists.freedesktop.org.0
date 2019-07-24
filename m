Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFCE7323E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B316E5C3;
	Wed, 24 Jul 2019 14:53:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4036E5C3
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnFnypAwsS6EAglXtnAQHR4t/UiH7n1khGexcJw8nsDi6MGRv+izr4bajnVWMQDpNhcJLArpah8Q1WWyHT7LWEvO6Sz7f9oHY0WrgLsHzboV22ulrVLlIS+a+7Aq49xQ77ETe32Ekm+7f7ZKQ0hLxVx7QRb2ZCL2kKCVypvER/bh36Ri5G84ts3tvnGC9EJHKhYa6Jg/99t3szL7AeaR6+2AWhkPM/lAW3aDqyOr2JaFym/NwowT1W8+V5zTzmwYNj7p0h/BStZjrPI5AXxuRN0QTjN0Y8RTKQkFzubdNAYlBklhThU1KDMXL676WkPuasPcJdpdwcJ5bDwAg9B/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlS1DFX4aShJ8ghXOpcw3Y6AX8yawC7TKk8hUnIov7Q=;
 b=I+S+8VSKTn9UUn+5uZj36Lk4LMx/rI59NGBk15kaf8D76a2tzV6mncU/YcguS5VyMoNYTYw4b8VvIz4ZxMlr76xk6VXUTz9q/2zdf4iQusHG7hIrzFJ48kyzJGVIDMarl/mYeFVB/kJnTOAs1bh0/IhPRphYwwMa0zb3UC6STVTywZi9ABV/YQd6D0lCikwFTbrsV8FepzJSSmNDdSx0NmK17hTBqjKz1Wox+dg2DvixHFJJKMYb9drRNJ7COxtq2p5QtOAo59s7ADrNfE6iPDMUvyiKnCOzFfwQ4Y3DsHTH6Ldi+mreT4qqRABE5H1HlpScTOMmsbS5hlPtf2cs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1342.namprd12.prod.outlook.com (10.169.204.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 14:53:00 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 14:52:59 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQimxqk1YeojMgkC1mpHwDMisxqbZ0tSAgAACGICAAAJrAIAAAoOAgAAAyIA=
Date: Wed, 24 Jul 2019 14:52:59 +0000
Message-ID: <5b2a81a4-8be1-0846-7f5b-ef9cfa934780@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
 <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
 <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
 <3d0c5357-52b9-80fb-61ff-363e13086aa8@daenzer.net>
In-Reply-To: <3d0c5357-52b9-80fb-61ff-363e13086aa8@daenzer.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4aa105fc-dfe0-4c05-456b-08d710469ed1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1342; 
x-ms-traffictypediagnostic: MWHPR12MB1342:
x-microsoft-antispam-prvs: <MWHPR12MB13421FB49FA25574CDCD964FEAC60@MWHPR12MB1342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(199004)(189003)(110136005)(54906003)(2906002)(36756003)(99286004)(316002)(2501003)(14454004)(71200400001)(8676002)(186003)(68736007)(71190400001)(3846002)(52116002)(7736002)(6116002)(31686004)(11346002)(476003)(305945005)(2616005)(446003)(6506007)(66066001)(386003)(66574012)(53546011)(76176011)(86362001)(6436002)(26005)(486006)(66446008)(66476007)(6486002)(25786009)(66556008)(6246003)(5660300002)(102836004)(66946007)(6512007)(8936002)(14444005)(256004)(53936002)(478600001)(81156014)(64756008)(4326008)(229853002)(31696002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1342;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0t2T9pCqT5y2xDo0N966CpPgy0rB+xmTNMG8h4Jgo9oX/8EjSic3GUF9zzNp6hqXNaGrUPo6ed56KPMIycd58eEpno0wefgnfaEuvscwep2nHN5dcBoif36JGFsjyldaSWQ6DX0sWC02RTFOQYeB2IOfpB3BO2OdOnXJ73LOIgLWVbhVcsY4LnSMdqLNWewiGRs/9xq7eGaRTWBoi56p5xTS/5sEcoZWJ9it2A47RMkXYhTFXOiE7tL594MAP5ChxC/tCTiiKRtlMD3E8r8IHQBHN20acCT+ST11AkDd0eXKymlF6+Vy/NdRr6H1aX856T1Q65jP/pTc5WIVtayhhJfJS+wudjXBg545J74Aq5mS+gswJ+LhgnoEa3epqeGizdaMT5ESTRlySZVhuO8pFhUOZpy2UdUsa5in6tXh1qs=
Content-ID: <9554994FBFC3C84F93D9A388BADB292E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa105fc-dfe0-4c05-456b-08d710469ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:52:59.6316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlS1DFX4aShJ8ghXOpcw3Y6AX8yawC7TKk8hUnIov7Q=;
 b=FNIsJKLQjftf/3e+Si7xdFyjidO5YzEV1LSWKco6onvBVF2n1gkfJYn9Q8h0nmAEMIsRFeXrC9A2TIApNq5N4gADcrIP3vTwWENx9mY5dxVjdgepYOGhdmQN8Cy86vLT47Qa5xwTbZQpIsC6TneVUGZGl8wKqDu4VkygN1ttHg4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzI0LzE5IDEwOjUwIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gT24gMjAxOS0w
Ny0yNCA0OjQxIHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjQuMDcuMTkg
dW0gMTY6MzIgc2NocmllYiBHcm9kem92c2t5LCBBbmRyZXk6DQo+Pj4gT24gNy8yNC8xOSAxMDoy
NSBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+Pj4+IEFtIDI0LjA3LjE5IHVtIDE2OjEw
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6DQo+Pj4+PiBGcm9tOiBTaGlyaXNoIFMgPHNoaXJp
c2guc0BhbWQuY29tPg0KPj4+Pj4NCj4+Pj4+IGVuYWJsZXMgZ3B1X3ZtX3N1cHBvcnQgaW4gZG0g
YW5kIGFkZHMNCj4+Pj4+IEFNREdQVV9HRU1fRE9NQUlOX0dUVCBhcyBzdXBwb3J0ZWQgZG9tYWlu
DQo+Pj4+Pg0KPj4+Pj4gdjI6DQo+Pj4+PiBNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFt
ZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zDQo+Pj4+Pg0KPj4+Pj4gdjM6DQo+Pj4+PiBV
c2UgYW1kZ3B1X2JvX3ZhbGlkYXRlX3Vzd2MgaW4gYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2Rv
bWFpbnMuDQo+Pj4+Pg0KPj4+Pj4gQ2hhbmdlLUlkOiBJZjM0MzAwYmVhYTYwYmUyZDM2MTcwYjdi
NWIwOTZlYzY0NDUwMmIyMA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNo
LnNAYW1kLmNvbT4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRy
ZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4+PiBBY3R1YWxseSB0aGF0IGRvZXNuJ3QgbG9vayBs
aWtlIGEgZ29vZCBpZGVhIHRvIG1lLg0KPj4+Pg0KPj4+PiBJdCBpcyBzdGlsbCBwZXJmZWN0bHkg
cG9zc2libGUgKGFuZCB3YW50ZWQhKSB0aGF0IHRoZSBVU1dDIGZsYWcgd2FzIG5vdA0KPj4+PiBz
ZXQgaW4gdGhlIGZpcnN0IHBsYWNlIGJ5IHVzZXJzcGFjZS4NCj4+Pj4NCj4+Pj4gSXMgdGhhdCBz
dGlsbCBjaGVja2VkIHNvbWV3aGVyZT8NCj4+Pj4NCj4+Pj4gUmVnYXJkcywNCj4+Pj4gQ2hyaXN0
aWFuLg0KPj4+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCBoZXJlLCBjYW4geW91IGVsYWJvcmF0ZSA/
DQo+PiBJdCdzIHN0aWxsIHBvc3NpYmxlIHRoYXQgdXNlcnNwYWNlIGRvZXNuJ3Qgc2V0IHRoZSBV
U1dDIGZsYWcgYW5kIHRoZXJlDQo+PiBhY3R1YWxseSBtaWdodCBiZSBnb29kIHJlYXNvbnMgZm9y
IHRoYXQuDQo+Pg0KPj4gRG8gd2Ugc3RpbGwgaGF2ZSBhIGNoZWNrIGZvciB0aGlzIGNhc2Ugc29t
ZXdoZXJlPw0KPiBJdCBzb3VuZHMgbGlrZSB5b3UncmUgbWlzdW5kZXJzdGFuZGluZyB3aGF0IHRo
aXMgcGF0Y2ggZG9lcywgcHJvYmFibHkNCj4gZHVlIHRvIHRoZSB3ZWlyZCBhbWRncHVfYm9fdmFs
aWRhdGVfdXN3YyBBUEkuDQo+IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zIGRvZXNu
J3Qgc2V0IHRoZSBmbGFnIGZvciB0aGUgQk8gaXRzZWxmLg0KPiBDaGFuZ2luZyB0aGUgaGVscGVy
IEFQSSB0byB3aGF0IHdlIHN1Z2dlc3RlZCBzaG91bGQgY2xlYXIgdGhpcyB1cC4NCj4NCj4gKE1h
eWJlIHRoZSBuZXcgaGVscGVyIGZ1bmN0aW9uIHNob3VsZCBiZSB1c2VkIGluDQo+IGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zIGluIHBhdGNoIDIgYWxyZWFkeSwgb3IgaW4geWV0IGFu
b3RoZXINCj4gc2VwYXJhdGUgcGF0Y2g/KQ0KDQoNClllYSwgYWdyZWUsIGxldCBtZSBzZW5kIHRo
ZSBWNCB3aXRoIGJvb2wgQVBJIHRvIG1ha2UgdGhpbmdzIGNsZWFyZXIgYW5kIA0KSSB3aWxsIGlu
ZGVlZCBzZXBhcmF0ZSB0aGlzIGNoYW5nZSBmcm9tIFMvRyBlbmFibGluZy4NCg0KQW5kcmV5DQoN
Cj4NCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
