Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FD777EE
	for <lists+amd-gfx@lfdr.de>; Sat, 27 Jul 2019 11:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823FB6EE75;
	Sat, 27 Jul 2019 09:37:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C376EE75
 for <amd-gfx@lists.freedesktop.org>; Sat, 27 Jul 2019 09:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN8kIOUc1Pfb5KLPbQk/wjOVoY8C9Z/u8KkVt6hIBtQw5xOw4Mw9bkgfYeg3r1P2cUEHxPBu3ZXbW6PbRB03JYkkSwPQmUfGq9biPlc5jsE9PWj7ZPMsbaKbDDUDThFqGEM+ncprt64aO/rxlsrJnRNauRt9BaDwIkhy5xvqff3WT8OExRvbFuBryctUJ0cyhUz9VqYQKv0WkCcxpqQ7/EarMvcDDLQhnaFCtz5A1mjiKLtA84FHtxo2FYBSTE+7sMko3Xi+PmAYmW0ztachGt/axYgdZm+TsVVvPI1B4HJS4iRTJiF5yhmoYm9yA1kjdtc416k34CzDRZes/1hhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ymNVBHuPirRdTVMPS2MYB2B+li1gx0BuQFIhFk9VxA=;
 b=nL1f+Wp606zafdBN3Fgw71pb0KI8ckBL4uaRep9NRoq+bMGu++PRfuCY05rdBDw0NvtQI4IVjGSDnrzs4kn0yaO4y7HfR6jvuMMRUYSTKe0vwmI321H3OKek8pnf99qfNZ4DddsM2kUEUWppPe9sSBdwmrgoxzvTCIQv6ChWowRfLNZbHZcVvhKw8pBPjvqrhKqGh8EIeKvQEON7i2GXnvjt+JLNyB4gwartMHZMJyVzlwBBFTFTE/OCkzghwxVG+APS9gUxv8iCl0swEXvrn9PLT/eF9vth/6UUejRJ7I5WPEbqs1VVvbwhTt08cA5syLUBimk2AyykOTTh4tIEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Sat, 27 Jul 2019 09:37:17 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2094.013; Sat, 27 Jul 2019
 09:37:17 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Subject: Re: [PATCH] drm/amdgpu: fix a potential information leaking bug
