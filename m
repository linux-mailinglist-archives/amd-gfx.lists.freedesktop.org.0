Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E319A72755
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A6C6E447;
	Wed, 24 Jul 2019 05:30:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38FE6E447
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndKD6d2veHWN+SIfaUHJGHcmi1qmVcUjs6Tb7cfCOR/+NXSScjgVrRJwwLylJ3OLRz8H8KWFxGNWzJqtwk23ZHeXdpZnqBHTaZEcaZk2rG/BK7bZGEZG2jxLXQ5qjG5bJZ6m0nu3Mo1FTsSl1Hu6eVxd7AqOSYrRVM0ow6KWKQRKKC9K+k9CvyBIxfdzhOnfJxJAvu0Y0gi3khvMrckv5glsnLfy+8nBZWwoVo8OIxIivLqTvTpFR1vtNfDN+t6W3fpQITOQ+O3YigWqsYjzLXRVmbYXuU2UHmi0QuiTvao4e0o4YDPsH6x3EpL6K5LLNTEDDngtreEBJRmzYyEi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSTH3lDjqPkRZOKft00EAOh6OofXZDRYbf2EW1E1f+Y=;
 b=eyIR/7Mkz4bldR5YsOmkln8fovnUhfdcHlvEg95UP+WEnF1GHkckjFu+EWo5+F/GQH2rAzz8T760D1BIgu5d+QCqzPyog68rZRHwrR+IHNFTaKpiNmNWLQRbuR6iVfxhT6x48LK1qPNPSeVAIaa1/FJ9zU+z89+jiMos9Y/1hg9cgkMGSxDfmYk8PAhcar+GbAPktsFyppG16Q+EWWwdJYuVCfUz3JapTaK94kVuhiTplEypAASPjq3Jk+oxoEbiqRpRV0oxBp7jugYG37ySemEOAv3tYDfa/fdl7XK3yC/itNB9vephcsCG0QVCAtKyGXkKn821yQe1HKXEPLOQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Wed, 24 Jul 2019 05:30:44 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 05:30:44 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Topic: [PATCH] drm/amd/powerplay: fix temperature granularity error in
 smu11
