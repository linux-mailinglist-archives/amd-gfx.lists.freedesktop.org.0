Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA3A9E66
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 11:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9B889DDD;
	Thu,  5 Sep 2019 09:30:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735D89DDD
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 09:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYxugCytnrMywctJdg1GxAA6hCMPQKJRaWh0x8+6vmsp52KzCplcvese4/6A1XN1zjDWQqoNVRMsr6GiROogNNURGNDJnLyBkxppfEV/5I0KksKfl/YFypcsEyQYYimDulVD1c/H8Lpf0VuIjQUqpT0F0GFyt+BfeOllUYG9W09V3kotwmFYAcihsnt23S2fyWSBq3x80gtxwWjmel9DBKJMAkJSTKurK77dqB+ozeq+VCr5wNP1C6MWtd04CtcplR6Sw5f2fTkJCdOfFQq92lpUyOYq9DAeU7nNj+BfCdF8DWY2gucbUhLqmf5g3b5Dz7b+FVaYo4OWNR7T+V8cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyShovn2TLaHevOj9xJYOmbMHQfiqP1ci562rzrFk/g=;
 b=lZd5kFn5R2hQ58f/slpIj7+ePyFFlE9BPzMyc3Cu1NuPbqZ2WYPJqasch8xf7u+H1tDTxi14xuNfWNdQnkaav6raRi2K2/8CT33y1YKieuS3x7uonsA3j7ylaOGoy5GfhgaWzrGwHhVSB0+mzQi5ZL7CvnurjaLfTKp96F1e7NYkc5lIJVPW42V6AGOJstvowv2+Rhe6s1/Fj0d90FeItHBQdBrRBXz/VNIJOWdz9uh36f1M9FNFQU+T20og27pVVvr+3SrXT6I31SFNAm5CnLUILe8iKJVJ3XOuo5kCeScqZ4xIydXSMjRdAlWUGw7/1jch3zuI8T0dnsB1MVWn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3471.namprd12.prod.outlook.com (20.178.242.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 09:30:16 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 09:30:16 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Topic: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Index: AQHVY8vluvawTcHLNEugyERMvsFgP6cc0UlA
Date: Thu, 5 Sep 2019 09:30:16 +0000
Message-ID: <MN2PR12MB3344F3C71E62E09B8FE203BBE4BB0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190905092526.5962-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190905092526.5962-1-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54683d82-4a21-4c33-a834-08d731e3a97d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3471; 
x-ms-traffictypediagnostic: MN2PR12MB3471:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3471AC5EFCA3B0647F0DA44DE4BB0@MN2PR12MB3471.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(189003)(199004)(13464003)(8676002)(7736002)(14454004)(33656002)(86362001)(110136005)(74316002)(8936002)(54906003)(478600001)(81156014)(81166006)(6436002)(316002)(2501003)(55016002)(229853002)(25786009)(52536014)(5660300002)(486006)(305945005)(256004)(446003)(186003)(26005)(6506007)(53546011)(76176011)(102836004)(66066001)(71190400001)(14444005)(11346002)(476003)(2906002)(7696005)(64756008)(66556008)(6246003)(66476007)(99286004)(76116006)(66946007)(9686003)(53936002)(3846002)(4326008)(66446008)(71200400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3471;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: osVhra2EsRi4f/BzYDdSwIoYxJvUFrQrd8cmWZX3sHz/CMiAA04K3kdWXA8x3RPwRT5B4OUZ3ApjcQQHb5s1FrupzhPJ+Jt3FmSBQhYgV7gIEHo6rw92Uh7irUTrH3IZjc04J3S2wzXAvO0wv4tBIMC151dVDvj7zVRYP3HTWm93hSiQK0V4wmTq8UpmwYBwbaOBS6OMbu/ZspiSrPufhBvQYavPmt5xI17BWVwuwDscQsDY/IgH/vLhLi5SSLmsJUS5BnxIH+qZ3trGUuQm33Mg+RRtqH2G0o8uvGVv0AnmYgLmf9lZ8pELJ2y8Ay7P+2luaew0SMgLcJELiWEp2PE2GHso26Ys09+NT7RBldqZa72d5jbu7rfi9h9ArDqoOQUl0t9WOgVADCYaCNPv1YbwKtzWPfOQhcFOiPpF9Hg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54683d82-4a21-4c33-a834-08d731e3a97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 09:30:16.5507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9J2FMAyjUjl3Adkme7KdCzSCofTFzdJ3iBe+fQ8XDZD11yaiQ3KwZj5HnV+wXmLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3471
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyShovn2TLaHevOj9xJYOmbMHQfiqP1ci562rzrFk/g=;
 b=FljJAijFc+3MAnH9brEEPwXjOhvObvZ84gz8Pohv9cNvPtAjo300MBQqlQtkKgZBvkA9V3u29iQQ+TJ0PxfPjUtRdRmL5rxTvjN+/hkOvqea8vz+0pTJkh5Kj9Orl41ltiaotOd/PGR2CDSWSywovi0Wj+RuNPE9Tb93WS86Aew=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFt
ZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyINeaXpSAxNzoyNg0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQu
Y29tPjsgUXVhbiwgRXZhbg0KPiA8RXZhbi5RdWFuQGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5n
KSA8S2V2aW4xLldhbmdAYW1kLmNvbT47DQo+IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBmaXggJ3VudXNl
ZGQgdmFyaWFibGUnIGNvbXBpbGUNCj4gd2FybmluZw0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGlh
b2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDIgLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgIHwgMiAtLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jICAgfCAyIC0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICB8IDIgLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwg
OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jDQo+IGluZGV4IDZlOGViMGY5NGM4Yi4uMWM2NzMyODQ3MTg1IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYw0KPiBA
QCAtMTkzMSw3ICsxOTMxLDUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzDQo+
IGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsNCj4gDQo+ICB2b2lkIGFyY3R1cnVzX3NldF9wcHRfZnVu
Y3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQo+IC0Jc3RydWN0IHNtdV90YWJsZV9jb250
ZXh0ICpzbXVfdGFibGUgPSAmc211LT5zbXVfdGFibGU7DQo+IC0NCj4gIAlzbXUtPnBwdF9mdW5j
cyA9ICZhcmN0dXJ1c19wcHRfZnVuY3M7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCj4gaW5kZXggZTNhZGQ4YjU5MjkxLi4xNjYzNGU2NTc1
ODkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMN
Cj4gQEAgLTE2MzAsNyArMTYzMCw1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5j
cyBuYXZpMTBfcHB0X2Z1bmNzDQo+ID0gew0KPiANCj4gIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVu
Y3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQo+IC0Jc3RydWN0IHNtdV90YWJsZV9jb250
ZXh0ICpzbXVfdGFibGUgPSAmc211LT5zbXVfdGFibGU7DQo+IC0NCj4gIAlzbXUtPnBwdF9mdW5j
cyA9ICZuYXZpMTBfcHB0X2Z1bmNzOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+IGluZGV4IGI3ZmE4YjE1OGZmMi4uYTVjZjg0NmI1MGQ0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+
IEBAIC0yNTcsOCArMjU3LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJl
bm9pcl9wcHRfZnVuY3MgPSB7DQo+IA0KPiAgdm9pZCByZW5vaXJfc2V0X3BwdF9mdW5jcyhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkgIHsNCj4gLQlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNt
dV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsNCj4gLQ0KPiAgCXNtdS0+cHB0X2Z1bmNzID0gJnJl
bm9pcl9wcHRfZnVuY3M7DQo+ICAJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTEyX0RSSVZFUl9J
Rl9WRVJTSU9OOyAgfSBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIw
X3BwdC5jDQo+IGluZGV4IDE4ZDFiNDMyZjcxOS4uOTI5ZjYxODkxZGZhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IEBAIC0zMTgwLDcgKzMx
ODAsNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIwX3BwdF9mdW5j
cw0KPiA9IHsNCj4gDQo+ICB2b2lkIHZlZ2EyMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KSAgew0KPiAtCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0g
JnNtdS0+c211X3RhYmxlOw0KPiAtDQo+ICAJc211LT5wcHRfZnVuY3MgPSAmdmVnYTIwX3BwdF9m
dW5jczsNCj4gIH0NCj4gLS0NCj4gMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
