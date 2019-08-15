Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E08E25C
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 03:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1838E6E889;
	Thu, 15 Aug 2019 01:29:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516156E893
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 01:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHoVk6QIlYOjGgmlP4gx9OqnV7vM+s7Al8gp4sDnWQwEPz/qpZ5r8BeTTyN4Wgx27maBZMcbnfcFNgjd8PuDQJwmyt2QO0JLJQ6xlKfQSpSrFyTbC+b8NInquRMtDAw2DA/RkZly0CR0ib/idaESDxsogIMltsrRwTrz5ZNZK/Hzu6NZzEAeRAD7mxyxyPaeozpm9NTvHYcfxmdWCHS8yZmJtZ/cDmNSQUPgslU0ec5gTy7sVV8ytUsm9Umrp7Litmf/da2wFyrKpPrRw/zEcn+QFDF8tMjBeqaBXgs/t1Ge8DONSIVYBYMl3jRUqxQQUykFJ3VAbst72a0p5iDbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1z7Pjp2C3WAU+btCEwiJBmx3VIK2r0k5Y0J8UUxgDg=;
 b=cRUzqAqwEIApDAlJHHjvWYprcBEL2W2nQmWSpXVudGWHgLPeLZwdSZDqN0PVqSMdl3O/m1T1ons5Z+F6wpdVW04El8VgZkKvMpgzKam2ot9Bn2pOdsvNIdh+cN0xCdJYy7yluxw9pUTbtsPvsawlPDELEJFmHk+ZYCaYaIClqKHw6DSZeHOBejkO8/yu34cn+td+KX+ujWOtYV2igdIXYadyUWZCzYnfc3dgMzLkUAbX1Q/BGziLot2XnTzjCfB3szi9nLSjyM/jr1L1r4E03Bxwo5p5epEocAozHwqv0U8rqfM8DBEu5EdOw6lasxSNs+qf6RNuRbUD+MStHH33rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4302.namprd12.prod.outlook.com (52.135.51.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 01:29:24 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 01:29:24 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)
