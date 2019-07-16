Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3806A0E0
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDE86E08C;
	Tue, 16 Jul 2019 03:41:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810078.outbound.protection.outlook.com [40.107.81.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16AD6E08C
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaatbEQ/O8nKgrBCInEdFh2tXbfXpO6K3WCMkq1q4rELWjKQSKiwX+ffiVig4fNOjUfuxql9YXZvNNLjOsMD2EzF6j5IxUso43eE/UrDv5jd6+Opz1Dh7mmDkqZ+KfsknsJ6v7UgkeINOcPe0ZFWYrdq6fBBVwAup4BPUA8fB49KmsOhJFcG8JXQycmNNIm3d5wNSbLuwJklQSQfUjY7MCyqQTYVIUKuoCXjWHz/HZITJsx7c7yLSA5oSHRsvhlQuczhgRecxIqnK1HXVbBQQyecVZ2IJyijYhxGKwESf7cJExNWHor0pTJlNd2po/v4oVbMo+1Ji2EOaiwGcunS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evLUTak7AS4eCCb8SpopCztawsqqKZWNfWRKvUwQyLE=;
 b=I1ZDZ3NGx4ZV0Igx1DgQx9b2Ca2FiG+NUJ/M3sVzUFIXiBa8cG9I+m3sN1bDckiz+KWI8pCHRr/Ui0Bf7NUmDSOoal/CLVyiM8X7s8coaZeD+K9PhZiJz2xLfw8HSSyx8hTjanwJFp7jgcXmV343KteAPHxQzFqtu1N91qxP4cThACgfXxr630P5wRCiuRIeD8t1neqHl+iuyR8XiRqQWBWPGcmCcQZZ1ejg8ltq+A3vOSvkJfRrZ26/oB62cGE/qmHTZNbZDlMlibYsDkYCkdJetVMLPinYecY6uBZnV/is/mRZoAuo4f+tpvJPvSrJ4ZiO0B2jzGizdrnVF57R8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3133.namprd12.prod.outlook.com (20.178.241.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 03:41:25 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::69c2:5f32:2f63:5c]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::69c2:5f32:2f63:5c%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 03:41:25 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] SWDEV-196010 Calltrace caught in amdgpu_vm_sdma.c file
Thread-Topic: [PATCH] SWDEV-196010 Calltrace caught in amdgpu_vm_sdma.c file
Thread-Index: AQHVO4PQK97zv8gwN0KQhJzujO756abMmY9w
Date: Tue, 16 Jul 2019 03:41:25 +0000
Message-ID: <MN2PR12MB39336BD78BF1438F7BD1681984CE0@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d42c69f6-f91f-436a-71e5-08d7099f7a5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3133; 
x-ms-traffictypediagnostic: MN2PR12MB3133:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB31339E894D1B7848884F978D84CE0@MN2PR12MB3133.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:221;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(13464003)(199004)(189003)(2906002)(5660300002)(3846002)(81156014)(966005)(478600001)(74316002)(2501003)(305945005)(7736002)(68736007)(66946007)(110136005)(66556008)(66476007)(66446008)(33656002)(52536014)(8936002)(6116002)(316002)(81166006)(8676002)(229853002)(76116006)(9686003)(26005)(6506007)(486006)(7696005)(476003)(6436002)(64756008)(66066001)(446003)(53936002)(11346002)(99286004)(53546011)(6306002)(14444005)(186003)(86362001)(102836004)(14454004)(71190400001)(71200400001)(6246003)(55016002)(256004)(76176011)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3133;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iSnMha77Lpywz2AYEgRTkwgnSRrzA43eHt50SGKdx1lfrTM9DMOWOWdxB3e1WG1PD2hGNNbp+wUAPRXV3AJP5hgPxB32Ei89NOSsdYpU54LEQ6uJEgKmZGUNq+Xf5T7yf+bm/v/jFmpz3S116uuVbqI36oUVqKQx65e/t+6owfuNtU6N7CJnVxq/EyboMAiWRolwLVsBxlrW5+l2qJbD5jQqZeJ5VDnc/le6QI8GC63ZmJLjZ/Un/ouMrGw+BbWTumPdmuPVsbeHTL50tE945pCFDOuvyAUMioitX/LxSGxTULOyPH3fhmcRwWsMvisBFBzkp9gPIP5GPCPL/xq6uImd9isbA084SPvS3kKc54vb4L1u6r6oTCuuY0cCiHh6IUtDylpk/4DMIFH4qLPy2qvKQiQE0ybQv/lvr/FttUI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42c69f6-f91f-436a-71e5-08d7099f7a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:41:25.2713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evLUTak7AS4eCCb8SpopCztawsqqKZWNfWRKvUwQyLE=;
 b=hmpZO0/zv6g+e01Zda/akt1yUp0SIjuZZMlivdKiQnGOv2JWs3VgeGbkgtkOsk/16QnAIKo5skcfwuDnffvv09D/i95Sof1RKEVcX6soX1Lkau/IuC+oZ9TWthzyDXvx1ivSU1X9tFERox6xoUKFpgPXgdq+/fdeN/WlugIP620=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

UGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLCBsb29rcyA2NDNkMTQ2Yzg2YzJmMWUyOWNiMThkYjkz
ZmJjZDJlZTQzZTY5NTlmICAgYWxyZWFkeSBhZGRyZXNzZWQgdGhlIGlzc3VlLg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpNb25rIExpdXxHUFUgVmlydHVhbGl6YXRp
b24gVGVhbSB8QU1EDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBN
b25rIExpdQ0KU2VudDogVHVlc2RheSwgSnVseSAxNiwgMjAxOSAxMTowOSBBTQ0KVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29t
Pg0KU3ViamVjdDogW1BBVENIXSBTV0RFVi0xOTYwMTAgQ2FsbHRyYWNlIGNhdWdodCBpbiBhbWRn
cHVfdm1fc2RtYS5jIGZpbGUNCg0KZG9uJ3QgY29tbWl0IHNkbWEgdm0gam9iIGlmIG5vIHVwZGF0
ZXMgbmVlZGVkIGFuZCBmcmVlIHRoZSBpYg0KDQpTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9u
ay5MaXVAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jIHwgMTIgKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCmlu
ZGV4IGFlYmE5ZTYuLmZmNmQzN2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMNCkBAIC0xMzA0LDkgKzEzMDQsMTUgQEAgaW50IGFtZGdwdV92bV91cGRhdGVfZGlyZWN0
b3JpZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJZ290byBlcnJvcjsNCiAJfQ0K
IA0KLQlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29tbWl0KCZwYXJhbXMsICZ2bS0+bGFzdF91cGRh
dGUpOw0KLQlpZiAocikNCi0JCWdvdG8gZXJyb3I7DQorDQorCWlmIChwYXJhbXMuaWItPmxlbmd0
aF9kdyA+IDApIHsNCisJCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgJnZt
LT5sYXN0X3VwZGF0ZSk7DQorCQlpZiAocikNCisJCQlnb3RvIGVycm9yOw0KKwl9IGVsc2Ugew0K
KwkJYW1kZ3B1X3NhX2JvX2ZyZWUoYWRldiwgJnBhcmFtcy5pYi0+c2FfYm8sIE5VTEwpOw0KKwl9
DQorDQogCXJldHVybiAwOw0KIA0KIGVycm9yOg0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
