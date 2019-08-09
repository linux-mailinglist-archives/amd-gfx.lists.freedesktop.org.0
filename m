Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593598704E
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70186ECF4;
	Fri,  9 Aug 2019 03:49:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622D86ECF4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhHW5s3X0ncPW/fAXh60zOfWwxCPjDOaYhzSg0Z2D/5RmV3oavaA7df1CNFY8HZRDjzfc3Jf/V9xml5DKtl9lr+mGTf0i5rpbP7mBIXpAavBbvcZQto9E5JhJikMEWBKxj+m4XzY4z0trWr+9NI6szvN0H4G8LgUw3pVNU1hNslJax6eVWiKUzgm0AYsohm4n5R7DWSDZdt0RhDVzwwVnx5JJnGR7jyx5d2L6O2Bc8eaE1rIlHF002v2bLZO8YlE4nMGGMxTk1FcEBp/xbmxjyGRRlWG+InK5qt5NZwwdkAviozCX2Jl0q9iemOzoOcySKMdI3sCCPPMjUcVZu5FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jukx4hbOVGTd+WXHuLR+urQEZFNxuq82OkwMdZeJBA=;
 b=nrxWqHoAoEj6WRjlbVMs8PCtyLulTCNMeSI2hhR4MVJZ1gsvMpv5JxR03c1ZtYV72Gxicj+yRMKV1qnQJ+i6Yrk+T0JCh/MoEsxFAfBO9mjhirp1BRoMvUtZ3MOM1oSr7W6OL4Iy1rC5tm1MnePXLsGyPN5SLGA7qD1csn1FdYEW9ON62PFLcmn4/eUlG3f2gbv9kdpzfRMuKs2diAwvE7ekIhpq5jJa7ObrSg9N0MIGJjTsO9ugy3c7N9z2+aAjF+KzphjwzZ4yWy1czZFd8YZjN/pJjjUbCdnsXRyA3Ul0jrVbSQR91mKLadsYErWNEEfBWufpNSLJQ9FR1YqglQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3934.namprd12.prod.outlook.com (10.255.238.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 03:49:46 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:49:46 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 7/9] drm/amdgpu: enable sdma clock gating for Arcturus
Thread-Topic: [PATCH 7/9] drm/amdgpu: enable sdma clock gating for Arcturus
Thread-Index: AQHVTdMpBk4XAElP3EK2K5n2Mb2eY6byL0Vw
Date: Fri, 9 Aug 2019 03:49:46 +0000
Message-ID: <MN2PR12MB3598777EF2C2B94E1589E7118ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-7-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-7-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95a01981-453a-4b05-e287-08d71c7c9f28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3934; 
x-ms-traffictypediagnostic: MN2PR12MB3934:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3934C510229C82F8D99C46C48ED60@MN2PR12MB3934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(13464003)(189003)(199004)(52536014)(14454004)(25786009)(76116006)(3846002)(186003)(33656002)(6436002)(6116002)(2906002)(81156014)(66066001)(6506007)(53546011)(102836004)(6246003)(53936002)(76176011)(81166006)(229853002)(7696005)(7736002)(74316002)(305945005)(316002)(71200400001)(8676002)(55016002)(478600001)(8936002)(71190400001)(110136005)(9686003)(966005)(6306002)(64756008)(4326008)(99286004)(446003)(26005)(476003)(11346002)(5660300002)(486006)(2501003)(256004)(14444005)(66446008)(66946007)(66556008)(66476007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3934;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EWFrjbFLtXhQ6gdNFvfMOBsft5rxoIfiit8ZWe1JdCNJibS8DwPvjbZfzeOb/AwsM9UNx1SMnvFtGc8VnxjBkp1BFUhjtPH6gCYTF7qwN02du6aLP5AWOASN7uQqs1Q4TWzkrrSUstX1CSjEjZFrjUAwcP79DIsH3MMT/lUj3TVJ2NPsVaEaw7pKfMUwBFqz5dN5755z7lc9NMqNF0OYScHTvJhVDHmpzs5u3ndTZ01LN2FuZEAzKZeowCckSOHg5Uy2MaoybZ+jD1wg19/r6B1yzQ6IxyLk7XqrEgG0hb1tv8vwdKSNTIDYf2KhHWHVlOJymlvkIpvpUNlbZCX7oAfNfqfitnh6x2NMS2YVoBnn97Vdvu3aorRA4HITwRG+9JRGPwLk+F1kRSOL3Zpp4wf1TOzhqYg40PJvcIjNEUU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a01981-453a-4b05-e287-08d71c7c9f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:49:46.5385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81f1jFhmrsWU2Y2pvVc9ditZJ1qPi9whUuil5qatDKru75ugjYba0hc1iyVn0ieT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jukx4hbOVGTd+WXHuLR+urQEZFNxuq82OkwMdZeJBA=;
 b=gvtTPQ+EdaxFVOZPxWKXkFYsGkd6gcdcBrLrf+RSFWxonVGRt75HbwBsoHy51XiJRoIYr6jC5A9t1/wR1uGXSC4u3063vLAa2HdMWl6zOQyWU/88uVbIzzUVIkSh5nkaDI24os3L6hLKuDDL1pUY3qW7vGqeiFOCMUlCyrmhJHQ=
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
c2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDcv
OV0gZHJtL2FtZGdwdTogZW5hYmxlIHNkbWEgY2xvY2sgZ2F0aW5nIGZvciBBcmN0dXJ1cw0KDQpb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCkluaXQgc2RtYSBNR0NHL0xTIGZsYWcNCg0KQ2hh
bmdlLUlkOiBJNjAwYjhjNjdiMWRmYTc0MjQwMjY5ZjJmMDI4OTYwYjJjOTNhMGVjMg0KU2lnbmVk
LW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jIHwgNCArKystDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IDYw
MzhkY2UuLmFkNjQ5NzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtMTAx
OSw3ICsxMDE5LDkgQEAgc3RhdGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpo
YW5kbGUpDQogICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfQ0dMUyB8
DQogICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgfA0KICAg
ICAgICAgICAgICAgICAgICAgICAgQU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfA0KLSAgICAgICAg
ICAgICAgICAgICAgICAgQU1EX0NHX1NVUFBPUlRfSERQX0xTOw0KKyAgICAgICAgICAgICAgICAg
ICAgICAgQU1EX0NHX1NVUFBPUlRfSERQX0xTIHwNCisgICAgICAgICAgICAgICAgICAgICAgIEFN
RF9DR19TVVBQT1JUX1NETUFfTUdDRyB8DQorICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0df
U1VQUE9SVF9TRE1BX0xTOw0KICAgICAgICAgICAgICAgIGFkZXYtPnBnX2ZsYWdzID0gMDsNCiAg
ICAgICAgICAgICAgICBhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDMy
Ow0KICAgICAgICAgICAgICAgIGJyZWFrOw0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
