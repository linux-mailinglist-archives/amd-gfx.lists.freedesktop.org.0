Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D406A454
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8571E6E0D4;
	Tue, 16 Jul 2019 08:55:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790055.outbound.protection.outlook.com [40.107.79.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E979D6E0D4
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAYoQn74OM0fW187e4qM7gFGnxS0rIMr4vQ4P0mI1t4SmZfmvYL5YZ7Qb0S3kefCBCKMAEyfNGGWPRF5xy97kuxsjOMlOX/a3pad9+zGbqoFJsEMH0aryNqTG94K4wPxFq/4iMLUO/H4CSGxygjNB/e4lrToC25zcHJpXbvjDYm1CXunA7eFfNUyzuHyRIJCkzfbsMdlWfqOfAqA74bnGePgL/urBBCBQP/LcSgwnYbCCwBvMnXhqWSQwhV5RdmlUPZYnh58TR+Q7CIy8mTKe+YidserFc3D594nrmXiEiHeI23g3uIJCY6Q4krQS8mU1MFUop+t1PmDX6Qh65cTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMngmYIsUBIRLo/CvR2ss11j6Fnv5txcwsR1veYcKyY=;
 b=QY5dGO6w6nU+Qs61hTSFfKFAgHH5k9544dawOpHvyjQ1G6ihDHZJiWl3AiyT9FFCC7yAY7dFmme2/GxdvJ2Z0X3XQoyGCYgLOvlNdfP8rn6enPXUn7vvvU1Hc+SLCHiBD3bKqTPJtaltQVF7kCNkMok5ODdXjM0YBtLkQZCgESdfD7q3MoJDS/UVYooHIKfygm0bCtA2Rh9Xk3FIlJTI3iOEdfnK2V3ASC2tXGdcKbiUBESSU6Gx4lgSyQqReQwSM9MjpMRyRTuF85wQD6Ypmhe0DSfg8sCvihnbcq6gOQlhcvaYZGBP6lhAfZAJ99GrgmKKmZwXUxIIElZr2YuGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 08:55:23 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 08:55:23 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: enable fw ctf,apcc dfll and gfx ss
Thread-Topic: [PATCH] drm/amd/powerplay: enable fw ctf,apcc dfll and gfx ss
Thread-Index: AQHVO7NidA/R2jDgiUybEKw/YgkmyabM8LvA
Date: Tue, 16 Jul 2019 08:55:23 +0000
Message-ID: <MN2PR12MB3344F84521850D0DB4104FCBE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1563266951-30106-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1563266951-30106-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ede1b7ae-3b59-4e24-b83a-08d709cb56d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2958; 
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2958DFDB9C21E8C11898E76DE4CE0@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(13464003)(81166006)(81156014)(966005)(74316002)(2501003)(7736002)(25786009)(64756008)(66446008)(76116006)(66476007)(66556008)(66946007)(86362001)(7696005)(8936002)(68736007)(478600001)(316002)(110136005)(8676002)(53936002)(6506007)(55016002)(76176011)(6436002)(5660300002)(14444005)(3846002)(4326008)(6116002)(66066001)(52536014)(33656002)(256004)(14454004)(476003)(11346002)(71200400001)(305945005)(2906002)(486006)(71190400001)(99286004)(6306002)(9686003)(6246003)(26005)(53546011)(229853002)(186003)(102836004)(446003)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2958;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z3eI87TiyPxj3YIJ1QOV9PFx369dmv8p0Fsi2n6I6MOpnB/7TIbR2XajDFhYq2qjipD2ooIk21FXrH2Yi8PAXPidXN0fuMoLQVUc0HeIacRieuXjggUA6rDqTq/aEDwkdxcfnN3DXM0hagDWzm5YNLFrd8LU10RNTCf1L7kAyzuaEiXBSotvxRXrFvDG63/pWgayKERnBVBy1kJShpYHDVgY9AWE6f/o/zN63/J4MsBWm/oX/YX3p10yS9JHPpmw3vDre3Rj6t5UF28OSSPOh6S5Yc1dtCwfc13PF7b+oz6HK8k6P4TH3x8+P6pEyevFmxUI7eHepKshRiqD0vEtp4JM5ln58JrbjMZMHtoX71g5cm1BkSrlLq9QpEJHMt9/41sFE22J5IbXo/CCZS55OpV0ZNAZLg5HHgPKHWhyUls=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede1b7ae-3b59-4e24-b83a-08d709cb56d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 08:55:23.4952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMngmYIsUBIRLo/CvR2ss11j6Fnv5txcwsR1veYcKyY=;
 b=Dey1SIU0+1tTKOVHWI+XXvv2ayPsxOYdEX12hiDPIQ55MA04/Tyh2l8S0e3vFzfzaUHK7nW0iOvr5ruUBmeYZYoSb2oA4Cu6x/63r1K5QTE5MUowhXb6TVBXJHwAL9Hfyn1zshA1eU0elL/H2Hky9gqVhpCha52eEJlDRmroqDg=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VHlwbzogZnVyaHRlcg0KV2l0aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6
IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEtlbm5ldGggRmVuZw0KPiBTZW50OiBUdWVzZGF5LCBKdWx5
IDE2LCAyMDE5IDQ6NDkgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIXSBkcm0vYW1kL3Bvd2VycGxheTogZW5hYmxlIGZ3IGN0ZixhcGNjIGRmbGwgYW5kIGdmeCBz
cw0KPiANCj4gZW5hYmxlIGZ3IGN0ZiwgYXBjYyBkZmxsIGFuZCBnZnggc3Mgb24gbmF2aTEwLg0K
PiBmdyBjdGY6IHdoZW4gdGhlIGZ3IGN0ZiBpcyB0cmlnZ2VyZWQsIHRoZSBnZnggYW5kIHNvYyBw
b3dlciBkb21haW4NCj4gYXJlIHNodXQgZG93bi4gZmFuIHNwZWVkIGlzIGJvb3N0ZWQgdG8gdGhl
IG1heGltdW0uDQo+IGdmeCBzczogaGFyZHdhcmUgZmVhdHVyZSwgc2FuaXR5IGNoZWNrIGhhcyBi
ZWVuIGRvbmUuDQo+IGFwY2MgZGZsbDogY2FuIGNoZWNrIHRoZSBzY29yZWJvYXJkIGluIHNtdSBm
dyB0byBjb25maXJtIGlmIGl0J3MgZW5hYmxlZC4NCj4gbm8gbmVlZCB0byBkbyBmdXJodGVyIGNo
ZWNrIHNpbmNlIHRoZSBnZnggaGFyZHdhcmUgY29udHJvbCB0aGUgZnJxdWVuY3kNCj4gb25jZQ0K
PiBhIHBjYyBzaWduYWwgY29tZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcg
PGtlbm5ldGguZmVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDExICsrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBpbmRleCA4OTVhNGU1Li5mYTYzNmQyIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+IEBA
IC0zMzEsNyArMzMxLDEwIEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0
DQo+IHNtdV9jb250ZXh0ICpzbXUsDQo+ICAJCQkJfA0KPiBGRUFUVVJFX01BU0soRkVBVFVSRV9E
U19EQ0VGQ0xLX0JJVCkNCj4gIAkJCQl8DQo+IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFU
RV9CSVQpDQo+ICAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9CQUNPX0JJVCkNCj4gLQkJCQl8
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklUKTsNCj4gKwkJCQl8IEZFQVRVUkVfTUFTSyhG
RUFUVVJFX0FDRENfQklUKQ0KPiArCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1NTX0JJ
VCkNCj4gKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FQQ0NfREZMTF9CSVQpDQo+ICsJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9GV19DVEZfQklUKTsNCj4gDQo+ICAJaWYgKGFkZXYtPnBt
LnBwX2ZlYXR1cmUgJiBQUF9NQ0xLX0RQTV9NQVNLKQ0KPiAgCQkqKHVpbnQ2NF90ICopZmVhdHVy
ZV9tYXNrIHw9DQo+IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9VQ0xLX0JJVCkNCj4gQEAgLTMz
OSw4ICszNDIsNyBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdA0KPiBz
bXVfY29udGV4dCAqc211LA0KPiAgCQkJCXwNCj4gRkVBVFVSRV9NQVNLKEZFQVRVUkVfTUVNX01W
RERfU0NBTElOR19CSVQpOw0KPiANCj4gIAlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX0dG
WE9GRl9NQVNLKSB7DQo+IC0JCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0NCj4gRkVBVFVS
RV9NQVNLKEZFQVRVUkVfR0ZYX1NTX0JJVCkNCj4gLQkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0dGWE9GRl9CSVQpOw0KPiArCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9DQo+IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9CSVQpOw0KPiAgCQkvKiBUT0RPOiByZW1vdmUgaXQgb25j
ZSBmdyBmaXggdGhlIGJ1ZyAqLw0KPiAgCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrICY9DQo+
IH5GRUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKTsNCj4gIAl9DQo+IEBAIC00NjUs
OSArNDY3LDYgQEAgc3RhdGljIGludCBuYXZpMTBfYXBwZW5kX3Bvd2VycGxheV90YWJsZShzdHJ1
Y3QNCj4gc211X2NvbnRleHQgKnNtdSkNCj4gIAlzbWNfcHB0YWJsZS0+TXZkZFJhdGlvID0gc21j
X2RwbV90YWJsZS0+TXZkZFJhdGlvOw0KPiANCj4gIAlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAm
IFBQX0dGWE9GRl9NQVNLKSB7DQo+IC0JCSoodWludDY0X3QgKilzbWNfcHB0YWJsZS0+RmVhdHVy
ZXNUb1J1biB8PQ0KPiBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhfU1NfQklUKQ0KPiAtCQkJCQl8
DQo+IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9CSVQpOw0KPiAtDQo+ICAJCS8qIFRPRE86
IHJlbW92ZSBpdCBvbmNlIFNNVSBmdyBmaXggaXQgKi8NCj4gIAkJc21jX3BwdGFibGUtPkRlYnVn
T3ZlcnJpZGVzIHw9DQo+IERQTV9PVkVSUklERV9ESVNBQkxFX0RGTExfUExMX1NIVVRET1dOOw0K
PiAgCX0NCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
