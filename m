Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F8AAF4B7
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3946E109;
	Wed, 11 Sep 2019 03:38:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D64C6E109
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/35b7RgxvyBO3uWJypOWouXicvwuew2f+Yriv2euEFaPs1KYaMmwpRqHUFhl9gFrdSXL8IhvjDfbykU4zWGH4sQvOhtmN+EexK7yYQ/mp6rblxgmlH5PHAGilHTF2pqMiowFbq6+eW2258m5eeyTfEZA1zSQLniv2f0IKWNXi3i8STxOIgUtVivdd2PEHHqqjHViR3i/tU9iCxkybi6u3HmqzT35Uh+ep+NUHSOQ8gQ5LQpfzUmQfUcsKY6vTiyqMTA+HSkI62Btfu7gXz7M4bjuvW/bZoRwRNo/JN+FG5xAZhHuidcX4E+yKbDb/ZLI027Bah1naxLcNdvJd5uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUzlspeaeooLpPq5DTh+caqvP+VMoSA69W9jmljXWZk=;
 b=L/wKvEXm7wV5Pl4WbtIv6V36/DhsIs/TtdcK46Sk+Lt0RBUfeTKSCxnx4ldZwLX1NSu/VFPMywEp4CHI0sgsHRacw+QFZM4KEBuP50SkxtM0ZwZSNvsdTMnmJvWNrC+N6rmVL1+oZByWZ6YoIg/Yo0GShn+OZcEbj0JjaSdDJQ86LGmliJda5m/eEL6W0paeMPjDyNehSh0zw9cyPjRQoHhH5t0vVsEj+H6QUc1IVDFTA4T80S00v06fJ7a5zUxbgwYR8fW6TdV8n6XhpP1gLRL3SPMdpf6d5X9WkPib7C3mJHNAYmX2VPf3BudAcbAmh2ORrjHmtqUxyux7AOqpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 03:38:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:38:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "S, Shirish" <Shirish.S@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Index: AQHVZ6zZSGP4wbr8DUmv4JsslOgvO6ckj2HwgAFGHAA=
