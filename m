Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D9833DE
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 16:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5366E3A0;
	Tue,  6 Aug 2019 14:23:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740071.outbound.protection.outlook.com [40.107.74.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9766E3A8
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 14:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSyhM1+w8VH80zicAZzQFGfcEDR/ZufPeEFhKrytp9hVwRo3STyKasGkCGR9o6IRI5IlW3P2IS6cOaXuYqQ1zEt7tfcc/NcK76C8z5qNRgj79am1VRVNVtm8TdlBIxFTkCjqTkcYdSz4V78+Hrhb7YV589k6tBSJHp8kOK0CCWmWVV2B6aMfu6hIIXG93a18lWi9YQxngJh571jf3H9Mhbj+zwbZMRWlATM6aekSOE95ilCbeoi2KspIiIX8Z5kvoCy+T59kP02qlTpNhHNNGCyK7atVoolpaeHG0FlU8+83BNLY1ZPIt+yeEg7pMgYN7+4tJ0ysRtyyNZOimv+JWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQUUNvMTpdtW1WkUncg7Y4FA8FwMrVZJFdskZf3+JRo=;
 b=PMRLfF7/oMCDTWdF3wR82/m+AGU4HQcw5rxqloBQEOnEgCKPiK7UWspX2Wz1Utsh7wfmsKW51JuwlStYTepmnem3CfZXLu5mUBZEMvjXxO9vXO+gkVfJY3j83Kf98CAmMJeMHkAJpqhYxWwkJsxY/v4N6MgU5Hsw3ssWGj/n+/7j+bjkYATEvfNfXnKOrAyPaRCX71Y6Udp0t7yA1SbG4OWZ9hcfhCsClxPV1oLUb2urLqU2t4GOGl/u7VJkAhcEJfG4kydThvmxg5YiZIwndb0q+e5X3jR0dOqDMdPSJuzN9Eu/Mi/G26CF5PjvuD/ZO99GcZ2Rnq5wvHNtUa5nMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHSPR00MB2400.namprd12.prod.outlook.com (10.171.151.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 6 Aug 2019 14:23:53 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::9065:8869:9c1c:931d%12]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 14:23:53 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Do gpu reset if we lost some gpu reset
 requests
Thread-Topic: [PATCH] drm/amdgpu: Do gpu reset if we lost some gpu reset
 requests
Thread-Index: AdVLU1B4lySKF6XQSeqswDdT0DkxOABD0CAA
Date: Tue, 6 Aug 2019 14:23:53 +0000
Message-ID: <2c9e600b-50ea-a1ab-8aa7-4fe842e2f8f5@amd.com>
References: <SN6PR12MB2800A083F4DB990AF2EEBD2B87DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2800A083F4DB990AF2EEBD2B87DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90d496ce-7680-4546-a329-08d71a79b527
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHSPR00MB2400; 
x-ms-traffictypediagnostic: MWHSPR00MB2400:
x-microsoft-antispam-prvs: <MWHSPR00MB24003370407332AC1FA56839EAD50@MWHSPR00MB2400.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(199004)(189003)(8676002)(68736007)(81156014)(256004)(486006)(14444005)(476003)(2616005)(6436002)(11346002)(186003)(66476007)(66446008)(66556008)(305945005)(31686004)(102836004)(66946007)(36756003)(64756008)(446003)(6116002)(26005)(6486002)(3846002)(6512007)(4326008)(81166006)(7736002)(99286004)(31696002)(6246003)(86362001)(25786009)(76176011)(52116002)(2501003)(110136005)(71200400001)(71190400001)(66066001)(478600001)(316002)(8936002)(53936002)(14454004)(6506007)(229853002)(2906002)(53546011)(386003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHSPR00MB2400;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZKV2ikxKDy9naNiE3nur4PsVgeAK7SyOVPsakXELyq3G8MNzysW/IP+mAvcB9SwjlYQWfPz4UNQKwnmuvy8cn8x2mmxNpsfy0p9U4F3ZYqLu0t9BuYcaATsLdyWTnDakH7RVPxd4rYKbUt25nuGgxoIzoha0E7gEiVmBeczr60u+UrjT4ur15okd1TeFegsvt8A68JeP3/GO1giD+X5ilJFkxK4UxMQahhzSZgmtx6QefpRe4jYsD16Kf3sxr/fV404HgdC65H0TPg5CNBpAeKkk9qs3u/yxkTEjs8iQU6DrkK5Aodip922OS9iNIJGA0boJT59DBCmqs2QwLGTMymNPFM9s6TrCwqZDAaGaKuwEMu53w7lhRdRF/cAcE17zhjN/E+Jsc+FCJgX7W6jjCH5M2LnnV2RHPz5ubJ+2vx4=
Content-ID: <B95F182065FCC84EAAD60CF873671501@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d496ce-7680-4546-a329-08d71a79b527
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 14:23:53.0682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHSPR00MB2400
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQUUNvMTpdtW1WkUncg7Y4FA8FwMrVZJFdskZf3+JRo=;
 b=V43EogadO3kd17vLw1bAMMWrmfxorBMXBCUIjwZojppstUTdFZINpQ9lO826NPCKAtkPRlOPH6IhW1nogTgEq/ZP5NhJ6eS9Rm8gzluNQHdSRPdVMZaehNLoGD8PiCr7087Q1pZOEG8Y4fuwKVNaTTSvqSej8e1qyCp5pwPN8pc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC81LzE5IDI6MDIgQU0sIFBhbiwgWGluaHVpIHdyb3RlOg0KPiBBcyB0aGUgcmFjZSBvZiBn
cHUgcmVzZXQgd2l0aCByYXMgaW50ZXJydXB0cy4gd2UgbWlnaHQgbG9zZSBhIGNoYW5jZSB0bw0K
PiBkbyBncHUgcmVjb3ZlcnkuIFRvIGd1YXJhbnRlZSB0aGUgZ3B1IGhhcyByZWNvdmVyZWQgc3Vj
Y2Vzc2Z1bGx5LCB3ZSB1c2UNCj4gYXRvbWljIHRvIHNhdmUgdGhlIGNvdW50cyBvZiBncHUgcmVz
ZXQgcmVxdWVzdHMsIGFuZCBpc3N1ZSBhbm90aGVyIGdwdQ0KPiByZXNldCBpZiB0aGVyZSBhcmUg
YW55IHBlbmRpbmcgcmVxdWVzdHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhp
bmh1aS5wYW5AYW1kLmNvbT4NCg0KDQpIb3cgdGhpcyBwcm90ZWN0cyBhZ2FpbnN0IFJBUyB0cmln
Z2VyZWQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlciBiZWluZyANCmRyb3BwZWQgYmVjYXVzZSB0
aGVyZSB3YXMgYW5vdGhlciBub24gUkFTIHJlY292ZXIgR1BVIHJlc2V0IGluIHByb2dyZXNzIA0K
c3VjaCBhcyBkdWUgdG8gam9iIHRpbWVvdXQ/DQoNCkFuZCByZWl0ZXJhdGluZyBhIHF1ZXN0aW9u
IEkgYWxyZWFkeSBhc2tlZCBiZWZvcmUsIHdoeSBkbyB5b3UgaGF2ZSB0byANCmRvwqAgc2NoZWR1
bGVfd29yayBmb3IgR1BVIHJlc2V0cyBmcm9tIGFtZGdwdV9yYXNfcmVzZXRfZ3B1IHdoZW4geW91
IA0KYWxyZWFkeSBpbiBub24gaW50ZXJydXB0IGNvbnRleHQgZm9yIGFueSBvZiB0aGUgcmFzX2lo
X2lmLmNiIGhhbmRsZXJzLiBJIA0Kc2VlIHdoeSB5b3UgbmVlZCBpdCBpbiBhbWRncHVfcmFzX3Jl
c3VtZSBidXQgbm90IGZvciB0aGUgb3RoZXIgY2FsbCBzaXRlcy4NCg0KQW5kcmV5DQoNCg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAxMCArKysr
KysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwgIDIg
Ky0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggYTk2
YjBmMTdjNjE5Li5jMWY0NDRiNzRiMTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMNCj4gQEAgLTEyMjAsNyArMTIyMCwxNSBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfcmFzX2RvX3JlY292ZXJ5KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gICAJCWNvbnRh
aW5lcl9vZih3b3JrLCBzdHJ1Y3QgYW1kZ3B1X3JhcywgcmVjb3Zlcnlfd29yayk7DQo+ICAgDQo+
ICAgCWFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmFzLT5hZGV2LCAwKTsNCj4gLQlhdG9taWNf
c2V0KCZyYXMtPmluX3JlY292ZXJ5LCAwKTsNCj4gKwkvKiBpZiB0aGVyZSBpcyBubyBjb21wZXRp
dG9uLCBpbl9yZWNvdmVyeSBjaGFuZ2VzIGZyb20gMSB0byAwLg0KPiArCSAqIGlmIHJhc19yZXNl
dF9ncHUgaXMgY2FsbGVkIHdoaWxlIHdlIGFyZSBkb2luZyBncHUgcmVjdm9lcnksDQo+ICsJICog
YmFjYXVzZSBvZiB0aGUgYXRvbWljIHByb3RlY3Rpb24sIHdlIG1heSBsb3NlIHNvbWUgcmVjb3Zl
cnkNCj4gKwkgKiByZXF1ZXN0cy4NCj4gKwkgKiBTbyB3ZSB1c2UgYXRvbWljX3hjaGcgdG8gY2hl
Y2sgdGhlIGNvdW50IG9mIHJlcXVlc3RzLCBhbmQNCj4gKwkgKiBpc3N1ZSBhbm90aGVyIGdwdSBy
ZXNldCByZXF1ZXN0IHRvIHBlcmZvcm0gdGhlIGdwdSByZWNvdmVyeS4NCj4gKwkgKi8NCj4gKwlp
ZiAoYXRvbWljX3hjaGcoJnJhcy0+aW5fcmVjb3ZlcnksIDApID4gMSkNCj4gKwkJYW1kZ3B1X3Jh
c19yZXNldF9ncHUocmFzLT5hZGV2LCAwKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGludCBh
bWRncHVfcmFzX3JlbGVhc2VfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPiBpbmRleCAyNzY1ZjJkYmIxZTYu
LmJhNDIzYTRhMzAxMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaA0KPiBAQCAtNDk4LDcgKzQ5OCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9yYXNf
cmVzZXRfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgIHsNCj4gICAJc3RydWN0
IGFtZGdwdV9yYXMgKnJhcyA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7DQo+ICAgDQo+
IC0JaWYgKGF0b21pY19jbXB4Y2hnKCZyYXMtPmluX3JlY292ZXJ5LCAwLCAxKSA9PSAwKQ0KPiAr
CWlmIChhdG9taWNfaW5jX3JldHVybigmcmFzLT5pbl9yZWNvdmVyeSkgPT0gMSkNCj4gICAJCXNj
aGVkdWxlX3dvcmsoJnJhcy0+cmVjb3Zlcnlfd29yayk7DQo+ICAgCXJldHVybiAwOw0KPiAgIH0N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
