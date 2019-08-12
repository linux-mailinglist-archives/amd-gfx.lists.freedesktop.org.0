Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFB896F3
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 07:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5DD6E48F;
	Mon, 12 Aug 2019 05:41:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710042.outbound.protection.outlook.com [40.107.71.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9D6E48F
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 05:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4wWRvSevJm9bfg8cP1f2AjZrpUj2dW/GuLN89lQiCc736jsgNsPTT9ELioIU+eI08Sl+Iuv4Vh2ljfgm+DPWgOqe3TODG9KTEw+mT5b9afw79dRvIhzpDia6AeBd7YSQMLsq4YoEU1layeCMCWQykbsCzFJ3ev4RlvaIQZXM3h2ne4whv+v0lpY7kE4WepiEd2xHtd/X9gjRQbV2N8WgXsJGg6YLzhFW85STUelUN9gyklaFqhCj51/iYpJ0uzv2ky95B0D3yeafxJFksHR0Tg7xcJFlpXB2BsT9fNU4R8SC+9BfhuvUvgb5PxJx14Eg5Q+52wDhEsdc5DA2yvHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/ABKkgrVFyLG7oEm6h+118Ogb07fBFyJ62Fyn9zkpY=;
 b=dXmib4RO0oOwM/q8vGcmB1Ed281E0xqCrFG6F/tIDAWGfUGLHwoiP/rr515vc5UWAv9Cq5Kxw4TS2jHuThV5Pz5rOdCltC3KuGds83TTRho1g6btvmrKX/O1YdmjFrNz6RggF0jrNUEqW3idCXX73+3u0ZguvXGtHtP4kf8IUaFUeZ8xvXdXniUy+VU9eO5qDWhUVMTpq9GRn0Ls/QHKIwEs6NrHHpbz5Nz9GaiZNflauPPxxhFiLsGJZ6MatcDJKUUpb8a6bsFt5vpehgUHipLYFtitdLTYb+4LNDW0TAev70hoScAtiUoIL4dhC70FOjo8rYd71BDwOFakwLBykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4175.namprd12.prod.outlook.com (52.135.48.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Mon, 12 Aug 2019 05:41:06 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.020; Mon, 12 Aug 2019
 05:41:06 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: enable mmhub clock gating for Arcturus
Thread-Index: AQHVTqVxl4iU4NA2yU+GtAOaR4Wqpqb3A6yA
Date: Mon, 12 Aug 2019 05:41:05 +0000
Message-ID: <MN2PR12MB359843FA47B82A1253E72A418ED30@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
 <1565350016-7071-4-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-4-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18983bb5-75d8-4f41-619e-08d71ee7ab9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4175; 
x-ms-traffictypediagnostic: MN2PR12MB4175:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417550FF6F273260B5D1221D8ED30@MN2PR12MB4175.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(13464003)(966005)(86362001)(53936002)(71190400001)(71200400001)(26005)(486006)(6306002)(66066001)(9686003)(229853002)(3846002)(6116002)(256004)(8936002)(7736002)(81156014)(81166006)(186003)(4326008)(74316002)(305945005)(2501003)(6436002)(8676002)(110136005)(25786009)(52536014)(102836004)(6246003)(478600001)(2906002)(6506007)(53546011)(7696005)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(11346002)(316002)(55016002)(446003)(5660300002)(33656002)(476003)(99286004)(14454004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4175;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fyD44UN39ceA4/VVLrIYZHCaqtTm9ZtsQYwCbfQuE52gffaJ69MpJ+JLqIV87BS7LVDMSCyrCSPFAa5+5aEIwIAGsuqC8vKXl9ZjXNy/bR90Wt2OYEg1S5Hqju1Y26VxnQx2rRnADYgkba1IUzWeNMmQ09lCpGGpkfuwjIUW9tnsKzWRmktHZFuW1LrZa9SauSGHVIAXqC9MgeiuqSsEsolWoYnp1Txqj2UjC6yyWn4ZBecFWcFNGiUpUwaT5wACbXtU4MUbfPa61zv+bRLj80NOHmDylfIMyCmrIw5GXoz14oWmn/8w5/yabfaXM+5DC1znoGRIXyfhhZflYgKsAFasFw6vjRWbn9QB6ZqLDzCzIV/2fQHj6sFdXSC1gg1dG8bC/Q/WtZBjqFH7TtWKsSXJRA8NQlVptcTS2FEZ14c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18983bb5-75d8-4f41-619e-08d71ee7ab9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 05:41:05.9706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cJrkTmIho5eh3BtTtxhizBdJ/OKHhH2/SO8WWCQq3wB5nO8MnY/bnW/KTLmD2iA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/ABKkgrVFyLG7oEm6h+118Ogb07fBFyJ62Fyn9zkpY=;
 b=EpnN0OXcAW28oSkAgF1bA7PnsaEjxdEvYvQmFvBZeHxIvvyD4L3SnB6JoofGUbNXj7B2/iJ9HRvd4TK9FHzYAqVueTuAK6m/TZ4BXHJiqmtmsOMdCCv+IY1wJmE+73sEWAg58iGdt7vPIfsop0oIsXNQbri+dFNQxrJA1AACre0=
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IEZy
aWRheSwgQXVndXN0IDA5LCAyMDE5IDc6MjcgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCA0LzRd
IGRybS9hbWRncHU6IGVuYWJsZSBtbWh1YiBjbG9jayBnYXRpbmcgZm9yIEFyY3R1cnVzDQoNCltD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KSW5pdCBNQ19NR0NHL0xTIGZsYWcuIEFsc28gYXBw
bHkgdG8gYXRodWIgQ0cuDQoNCkNoYW5nZS1JZDogSWMwMGNiOGU2ZDY5ZWI3NWRkMzJmMzRmNzc4
MzUyY2VlOTMwNjNlZTANClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIHwgMSAtDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgIHwgNCArKystDQogMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tbWh1Yl92OV80LmMNCmluZGV4IGU1MmU0ZDEuLjBjZjdlZjQgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuYw0KQEAgLTYxNSw3ICs2MTUsNiBAQCBpbnQg
bW1odWJfdjlfNF9zZXRfY2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQog
ICAgICAgIHJldHVybiAwOw0KIH0NCg0KLS8qIFRPRE86IGdldCAyIG1taHViIGluc3RhbmNlcyBD
RyBzdGF0ZSAqLyAgdm9pZCBtbWh1Yl92OV80X2dldF9jbG9ja2dhdGluZyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdTMyICpmbGFncykgIHsNCiAgICAgICAgaW50IGRhdGEsIGRhdGExOw0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCBhZWNiYTFjLi4yMzVjYjViIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KQEAgLTExMjYsNyArMTEyNiw5IEBAIHN0YXRp
YyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KICAgICAgICAgICAg
ICAgICAgICAgICAgQU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfA0KICAgICAgICAgICAgICAgICAg
ICAgICAgQU1EX0NHX1NVUFBPUlRfSERQX0xTIHwNCiAgICAgICAgICAgICAgICAgICAgICAgIEFN
RF9DR19TVVBQT1JUX1NETUFfTUdDRyB8DQotICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0df
U1VQUE9SVF9TRE1BX0xTOw0KKyAgICAgICAgICAgICAgICAgICAgICAgQU1EX0NHX1NVUFBPUlRf
U0RNQV9MUyB8DQorICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9NQ19NR0NH
IHwNCisgICAgICAgICAgICAgICAgICAgICAgIEFNRF9DR19TVVBQT1JUX01DX0xTOw0KICAgICAg
ICAgICAgICAgIGFkZXYtPnBnX2ZsYWdzID0gMDsNCiAgICAgICAgICAgICAgICBhZGV2LT5leHRl
cm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDMyOw0KICAgICAgICAgICAgICAgIGJyZWFr
Ow0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
