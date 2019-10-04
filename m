Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F71CC687
	for <lists+amd-gfx@lfdr.de>; Sat,  5 Oct 2019 01:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61076EC36;
	Fri,  4 Oct 2019 23:29:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C046EC36
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 23:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG4FbKKpDr9BTniTy8m5oVHJ4bRKqc8t4A1WlZyIfT9JboRvuuai/YJHkhklULiZy1hUG4062GzG0UIFiZJJOmBHKFY2Db8wORIv82tUXp7uCiLq6VNNHuOzfIeYJNVoMmjQWfDtAB0fOL7hYobkusKVPJ8WdN7jOl0m2pGSanZbv5fFzKllwlHtsRz6lf4NPAOhEsp8tdNJTShgsuwAVpMxh5duboS2hcsj6gjiHcMFlT6BgdNi1uFDV0bnDrmGmOEebk0FJKzpDj5BBcTlaEYJ6HW2x6NfknH3JmYfO89dfbsWE2woeRA6AouFV9fAVQWkOrx5nQV9S1W1RagM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeLHZ4QFAInENXt/LEgrZwCF9+y1T9XCUGeqd3pmCHU=;
 b=X1hI7/reTHzX51UgYNwVlDVHdLVUsz81B4ElhTwaPv5y3qHFSUOlyZaSb60bfyKxPkoH0AuLT+Tc9X5RjnZC7onXyS86NrK4ssqg4hKNWnOwryw/SGftAGafZg2Nyrrj53HroNUObvrpuMulEars2mdcyGXrkBQ9FNBpAJ/Tcjnjz2+H+OyH42V4e9P/kIH1BLpg6VMqogzu/s5fMU7kAZMNOYEN4GnKELGWar2f5UuSLcjTco0LO2hMaU8CfPb1iscxpl411Yy90jHw1OJ+nEHA3eG80j2LZ72xwJQ/Fc2I6ZLabh/VuWNT41TiuxYDUByBZ9xnpOnUKEpfSrwwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (20.180.6.72) by
 CH2PR12MB4056.namprd12.prod.outlook.com (20.180.5.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 4 Oct 2019 23:29:30 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::a426:f52a:fb94:e138%2]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 23:29:30 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Use the ALIGN() macro
Thread-Topic: [PATCH] drm/amdgpu: Use the ALIGN() macro
Thread-Index: AQHVekPDqEe14BkCoUKlLFla0wlkfadKEqUAgAEP9oA=
Date: Fri, 4 Oct 2019 23:29:30 +0000
Message-ID: <911f3f03-3484-f03f-ee89-c6ad6e9ff68f@amd.com>
References: <20191003233902.1982-1-luben.tuikov@amd.com>
 <f4f4bdef-577a-7402-e467-7003be73687a@gmail.com>
