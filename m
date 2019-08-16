Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F790382
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 15:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E166E455;
	Fri, 16 Aug 2019 13:58:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800079.outbound.protection.outlook.com [40.107.80.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7D6E438
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 13:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb2DO14zHMv+ZbyFy2UenU8lrUMMo2Kmgqw4deDY1GgQyQtLDG7EN29XH8srqutJrJfMzOdjy2kXs1rdgLNtwJ7ZSfXtUjdgp1kMpb/qOMECbertRePVOIaslEmxHPPG2h1PfqQjjGxjIWsOxRLvvBnbwiMbNOweFMZ/iFZHD8ZM0x1FmJHs6X1pAiWfU7PPf+Ksq3e6H1bBa5dKkWBmbIRJoysjnak5akPeM+yweybCmVfyb2FlOsuKBNkdIvDKdwZWaHW967oiNsq84yLZ+RiCwceTQ2QT/2gvj/LR/+cCsm+AGlUeCwCs8ZjYQ2r+NpA5t2onLNRGLr53hBQrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kf6QEI8/fwg2zgqmP1tCKqedVM5mwnNGqdTDKoJ/9c=;
 b=laFxpQxRNIlK3PSB3KsVEu3ka5mQnay4ZvZgD5RRg1XuWSacjXPIhWPyj8yGBqUbGdyBBSOTbaQZDgBJYVawIw54AwIXfFKeySxrJ33/UHWbDpiGIf8W2cUBfceYfpd8i+j6OgiPG+9CcyokdFQQi2jkC3msWF1v5MGDb4D3romFrHlQsMpV2OQC5ty32MxuZIuh7kLaUfWb70U+Dr+PoGwplNG4wlpExTq8fKDcJJ05+I9BeR9Ho/FmbwEOgD0gC7zmYmHSZUkNp9ngh9PF8GGdh7oTJ/z5CYCkF9H0naOsVvHRg+bhIlA8yu3jxvZcJwtr17dsohJqAtGLHQTcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 13:58:18 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::889b:34f1:1aaa:1e67%7]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 13:58:18 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix dma_fence_wait without reference
Thread-Topic: [PATCH] drm/amdgpu: fix dma_fence_wait without reference
Thread-Index: AQHVVDWKd48i1hcnhkKNjn0AhUjtnab9zNsA
Date: Fri, 16 Aug 2019 13:58:18 +0000
Message-ID: <cd332e89-6764-dc58-ecc7-dfc058b7e213@amd.com>
References: <20190816132131.1951-1-christian.koenig@amd.com>
In-Reply-To: <20190816132131.1951-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 963db8ca-75c9-4897-fa94-08d72251caa0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2958; 
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-microsoft-antispam-prvs: <MN2PR12MB2958EA80D796CFB171B14583B4AF0@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(189003)(199004)(478600001)(11346002)(81166006)(476003)(2906002)(66556008)(486006)(7736002)(110136005)(66476007)(2501003)(66446008)(66946007)(53936002)(3846002)(256004)(14454004)(66066001)(14444005)(305945005)(2616005)(316002)(71200400001)(64756008)(71190400001)(6116002)(31686004)(446003)(386003)(186003)(229853002)(66574012)(6512007)(8936002)(52116002)(76176011)(6506007)(99286004)(5660300002)(25786009)(102836004)(6436002)(36756003)(6246003)(81156014)(31696002)(8676002)(26005)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2958;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JxEpwzC8tAHsU2ANRLgFaH7BKjFY3LD87AIvpescZIqlgAdCqhRHAxzXiPafvtdfGodJUV0OWAYI1rZT9QsXw64q5qq/hUa7/aMQwgJj/oYGZL8V97grbCPU4l4I9oz+OKDrp8z38Bs6TZl/4MLKORSA1t8NvLXPJGVQgrRI+lyppSzophRKUS+0+it/OOZE6RUHkPMKe+FPdIgonrH1/Rzxxl5SaIoR93EhQd1xQBSUAMbrm8RPSs6ZtVlm5ILRMgFKNjfQG1anVrMaKygenvqt2A0cvmXT12PPwbcDyBFitrqTXuN6uAYEfRA5Mq//UptuGr5PjKBxUHduMdwpsxMdrgYsy07UDbu9MQpDJKS3YiZHuIzdtnbJ1F8LLplfVDNw3CDNZBGJd6lRUFP3l0F5B+B61g+Y6Sn79GjUx9k=
x-ms-exchange-transport-forked: True
Content-ID: <E19CBBBB394F9B44A251F8FFB4541611@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963db8ca-75c9-4897-fa94-08d72251caa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 13:58:18.5536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bb6osEyZumBG6+XTRviNLcc8UsGiJji5HDo1qktJ+74QwDKo+5jG4Nf3btf929F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kf6QEI8/fwg2zgqmP1tCKqedVM5mwnNGqdTDKoJ/9c=;
 b=UIpGQ3DqymYSZeI/zbU/mhuwqs6/h3ijivecFncPKxAkHhUuBTxgcnvgGNhrN1htyGGTFaydo5FIwvFP154MVzFTGZgxojMBLddUo/aSpPtVRVwEXNeMePDpxt7+DOMamaJwxIaNNtw1/VP9FF/FbJ4x1WV9h2JAHViGi2LACME=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

UmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+DQoNCuWcqCAy
MDE5LzgvMTYgMjE6MjEsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOg0KPiBXZSBuZWVkIHRvIGdy
YWIgYSByZWZlcmVuY2UgdG8gdGhlIGZlbmNlIHdlIHdhaXQgZm9yLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyB8IDI3ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4
LmMNCj4gaW5kZXggZjUzOWEyYTkyNzc0Li43Mzk4YjQ4NTA2NDkgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMNCj4gQEAgLTUzNCwyMSArNTM0LDI0IEBAIGlu
dCBhbWRncHVfY3R4X3dhaXRfcHJldl9mZW5jZShzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4LA0KPiAg
IAkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQ0KPiAgIHsNCj4gICAJ
c3RydWN0IGFtZGdwdV9jdHhfZW50aXR5ICpjZW50aXR5ID0gdG9fYW1kZ3B1X2N0eF9lbnRpdHko
ZW50aXR5KTsNCj4gLQl1bnNpZ25lZCBpZHggPSBjZW50aXR5LT5zZXF1ZW5jZSAmIChhbWRncHVf
c2NoZWRfam9icyAtIDEpOw0KPiAtCXN0cnVjdCBkbWFfZmVuY2UgKm90aGVyID0gY2VudGl0eS0+
ZmVuY2VzW2lkeF07DQo+ICsJc3RydWN0IGRtYV9mZW5jZSAqb3RoZXI7DQo+ICsJdW5zaWduZWQg
aWR4Ow0KPiArCWxvbmcgcjsNCj4gICANCj4gLQlpZiAob3RoZXIpIHsNCj4gLQkJc2lnbmVkIGxv
bmcgcjsNCj4gLQkJciA9IGRtYV9mZW5jZV93YWl0KG90aGVyLCB0cnVlKTsNCj4gLQkJaWYgKHIg
PCAwKSB7DQo+IC0JCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpDQo+IC0JCQkJRFJNX0VSUk9SKCJF
cnJvciAoJWxkKSB3YWl0aW5nIGZvciBmZW5jZSFcbiIsIHIpOw0KPiArCXNwaW5fbG9jaygmY3R4
LT5yaW5nX2xvY2spOw0KPiArCWlkeCA9IGNlbnRpdHktPnNlcXVlbmNlICYgKGFtZGdwdV9zY2hl
ZF9qb2JzIC0gMSk7DQo+ICsJb3RoZXIgPSBkbWFfZmVuY2VfZ2V0KGNlbnRpdHktPmZlbmNlc1tp
ZHhdKTsNCj4gKwlzcGluX3VubG9jaygmY3R4LT5yaW5nX2xvY2spOw0KPiAgIA0KPiAtCQkJcmV0
dXJuIHI7DQo+IC0JCX0NCj4gLQl9DQo+ICsJaWYgKCFvdGhlcikNCj4gKwkJcmV0dXJuIDA7DQo+
ICAgDQo+IC0JcmV0dXJuIDA7DQo+ICsJciA9IGRtYV9mZW5jZV93YWl0KG90aGVyLCB0cnVlKTsN
Cj4gKwlpZiAociA8IDAgJiYgciAhPSAtRVJFU1RBUlRTWVMpDQo+ICsJCURSTV9FUlJPUigiRXJy
b3IgKCVsZCkgd2FpdGluZyBmb3IgZmVuY2UhXG4iLCByKTsNCj4gKw0KPiArCWRtYV9mZW5jZV9w
dXQob3RoZXIpOw0KPiArCXJldHVybiByOw0KPiAgIH0NCj4gICANCj4gICB2b2lkIGFtZGdwdV9j
dHhfbWdyX2luaXQoc3RydWN0IGFtZGdwdV9jdHhfbWdyICptZ3IpDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
