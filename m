Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328DD8631
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 05:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAD46E88C;
	Wed, 16 Oct 2019 03:06:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700088.outbound.protection.outlook.com [40.107.70.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41E86E88C
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 03:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbRaPV+GrQxl3tGQRAHvqeW2dKMSTnR0yw2KCa9B/pc4y7DTPB98pQHqUh8M+TUnvccFv1kCpqLaLkRdBbbAJ44aZasRJLbexcx+Ice92GHprBp5oZ83cuOv9ptTvJzq8fqe3L4rvPVIjb/+Mi8LQFWFa7fGxIi7JvpezcdsW3fvImBQFrv3/klLgDCvtniNuPIVchMnL3CmWIFuKfwAW0EAn8RvIdQUK8LaTynQOKVjlcl5CDiZnpsOP4vc7dEKUoVKB15mswuODFdtkPIvQqV5ZgkJo7gX9tIREMe5pUk9Fcuyjd2uYPzSih8CjMH5muA9QIi+42THOtCevsgAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5MjT/0Ne2ZyZLht3Sjk6xF9Hk1EY4Wbrp6PBMMZGyE=;
 b=IbtCrLNCvV5BQyqf9tnEQGFoGSJFnU60+KuMWmDL0tcCdwue8srNArOLIriHBpJX1dafdmDKwnmE0dRUIPbg0rvNqHC8ScTK7C+9aD0ZRlYEfVJWkTlIp7vmMJnKVyI/WDQ1HqoHjx15/BPdcnB2iM/n8UKElYNs2C9sInXlFPVq02XDgQfjC4t6Y1jlvboJVOpuHY5Xakykm4Shoj+LWA4FFFPvkhYf6s0erLTR4tLRmAMAZ7eIdwTdX1r/btpf46ZuOv6esVfJZVFdwhluRMqRyFUlundlRWS3udS3H5mmkmOgAedvq3ecUBMCunjm/3igWqi6FsZk3tpEph+mPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4302.namprd12.prod.outlook.com (52.135.51.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 03:06:20 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 03:06:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix amdgpu trace event print string format error
Thread-Topic: [PATCH] drm/amdgpu: fix amdgpu trace event print string format
 error
Thread-Index: AQHVg86vWIVY1lsAkUOYMTo6iKVQjQ==
Date: Wed, 16 Oct 2019 03:06:20 +0000
Message-ID: <20191016030606.6750-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2895f295-921f-438e-0432-08d751e5d1ac
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4302703C6453ACF446C051E9A2920@MN2PR12MB4302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:59;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(189003)(199004)(3846002)(66946007)(6116002)(6512007)(256004)(66446008)(66556008)(6916009)(66476007)(6486002)(64756008)(86362001)(52116002)(5640700003)(316002)(486006)(386003)(2616005)(476003)(6506007)(102836004)(99286004)(50226002)(186003)(2906002)(71200400001)(7736002)(71190400001)(2351001)(36756003)(66066001)(81166006)(81156014)(478600001)(8676002)(5660300002)(14454004)(26005)(6436002)(1076003)(4326008)(305945005)(2501003)(8936002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4302;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8UGYW6pJ+FWAKz1vTDEJb1JtodUCkG0uSUwPdNlviU8eu0aYzeVnV6UWTmoaHKezzdHItrXrgYvLluS+sciJnSzdmypuhl8mzHOyEHM1oAvZ77uK2q3FD71RQT5ZMXmesMdKSkcuhhwDMqsKYC0A8byfhb7MyFeUqItStm+GNcoIdx1S9kGNqx8bbttp9x2XVrXy/OuCwLkWzFfOVsp1CWLRf8a1V8J88A19XbTSZ2UrdOT9Ln1AkDn6EJGTTUGjT6DWXSDKT/pJXu3CYhxm1N3d+aW0k+lZjTv74bujHIDsh02jIpjpEJb/vD/lbLDWDPQ05ulCNEQYX+oCv/Ma+CUziAaDZ3QWx4249AzHx9YEkl+2sIrPvVw8lIxG6IZtDms/Us8lCLDM8UcYVfhR/e9ra6xhPM09O62px7xzJOQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2895f295-921f-438e-0432-08d751e5d1ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 03:06:20.6684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1G3We2/iLc5eqDLisU/C+85NCIFenU9Ml8zN+p8c35gWS0a9cFduL8al+k9JrzXA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5MjT/0Ne2ZyZLht3Sjk6xF9Hk1EY4Wbrp6PBMMZGyE=;
 b=bqJetdqQV0RfdPAhHz8wJcSZ1WNMcWW0a8Armqu8nJK4w5ecm6x+NaI3T8LMWNTIyg2qL+l9UjuIF3dl5ecdXiAve6vX7vuy1cApycue6x/FJwKcrkeC6U6VFZ1pUWaniXWgyNfAQSqZY1g2pFVZVODgzpQ+n9BkRdbPLTD7omI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIHRyYWNlIGV2ZW50IHByaW50IHN0cmluZyBmb3JtYXQgZXJyb3IuCih1c2UgaW50ZWdlciB0
eXBlIHRvIGhhbmRsZSBzdHJpbmcpCgpiZWZvcmU6CmFtZGdwdV90ZXN0X2tldi0xNTU2ICBbMDAy
XSAgIDEzOC41MDg3ODE6IGFtZGdwdV9jc19pb2N0bDoKc2NoZWRfam9iPTgsIHRpbWVsaW5lPWdm
eF8wLjAuMCwgY29udGV4dD0xNzcsIHNlcW5vPTEsCnJpbmdfbmFtZT1mZmZmOTRkMDFjMjA3YmYw
LCBudW1faWJzPTIKCmFmdGVyOgphbWRncHVfdGVzdF9rZXYtMTUwNiAgWzAwNF0gICAzNzAuNzAz
NzgzOiBhbWRncHVfY3NfaW9jdGw6CnNjaGVkX2pvYj0xMiwgdGltZWxpbmU9Z2Z4XzAuMC4wLCBj
b250ZXh0PTIzNCwgc2Vxbm89MiwKcmluZ19uYW1lPWdmeF8wLjAuMCwgbnVtX2licz0xCgpjaGFu
Z2UgdHJhY2UgZXZlbnQgbGlzdDoKMS5hbWRncHVfY3NfaW9jdGwKMi5hbWRncHVfc2NoZWRfcnVu
X2pvYgozLmFtZGdwdV9pYl9waXBlX3N5bmMKClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtl
dmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3RyYWNlLmggfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHJhY2UuaAppbmRleCA4MjI3ZWJkMGY1MTEuLmY5NDA1MjZjNTg4OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKQEAgLTE3MCw3ICsxNzAsNyBAQCBUUkFD
RV9FVkVOVChhbWRncHVfY3NfaW9jdGwsCiAJCQkgICAgIF9fZmllbGQodW5zaWduZWQgaW50LCBj
b250ZXh0KQogCQkJICAgICBfX2ZpZWxkKHVuc2lnbmVkIGludCwgc2Vxbm8pCiAJCQkgICAgIF9f
ZmllbGQoc3RydWN0IGRtYV9mZW5jZSAqLCBmZW5jZSkKLQkJCSAgICAgX19maWVsZChjaGFyICos
IHJpbmdfbmFtZSkKKwkJCSAgICAgX19zdHJpbmcocmluZywgdG9fYW1kZ3B1X3Jpbmcoam9iLT5i
YXNlLnNjaGVkKS0+bmFtZSkKIAkJCSAgICAgX19maWVsZCh1MzIsIG51bV9pYnMpCiAJCQkgICAg
ICksCiAKQEAgLTE3OSwxMiArMTc5LDEyIEBAIFRSQUNFX0VWRU5UKGFtZGdwdV9jc19pb2N0bCwK
IAkJCSAgIF9fYXNzaWduX3N0cih0aW1lbGluZSwgQU1ER1BVX0pPQl9HRVRfVElNRUxJTkVfTkFN
RShqb2IpKQogCQkJICAgX19lbnRyeS0+Y29udGV4dCA9IGpvYi0+YmFzZS5zX2ZlbmNlLT5maW5p
c2hlZC5jb250ZXh0OwogCQkJICAgX19lbnRyeS0+c2Vxbm8gPSBqb2ItPmJhc2Uuc19mZW5jZS0+
ZmluaXNoZWQuc2Vxbm87Ci0JCQkgICBfX2VudHJ5LT5yaW5nX25hbWUgPSB0b19hbWRncHVfcmlu
Zyhqb2ItPmJhc2Uuc2NoZWQpLT5uYW1lOworCQkJICAgX19hc3NpZ25fc3RyKHJpbmcsIHRvX2Ft
ZGdwdV9yaW5nKGpvYi0+YmFzZS5zY2hlZCktPm5hbWUpCiAJCQkgICBfX2VudHJ5LT5udW1faWJz
ID0gam9iLT5udW1faWJzOwogCQkJICAgKSwKIAkgICAgVFBfcHJpbnRrKCJzY2hlZF9qb2I9JWxs
dSwgdGltZWxpbmU9JXMsIGNvbnRleHQ9JXUsIHNlcW5vPSV1LCByaW5nX25hbWU9JXMsIG51bV9p
YnM9JXUiLAogCQkgICAgICBfX2VudHJ5LT5zY2hlZF9qb2JfaWQsIF9fZ2V0X3N0cih0aW1lbGlu
ZSksIF9fZW50cnktPmNvbnRleHQsCi0JCSAgICAgIF9fZW50cnktPnNlcW5vLCBfX2VudHJ5LT5y
aW5nX25hbWUsIF9fZW50cnktPm51bV9pYnMpCisJCSAgICAgIF9fZW50cnktPnNlcW5vLCBfX2dl
dF9zdHIocmluZyksIF9fZW50cnktPm51bV9pYnMpCiApOwogCiBUUkFDRV9FVkVOVChhbWRncHVf
c2NoZWRfcnVuX2pvYiwKQEAgLTE5NSw3ICsxOTUsNyBAQCBUUkFDRV9FVkVOVChhbWRncHVfc2No
ZWRfcnVuX2pvYiwKIAkJCSAgICAgX19zdHJpbmcodGltZWxpbmUsIEFNREdQVV9KT0JfR0VUX1RJ
TUVMSU5FX05BTUUoam9iKSkKIAkJCSAgICAgX19maWVsZCh1bnNpZ25lZCBpbnQsIGNvbnRleHQp
CiAJCQkgICAgIF9fZmllbGQodW5zaWduZWQgaW50LCBzZXFubykKLQkJCSAgICAgX19maWVsZChj
aGFyICosIHJpbmdfbmFtZSkKKwkJCSAgICAgX19zdHJpbmcocmluZywgdG9fYW1kZ3B1X3Jpbmco
am9iLT5iYXNlLnNjaGVkKS0+bmFtZSkKIAkJCSAgICAgX19maWVsZCh1MzIsIG51bV9pYnMpCiAJ
CQkgICAgICksCiAKQEAgLTIwNCwxMiArMjA0LDEyIEBAIFRSQUNFX0VWRU5UKGFtZGdwdV9zY2hl
ZF9ydW5fam9iLAogCQkJICAgX19hc3NpZ25fc3RyKHRpbWVsaW5lLCBBTURHUFVfSk9CX0dFVF9U
SU1FTElORV9OQU1FKGpvYikpCiAJCQkgICBfX2VudHJ5LT5jb250ZXh0ID0gam9iLT5iYXNlLnNf
ZmVuY2UtPmZpbmlzaGVkLmNvbnRleHQ7CiAJCQkgICBfX2VudHJ5LT5zZXFubyA9IGpvYi0+YmFz
ZS5zX2ZlbmNlLT5maW5pc2hlZC5zZXFubzsKLQkJCSAgIF9fZW50cnktPnJpbmdfbmFtZSA9IHRv
X2FtZGdwdV9yaW5nKGpvYi0+YmFzZS5zY2hlZCktPm5hbWU7CisJCQkgICBfX2Fzc2lnbl9zdHIo
cmluZywgdG9fYW1kZ3B1X3Jpbmcoam9iLT5iYXNlLnNjaGVkKS0+bmFtZSkKIAkJCSAgIF9fZW50
cnktPm51bV9pYnMgPSBqb2ItPm51bV9pYnM7CiAJCQkgICApLAogCSAgICBUUF9wcmludGsoInNj
aGVkX2pvYj0lbGx1LCB0aW1lbGluZT0lcywgY29udGV4dD0ldSwgc2Vxbm89JXUsIHJpbmdfbmFt
ZT0lcywgbnVtX2licz0ldSIsCiAJCSAgICAgIF9fZW50cnktPnNjaGVkX2pvYl9pZCwgX19nZXRf
c3RyKHRpbWVsaW5lKSwgX19lbnRyeS0+Y29udGV4dCwKLQkJICAgICAgX19lbnRyeS0+c2Vxbm8s
IF9fZW50cnktPnJpbmdfbmFtZSwgX19lbnRyeS0+bnVtX2licykKKwkJICAgICAgX19lbnRyeS0+
c2Vxbm8sIF9fZ2V0X3N0cihyaW5nKSwgX19lbnRyeS0+bnVtX2licykKICk7CiAKIApAQCAtNDcz
LDcgKzQ3Myw3IEBAIFRSQUNFX0VWRU5UKGFtZGdwdV9pYl9waXBlX3N5bmMsCiAJICAgIFRQX1BS
T1RPKHN0cnVjdCBhbWRncHVfam9iICpzY2hlZF9qb2IsIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KSwKIAkgICAgVFBfQVJHUyhzY2hlZF9qb2IsIGZlbmNlKSwKIAkgICAgVFBfU1RSVUNUX19lbnRy
eSgKLQkJCSAgICAgX19maWVsZChjb25zdCBjaGFyICosbmFtZSkKKwkJCSAgICAgX19zdHJpbmco
cmluZywgc2NoZWRfam9iLT5iYXNlLnNjaGVkLT5uYW1lKTsKIAkJCSAgICAgX19maWVsZCh1aW50
NjRfdCwgaWQpCiAJCQkgICAgIF9fZmllbGQoc3RydWN0IGRtYV9mZW5jZSAqLCBmZW5jZSkKIAkJ
CSAgICAgX19maWVsZCh1aW50NjRfdCwgY3R4KQpAQCAtNDgxLDE0ICs0ODEsMTQgQEAgVFJBQ0Vf
RVZFTlQoYW1kZ3B1X2liX3BpcGVfc3luYywKIAkJCSAgICAgKSwKIAogCSAgICBUUF9mYXN0X2Fz
c2lnbigKLQkJCSAgIF9fZW50cnktPm5hbWUgPSBzY2hlZF9qb2ItPmJhc2Uuc2NoZWQtPm5hbWU7
CisJCQkgICBfX2Fzc2lnbl9zdHIocmluZywgc2NoZWRfam9iLT5iYXNlLnNjaGVkLT5uYW1lKQog
CQkJICAgX19lbnRyeS0+aWQgPSBzY2hlZF9qb2ItPmJhc2UuaWQ7CiAJCQkgICBfX2VudHJ5LT5m
ZW5jZSA9IGZlbmNlOwogCQkJICAgX19lbnRyeS0+Y3R4ID0gZmVuY2UtPmNvbnRleHQ7CiAJCQkg
ICBfX2VudHJ5LT5zZXFubyA9IGZlbmNlLT5zZXFubzsKIAkJCSAgICksCiAJICAgIFRQX3ByaW50
aygiam9iIHJpbmc9JXMsIGlkPSVsbHUsIG5lZWQgcGlwZSBzeW5jIHRvIGZlbmNlPSVwLCBjb250
ZXh0PSVsbHUsIHNlcT0ldSIsCi0JCSAgICAgIF9fZW50cnktPm5hbWUsIF9fZW50cnktPmlkLAor
CQkgICAgICBfX2dldF9zdHIocmluZyksIF9fZW50cnktPmlkLAogCQkgICAgICBfX2VudHJ5LT5m
ZW5jZSwgX19lbnRyeS0+Y3R4LAogCQkgICAgICBfX2VudHJ5LT5zZXFubykKICk7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
