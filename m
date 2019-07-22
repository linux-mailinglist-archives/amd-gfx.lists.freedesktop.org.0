Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9256F877
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 06:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DED589AAD;
	Mon, 22 Jul 2019 04:27:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710058.outbound.protection.outlook.com [40.107.71.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8189AAD
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 04:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG+xtJUWJc6XF9fC0QH9x2fF+lJVXi4JsrC8C4zwl+0b6F+MJiKmT4IGtTieLTSWiDtWKLxGkdd+eFsFuwLN7YDQqC168fkk4ZPeE2IoNwMYwVM9wRRyLyzldTnjK/bj8f3ghzZ02lny9+eDt7SfmjUPkm6FanNr9s0FlwzVyhbsTv4eTLfFwwW3szmm9mnUp9lrOzitJoemSvcJ04Nq/D5gbfbyeTms1y/riITSRnNUnv9g6cyUl26dx4YPVWJnGdl21ymKoW5keuvOJXCzSYNSgtspmd3KGDQ7V1CN9fyHppcVf9zp/c2L8LvzigZUcokK5iUzHjV1bMAMPYEzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDDpiSp/RdWWZ+RWE6n6Ru1Zxa6FkRRoVjjzX+UVGv0=;
 b=M21e8L+xl+ohxThGNEcUU1YSQnmh4dSfs/kqnjiDhEViTJXykzVD3dlhYFz4OgDn3T+MeDBg9la0vAL5US03LyZ/3E4i0G/IOGMb5yrsIebpe8kxzP8T1m1gkMoZhfJK+s65yfihNcYnqgzduN0ozqeOHJSCZbCg2jF5N3Ejd77W1p2TMsYxWGfp8Zk+cbr8RPxpdxGtdRmprKQu2Y2LrWLDD4RkD4iMnTooXnCH79zuG/fX47kYXZTLBa29MrMj5o0Ds3b07QHFd5VAP8B5b05+DFeGdbGQ9YT8jWXrCGCJjJ9bFohIodfP0HXiuaGnlAD9lcDYkLhmP3yoWL+FNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 04:27:27 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 04:27:27 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amd/powerplay: support VCN powergate status
 retrieval on Raven
Thread-Topic: [PATCH 2/5] drm/amd/powerplay: support VCN powergate status
 retrieval on Raven
Thread-Index: AQHVQDvLnD8PF7xn3UOB+Jo+uKLPsqbWCwKQ
Date: Mon, 22 Jul 2019 04:27:26 +0000
Message-ID: <MN2PR12MB3598D8D6BB2771000D0938A48EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-3-evan.quan@amd.com>
In-Reply-To: <20190722031531.23437-3-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 096c7109-8fd1-40c1-8685-08d70e5ce6f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4016938CFE74C23E8451A4E58EC40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:239;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(5660300002)(7736002)(66066001)(6246003)(2906002)(81166006)(81156014)(8676002)(53546011)(476003)(26005)(102836004)(446003)(11346002)(33656002)(55016002)(66446008)(64756008)(256004)(6506007)(99286004)(9686003)(6306002)(53936002)(966005)(76116006)(66556008)(66476007)(229853002)(52536014)(66946007)(3846002)(6436002)(110136005)(6116002)(86362001)(478600001)(316002)(76176011)(486006)(305945005)(7696005)(14454004)(68736007)(74316002)(4326008)(25786009)(71200400001)(71190400001)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tnNqcUdcMaQEO6mA0mz8PYjN+Ul/ZKYQWdGMy82JWhSPrkjelzS3lUC5icv9vYp4DhDWNBL6VlHtwvrGBPmS+1jbX41jPCKOk+eKJTlxrnyTrxwIMQY7F7Q+9+iszhgKVR3OfrHCGLQuvmdKtKZb+F+eYftCJAPyioI0R99vskeTZZA4mEI0shlE24bzuEQXKlpogxTX+Rg95tQEnTmCJO3CcgG27UNIXRul6z7OPWBEyfTOyEEfnCfRsLawOYJSBGm3vo0dgwQzUUnYqIdaGoJkd3HZxxgbABpRtTKTfLSeYaIXIzMz7UyN1/C1vvv6wXP38w5d3hm+7yBUKZEaz9wUBemn0BzlpJQiuGkzNzOTGBrZlZfJVVRCI47hUXHlvgcj8VgDiJbWLnEb9BdVFy5U4vvbqaG669HRjCh8i3k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096c7109-8fd1-40c1-8685-08d70e5ce6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 04:27:26.9118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDDpiSp/RdWWZ+RWE6n6Ru1Zxa6FkRRoVjjzX+UVGv0=;
 b=dT1zDJuTzqo7H9He9hIbrCnCPlvbZ3bo1z09Dmx96s7eZ3Hi9OHcLC/4nLAU+dBW7bJh5fsHjvfdPDeByGQF5NhC934P3hB2oCe2tCUB1pyKmV7KdHHm1tGUC8Rjz4PGF5RRq09wV7GoyXw4UqFzkKpVAKJgsm56cvJn7AAOYOE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTUgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDIv
NV0gZHJtL2FtZC9wb3dlcnBsYXk6IHN1cHBvcnQgVkNOIHBvd2VyZ2F0ZSBzdGF0dXMgcmV0cmll
dmFsIG9uIFJhdmVuDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KRW5hYmxlIFZDTiBw
b3dlcmdhdGUgc3RhdHVzIHJlcG9ydCBvbiBSYXZlbi4NCg0KQ2hhbmdlLUlkOiBJNjBjNzkzZjgx
ODVjZTY3OTliNDBhMGNhYmQ5N2Q5YzlmZTU0ODNmZA0KU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3NtdTEwX2h3bWdyLmMgfCA5ICsrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2h3bWdyL3NtdTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci9zbXUxMF9od21nci5jDQppbmRleCBlMzJhZTlkMzM3M2MuLjQ5MWEzY2M3NzZmYyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMN
CkBAIC0xMTExLDYgKzExMTEsNyBAQCBzdGF0aWMgaW50IHNtdTEwX3RoZXJtYWxfZ2V0X3RlbXBl
cmF0dXJlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpICBzdGF0aWMgaW50IHNtdTEwX3JlYWRfc2Vu
c29yKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGludCBpZHgsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgIHZvaWQgKnZhbHVlLCBpbnQgKnNpemUpICB7DQorICAgICAgIHN0cnVjdCBzbXUxMF9o
d21nciAqc211MTBfZGF0YSA9IChzdHJ1Y3Qgc211MTBfaHdtZ3IgDQorICopKGh3bWdyLT5iYWNr
ZW5kKTsNCiAgICAgICAgdWludDMyX3Qgc2NsaywgbWNsazsNCiAgICAgICAgaW50IHJldCA9IDA7
DQoNCkBAIC0xMTMyLDYgKzExMzMsMTAgQEAgc3RhdGljIGludCBzbXUxMF9yZWFkX3NlbnNvcihz
dHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBpbnQgaWR4LA0KICAgICAgICBjYXNlIEFNREdQVV9QUF9T
RU5TT1JfR1BVX1RFTVA6DQogICAgICAgICAgICAgICAgKigodWludDMyX3QgKil2YWx1ZSkgPSBz
bXUxMF90aGVybWFsX2dldF90ZW1wZXJhdHVyZShod21ncik7DQogICAgICAgICAgICAgICAgYnJl
YWs7DQorICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVI6DQorICAgICAgICAg
ICAgICAgKih1aW50MzJfdCAqKXZhbHVlID0gIHNtdTEwX2RhdGEtPnZjbl9wb3dlcl9nYXRlZCA/
IDAgOiAxOw0KKyAgICAgICAgICAgICAgICpzaXplID0gNDsNCisgICAgICAgICAgICAgICBicmVh
azsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KICAg
ICAgICAgICAgICAgIGJyZWFrOw0KQEAgLTExNzUsMTggKzExODAsMjIgQEAgc3RhdGljIGludCBz
bXUxMF9wb3dlcmdhdGVfc2RtYShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGdhdGUpDQoN
CiBzdGF0aWMgdm9pZCBzbXUxMF9wb3dlcmdhdGVfdmNuKHN0cnVjdCBwcF9od21nciAqaHdtZ3Is
IGJvb2wgYmdhdGUpICB7DQorICAgICAgIHN0cnVjdCBzbXUxMF9od21nciAqc211MTBfZGF0YSA9
IChzdHJ1Y3Qgc211MTBfaHdtZ3IgDQorICopKGh3bWdyLT5iYWNrZW5kKTsNCisNCiAgICAgICAg
aWYgKGJnYXRlKSB7DQogICAgICAgICAgICAgICAgYW1kZ3B1X2RldmljZV9pcF9zZXRfcG93ZXJn
YXRpbmdfc3RhdGUoaHdtZ3ItPmFkZXYsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBBTURfSVBfQkxPQ0tfVFlQRV9WQ04sDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBTURfUEdfU1RBVEVfR0FURSk7DQogICAg
ICAgICAgICAgICAgc211bV9zZW5kX21zZ190b19zbWNfd2l0aF9wYXJhbWV0ZXIoaHdtZ3IsDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFBTTUNfTVNHX1Bvd2VyRG93
blZjbiwgMCk7DQorICAgICAgICAgICAgICAgc211MTBfZGF0YS0+dmNuX3Bvd2VyX2dhdGVkID0g
dHJ1ZTsNCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICBzbXVtX3NlbmRfbXNnX3Rv
X3NtY193aXRoX3BhcmFtZXRlcihod21nciwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBQU01DX01TR19Qb3dlclVwVmNuLCAwKTsNCiAgICAgICAgICAg
ICAgICBhbWRncHVfZGV2aWNlX2lwX3NldF9wb3dlcmdhdGluZ19zdGF0ZShod21nci0+YWRldiwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFNRF9JUF9C
TE9DS19UWVBFX1ZDTiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEFNRF9QR19TVEFURV9VTkdBVEUpOw0KKyAgICAgICAgICAgICAgIHNtdTEwX2RhdGEt
PnZjbl9wb3dlcl9nYXRlZCA9IGZhbHNlOw0KICAgICAgICB9DQogfQ0KDQotLQ0KMi4yMi4wDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4
IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
