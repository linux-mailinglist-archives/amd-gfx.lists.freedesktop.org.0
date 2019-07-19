Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE3A6E4EB
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 13:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87F46E80A;
	Fri, 19 Jul 2019 11:19:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915E06E80A
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 11:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZp8n391Z1JrHOwkKb9jzcfO1eti1JIRPG4sUEPBffGZxEnkepXotyaqknADeJS7JiwSXIXTZkUESeH+tNMQaJvSsqdWS/b20YzEiU4Ic2V3btLNIHspAoW35pI0XIIuD1J9WIEj01dF4Yp/ICyhC7/aqSs7SighkSjC42KAUyebi0Xmpw8RDzuc6e/9jEBflawJrwTnt8+ej7lWskw5Zi/M/3xuNwJFH/xrStutM8nBtlj0t0vR3eQ8vKbQDPb/pasCXiiLr/LoWyxTYfTXR6A+Naux1gZkTHjS2qY+yvXfHVDR8qu32xylP6QXuIUICxgeJOA5Yzyu43djIjRFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwUNr8gWu3h5zY4t6ubltuAPTYdcgApkIY7v5JD3ahU=;
 b=KQ/FsrWq8E/ven9JX75DQA7idWz1e2Z+MQc5/qBx73UcFdz+AidyLCgA5+nKBi4tAsVJxWWYLVeu+XzuQTqbhRjcV1pFj0L4QD7Q5CIITRo/o2hDBL78lN8ivSXENFqyfJ+re9cfwXyxPM0a9wff3fNnGVyb3VDW5zhA4SZa0l9p2dD/g2YLwzKcDSsLm7pPTBguklN3UXmsJntqVIXfbS+vzNZ4/kiP6ZF0799gA/dPIoOHoGV2D5qzZRgi11Bm1GIG5Gte/KzkGFZjhSkKPvrRAQBbWiDDOC/8ugsJSy4rV224IVDpW3KID2/IhOrRKg+77qG1Uf3S2AAfUglvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.144) by
 BN8PR12MB3396.namprd12.prod.outlook.com (20.178.211.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 11:19:37 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502%7]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 11:19:37 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: set sdma irq src num according to sdma
 instances
Thread-Topic: [PATCH] drm/amdgpu: set sdma irq src num according to sdma
 instances
