Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2478702B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FDB6E193;
	Fri,  9 Aug 2019 03:28:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70546E193
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIntXMFiNwZcSvVByVOOnNO5pUd4Md3F59o8xTcp708eQW/uCDmARPaCl3jbHEPDAHfBlMClJg3zfAzeN5fQF5XpEIOuhkvkZJFsXdxWuChrVyUp0MUFICXs3sGbDnqSrlfTPVNE/q34Au+0Byos8e7lpM+MVoOkoFXjPe+rdsh2vqrMlkTnwrPx6fHI1Y6TMhSIm4nLdHbLWQSQTWm3pQCpgAJSVjNni7kAIO409WbbttA6p1rC/cYbRZZKsdEp5eTAXaR/ZRqm6uro9sueESzDom6S2dGEeC5o7I4VF1twMl/g4VMPsPLh/tYAwxK/DQhEUWOTXr2k+PPA3yefGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+W6Wslc+DMucTwXh1FCXcZJ1zagX5B4b3kQGFsd3+M=;
 b=iBmz055WGDUFZBuDX9SOiU6yBdwZPAx0HxmQR0+txTHVNANGPBoq/pbmf+6qpU6zlHyUh9t3SaGg2N2aQs4ZpU46wrs6ccjgu+aLEDDa6M/po8x4beMh7LXW6buzO3W3NILUAkuIf08Uvv5CXLr8ex6pz8aRsFHu2wad+zkKVc/WV9ojanculQJULIU9BHzt7+01x4O47ZY34CVUYjrujHLQEAMDuY3L3NmN8VdOWW8lg91iNvFT77LkBMKiz5PbjEx28NwHIkM+OkCPBPWm3uYWYcdgnEAIzH1r5js+ZY69Cjk8NqkGg9kLpSWMBWlJFe6pKSwBvT5WsvKCodbRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 03:28:04 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:28:04 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/9] drm/amdgpu: add gfx clock gating for Arcturus
Thread-Topic: [PATCH 1/9] drm/amdgpu: add gfx clock gating for Arcturus
Thread-Index: AQHVTdMh/53BuIN+B0i/Sk5p0zuRVKbyKS7w
Date: Fri, 9 Aug 2019 03:28:03 +0000
Message-ID: <MN2PR12MB359867E74AE42D19250D488B8ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c19be373-7906-4160-48f2-08d71c7996bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB31044CE768017665F44D04CB8ED60@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(13464003)(6246003)(316002)(6306002)(305945005)(11346002)(2906002)(52536014)(486006)(55016002)(478600001)(2501003)(7696005)(7736002)(3846002)(8676002)(6116002)(25786009)(66066001)(446003)(66556008)(71190400001)(71200400001)(74316002)(5660300002)(4326008)(66476007)(81166006)(81156014)(229853002)(256004)(14444005)(86362001)(8936002)(186003)(26005)(476003)(53546011)(6506007)(66446008)(53936002)(66946007)(76176011)(102836004)(6436002)(33656002)(110136005)(14454004)(966005)(99286004)(76116006)(9686003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i6A/Nx1oy2jbUH0ZJgw2G87bCkFL8Ot41QNdp/FFYgeAXdMcTV2ybhQafNYq8/bOO4rkyCFMGmsQ7c/3r+IxEchD3ii0wbrmBPXLDzQSlZyjNAHS1ICA6qQOx+8C7sabUVEIsI0n+deVQMFcqKkLaIOZZC6SSOQAlGSsFrWemgaOJY+CtXAbFOS37rKiSQ5X0WMbDtOZJQWY+NMIpgD2FkQz0yCOINRUjDfQsM9N1wOK2f3KqelAqrGi33z+CcRDM5FbEznDvzENI3aiaJGtzTN9A/XcHV7iCI9X5HQa2d/DCsP45K9GBKC5mbeeoaWQ9JOIJRyjXgyW86ylM9h5buehEfD3DK3dWAYgH/9geN8pamrABrZpew6vbE0L2zSEx3MDS4vfnRfvDBWs4sTwWEsxSAvw/NtN7Yp3jxTZIr8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19be373-7906-4160-48f2-08d71c7996bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:28:03.9263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJwGLT3tjlWUHvQ/QOoA42Gz5pgu3qOxUn9rRH1xm86CE9XIuFuXWBuKRPSVWt/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+W6Wslc+DMucTwXh1FCXcZJ1zagX5B4b3kQGFsd3+M=;
 b=Pps04CKANWJyG0ZYN1A+oWtkgDiSbB5rWrMC4uGm/ZdPbwArm81Pd56ZDyVP8aullG4+PzumqXUaiDMxXG0E0qTzbql5keWzKcorp1IGn/2kBnytfuk6ycfEXxpxFYsqQtl8u6NHAAthEGyTBVA0LSwQDdx99Pj6OywCG9XRmqY=
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
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IFRo
dXJzZGF5LCBBdWd1c3QgMDgsIDIwMTkgNjoyMiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDEv
OV0gZHJtL2FtZGdwdTogYWRkIGdmeCBjbG9jayBnYXRpbmcgZm9yIEFyY3R1cnVzDQoNCltDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KQWRkIEFSQ1RVUlVTIGNhc2UgaW4gZ2Z4IHNldCBjbG9j
a2dhdGluZyBmdW5jdGlvbi4gTm8gM2QgY2xvY2sgb24gQXJjdHVydXMuDQoNCkNoYW5nZS1JZDog
STk4OTNhMmFmZWE3ZjBiNWQ0MzNiYWExNGY0OGFlNTVhMzY1MTZmYWMNClNpZ25lZC1vZmYtYnk6
IExlIE1hIDxsZS5tYUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCBmZGQ5MGMxLi5kZTNkZTFj
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KQEAgLTQyMTgsNiArNDIx
OCw5IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX3VwZGF0ZV8zZF9jbG9ja19nYXRpbmcoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsICB7DQogICAgICAgIHVpbnQzMl90IGRhdGEsIGRlZjsNCg0K
KyAgICAgICBpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMpDQorICAgICAgICAg
ICAgICAgcmV0dXJuOw0KKw0KICAgICAgICBhbWRncHVfZ2Z4X3JsY19lbnRlcl9zYWZlX21vZGUo
YWRldik7DQoNCiAgICAgICAgLyogRW5hYmxlIDNEIENHQ0cvQ0dMUyAqLw0KQEAgLTQ0MTAsNiAr
NDQxMyw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQg
KmhhbmRsZSwNCiAgICAgICAgY2FzZSBDSElQX1ZFR0ExMjoNCiAgICAgICAgY2FzZSBDSElQX1ZF
R0EyMDoNCiAgICAgICAgY2FzZSBDSElQX1JBVkVOOg0KKyAgICAgICBjYXNlIENISVBfQVJDVFVS
VVM6DQogICAgICAgICAgICAgICAgZ2Z4X3Y5XzBfdXBkYXRlX2dmeF9jbG9ja19nYXRpbmcoYWRl
diwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0
ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7DQogICAgICAgICAgICAgICAg
YnJlYWs7DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