Thread-Topic: [PATCH] drm/amdgpu: fix a potential information leaking bug
Thread-Index: AQHVRF38P9Q9EpbuFUSUrYIqGxgDEabeNM+A
Date: Sat, 27 Jul 2019 09:37:16 +0000
Message-ID: <44b2a1d2-415f-3ae7-fa84-a0f4711ef4a9@amd.com>
References: <20190727093030.6256-1-xywang.sjtu@sjtu.edu.cn>
In-Reply-To: <20190727093030.6256-1-xywang.sjtu@sjtu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe4e54a-98f5-4041-8980-08d71276030b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3054; 
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-microsoft-antispam-prvs: <MN2PR12MB3054B2347D8021A37D297DDEB4C30@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01110342A5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(386003)(66446008)(64756008)(229853002)(66476007)(6512007)(66946007)(2171002)(5660300002)(6486002)(25786009)(31686004)(102836004)(186003)(478600001)(6916009)(6506007)(81156014)(316002)(66556008)(81166006)(2906002)(76176011)(54906003)(6246003)(4326008)(486006)(6436002)(305945005)(8936002)(14444005)(6116002)(256004)(31696002)(99286004)(36756003)(53936002)(8676002)(11346002)(26005)(66066001)(7736002)(71200400001)(446003)(14454004)(2616005)(476003)(3846002)(68736007)(52116002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3054;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nNBO4T6/8mm082n6+JrpYMqqazgrTSWI19dr45BdUdVPgTTtcH3OIOVN1ANOmaOkLD7I4VgtvSqYSm6lrvTFwjGV87ULnIiiT690NEXVoVItn49xQCj3prn0c6tHEtmdzDv8sqOpNEcWGqefBACaAGrFk3EAKKywlXmIZOIMgI8zon0h6EvGPzmVty1wBmR2wXVG4/RVtuQeuMbBifbB0yfwdF+hUYVmbAlTpyR6grm6rCq/14ObpnWowAUQkILZfJywwyITJr7uWcEkIxoSMVyffaZHylF0nMXRi8g42atsJl8VkvkyB98DMm9PwQpCZFmkwKk6v+jlefr4PZEr7RnbwUBtAJhonEyF0aswXFWDcPRN0L/FLiAAxhBXbjLRSMw2TLLG6C2ynzqL8SRtSOwiO633f+NtTvOJ3yg81U8=
Content-ID: <0E632ADDEF348F40A6658E9317C4B5AB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe4e54a-98f5-4041-8980-08d71276030b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2019 09:37:17.1228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ymNVBHuPirRdTVMPS2MYB2B+li1gx0BuQFIhFk9VxA=;
 b=HknRw2hL/7icUtH4kVDGlk1HMzAdoQBC0bPyWMWHQXs+OkdeXtixNXudkyqRAqGIaB9N/SG3SjV6pkiv34ek29nwacmN6MOa01g2VYKQUbjgPemybRcM76bwSwyWg3w9sfSHKK9pm3QCKCqKrzDmN5mDXRpuM6xX8p8O1l90rhM=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhou,
 David\(ChunMing\)" <David1.Zhou@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQrlnKggMjAxOS83LzI3IDE3OjMwLCBXYW5nIFhpYXlhbmcg5YaZ6YGTOg0KPiBDb2NjaW5lbGxl
IHJlcG9ydHMgYSBwYXRoIHRoYXQgdGhlIGFycmF5ICJkYXRhIiBpcyBuZXZlciBpbml0aWFsaXpl
ZC4NCj4gVGhlIHBhdGggc2tpcHMgdGhlIGNoZWNrcyBpbiB0aGUgY29uZGl0aW9uYWwgYnJhbmNo
ZXMgd2hlbiBlaXRoZXINCj4gb2YgY2FsbGJhY2sgZnVuY3Rpb25zLCByZWFkX3dhdmVfdmdwcnMg
YW5kIHJlYWRfd2F2ZV9zZ3BycywgaXMgbm90DQo+IHJlZ2lzdGVyZWQuIExhdGVyLCB0aGUgdW5p
bml0aWFsaXplZCAiZGF0YSIgYXJyYXkgaXMgcmVhZA0KPiBpbiB0aGUgd2hpbGUtbG9vcCBiZWxv
dyBhbmQgcGFzc2VkIHRvIHB1dF91c2VyKCkuDQo+DQo+IEZpeCB0aGUgcGF0aCBieSBhbGxvY2F0
aW5nIHRoZSBhcnJheSB3aXRoIGtjYWxsb2MoKS4NCj4NCj4gVGhlIHBhdGNoIGlzIHNpbXBsaWVy
IHRoYW4gYWRkaW5nIGEgZmFsbC1iYWNrIGJyYW5jaCB0aGF0IGV4cGxpY2l0bHkNCj4gY2FsbHMg
bWVtc2V0KGRhdGEsIDAsIC4uLikuIEFsc28gaXQgZG9lcyBub3QgbmVlZCB0aGUgbXVsdGlwbGlj
YXRpb24NCj4gMTAyNCpzaXplb2YoKmRhdGEpIGFzIHRoZSBzaXplIHBhcmFtZXRlciBmb3IgbWVt
c2V0KCkgdGhvdWdoIHRoZXJlIGlzDQo+IG5vIHJpc2sgb2YgaW50ZWdlciBvdmVyZmxvdy4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaWF5YW5nIDx4eXdhbmcuc2p0dUBzanR1LmVkdS5jbj4N
Cg0KUmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+DQoNCi1E
YXZpZA0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1
Z2ZzLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMu
Yw0KPiBpbmRleCA2ZDU0ZGVjZWY3ZjguLjU2NTJjYzcyZWQzYSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jDQo+IEBAIC03MDcsNyArNzA3LDcg
QEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2RlYnVnZnNfZ3ByX3JlYWQoc3RydWN0IGZpbGUgKmYs
IGNoYXIgX191c2VyICpidWYsDQo+ICAgCXRocmVhZCA9ICgqcG9zICYgR0VOTUFTS19VTEwoNTks
IDUyKSkgPj4gNTI7DQo+ICAgCWJhbmsgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDYxLCA2MCkpID4+
IDYwOw0KPiAgIA0KPiAtCWRhdGEgPSBrbWFsbG9jX2FycmF5KDEwMjQsIHNpemVvZigqZGF0YSks
IEdGUF9LRVJORUwpOw0KPiArCWRhdGEgPSBrY2FsbG9jKDEwMjQsIHNpemVvZigqZGF0YSksIEdG
UF9LRVJORUwpOw0KPiAgIAlpZiAoIWRhdGEpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gICAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
