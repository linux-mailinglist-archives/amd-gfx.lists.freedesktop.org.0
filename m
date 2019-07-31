Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDE7B866
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 06:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAA06E66C;
	Wed, 31 Jul 2019 04:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720072.outbound.protection.outlook.com [40.107.72.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CCB6E66C
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 04:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNUnTz15tRKAwWTWqSWnVPM87luDNmQkl9XAV7jtKZ9M/+GworatlKfsJ4l0bZcMkOmhpttc1RWOjiFArcLteL6TMzr5TInniOAEOgNJVt2b2OyX1XdJ7faiy1aJiGMZlzzoyGMdG92qItr/SSQ6E13RWl7/jKp1gX7xI9bC9tuve2wY3snO4iUCxunx7fatoDkVsuisuJBfAokaNpaD1VICUln9v30AeI6q3iZEdzQdBdiN5LcZvwM74zpIP3j2Se4L/fIIfEtEBNz3L2p7/RgYHJE0kBOJM5c+njwHMFFnPmV6ReYNoxINDJtCV6rn+mly5LY7SErmGoyr5Hn1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWz1lsRAKDijW0OhmiPs1Id98D1mF1PQkdvsjY62HlA=;
 b=n7X948rXNv41jbkeSIiKEXFs+6FUUenXJndSihykOL200cGj9/mCxbmadcQYOMGCvJfuSoQsc/SAceNiMw4owCJEwfhp3ihkORTBMT+0ffDtpjJU40wusB02zer3ECasWKOPUg7ASeMtuvESEabyKgeJtQaS5WMwzHc+DAknVbYcfwcZbhkJM/Nwi6w8/vakqG+HOyY5I8oCDvjHy2PYHhc2/nX6jDVTnHuZSvDg5oW8dEJhMfFqwsiX+QCnLmExlnuoXW0r37tRnUbCso5rHGY3pibT246jcv1wOmMjd36SS5HWWtm3YC5+kQTl3Fb4FjuZGPaY1tA/I0wSmamE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3343.namprd12.prod.outlook.com (20.178.240.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 04:06:19 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 04:06:19 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: support power profile retrieval
 and setting on arcturus
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: support power profile retrieval
 and setting on arcturus
Thread-Index: AQHVR1Gtqof6oO1ZF06lJ/+llRaAKKbkG/EA
Date: Wed, 31 Jul 2019 04:06:19 +0000
Message-ID: <af318fde-dded-98d5-a60e-e84e4a4ae71a@amd.com>
References: <20190731033959.10414-1-evan.quan@amd.com>
In-Reply-To: <20190731033959.10414-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b31fb787-7539-4dbf-c9d4-08d7156c70cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3343; 
x-ms-traffictypediagnostic: MN2PR12MB3343:
x-microsoft-antispam-prvs: <MN2PR12MB3343B96C32F3BA90C7113DA9A2DF0@MN2PR12MB3343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(7736002)(66066001)(52116002)(476003)(6116002)(3846002)(478600001)(66946007)(25786009)(446003)(71200400001)(256004)(2616005)(99286004)(64756008)(66556008)(66446008)(8676002)(66476007)(81156014)(8936002)(6246003)(5660300002)(31696002)(305945005)(81166006)(71190400001)(186003)(11346002)(486006)(68736007)(110136005)(102836004)(26005)(6512007)(386003)(53936002)(316002)(14454004)(6506007)(53546011)(14444005)(36756003)(229853002)(6436002)(6486002)(76176011)(31686004)(2501003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3343;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QxJYUPKDgvZmFmYzJJEeoUCiXBLOEOLzzV35MO9PXyu6da5i+mRn0xSUrIwQbzRKZwWutSF1PH5NjDqKvk3ifHdTvnjQQz/srq0JPw6Ow/XIZ94SfiNj/SfKDCoWiC5QftUzab9Ch2wpL/91ef0vM6U76gKokzGrpDDtMIgt1L9up4GN9/HjqnANWUh6yWAEvdQK1+7JSnilnukiux1IhzB5sM2glt24C1kX4Z55s4STOM82LFAihSideOjFC8iEUN69Ny+cqNjTnkmckT0rCyARS9JTyCM9MpHfOwKo3wR4wbcR41wXdfyT3V8DAJjziqLwxpz/zhzOLxlACoHMEvu5sApF+0UJOTsIJOPSxLNnrtRlPmKXniQ5v7jR3SksbakrJ3im7o8rkClZs04i4/sLXeP0hWUsPGAi6LjetVs=
Content-ID: <2D8611AA1CDA37419371CC3E6490B68F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31fb787-7539-4dbf-c9d4-08d7156c70cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 04:06:19.2932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWz1lsRAKDijW0OhmiPs1Id98D1mF1PQkdvsjY62HlA=;
 b=kRyr+WiFODhpNthwGzAbdYxBLTGH5EqIUtOKwJYSjx963XDREVjGTXwiMvVy1GKzk5Tk3Fsiv9l+sK1cRM5AIq/NinPqfbP2CIi+ec+2I/fqh1dwcSc5ns52JYz40vvRCTzJbwbAL03/yJGPbMEJXExyew26l7gyg8yT6nvTKyk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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

DQpPbiA3LzMxLzE5IDExOjM5IEFNLCBFdmFuIFF1YW4gd3JvdGU6DQo+IEVuYWJsZSBhcmN0dXJ1
cyBwb3dlciBwcm9maWxlIHJldHJpZXZhbCBhbmQgc2V0dGluZy4NCj4NCj4gQ2hhbmdlLUlkOiBJ
ODU0NDdiYTljYTdkZThlMTk3ODQwZjc2Y2UzNzQ1MzYzYzQxMzNhNg0KPiBTaWduZWQtb2ZmLWJ5
OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDY5ICsrKysrKysrKysrKysrKysrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMNCj4gaW5kZXggYzNmOTQ4NzI3NmMw
Li40N2QwMTUwMzU5MDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FyY3R1cnVzX3BwdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jDQo+IEBAIC0xNTAzLDYgKzE1MDMsNzMgQEAgc3RhdGljIGludCBhcmN0
dXJ1c19nZXRfcG93ZXJfbGltaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQo+ICAgCXJldHVy
biAwOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgYXJjdHVydXNfZ2V0X3Bvd2VyX3Byb2Zp
bGVfbW9kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gKwkJCQkJICAgY2hhciAqYnVmKQ0K
PiArew0KPiArCXN0YXRpYyBjb25zdCBjaGFyICpwcm9maWxlX25hbWVbXSA9IHsNCj4gKwkJCQkJ
IkJPT1RVUF9ERUZBVUxUIiwNCj4gKwkJCQkJIjNEX0ZVTExfU0NSRUVOIiwNCj4gKwkJCQkJIlBP
V0VSX1NBVklORyIsDQo+ICsJCQkJCSJWSURFTyIsDQo+ICsJCQkJCSJWUiIsDQo+ICsJCQkJCSJD
T01QVVRFIiwNCj4gKwkJCQkJIkNVU1RPTSJ9Ow0KPiArCXVpbnQzMl90IGksIHNpemUgPSAwOw0K
PiArCWludDE2X3Qgd29ya2xvYWRfdHlwZSA9IDA7DQo+ICsNCj4gKwlpZiAoIXNtdS0+cG1fZW5h
YmxlZCB8fCAhYnVmKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWZvciAoaSA9IDA7
IGkgPD0gUFBfU01DX1BPV0VSX1BST0ZJTEVfQ1VTVE9NOyBpKyspIHsNCj4gKwkJLyoNCj4gKwkJ
ICogQ29udiBQUF9TTUNfUE9XRVJfUFJPRklMRSogdG8gV09SS0xPQURfUFBMSUJfKl9CSVQNCj4g
KwkJICogTm90IGFsbCBwcm9maWxlIG1vZGVzIGFyZSBzdXBwb3J0ZWQgb24gYXJjdHVydXMuDQo+
ICsJCSAqLw0KPiArCQl3b3JrbG9hZF90eXBlID0gc211X3dvcmtsb2FkX2dldF90eXBlKHNtdSwg
aSk7DQo+ICsJCWlmICh3b3JrbG9hZF90eXBlIDwgMCkNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+
ICsJCXNpemUgKz0gc3ByaW50ZihidWYgKyBzaXplLCAiJTJkICUxNHMlc1xuIiwNCj4gKwkJCWks
IHByb2ZpbGVfbmFtZVtpXSwgKGkgPT0gc211LT5wb3dlcl9wcm9maWxlX21vZGUpID8gIioiIDog
IiAiKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gc2l6ZTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IGludCBhcmN0dXJ1c19zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LA0KPiArCQkJCQkgICBsb25nICppbnB1dCwNCj4gKwkJCQkJICAgdWludDMyX3Qgc2l6ZSkN
Cj4gK3sNCj4gKwlpbnQgd29ya2xvYWRfdHlwZSA9IDA7DQo+ICsJdWludDMyX3QgcHJvZmlsZV9t
b2RlID0gaW5wdXRbc2l6ZV07DQo+ICsNCj4gKwlpZiAoIXNtdS0+cG1fZW5hYmxlZCkNCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlpZiAocHJvZmlsZV9tb2RlID4gUFBfU01DX1BPV0VS
X1BST0ZJTEVfQ1VTVE9NKSB7DQo+ICsJCXByX2VycigiSW52YWxpZCBwb3dlciBwcm9maWxlIG1v
ZGUgJWRcbiIsIHByb2ZpbGVfbW9kZSk7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4g
Kw0KPiArCS8qDQo+ICsJICogQ29udiBQUF9TTUNfUE9XRVJfUFJPRklMRSogdG8gV09SS0xPQURf
UFBMSUJfKl9CSVQNCj4gKwkgKiBOb3QgYWxsIHByb2ZpbGUgbW9kZXMgYXJlIHN1cHBvcnRlZCBv
biBhcmN0dXJ1cy4NCj4gKwkgKi8NCj4gKwl3b3JrbG9hZF90eXBlID0gc211X3dvcmtsb2FkX2dl
dF90eXBlKHNtdSwgcHJvZmlsZV9tb2RlKTsNCj4gKwlpZiAod29ya2xvYWRfdHlwZSA8IDApIHsN
Cj4gKwkJcHJfZXJyKCJVbnN1cHBvcnRlZCBwb3dlciBwcm9maWxlIG1vZGUgJWQgb24gYXJjdHVy
dXNcbiIsIHByb2ZpbGVfbW9kZSk7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0K
PiArCXNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsDQo+ICsJCQkJICAgIFNNVV9NU0df
U2V0V29ya2xvYWRNYXNrLA0KPiArCQkJCSAgICAxIDw8IHdvcmtsb2FkX3R5cGUpOw0KDQpba2V2
aW5dOg0KDQpwbGVhc2UgZCBjaGVjayByZXR1cm4gdmFsdWUsIGFmdGVyIHNlbmQgbWVzc2FnZSBz
dWNjZWVkLCB0aGVuIG1vZGlmeSANCnBvd2VyX3Byb2ZpbGVfbW9kZSB2YWx1ZS4NCg0KaWYgc2Vu
ZCBtZXNzYWdlIGZhaWxlZCwgeW91IGNhbid0IHVwZGF0ZSBwb3dlcl9wcm9maWxlX21vZGUgdmFs
dWUuDQoNCmFmdGVyIGZpeGVkOg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndh
bmdAYW1kLmNvbT4NCg0KPiArDQo+ICsJc211LT5wb3dlcl9wcm9maWxlX21vZGUgPSBwcm9maWxl
X21vZGU7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGFy
Y3R1cnVzX2R1bXBfcHB0YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCj4gICB7DQo+ICAg
CXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJs
ZTsNCj4gQEAgLTE5NjgsNiArMjAzNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9m
dW5jcyBhcmN0dXJ1c19wcHRfZnVuY3MgPSB7DQo+ICAgCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUg
PSBhcmN0dXJ1c19mb3JjZV9kcG1fbGltaXRfdmFsdWUsDQo+ICAgCS51bmZvcmNlX2RwbV9sZXZl
bHMgPSBhcmN0dXJ1c191bmZvcmNlX2RwbV9sZXZlbHMsDQo+ICAgCS5nZXRfcHJvZmlsaW5nX2Ns
a19tYXNrID0gYXJjdHVydXNfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzaywNCj4gKwkuZ2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZSA9IGFyY3R1cnVzX2dldF9wb3dlcl9wcm9maWxlX21vZGUsDQo+ICsJLnNl
dF9wb3dlcl9wcm9maWxlX21vZGUgPSBhcmN0dXJ1c19zZXRfcG93ZXJfcHJvZmlsZV9tb2RlLA0K
PiAgIAkvKiBkZWJ1ZyAoaW50ZXJuYWwgdXNlZCkgKi8NCj4gICAJLmR1bXBfcHB0YWJsZSA9IGFy
Y3R1cnVzX2R1bXBfcHB0YWJsZSwNCj4gICAJLmdldF9wb3dlcl9saW1pdCA9IGFyY3R1cnVzX2dl
dF9wb3dlcl9saW1pdCwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