In-Reply-To: <f4f4bdef-577a-7402-e467-7003be73687a@gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::16) To CH2PR12MB4152.namprd12.prod.outlook.com
 (2603:10b6:610:a7::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24607937-3e17-4bcd-ff7a-08d74922b45d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4056:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB405637970D81974D0448C521999E0@CH2PR12MB4056.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(199004)(189003)(66446008)(66946007)(316002)(478600001)(6246003)(256004)(229853002)(64756008)(66556008)(31696002)(86362001)(66066001)(6486002)(6436002)(66476007)(2906002)(81156014)(14454004)(71200400001)(71190400001)(6512007)(31686004)(8676002)(36756003)(81166006)(110136005)(476003)(386003)(186003)(6506007)(11346002)(446003)(4326008)(26005)(25786009)(53546011)(2616005)(3846002)(102836004)(99286004)(2501003)(486006)(76176011)(52116002)(305945005)(5660300002)(6116002)(7736002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4056;
 H:CH2PR12MB4152.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oEam6jEeWjzdxUiD6xM9sStVPZIPtqIBLmVDisRhwZRoD804Qe+yj2hCzDOY0G/Te+cpKAKnYNJ45ysNyym9a19fAm5qgIiyXLc6c5L/YcQMTJMXhEPoQjsPtdiqd3HZwmCVMto5Bo2M0dCrx8LaEj3ncoWdMfXH6m24JUMgIYuJqYyqSqwG6TJsjX6t4WIEgKKPyyvqYUIEJNnTjKbs9kxdcmQpRaAKPZSHLYo4Yf6eSnRQ6uBJO0zZtATjnQEhC2zmmC2ZTlc9cx0P9mtKpZijhCSImdz8muldKLnyhKIunuPv2emGufb6gr+eu7yLRKbNgWQ6Y69YiM9bKyHXB+uHayJXMHM5Uef1iPL8BPcrK9aqe4Lz7x99KG72IW68faws3Fqi2BDjOqHvJ+WZWqjhgXGkgU/kO1kMUxW5lNs=
Content-ID: <019BAC4F2451134B876939C46DADDB4E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24607937-3e17-4bcd-ff7a-08d74922b45d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 23:29:30.2881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYK0XxmybGwjsNdxJtphfPyhyZ4eiGTBggViSxV7S57tGKYh04I0r1/a5kPnepjR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeLHZ4QFAInENXt/LEgrZwCF9+y1T9XCUGeqd3pmCHU=;
 b=cKxWelwWMGBsO+9vmj1AnANZgnwIkqRD+mCK5WcBke7b4jSuUiv6nyaEYRR1ewjR5NXqJqz6Sqcb4AbVk3ZPcnZVh+QURHM/CMYVpZFI4u24W8ADzOKtDGaDmD92x+mNl9MmM7+uXNoeNTBb8nehb/3ovIgM5DRmPlEwzp7HdJw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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

T24gMjAxOS0xMC0wNCAzOjE2IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDA0
LjEwLjE5IHVtIDAxOjM5IHNjaHJpZWIgVHVpa292LCBMdWJlbjoNCj4+IFVzZSB0aGUgQUxJR04o
KSBtYWNybyB0byBzZXQgIm51bV9kdyIgdG8gYQ0KPj4gbXVsdGlwbGUgb2YgOCwgaS5lLiBsb3dl
ciAzIGJpdHMgY2xlYXJlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1
YmVuLnR1aWtvdkBhbWQuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KSGkgQ2hyaXN0aWFuLA0KDQpObyBBQ0s/DQoN
CkkndmUgYmVlbiBydW5uaW5nIHRoaXMgdmVyc2lvbiBvZiB0aGUgZHJpdmVyIGFuZCBubyBwcm9i
bGVtcy4NCg0KUmVnYXJkcywNCkx1YmVuDQoNCj4gDQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTEgKystLS0tLS0tLS0NCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+PiBpbmRleCA2OGM1NDFlMTExODkuLjcz
YzYyOGJjNmE1YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jDQo+PiBAQCAtMTkyMywxMCArMTkyMyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X21hcF9idWZm
ZXIoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+ICAgCSphZGRyICs9ICh1NjQpd2lu
ZG93ICogQU1ER1BVX0dUVF9NQVhfVFJBTlNGRVJfU0laRSAqDQo+PiAgIAkJQU1ER1BVX0dQVV9Q
QUdFX1NJWkU7DQo+PiAgIA0KPj4gLQludW1fZHcgPSBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+
Y29weV9udW1fZHc7DQo+PiAtCXdoaWxlIChudW1fZHcgJiAweDcpDQo+PiAtCQludW1fZHcrKzsN
Cj4+IC0NCj4+ICsJbnVtX2R3ID0gQUxJR04oYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlf
bnVtX2R3LCA4KTsNCj4+ICAgCW51bV9ieXRlcyA9IG51bV9wYWdlcyAqIDg7DQo+PiAgIA0KPj4g
ICAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihhZGV2LCBudW1fZHcgKiA0ICsgbnVtX2J5
dGVzLCAmam9iKTsNCj4+IEBAIC0xOTg2LDExICsxOTgzLDcgQEAgaW50IGFtZGdwdV9jb3B5X2J1
ZmZlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQ2NF90IHNyY19vZmZzZXQsDQo+PiAg
IA0KPj4gICAJbWF4X2J5dGVzID0gYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmNvcHlfbWF4X2J5
dGVzOw0KPj4gICAJbnVtX2xvb3BzID0gRElWX1JPVU5EX1VQKGJ5dGVfY291bnQsIG1heF9ieXRl
cyk7DQo+PiAtCW51bV9kdyA9IG51bV9sb29wcyAqIGFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzLT5j
b3B5X251bV9kdzsNCj4+IC0NCj4+IC0JLyogZm9yIElCIHBhZGRpbmcgKi8NCj4+IC0Jd2hpbGUg
KG51bV9kdyAmIDB4NykNCj4+IC0JCW51bV9kdysrOw0KPj4gKwludW1fZHcgPSBBTElHTihudW1f
bG9vcHMgKiBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jcy0+Y29weV9udW1fZHcsIDgpOw0KPj4gICAN
Cj4+ICAgCXIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIoYWRldiwgbnVtX2R3ICogNCwgJmpv
Yik7DQo+PiAgIAlpZiAocikNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