Thread-Index: AQHVQU9OHIipvp+bC0yHsFNY2j2yu6bZDQzQgAAyLAA=
Date: Wed, 24 Jul 2019 05:30:44 +0000
Message-ID: <73d462f1-9550-7f91-4652-a9a8940337f5@amd.com>
References: <20190723120756.27823-1-kevin1.wang@amd.com>
 <MN2PR12MB33442FF3B6EB92F3040F6692E4C60@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33442FF3B6EB92F3040F6692E4C60@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0047.apcprd03.prod.outlook.com
 (2603:1096:202:17::17) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 426a9a66-d9f1-4e9a-cdc3-08d70ff81313
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-microsoft-antispam-prvs: <MN2PR12MB37123DF0D8A0467ACC0EFD41A2C60@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(13464003)(14454004)(3846002)(110136005)(316002)(31696002)(54906003)(64756008)(66066001)(305945005)(7736002)(66946007)(66556008)(66446008)(5660300002)(25786009)(8936002)(66476007)(2501003)(99286004)(76176011)(36756003)(68736007)(6116002)(52116002)(476003)(4326008)(6436002)(2616005)(31686004)(2906002)(53936002)(478600001)(11346002)(6512007)(229853002)(386003)(6506007)(53546011)(102836004)(26005)(8676002)(71200400001)(186003)(256004)(71190400001)(81166006)(81156014)(6246003)(6486002)(446003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Rcm3kR97p9fvlLTWri1OV7edDGIAUZJD5C33IsTAWSkqb2AZ9Pa2HjkBK2E/rlauNeerA0JpLSo4jME0NM+XBQV3BKMY95BKJQ2d9Dnl+ZLP7pDgMm7TOzuhihPbNsEwBhOBcxFEN7g1s7kbIDrVhLsQGa6Tyv/uPmomYVrCP7AL9S/yLW2JIqUsydxqwX+DrPhF4axfLQEk9NOZFuJUkglqTsApz63asQyPZkOzRteQFKlYL/a+NqPTpkvXB7G/WmaP/x4gcAiTPLLYQjnkdo4O0bEr1Q7L7K/dDCP51u4mhlV2pu/u5l62OZnhCP/JjYRxMGG1YQYPO4h80wa9hCwgSCXGwIx71RFomXEh+b4wat4OH9GEEGKVMYWEzdd2QfSi0KpUhoHiJKVEMBmqzFWynsI9tRgQfDyNV2d6pRE=
Content-ID: <4666B74B44B32D4B86E5209B2308FE57@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426a9a66-d9f1-4e9a-cdc3-08d70ff81313
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 05:30:44.4504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSTH3lDjqPkRZOKft00EAOh6OofXZDRYbf2EW1E1f+Y=;
 b=x2Q9KLwZOBom33IqwqJ9eDaKXdONr4nBvxPr9XS1iy7GhiofpVtdWTFVDF71JoXOMDDgpMO4r/pyvduleCHRvfVSf559JUB/vBfaUmfKPZNQ4+gWrqlEcQICqMgBpuDfFdxgEequEqChusDncv1xWDgTQUVC6BWDI3lDfbmr/d0=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIHByZXZpb3VzIHBhdGNoIGFscmVhZHkgc3VibWl0dGVkLCBzbyBuZWVkIHRoaXMgcGF0Y2gg
dG8gZml4Lg0KdGhhbmtzLg0KDQpCZXN0IFJlZ2FyZHMsDQpLZXZpbg0KDQpPbiA3LzI0LzE5IDEw
OjM0IEFNLCBRdWFuLCBFdmFuIHdyb3RlOg0KPiBCZXR0ZXIgdG8gY29tYmluZSB0aGlzIHdpdGgg
cHJldmlvdXMgcHRhY2goZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBjYWxsYmFjayBmdW5jdGlvbiBv
ZiBnZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9yYW5nZSkgYXMgb25lLg0KPiBTaW5jZSB0aGlzIGlz
c3VlIHRvIGZpeCB3YXMgYWN0dWFsbHkgaW50cm9kdWNlZCBieSB0aGF0IHBhdGNoLg0KPiAgIA0K
PiBCdXQgaWYgdGhlIG9yaWdpbmFsIHBhdGNoIHdhcyBhbHJlYWR5IHN1Ym1pdHRlZCwgaXQncyBP
SyB0byBjb21taXQgdGhpcyBzZXBhcmF0ZWx5Lg0KPg0KPiBFaXRoZXIgd2F5LCB0aGlzIHdheSBp
cyBSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4NCj4gUmVnYXJk
cywNCj4gRXZhbg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFdhbmcs
IEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPg0KPj4gU2VudDogVHVlc2RheSwgSnVs
eSAyMywgMjAxOSA4OjA4IFBNDQo+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4+IENjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1YW5nLCBSYXkN
Cj4+IDxSYXkuSHVhbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsg
V2FuZywNCj4+IEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPg0KPj4gU3ViamVjdDog
W1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogZml4IHRlbXBlcmF0dXJlIGdyYW51bGFyaXR5IGVy
cm9yIGluDQo+PiBzbXUxMQ0KPj4NCj4+IGluIHRoaXMgcGF0Y2gsDQo+PiBkcm0vYW1kL3Bvd2Vy
cGxheTogYWRkIGNhbGxiYWNrIGZ1bmN0aW9uIG9mDQo+PiBnZXRfdGhlcm1hbF90ZW1wZXJhdHVy
ZV9yYW5nZSB0aGUgZHJpdmVyIG1pc3NlZCB0ZW1wZXJhdHVyZSBncmFudWxhcml0eQ0KPj4gY2hh
bmdlIG9uIG90aGVyIHRlbXBlcmF0dXJlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdh
bmcgPGtldmluMS53YW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4+IGluZGV4IDc0NWIz
NWExNjAwZC4uNzM1ODAyYmIwN2I5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jDQo+PiBAQCAtMTIyOSwxNSArMTIyOSwxNSBAQCBzdGF0aWMgaW50
DQo+PiBzbXVfdjExXzBfc3RhcnRfdGhlcm1hbF9jb250cm9sKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQ0KPj4gICAJCQlyZXR1cm4gcmV0Ow0KPj4gICAJfQ0KPj4NCj4+IC0JYWRldi0+cG0uZHBt
LnRoZXJtYWwubWluX3RlbXAgPSByYW5nZS5taW47DQo+PiAtCWFkZXYtPnBtLmRwbS50aGVybWFs
Lm1heF90ZW1wID0gcmFuZ2UubWF4Ow0KPj4gLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfZWRn
ZV9lbWVyZ2VuY3lfdGVtcCA9DQo+PiByYW5nZS5lZGdlX2VtZXJnZW5jeV9tYXg7DQo+PiAtCWFk
ZXYtPnBtLmRwbS50aGVybWFsLm1pbl9ob3RzcG90X3RlbXAgPSByYW5nZS5ob3RzcG90X21pbjsN
Cj4+IC0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X2hvdHNwb3RfY3JpdF90ZW1wID0NCj4+IHJh
bmdlLmhvdHNwb3RfY3JpdF9tYXg7DQo+PiAtCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9ob3Rz
cG90X2VtZXJnZW5jeV90ZW1wID0NCj4+IHJhbmdlLmhvdHNwb3RfZW1lcmdlbmN5X21heDsNCj4+
IC0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX21lbV90ZW1wID0gcmFuZ2UubWVtX21pbjsNCj4+
IC0JYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21lbV9jcml0X3RlbXAgPQ0KPj4gcmFuZ2UubWVt
X2NyaXRfbWF4Ow0KPj4gLQlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfbWVtX2VtZXJnZW5jeV90
ZW1wID0NCj4+IHJhbmdlLm1lbV9lbWVyZ2VuY3lfbWF4Ow0KPj4gKwlhZGV2LT5wbS5kcG0udGhl
cm1hbC5taW5fdGVtcCA9IHJhbmdlLm1pbiAqDQo+PiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVS
X0NFTlRJR1JBREVTOw0KPj4gKwlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfdGVtcCA9IHJhbmdl
Lm1heCAqDQo+PiBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOw0KPj4gKwlh
ZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfZWRnZV9lbWVyZ2VuY3lfdGVtcCA9DQo+PiByYW5nZS5l
ZGdlX2VtZXJnZW5jeV9tYXggKg0KPj4gU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdS
QURFUzsNCj4+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWluX2hvdHNwb3RfdGVtcCA9IHJhbmdl
LmhvdHNwb3RfbWluICoNCj4+IFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7
DQo+PiArCWFkZXYtPnBtLmRwbS50aGVybWFsLm1heF9ob3RzcG90X2NyaXRfdGVtcCA9DQo+PiBy
YW5nZS5ob3RzcG90X2NyaXRfbWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdS
QURFUzsNCj4+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X2hvdHNwb3RfZW1lcmdlbmN5X3Rl
bXAgPQ0KPj4gcmFuZ2UuaG90c3BvdF9lbWVyZ2VuY3lfbWF4ICoNCj4+IFNNVV9URU1QRVJBVFVS
RV9VTklUU19QRVJfQ0VOVElHUkFERVM7DQo+PiArCWFkZXYtPnBtLmRwbS50aGVybWFsLm1pbl9t
ZW1fdGVtcCA9IHJhbmdlLm1lbV9taW4gKg0KPj4gU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9D
RU5USUdSQURFUzsNCj4+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21lbV9jcml0X3RlbXAg
PQ0KPj4gcmFuZ2UubWVtX2NyaXRfbWF4ICogU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5U
SUdSQURFUzsNCj4+ICsJYWRldi0+cG0uZHBtLnRoZXJtYWwubWF4X21lbV9lbWVyZ2VuY3lfdGVt
cCA9DQo+PiByYW5nZS5tZW1fZW1lcmdlbmN5X21heA0KPj4gKyogU01VX1RFTVBFUkFUVVJFX1VO
SVRTX1BFUl9DRU5USUdSQURFUzsNCj4+ICAgCWFkZXYtPnBtLmRwbS50aGVybWFsLm1pbl90ZW1w
ID0gcmFuZ2UubWluICoNCj4+IFNNVV9URU1QRVJBVFVSRV9VTklUU19QRVJfQ0VOVElHUkFERVM7
DQo+PiAgIAlhZGV2LT5wbS5kcG0udGhlcm1hbC5tYXhfdGVtcCA9IHJhbmdlLm1heCAqDQo+PiBT
TVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOw0KPj4NCj4+IC0tDQo+PiAyLjIy
LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
