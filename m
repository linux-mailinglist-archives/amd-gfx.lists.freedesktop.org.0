Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE97F240
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 11:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076006ED94;
	Fri,  2 Aug 2019 09:48:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292E76ED94
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 09:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jngq26e9VvM8Sthr62GdMutOQ97VbcmX3fNaxSmDGxo8bOaf9eQfxiMyPywAPXwD2I3I77piuQZx2DExei7sRko7Pz6iNaO0a9eZ6CQkMgZF//Y2ylZK7Sjy4IJ3FG8+jt63oI4zkU08C7HCeCV4ViOFxkvVEb1Vj9lU6tQkKaJbsJVQaOvOHKjJYYer/yxjW83pPN25WiVw7Nzd09CJlS2JVq7FFkGKpMRP+TH4jIfEdk2BM5t3uCB4rf97ebxaKAcsSQAmoUa3l7RBZJu76ITlz+OiryZIA28/Bu2pe51EkvKVT9JP3dcsVfViAIeSiIUI7D5KP7OIIRtTaTsSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRS1qNhr7LpUvijSDoJJUPVqUxDL9IaF5DVqWkoQ0nA=;
 b=JD8TcjIkCpNqwsHBtJ2bx3QieehKV1EQjvl3s94HHLgZVTEbY4zZ7v4LdGMb5EhGDeN1x/tkRiblqRdsyErXczpvJBL2sXo9Ra+IUoKV09ERs8qodQd+3P4UFuDbmj0VwhZuPTS3DPxQ3B2ukadLY3S/MvUQkTGRQMgB/jlulVgdjvmJeCYvMh2vpOU4rsSu/SBwy2L7b9x35pCby6UhUsP6RI/X2dqQXikeEtgOXlS2daJDvzO1WCpDVOji0ApJXUpFcBxW6rfVh8UOZV0UXUrgl0vmnFCAPx9AHZziG0ojp9wYc5xkJFqXMOTAA16SpnGVA9h7gQdi0y8HATMr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3214.namprd12.prod.outlook.com (20.179.83.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 09:48:09 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 09:48:09 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: correct navi10 vcn powergate
Thread-Topic: [PATCH] drm/amd/powerplay: correct navi10 vcn powergate
Thread-Index: AQHVSRRuP2TmNc1m70KgVi+c8WuAS6bnnHoQ
Date: Fri, 2 Aug 2019 09:48:08 +0000
Message-ID: <MN2PR12MB35989FB714E4A54C9AABF0BE8ED90@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190802092645.25486-1-evan.quan@amd.com>
In-Reply-To: <20190802092645.25486-1-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 972a1eee-3a3d-4dab-8f78-08d7172e8697
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3214; 
x-ms-traffictypediagnostic: MN2PR12MB3214:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB32146077BAFD6E41E3C7D4E48ED90@MN2PR12MB3214.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(13464003)(199004)(189003)(99286004)(76176011)(26005)(33656002)(55016002)(102836004)(6506007)(53546011)(256004)(966005)(305945005)(110136005)(316002)(9686003)(2906002)(68736007)(229853002)(53936002)(7696005)(14454004)(478600001)(7736002)(6436002)(66066001)(66946007)(8676002)(81156014)(81166006)(64756008)(66476007)(76116006)(8936002)(66446008)(5660300002)(52536014)(11346002)(446003)(6306002)(486006)(476003)(6116002)(66556008)(186003)(4326008)(25786009)(86362001)(3846002)(6246003)(2501003)(71190400001)(71200400001)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3214;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I+rfWdtTUfctBXQAVSxjRUVPXQzXNOsxr8EUvHkOR0I+ZzaElN/aD4TQZpqnSaLjj1Wv7t8BA8G4zzZwrLP9lca48HNokYcV9vZEVDnRtYa4l/1pafPoqQz3EQ2joaBkp55EZ/vFhmeM4ziu5WtBdGOGGZlpaMgaCl14BHnN16R9TFFyhxoB/SGlN2RFwxjiQfbMQwImZbdM3PDZ9yEL/Df3w5TFwEHe3p6IoxeGn0H0CiC+LrdCLc32QRUD5+lzJQdNpWD7JBDhyPkK+85uk1JmJHWa2rGor+Y4+yVQ+9/z0GQXXNkoSipxL6Bqa/d8mQepTPYMgLp6QjljkKNGBCiMXKClAXptxvwG2kjoUb2+gpjePvaesBT9Tgz88mchETTCb6vQ43JIE0xCP57gOjq8N+5RFVEgXka4S+Q4f2s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972a1eee-3a3d-4dab-8f78-08d7172e8697
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 09:48:08.6960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRS1qNhr7LpUvijSDoJJUPVqUxDL9IaF5DVqWkoQ0nA=;
 b=DWkrvZdxNmAjkpoRkrtUTIP8EwWD7st2RRAUUWlg8HGDIOEgCyxZcm4a/m5qiW+Iiw1AwPxX0I+WlexEpIp1xR7RcGSkmgABa9HNDwJzJOhcXw4BsIb9EmYolxoJnBJp+AfVhkPvYg5U2rXKVCBCm4TU88GX2Swa7jblt7l7yKE=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBGcmlkYXksIEF1Z3VzdCAwMiwgMjAxOSA1OjI3IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NClN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGNvcnJlY3QgbmF2aTEwIHZjbiBwb3dlcmdhdGUN
Cg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQp2Y24gZHBtIG9uIGlzIGEgcHJlcmVxdWlz
aXRlIGZvciB2Y24gcG93ZXIgZ2F0ZSBjb250cm9sLg0KDQpDaGFuZ2UtSWQ6IElmODlhODFiYzA3
MDlmMWMyNjU2OWUzNzg1MDdhODczY2ZhZjZlMGVmDQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jICAgIHwgIDQgKysrLQ0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaCAgICB8ICAxICsNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgICAgfCAyMyArKysrKysrKysrKystLS0tLS0tDQogMyBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQppbmRleCA0Yzg3M2I5NjBhZmUuLjE1ZjkxMTMxNDZl
ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQpAQCAt
NDAwLDYgKzQwMCw4IEBAIGludCBzbXVfZ2V0X3Bvd2VyX251bV9zdGF0ZXMoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsICBpbnQgc211X2NvbW1vbl9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICpkYXRhLCB1aW50MzJfdCAqc2l6ZSkgIHsNCisgICAgICAgc3RydWN0IHNt
dV9wb3dlcl9jb250ZXh0ICpzbXVfcG93ZXIgPSAmc211LT5zbXVfcG93ZXI7DQorICAgICAgIHN0
cnVjdCBzbXVfcG93ZXJfZ2F0ZSAqcG93ZXJfZ2F0ZSA9ICZzbXVfcG93ZXItPnBvd2VyX2dhdGU7
DQogICAgICAgIGludCByZXQgPSAwOw0KDQogICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7DQpAQCAt
NDI0LDcgKzQyNiw3IEBAIGludCBzbXVfY29tbW9uX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwNCiAgICAgICAgICAgICAgICAq
c2l6ZSA9IDQ7DQogICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgIGNhc2UgQU1ER1BVX1BQ
X1NFTlNPUl9WQ05fUE9XRVJfU1RBVEU6DQotICAgICAgICAgICAgICAgKih1aW50MzJfdCAqKWRh
dGEgPSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfVkNOX1BHX0JJVCkg
PyAxIDogMDsNCisgICAgICAgICAgICAgICAqKHVpbnQzMl90ICopZGF0YSA9IHBvd2VyX2dhdGUt
PnZjbl9nYXRlZCA/IDAgOiAxOw0KICAgICAgICAgICAgICAgICpzaXplID0gNDsNCiAgICAgICAg
ICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVsdDoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KaW5kZXggMWVjZDczY2Q3NjhjLi4yNTc5YjAw
MjYxNmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oDQpAQCAtMjc3LDYgKzI3Nyw3IEBAIHN0cnVjdCBzbXVfZHBtX2NvbnRleHQgeyAgc3Ry
dWN0IHNtdV9wb3dlcl9nYXRlIHsNCiAgICAgICAgYm9vbCB1dmRfZ2F0ZWQ7DQogICAgICAgIGJv
b2wgdmNlX2dhdGVkOw0KKyAgICAgICBib29sIHZjbl9nYXRlZDsNCiB9Ow0KDQogc3RydWN0IHNt
dV9wb3dlcl9jb250ZXh0IHsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMNCmluZGV4IGYzYWRiNzEzNzg0YS4uYjdiYjBmNzhmNDg5IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCkBAIC01OTAsMjAgKzU5MCwyNyBAQCBz
dGF0aWMgaW50IG5hdmkxMF9zZXRfZGVmYXVsdF9kcG1fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpDQoNCiBzdGF0aWMgaW50IG5hdmkxMF9kcG1fc2V0X3V2ZF9lbmFibGUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKSAgew0KKyAgICAgICBzdHJ1Y3Qgc211X3Bvd2Vy
X2NvbnRleHQgKnNtdV9wb3dlciA9ICZzbXUtPnNtdV9wb3dlcjsNCisgICAgICAgc3RydWN0IHNt
dV9wb3dlcl9nYXRlICpwb3dlcl9nYXRlID0gJnNtdV9wb3dlci0+cG93ZXJfZ2F0ZTsNCiAgICAg
ICAgaW50IHJldCA9IDA7DQoNCiAgICAgICAgaWYgKGVuYWJsZSkgew0KLSAgICAgICAgICAgICAg
IHJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfUG93ZXJVcFZj
biwgMSk7DQotICAgICAgICAgICAgICAgaWYgKHJldCkNCi0gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgLyogdmNuIGRwbSBvbiBpcyBhIHByZXJlcXVp
c2l0ZSBmb3IgdmNuIHBvd2VyIGdhdGUgbWVzc2FnZXMgKi8NCisgICAgICAgICAgICAgICBpZiAo
c211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZDTl9QR19CSVQpKSB7DQor
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0o
c211LCBTTVVfTVNHX1Bvd2VyVXBWY24sIDEpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHJldCkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAg
ICAgICAgICAgICB9DQorICAgICAgICAgICAgICAgcG93ZXJfZ2F0ZS0+dmNuX2dhdGVkID0gZmFs
c2U7DQogICAgICAgIH0gZWxzZSB7DQotICAgICAgICAgICAgICAgcmV0ID0gc211X3NlbmRfc21j
X21zZyhzbXUsIFNNVV9NU0dfUG93ZXJEb3duVmNuKTsNCi0gICAgICAgICAgICAgICBpZiAocmV0
KQ0KLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAgICAgICAgICBp
ZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX1ZDTl9QR19CSVQpKSB7
DQorICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01V
X01TR19Qb3dlckRvd25WY24pOw0KKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAgICAgICAg
ICB9DQorICAgICAgICAgICAgICAgcG93ZXJfZ2F0ZS0+dmNuX2dhdGVkID0gdHJ1ZTsNCiAgICAg
ICAgfQ0KDQotICAgICAgIHJldCA9IHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgU01VX0ZF
QVRVUkVfVkNOX1BHX0JJVCwgZW5hYmxlKTsNCi0NCiAgICAgICAgcmV0dXJuIHJldDsNCiB9DQoN
Ci0tDQoyLjIyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