Thread-Topic: [PATCH] drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)
Thread-Index: AQHVUuC5NRhqkIJ52Uy+gNjNtrQAuqb7a+0w
Date: Thu, 15 Aug 2019 01:29:24 +0000
Message-ID: <MN2PR12MB3344F44C3E591C410766584BE4AC0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190814204149.22226-1-alexander.deucher@amd.com>
In-Reply-To: <20190814204149.22226-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9eb4ab9-c8a2-4e77-1329-08d7212001a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4302; 
x-ms-traffictypediagnostic: MN2PR12MB4302:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB430297BCF8ADC64780CA9CA7E4AC0@MN2PR12MB4302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(13464003)(53936002)(478600001)(71200400001)(81166006)(71190400001)(316002)(99286004)(110136005)(81156014)(76116006)(66446008)(229853002)(86362001)(66476007)(5660300002)(6306002)(9686003)(66556008)(64756008)(54906003)(66946007)(6246003)(55016002)(8936002)(2906002)(6436002)(7736002)(305945005)(4326008)(966005)(26005)(256004)(33656002)(25786009)(14454004)(74316002)(446003)(52536014)(8676002)(6506007)(486006)(3846002)(2501003)(6116002)(7696005)(76176011)(102836004)(66066001)(186003)(53546011)(476003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4302;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4lTxlSgzKWPA+Tyn5nJ3IF3MXFt360tf3vQDtAbisGrEcHmbqaEiOiESVZVxuIbYpMsPPEm18cOMrU/bMikL146KY+qHYHOe+u0lCYJhaVJ4ceGsV4//7VRz1ByC6y35LO7wYNqfOeOqE/b3L93xJM4XeyJooUqAIawyYt0JutDOMx88+6vxzAvRop56ZIPe4c5lQ0+cWQFwcvSyXuryKilRNM58lnNKKiB6gwSzs6GzL+LKz7g33W1zTm+W5GQR8t2xpgF0KEM4+nSsNkodEzJBISXhH8OZb1ED8mbo1qiowgy6p+OrsjqGH55C5yrh1E8tNRCrmt71eWNcf6D4KV7kWx+u8/I/+BWeBXS0Mnf9NO5aiOfBVmEhCbagzVWfZUj5/9vVgf+kWRtFrc+0NtaX26PxnQVFBA0B6UXIiZE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eb4ab9-c8a2-4e77-1329-08d7212001a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 01:29:24.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtDyVjJJTGknuCYS9GbcMHXrRvlFcFrEEPxSfGhBuSwFzFrBydCgjaDVYHOjJMtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1z7Pjp2C3WAU+btCEwiJBmx3VIK2r0k5Y0J8UUxgDg=;
 b=3dPHDaVEk8w0IQp27oXSjJDSdW7QN1jBQ/a2tdb53fF6uDZwJiAM0xMZCyP5STDBsHSesZD3LvqANNAC8x/pyogdEWnwru2v0RibPs+Z6qKxSgQwO4ztyQMic3EIf3N6EB8+D33xkuTVibziddR7ltLWmdqGHjDtS91u4yQcWc8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDE1LCAyMDE5IDQ6NDIgQU0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBBaHpvDQo+IDxBaHpvQHR1dGFub3RhLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kL3Bvd2VycGxheS9zbXU3OiBlbmZvcmNlIG1pbmltYWwgVkJJVGltZW91dA0KPiAo
djIpDQo+IA0KPiBGcm9tOiBBaHpvIDxBaHpvQHR1dGFub3RhLmNvbT4NCj4gDQo+IFRoaXMgZml4
ZXMgc2NyZWVuIGNvcnJ1cHRpb24vZmxpY2tlcmluZyBvbiA3NSBIeiBkaXNwbGF5cy4NCj4gDQo+
IHYyOiBtYWtlIHByaW50IHN0YXRlbWVudCBkZWJ1ZyBvbmx5IChBbGV4KQ0KPiANCj4gQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjY0Ng0K
PiBTaWduZWQtb2ZmLWJ5OiBBaHpvIDxBaHpvQHR1dGFub3RhLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyB8IDUgKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMNCj4gaW5kZXggMTBk
NjZlM2M3YTlmLi5iNDY4ZjYzNGZmYTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMNCj4gQEAgLTQwNjcsNiArNDA2NywxMSBA
QCBzdGF0aWMgaW50IHNtdTdfcHJvZ3JhbV9kaXNwbGF5X2dhcChzdHJ1Y3QNCj4gcHBfaHdtZ3Ig
Kmh3bWdyKQ0KPiANCj4gIAlkYXRhLT5mcmFtZV90aW1lX3gyID0gZnJhbWVfdGltZV9pbl91cyAq
IDIgLyAxMDA7DQo+IA0KPiArCWlmIChkYXRhLT5mcmFtZV90aW1lX3gyIDwgMjgwKSB7DQo+ICsJ
CXByX2RlYnVnKCIlczogZW5mb3JjZSBtaW5pbWFsIFZCSVRpbWVvdXQ6ICVkIC0+IDI4MFxuIiwN
Cj4gX19mdW5jX18sIGRhdGEtPmZyYW1lX3RpbWVfeDIpOw0KPiArCQlkYXRhLT5mcmFtZV90aW1l
X3gyID0gMjgwOw0KPiArCX0NCj4gKw0KPiAgCWRpc3BsYXlfZ2FwMiA9IHByZV92YmlfdGltZV9p
bl91cyAqIChyZWZfY2xvY2sgLyAxMDApOw0KPiANCj4gIAljZ3Nfd3JpdGVfaW5kX3JlZ2lzdGVy
KGh3bWdyLT5kZXZpY2UsIENHU19JTkRfUkVHX19TTUMsDQo+IGl4Q0dfRElTUExBWV9HQVBfQ05U
TDIsIGRpc3BsYXlfZ2FwMik7DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QN
Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
