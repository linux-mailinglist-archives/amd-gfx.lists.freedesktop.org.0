Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5E7D365
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 04:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1B96E330;
	Thu,  1 Aug 2019 02:43:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700065.outbound.protection.outlook.com [40.107.70.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3296E330
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 02:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMx6T1GNjs9Y8rgfn6MsJ2zDwXoWqasbbPLZ5s+xoGlw7Wbh5mDSIsQUIkR8oWVdn1a0O0A8bWIxIGEujxVBm/4Dn8X6LA+iZcKkwE9kcirBZqfcbRjk6zwacXkLjuVQKLqVSZAO4qEtyMWOTnoYhd/hybM5vyeYcPHJlN77zbpER2RGODRsEtb5jGAd2ZX61eeIQKKlS69F0dAD3Ng/QjjPkRgmLxNzAHMUXDcl0BIgx8Trxk508mV+cDQjCHX4YSa4GgfMA9f76C+l//RTkeifNsI/brzmtYBE63LMCJaPwcVp5bdQ8tUWQlBOYgk7295OGfIh8Oc5PzcmnuPU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mBk2LCZLswW3PUai4Ou/ac9O/cpG0zoeHegLo/jgI=;
 b=kv6il64/UOseFxmyruiJ5nSu6W7NxI5sgF759uGkRvieE7u7NJD+CqMe8sAAkdwhcx162ib2QzWO3DSv67yjE9xnstEgIHLoOpHcCZntVO2gjbt/cmAZcvkMGkUAA5r/JWjNY9AHEhkaqC9qEx5uTGOk+hBj8AiZd7bBgfhGCnZ5ewI0zpDvL2cI5Sk9krVdyuASOeEYSWqjODj5VGzXSGmAitn2A1tqobxB2zFzHWYAX4LQasJ448b/exgfROZ7hX4ooQmPAOyyXpDSMuwehp4EZhbh9vkAq5e0JrHYhjloZZYJeO+uEYMXCrNTFjeDnpdp0VBpI1h2TNWyz0UnSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4208.namprd12.prod.outlook.com (10.255.224.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 02:43:55 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::b821:71b7:13f7:1a3c]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::b821:71b7:13f7:1a3c%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 02:43:54 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: sort feature status index by asic
 feature id for smu
Thread-Topic: [PATCH] drm/amd/powerplay: sort feature status index by asic
 feature id for smu
Thread-Index: AQHVR3S9HSKUfYSP8k2n/AI0gRxY4qbllviA
Date: Thu, 1 Aug 2019 02:43:54 +0000
Message-ID: <2ad27a68-2b1c-ad70-d1e7-330e6f3c2496@amd.com>
References: <20190731075035.32068-1-kevin1.wang@amd.com>
In-Reply-To: <20190731075035.32068-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0161.apcprd02.prod.outlook.com
 (2603:1096:201:1f::21) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8eabb6c-1b29-47a6-3faa-08d7162a17f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4208; 
x-ms-traffictypediagnostic: MN2PR12MB4208:
x-microsoft-antispam-prvs: <MN2PR12MB4208174427D41AE7C2630641A2DE0@MN2PR12MB4208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(7736002)(305945005)(6486002)(54906003)(110136005)(6436002)(2501003)(14454004)(81156014)(316002)(8676002)(31686004)(229853002)(71190400001)(14444005)(3846002)(68736007)(6116002)(71200400001)(2906002)(256004)(5660300002)(26005)(66066001)(25786009)(8936002)(66446008)(64756008)(66556008)(66476007)(66946007)(31696002)(102836004)(53546011)(6506007)(386003)(76176011)(478600001)(6246003)(446003)(81166006)(6512007)(36756003)(53936002)(476003)(99286004)(2616005)(11346002)(486006)(52116002)(186003)(4326008)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4208;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bLdl88lUVf/j8IENPgXFeOJh0KQWtp7CwAwqqJhOZVdssLGs+CM3PGcBv4YwpFIGYHbKhwjYO66R6nSgAe0XiKxm17AcvoJu4OXvNguc4Gv4GLdgnOC9I+cA7MQZc29nf2lzVpWZRSB/aLzSteT3mr1oLyQnPjmdbsREpl2Etxne1Kg12nPKd+fDfr+pQXaaGIW4997zoijWiODWuosh1e+ejWAdXIekjEewZ0mVso4+sxKdkMLh9BnC8LIP7vL3ixng4KmymELz6lWaVAgVQT6oamPVAxGA6yoNBZlKfnnBxQOLcEsYqy2OvKtzVHUDyH0oZp1ps8twJ90QH9mH7low64O3APws7c6njtEzjU+G5snEhDHdecizaRJJACzziT4xqg9rYcGE4E3qmGMNitHVjXb73CvcQOBdbKBoCEU=
Content-ID: <4A5539DF2EE7D94E83376027B4C11EE2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8eabb6c-1b29-47a6-3faa-08d7162a17f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 02:43:54.8289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2mBk2LCZLswW3PUai4Ou/ac9O/cpG0zoeHegLo/jgI=;
 b=fb7V211F2I1owfpOws7SJ4AscJFKtYUy3e3RYkPBn9f/Jkbit0qc0gEIkffJK4ptgnJxtbVpmPiX9u6Ks13Wc4bSpsHmdXNSlTMWFkg02rsBXeGk6AR4795NNKq30pI5H5ZsJpa2oAtElSNsiod34+X7OnzdoYGo80S80x9+f2k=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGluZy4uLg0KDQpwbGVhc2UgaGVscCBtZSByZXZpZXcgaXQgLCB0aGFua3MuDQoNCkJSDQpLZXZp
bg0KDQpPbiA3LzMxLzE5IDM6NTEgUE0sIFdhbmcsIEtldmluKFlhbmcpIHdyb3RlOg0KPiBiZWZv
cmUgdGhpcyBjaGFuZ2UsIHRoZSBwcF9mZWF0dXJlIHN5c2ZzIHNob3cgZmVhdHVyZSBlbmFibGUg
c3RhdGUgYnkNCj4gbG9naWMgZmVhdHVyZSBpZCwgaXQgaXMgbm90IGVhc3kgdG8gcmVhZC4NCj4g
dGhpcyBjaGFuZ2Ugd2lsbCBzb3J0IHBwX2ZlYXR1cmVzIHNob3cgaW5kZXggYnkgYXNpYyBmZWF0
dXJlIGlkLg0KPg0KPiBiZWZvcmU6DQo+IGZlYXR1cmVzIGhpZ2g6IDB4MDAwMDA2MjMgbG93OiAw
eGIzY2RhZmZiDQo+IDAwLiBEUE1fUFJFRkVUQ0hFUiAgICAgICAoIDApIDogZW5hYmVsZA0KPiAw
MS4gRFBNX0dGWENMSyAgICAgICAgICAgKCAxKSA6IGVuYWJlbGQNCj4gMDIuIERQTV9VQ0xLICAg
ICAgICAgICAgICggMykgOiBlbmFiZWxkDQo+IDAzLiBEUE1fU09DQ0xLICAgICAgICAgICAoIDQp
IDogZW5hYmVsZA0KPiAwNC4gRFBNX01QMENMSyAgICAgICAgICAgKCA1KSA6IGVuYWJlbGQNCj4g
MDUuIERQTV9MSU5LICAgICAgICAgICAgICggNikgOiBlbmFiZWxkDQo+IDA2LiBEUE1fRENFRkNM
SyAgICAgICAgICAoIDcpIDogZW5hYmVsZA0KPiAwNy4gRFNfR0ZYQ0xLICAgICAgICAgICAgKDEw
KSA6IGVuYWJlbGQNCj4gMDguIERTX1NPQ0NMSyAgICAgICAgICAgICgxMSkgOiBlbmFiZWxkDQo+
IDA5LiBEU19MQ0xLICAgICAgICAgICAgICAoMTIpIDogZGlzYWJsZWQNCj4gMTAuIFBQVCAgICAg
ICAgICAgICAgICAgICgyMykgOiBlbmFiZWxkDQo+IDExLiBUREMgICAgICAgICAgICAgICAgICAo
MjQpIDogZW5hYmVsZA0KPiAxMi4gVEhFUk1BTCAgICAgICAgICAgICAgKDMzKSA6IGVuYWJlbGQN
Cj4gMTMuIFJNICAgICAgICAgICAgICAgICAgICgzNSkgOiBkaXNhYmxlZA0KPiAuLi4uLi4NCj4N
Cj4gYWZ0ZXI6DQo+IGZlYXR1cmVzIGhpZ2g6IDB4MDAwMDA2MjMgbG93OiAweGIzY2RhZmZiDQo+
IDAwLiBEUE1fUFJFRkVUQ0hFUiAgICAgICAoIDApIDogZW5hYmVsZA0KPiAwMS4gRFBNX0dGWENM
SyAgICAgICAgICAgKCAxKSA6IGVuYWJlbGQNCj4gMDIuIERQTV9HRlhfUEFDRSAgICAgICAgICgg
MikgOiBkaXNhYmxlZA0KPiAwMy4gRFBNX1VDTEsgICAgICAgICAgICAgKCAzKSA6IGVuYWJlbGQN
Cj4gMDQuIERQTV9TT0NDTEsgICAgICAgICAgICggNCkgOiBlbmFiZWxkDQo+IDA1LiBEUE1fTVAw
Q0xLICAgICAgICAgICAoIDUpIDogZW5hYmVsZA0KPiAwNi4gRFBNX0xJTksgICAgICAgICAgICAg
KCA2KSA6IGVuYWJlbGQNCj4gMDcuIERQTV9EQ0VGQ0xLICAgICAgICAgICggNykgOiBlbmFiZWxk
DQo+IDA4LiBNRU1fVkREQ0lfU0NBTElORyAgICAoIDgpIDogZW5hYmVsZA0KPiAwOS4gTUVNX01W
RERfU0NBTElORyAgICAgKCA5KSA6IGVuYWJlbGQNCj4gMTAuIERTX0dGWENMSyAgICAgICAgICAg
ICgxMCkgOiBlbmFiZWxkDQo+IDExLiBEU19TT0NDTEsgICAgICAgICAgICAoMTEpIDogZW5hYmVs
ZA0KPiAxMi4gRFNfTENMSyAgICAgICAgICAgICAgKDEyKSA6IGRpc2FibGVkDQo+IDEzLiBEU19E
Q0VGQ0xLICAgICAgICAgICAoMTMpIDogZW5hYmVsZA0KPiAuLi4uLi4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMTQgKysrKysrKysrKystLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBpbmRleCBl
YWJlOGE2ZDBlYjcuLjllMjU2YWEzYjM1NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBAQCAtNjIsNiArNjIsOCBAQCBzaXplX3Qgc211X3N5
c19nZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBjaGFyICpidWYp
DQo+ICAgCXVpbnQzMl90IGZlYXR1cmVfbWFza1syXSA9IHsgMCB9Ow0KPiAgIAlpbnQzMl90IGZl
YXR1cmVfaW5kZXggPSAwOw0KPiAgIAl1aW50MzJfdCBjb3VudCA9IDA7DQo+ICsJdWludDMyX3Qg
c29ydF9mZWF0dXJlW1NNVV9GRUFUVVJFX0NPVU5UXTsNCj4gKwl1aW50NjRfdCBod19mZWF0dXJl
X2NvdW50ID0gMDsNCj4gICANCj4gICAJcmV0ID0gc211X2ZlYXR1cmVfZ2V0X2VuYWJsZWRfbWFz
ayhzbXUsIGZlYXR1cmVfbWFzaywgMik7DQo+ICAgCWlmIChyZXQpDQo+IEBAIC03NCwxMSArNzYs
MTcgQEAgc2l6ZV90IHNtdV9zeXNfZ2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgY2hhciAqYnVmKQ0KPiAgIAkJZmVhdHVyZV9pbmRleCA9IHNtdV9mZWF0dXJlX2dl
dF9pbmRleChzbXUsIGkpOw0KPiAgIAkJaWYgKGZlYXR1cmVfaW5kZXggPCAwKQ0KPiAgIAkJCWNv
bnRpbnVlOw0KPiArCQlzb3J0X2ZlYXR1cmVbZmVhdHVyZV9pbmRleF0gPSBpOw0KPiArCQlod19m
ZWF0dXJlX2NvdW50Kys7DQo+ICsJfQ0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IGh3X2ZlYXR1
cmVfY291bnQ7IGkrKykgew0KPiAgIAkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlMDJk
LiAlLTIwcyAoJTJkKSA6ICVzXG4iLA0KPiAgIAkJCSAgICAgICBjb3VudCsrLA0KPiAtCQkJICAg
ICAgIHNtdV9nZXRfZmVhdHVyZV9uYW1lKHNtdSwgaSksDQo+IC0JCQkgICAgICAgZmVhdHVyZV9p
bmRleCwNCj4gLQkJCSAgICAgICAhIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBpKSA/ICJl
bmFiZWxkIiA6ICJkaXNhYmxlZCIpOw0KPiArCQkJICAgICAgIHNtdV9nZXRfZmVhdHVyZV9uYW1l
KHNtdSwgc29ydF9mZWF0dXJlW2ldKSwNCj4gKwkJCSAgICAgICBpLA0KPiArCQkJICAgICAgICEh
c211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIHNvcnRfZmVhdHVyZVtpXSkgPw0KPiArCQkJICAg
ICAgICJlbmFiZWxkIiA6ICJkaXNhYmxlZCIpOw0KPiAgIAl9DQo+ICAgDQo+ICAgZmFpbGVkOg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
