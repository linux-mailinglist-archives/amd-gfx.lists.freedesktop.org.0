Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FD85F7C
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABFF6E81D;
	Thu,  8 Aug 2019 10:25:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A46E81D
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfIf87SsZfUm7fWLSKHYRUJzCXfPexyLOFKeWCbRDI1xIUAl6mpjEijSI2pZpTSx+d7lymA/gYzc/B5AmdbsJZ9Bmb7m+l9po58W9Ta9tm36pIc0CHCtSZCuT0XCXfz+lNoyfTtF5+QE9r0mvLyjmw6qhHWhFqlkP2hH/sw+/6MQALUjEf3rq6V4Zlpw8zmhkMmgvoduuHJn11khWEDYeJDrH1BoVxVPS/b+en6thx5EP7g33dgXvLDL3sB/jWJLj7dkAhh9Dg/Qo4ZENCLFBRjiHbRZBpna2hKR5ctl2GlVJNUBRVPLccB1MtPOjgoOHV/yKYOIsd6qwVc74BWYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DULs7hGxSlCWatxRyO0+8jIy7h5DvxdK0n6PdPMNqYQ=;
 b=FAwimKDSkLOOIAHkVEZMRGJO45xMnFbpn4RwOK8bxFl2QTKsNFiMGe8iFQZNFzHgF7adzX6lo8WZmzwzs7zxVCkSoMGlAShmi0k0OJLzdw6urtzrG0iRI25QBXUaZPq+Nh4fCNBqPtOPR/MUS16VfgevDgZO/6/p9wyfGSV+I4gEvasfHLfTQsEBiYSko4oVlpFH5/4e7mXp7HfRpKOL/Ey4rowxc6Aayk+4EsTVsJNAEl6YEblPQM2qcsQ/jItMqfIqAZFU91305G7v8Y14yLtACa3hy2e8USuEBvptXM5tP1G2vEhL+6rO005/UYHOQCOCCYcVZgJzcxmfvuVVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3072.namprd12.prod.outlook.com (20.178.240.93) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 8 Aug 2019 10:25:21 +0000
Received: from MN2PR12MB3072.namprd12.prod.outlook.com
 ([fe80::19d9:42de:5029:e15]) by MN2PR12MB3072.namprd12.prod.outlook.com
 ([fe80::19d9:42de:5029:e15%6]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 10:25:21 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 7/9] drm/amdgpu: enable sdma clock gating for Arcturus
Thread-Topic: [PATCH 7/9] drm/amdgpu: enable sdma clock gating for Arcturus
Thread-Index: AQHVTdMo4FU3Ln3huUKpCoH59ugxNKbxCy7w
Date: Thu, 8 Aug 2019 10:25:20 +0000
Message-ID: <MN2PR12MB3072927F976AED1A0452A8E3F6D70@MN2PR12MB3072.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-7-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-7-git-send-email-le.ma@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed492132-a808-4f70-6f21-08d71beab784
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2958; 
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2958717F31FF4C52DAD85B81F6D70@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(13464003)(199004)(189003)(7696005)(966005)(25786009)(14454004)(6246003)(11346002)(256004)(86362001)(316002)(14444005)(76116006)(66946007)(66556008)(64756008)(66446008)(66476007)(99286004)(6916009)(2351001)(71200400001)(71190400001)(53936002)(2501003)(5660300002)(7736002)(8676002)(305945005)(74316002)(8936002)(486006)(6306002)(55016002)(81156014)(81166006)(9686003)(229853002)(5640700003)(6436002)(26005)(33656002)(186003)(102836004)(476003)(446003)(3846002)(52536014)(2906002)(6116002)(76176011)(478600001)(66066001)(53546011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2958;
 H:MN2PR12MB3072.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nq6siISLNitN5QgTuPD644u3l6BuaicOdqvf//ckWp3JetKcIyLvltQUM30ChF1i+Oqj8CqBvP2nagk8wmKeCcw2fU2in3BTweELBkBshMD9xP50P5Hle1SLuJg2Ww+IzkQP4vAuiELC/Ar1PhrfbZuzSzMTjVoqBsnMvFm5MEUlFUvh6kWTenJA/4ynbzCZl7I68R/MubHZLVPCqewA+ub4MAL3ZmJ8cPDl+Rpm01CaB+9Zk3T9YZhtO6ktRny/0cmG76AFesh4DyHdZGrdNbFuhSigFV5CHtC5kg7701x/7KilxeRqq8oLd/MIn26qeyyRrnxQLlkSFuFlL+5TNunT18sdFWBG4mvriQ2HUoFBIOSCCW6nHOHqDmVLSF4tKq49y8uodWCLZoB9vX236sAanaxZJ7cTBx9/XKKMBx0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed492132-a808-4f70-6f21-08d71beab784
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 10:25:20.7993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DULs7hGxSlCWatxRyO0+8jIy7h5DvxdK0n6PdPMNqYQ=;
 b=mVXIcTNVVmNkT7XFe3yl2ZiAPJvg2rMNWi7ajGkXcEiUk2Tqz+PGwdHvYL9GVvtqlXNRHgQWu8eYlTPet8tCsx45k2WL9sb67dvN2utKVB+TdtRQIKi+cWhUJcbdRQKHSIOU+2dVUOyCFAL2ZNyy/KNg1z19rzzNaZFF1MWHR1Q=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgb25seSBjb250YWlucyA3IHBhdGNoZXMuIFNvcnJ5IGZvciB0aGUgY29uZnVz
aW9uLg0KDQpSZWdhcmRzLA0KTWEgTGUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBMZSBNYQ0KU2VudDogVGh1cnNkYXksIEF1Z3VzdCAwOCwgMjAxOSA2OjIyIFBNDQpU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBNYSwgTGUgPExlLk1hQGFtZC5j
b20+DQpTdWJqZWN0OiBbUEFUQ0ggNy85XSBkcm0vYW1kZ3B1OiBlbmFibGUgc2RtYSBjbG9jayBn
YXRpbmcgZm9yIEFyY3R1cnVzDQoNCkluaXQgc2RtYSBNR0NHL0xTIGZsYWcNCg0KQ2hhbmdlLUlk
OiBJNjAwYjhjNjdiMWRmYTc0MjQwMjY5ZjJmMDI4OTYwYjJjOTNhMGVjMg0KU2lnbmVkLW9mZi1i
eTogTGUgTWEgPGxlLm1hQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jIHwgNCArKystDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IDYwMzhkY2Uu
LmFkNjQ5NzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtMTAxOSw3ICsx
MDE5LDkgQEAgc3RhdGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
DQogCQkJQU1EX0NHX1NVUFBPUlRfR0ZYX0NHTFMgfA0KIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9D
UF9MUyB8DQogCQkJQU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfA0KLQkJCUFNRF9DR19TVVBQT1JU
X0hEUF9MUzsNCisJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFMgfA0KKwkJCUFNRF9DR19TVVBQT1JU
X1NETUFfTUdDRyB8DQorCQkJQU1EX0NHX1NVUFBPUlRfU0RNQV9MUzsNCiAJCWFkZXYtPnBnX2Zs
YWdzID0gMDsNCiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MzI7
DQogCQlicmVhazsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