Thread-Index: AQHVPiOmMxmhYVXXkEKFyo1qxdSZI6bRy1MQ
Date: Fri, 19 Jul 2019 11:19:36 +0000
Message-ID: <BN8PR12MB305706346F5E6B707464992DF6CB0@BN8PR12MB3057.namprd12.prod.outlook.com>
References: <1563535077-6710-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1563535077-6710-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14de396a-fa76-4c0f-0def-08d70c3afbf5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3396; 
x-ms-traffictypediagnostic: BN8PR12MB3396:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB33969563BE51E357201B7B02F6CB0@BN8PR12MB3396.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(13464003)(66066001)(71190400001)(476003)(71200400001)(11346002)(66476007)(86362001)(446003)(76176011)(66946007)(5660300002)(2906002)(66556008)(74316002)(6246003)(68736007)(26005)(7696005)(8676002)(53546011)(229853002)(2501003)(6506007)(6436002)(64756008)(66446008)(8936002)(14454004)(33656002)(81156014)(3846002)(55016002)(99286004)(486006)(9686003)(76116006)(6306002)(7736002)(478600001)(52536014)(316002)(6116002)(966005)(102836004)(25786009)(256004)(305945005)(110136005)(4326008)(53936002)(81166006)(14444005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3396;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8goGWQEBPAsCZGR8EaU+I9zKGuxajHCqoW6/FgTbtaT9g3o2y8rVzeOEYB1+8pYkWP4SOB0cJR2fXFrUg8FKyyOrJWnWf4OH1A6lBWw8/A0mQptAQtX/o1pXzw9EnsbHJYsxXrs6OJU7bGGWx/i+g0gaE8SNepFODRY4KlnXQdIjHh95GRBVYiE3A3Vs1h7w6Pw4ACuRkoKpm0yMqAP0yKvwMAEyGdEClZHvjqeigxpFAOHO/wHE9pFO5Cy6sxaPKhSC9/FkIPO3fardLFtjYVRdHocC86h3kCxA0ZT4RfLlHLE638PGB9sPAdE2JQxdFEVQYbXSqz8laJS1jQBJRCfUqcEucL+pU4cLKUWgHq1Ly+x/HGZrjQAo15M7UsYZRwHDfp9JZaqg3J6YEi0lnCVGU8nhqLfdNAd5OZs2Yjc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14de396a-fa76-4c0f-0def-08d70c3afbf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 11:19:36.9452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3396
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwUNr8gWu3h5zY4t6ubltuAPTYdcgApkIY7v5JD3ahU=;
 b=LzzzPdIyVYngWd+rlGvP0X296Yw9PaCqJMXz5PHUq92MaYssrwbMFubZqvFIt6uLvkcALHq43YOHPbhv6RENK91PjdTavnz3WYgwghM6pnooA6+IORPrT9QQmPODt1zzNvsmW4VLRSFQv0ULusTpgGd708BovCkSXwwTYlIBJ2k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5NYUBhbWQuY29tPg0KDQpSZWdhcmRzLA0KTWEgTGUNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBIYXdraW5nIFpoYW5nDQpTZW50
OiBGcmlkYXksIEp1bHkgMTksIDIwMTkgNzoxOCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBNYSwgTGUgPExlLk1hQGFtZC5jb20+DQpDYzogWmhhbmcsIEhhd2tpbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogc2V0IHNk
bWEgaXJxIHNyYyBudW0gYWNjb3JkaW5nIHRvIHNkbWEgaW5zdGFuY2VzDQoNCk90aGVyd2lzZSwg
aXQgd2lsbCBjYXVzZSBkcml2ZXIgYWNjZXNzIG5vbi1leGlzdGluZyBzZG1hIHJlZ2lzdGVycyBp
biBncHUgcmVzZXQgY29kZSBwYXRoDQoNClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjRfMC5jIHwgMTcgKysrKysrKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMNCmluZGV4IGMyMWIyNDcuLmExYzJkMjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMNCkBAIC0yNDIxLDEwICsyNDIxLDIzIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mgc2RtYV92NF8wX2VjY19pcnFfZnVuY3MgPSB7DQog
DQogc3RhdGljIHZvaWQgc2RtYV92NF8wX3NldF9pcnFfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpICB7DQotCWFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NE
TUFfSVJRX0xBU1Q7DQorCXN3aXRjaCAoYWRldi0+c2RtYS5udW1faW5zdGFuY2VzKSB7DQorCWNh
c2UgMToNCisJCWFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJR
X0lOU1RBTkNFMTsNCisJCWFkZXYtPnNkbWEuZWNjX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RN
QV9JUlFfSU5TVEFOQ0UxOw0KKwkJYnJlYWs7DQorCWNhc2UgODoNCisJCWFkZXYtPnNkbWEudHJh
cF9pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0xBU1Q7DQorCQlhZGV2LT5zZG1hLmVj
Y19pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0xBU1Q7DQorCQlicmVhazsNCisJY2Fz
ZSAyOg0KKwlkZWZhdWx0Og0KKwkJYWRldi0+c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURH
UFVfU0RNQV9JUlFfSU5TVEFOQ0UyOw0KKwkJYWRldi0+c2RtYS5lY2NfaXJxLm51bV90eXBlcyA9
IEFNREdQVV9TRE1BX0lSUV9JTlNUQU5DRTI7DQorCQlicmVhazsNCisJfQ0KIAlhZGV2LT5zZG1h
LnRyYXBfaXJxLmZ1bmNzID0gJnNkbWFfdjRfMF90cmFwX2lycV9mdW5jczsNCiAJYWRldi0+c2Rt
YS5pbGxlZ2FsX2luc3RfaXJxLmZ1bmNzID0gJnNkbWFfdjRfMF9pbGxlZ2FsX2luc3RfaXJxX2Z1
bmNzOw0KLQlhZGV2LT5zZG1hLmVjY19pcnEubnVtX3R5cGVzID0gQU1ER1BVX1NETUFfSVJRX0xB
U1Q7DQogCWFkZXYtPnNkbWEuZWNjX2lycS5mdW5jcyA9ICZzZG1hX3Y0XzBfZWNjX2lycV9mdW5j
czsgIH0NCiANCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