Date: Wed, 11 Sep 2019 03:38:50 +0000
Message-ID: <67422930-9dbe-bac2-1636-c0b71a814acb@amd.com>
References: <20190910075312.17108-1-shirish.s@amd.com>
 <MN2PR12MB33099B938972C6AF2437C92BECB60@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33099B938972C6AF2437C92BECB60@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f17db39-6704-4ed3-a7a3-08d736698f40
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3209; 
x-ms-traffictypediagnostic: DM6PR12MB3209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB32097753A5FDDA5281E3E68592B10@DM6PR12MB3209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:133;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(13464003)(189003)(199004)(11346002)(36756003)(81166006)(6246003)(53936002)(6506007)(14454004)(8936002)(102836004)(26005)(53546011)(256004)(386003)(6436002)(14444005)(316002)(6486002)(58126008)(71190400001)(25786009)(2616005)(476003)(229853002)(99286004)(446003)(186003)(3846002)(31686004)(305945005)(6636002)(7736002)(76176011)(31696002)(5660300002)(81156014)(486006)(4326008)(478600001)(2906002)(6512007)(64756008)(66476007)(66556008)(66946007)(65956001)(65806001)(66446008)(66066001)(52116002)(71200400001)(86362001)(110136005)(8676002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3209;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PZTRR/+btY9UCt2Dgco8+VPY7NYYI/Syqr7YUdvlcgrWN/TYhWtDX6Y03oyzPpfcNicQVFePEN0BSWBSdlcNFz+IodzUEUHNMYs8HD7eRy7a1YaTCUMSJoq/mCpBa25dLBGAlkLQBZEA5U3QVUOw/xOlvgmOctGmfh3O833d75rVxGTkuzx3NyxyA7d8AowMUzKKXANQwJ4TbnxruzYVTE8e+5LNAw0lVd0s5IOs4xsNotK+CpCTorvx33nOJaNaHqi7H8gRPhEpP/vdxzFswt2P8OfF/vKphbdvD87gPJbjm4aLAeCBAjzx941aePhOCAfItNeX/tbRWDI6Mqo+3rVKYK/8mDXdjyQngw0lOFjKiDrynQQraN10Ra5Nv338r7VnqLNUnm6Xqs/yfbpzvKivDGeAAwOEZa/0N5TP+CQ=
Content-ID: <6396CD18345F8546A365A69EBAEAF775@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f17db39-6704-4ed3-a7a3-08d736698f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:38:50.1757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9n8ddOfgCFjiyThf43FGVf/7kcpm7dApc8xmHVr7+fJl02ZtkoHyp1pTkpQWU2yPbINP1MIbps/bHODdXVM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUzlspeaeooLpPq5DTh+caqvP+VMoSA69W9jmljXWZk=;
 b=NQtQU5w0RBSTtj1DPJ0vgjqZiWHN/69i7i1U2+D6cIztY/eP5j0yJx4ziUdrn2QjaYxFrK9ZUXub/BM/eKPNHK7R81YVowmdvIlDaq96OZpwHtfmS3jRxex+yHkRm2woiWA1MzNSHdNeMPcg1DaRRaPJd3E8ExjeNaGxPB13ZsI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBwcmV0dHkgdWdseS4gU2VlIGEgc3VnZ2VzdGlvbiBpbmxpbmUuDQoNCk9uIDIwMTkt
MDktMTAgNDoxMiBhLm0uLCBIdWFuZywgUmF5IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4+IEZyb206IFMsIFNoaXJpc2ggPFNoaXJpc2guU0BhbWQuY29tPg0KPj4gU2Vu
dDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAyMDE5IDM6NTQgUE0NCj4+IFRvOiBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0K
Pj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQu
Y29tPg0KPj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTLCBTaGlyaXNoIDxT
aGlyaXNoLlNAYW1kLmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IGJ1
aWxkIGVycm9yIHdpdGhvdXQgQ09ORklHX0hTQV9BTUQNCj4+DQo+PiBJZiBDT05GSUdfSFNBX0FN
RCBpcyBub3Qgc2V0LCBidWlsZCBmYWlsczoNCj4+DQo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLm86IEluIGZ1bmN0aW9uDQo+PiBgYW1kZ3B1X2RldmljZV9pcF9l
YXJseV9pbml0JzoNCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YzoxNjI2OiB1bmRlZmluZWQNCj4+IHJlZmVyZW5jZSB0byBgc2NoZWRfcG9saWN5Jw0KPj4NCj4+
IFVzZSBDT05GSUdfSFNBX0FNRCB0byBndWFyZCB0aGlzLg0KPj4NCj4+IEZpeGVzOiAxYWJiNjgw
YWQzNzEgKCJkcm0vYW1kZ3B1OiBkaXNhYmxlIGdmeG9mZiB3aGlsZSB1c2Ugbm8gSC9XDQo+PiBz
Y2hlZHVsaW5nIHBvbGljeSIpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGly
aXNoLnNAYW1kLmNvbT4NCj4gKyBGZWxpeCBmb3IgaGlzIGF3YXJlbmVzcy4NCj4NCj4gUmV2aWV3
ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+DQo+PiAtLS0NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwgMiArKw0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKysrLQ0KPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gaW5kZXggMTAzMGNiMzA3MjBjLi5h
MTUxNmEzYWU5YTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+
IEBAIC0xNjksNyArMTY5LDkgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5OyAgZXh0ZXJu
IGludA0KPj4gYW1kZ3B1X21lczsgIGV4dGVybiBpbnQgYW1kZ3B1X25vcmV0cnk7ICBleHRlcm4g
aW50DQo+PiBhbWRncHVfZm9yY2VfYXNpY190eXBlOw0KPj4gKyNpZmRlZiBDT05GSUdfSFNBX0FN
RA0KPj4gICBleHRlcm4gaW50IHNjaGVkX3BvbGljeTsNCg0KI2Vsc2UNCnN0YXRpYyBjb25zdCBp
bnQgc2NoZWRfcG9saWN5ID0gS0ZEX1NDSEVEX1BPTElDWV9IV1M7DQojZW5kaWYNCg0KVGhpcyB3
YXkgeW91IGRvbid0IG5lZWQgYW5vdGhlciBzZXQgb2YgdWdseSAjaWZkZWZzIGluIGFtZGdwdV9k
ZXZpY2UuYy4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4+ICsjZW5kaWYNCj4+DQo+PiAg
ICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQ0KPj4gICBleHRlcm4gaW50IGFtZGdwdV9zaV9z
dXBwb3J0Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMNCj4+IGluZGV4IGJkNDIzZGQ2NGUxOC4uMjUzNWRiMjdmODIxIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IEBAIC0xNjIzLDcgKzE2
MjMsMTEgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQoc3RydWN0DQo+
PiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gICAJfQ0KPj4NCj4+ICAgCWFkZXYtPnBtLnBwX2Zl
YXR1cmUgPSBhbWRncHVfcHBfZmVhdHVyZV9tYXNrOw0KPj4gLQlpZiAoYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpIHx8IHNjaGVkX3BvbGljeSA9PQ0KPj4gS0ZEX1NDSEVEX1BPTElDWV9OT19IV1MpDQo+
PiArCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikNCj4+ICsJICAgICNpZmRlZiBDT05GSUdfSFNB
X0FNRA0KPj4gKwkgICAgfHwgc2NoZWRfcG9saWN5ID09IEtGRF9TQ0hFRF9QT0xJQ1lfTk9fSFdT
DQo+PiArCSAgICAjZW5kaWYNCj4+ICsJICAgICkNCj4+ICAgCQlhZGV2LT5wbS5wcF9mZWF0dXJl
ICY9IH5QUF9HRlhPRkZfTUFTSzsNCj4+DQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+bnVt
X2lwX2Jsb2NrczsgaSsrKSB7DQo+PiAtLQ0KPj4gMi4yMC4xDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
