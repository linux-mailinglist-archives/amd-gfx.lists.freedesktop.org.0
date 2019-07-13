Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC4678DC
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jul 2019 08:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880136E3B7;
	Sat, 13 Jul 2019 06:43:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03DA6E3B7
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jul 2019 06:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXKoGewZZRGG7dB8g9p0pDDM9xYn8huFjIKc3Gfdl8vF0NOLYH2ZEMKMVgs+LSoqhU0JGAkAQ4TIyoUx7dYpwkrvxWaSsRV746cvZRlMwFaYi+vx28U4upw+oqRR+KcRcw7wWAaiQXtfuaiqzl+bl8X5I/IIkJ+4wNGsi9so6QERI/Sg8Fj7RQHazsni0ZuesQj+b2JiYrWhvFiMbdNnrzElTkR4sUlU23GIcMzgYSGiqvjQWUaBjg+YdABsASmzPSRKlc9TX7Fxd1C5ws6bZmylhBF7MFRI3ponc+ENC/B2JjLVV+wu/Q/xtEE54t8rU8qdw3LhGjgxrUmeMPhnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23169jDacgSjLDHhH489uaaKqLBYfxE2wgV+if9UOos=;
 b=GzmAd+Hef1BaV+czfQQZ6ecODjxzK78Ka3Me1qsYgcZnMt2CrmJirfGioO8AI2E7UStC9ikQpeH7X8zBuOrJTq0DJUZGwMaeQp5/KNGAZB1MXn1YFq1dq/o/pqykId7/EKSHsmEIFGnsXz/GK1ansc6bq7+L98Xt0SeMnY0T72A1OdLTodd8i7+Y91MYdp+NBQqJuo4WjrFkRwHtqAApjJ591ATXfBYBzpyCnLN3IwLbqjNuigfX0MFgaHoS5KbnPJPA5+JYJu/yV3wNxnbI6o5/hfXC5e8Dwp1PaeVr9Ai1nHGEgXhyqXV7y3GDWvu3dPTXbkpa00tVgUqeGQXWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3067.namprd12.prod.outlook.com (20.178.30.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Sat, 13 Jul 2019 06:42:57 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Sat, 13 Jul 2019
 06:42:57 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix unaligned memory copies
Thread-Topic: [PATCH] drm/amdgpu: Fix unaligned memory copies
Thread-Index: AQHVOUY1mUr1shoMF028xXTNkO7iQw==
Date: Sat, 13 Jul 2019 06:42:57 +0000
Message-ID: <20190713064245.20097-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 016ad8dd-4463-4845-b5e4-08d7075d5765
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3067; 
x-ms-traffictypediagnostic: DM6PR12MB3067:
x-microsoft-antispam-prvs: <DM6PR12MB306707CF69202D20A4D0873392CD0@DM6PR12MB3067.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 00979FCB3A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(189003)(199004)(6486002)(186003)(8676002)(26005)(2616005)(476003)(1076003)(71190400001)(2501003)(14454004)(71200400001)(6512007)(6436002)(5640700003)(2906002)(53936002)(25786009)(99286004)(66446008)(64756008)(66476007)(66556008)(316002)(256004)(6916009)(36756003)(68736007)(478600001)(305945005)(7736002)(5660300002)(6506007)(52116002)(102836004)(386003)(66066001)(86362001)(81156014)(486006)(50226002)(81166006)(8936002)(3846002)(2351001)(66946007)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3067;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eGaiVKp7XtFZ0gb11SKbrOx6NfNJA7W+10IHQQ8UAV9rgTmQdKtyPNL/0VOzs4M+o+0L5ybd0u/LyOCnMW9A66zUXtGZDr8djiQ8rdqCfpP60IaS934XIW3ii/J59iiIuspRFxSPCwv+fKvoMGOARmrdsW4NdyAxsQY0+jK2QLF5JuDs8n3wW/B2tZ51kRwTNJrvN9YUlsQnc9DHHWz/d4aj6cEJ0frVM9gEfAuvkjqoqLTkEJ+RmEec/O5GjXP3rDyFm5b7rWgupTjIS4g5g7zPCAGd/Ly65V24JYMyBbAEroDGNQ7C6rs+yOrnku7mffTVsDUj8Uw3d4e5GBdGFkFYUI3qb7wcS4+YuTK7bc2w8yiymwsgDhffU8mWXsHDzRpk+fZU2NQLd8JXGAVy2s85z4a8Z21lvIEP6raOutE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016ad8dd-4463-4845-b5e4-08d7075d5765
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2019 06:42:57.7989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23169jDacgSjLDHhH489uaaKqLBYfxE2wgV+if9UOos=;
 b=hjnFxi3xNnqyOCEaHVJgIQF402KkdhAz5/wm1crSX5ouCqu97+PQbcGvGYReYtYOksO11x0rSaYlFt/3Xu1qP2CkoVevsgOD8jG1Kz/7oTXzSG4RsNtHvE5IGWPKyel6kZHwTx2rmOGbRqdszHlRqlhaQaUW+pq9iWmBc5QUktQ=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBzdGFydGluZyBhIG5ldyBtbV9ub2RlLCB0aGUgcGFnZV9vZmZzZXQgYmVjb21lcyAwLgoK
U2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwppbmRleCAzN2Q5YTNiMDk5NDYuLmQwZjZjMjNlYzdjZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtMzg2LDYgKzM4Niw3IEBAIGludCBhbWRncHVf
dHRtX2NvcHlfbWVtX3RvX21lbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCXNyY19u
b2RlX3N0YXJ0ID0gYW1kZ3B1X21tX25vZGVfYWRkcihzcmMtPmJvLCArK3NyY19tbSwKIAkJCQkJ
CQkgICAgIHNyYy0+bWVtKTsKIAkJCXNyY19ub2RlX3NpemUgPSAoc3JjX21tLT5zaXplIDw8IFBB
R0VfU0hJRlQpOworCQkJc3JjX3BhZ2Vfb2Zmc2V0ID0gMDsKIAkJfSBlbHNlIHsKIAkJCXNyY19u
b2RlX3N0YXJ0ICs9IGN1cl9zaXplOwogCQkJc3JjX3BhZ2Vfb2Zmc2V0ID0gc3JjX25vZGVfc3Rh
cnQgJiAoUEFHRV9TSVpFIC0gMSk7CkBAIC0zOTUsNiArMzk2LDcgQEAgaW50IGFtZGdwdV90dG1f
Y29weV9tZW1fdG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJZHN0X25vZGVf
c3RhcnQgPSBhbWRncHVfbW1fbm9kZV9hZGRyKGRzdC0+Ym8sICsrZHN0X21tLAogCQkJCQkJCSAg
ICAgZHN0LT5tZW0pOwogCQkJZHN0X25vZGVfc2l6ZSA9IChkc3RfbW0tPnNpemUgPDwgUEFHRV9T
SElGVCk7CisJCQlkc3RfcGFnZV9vZmZzZXQgPSAwOwogCQl9IGVsc2UgewogCQkJZHN0X25vZGVf
c3RhcnQgKz0gY3VyX3NpemU7CiAJCQlkc3RfcGFnZV9vZmZzZXQgPSBkc3Rfbm9kZV9zdGFydCAm
IChQQUdFX1NJWkUgLSAxKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
