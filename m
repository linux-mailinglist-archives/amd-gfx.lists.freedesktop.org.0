Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B1AD0E9
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 00:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274628922A;
	Sun,  8 Sep 2019 22:07:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71428922A
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Sep 2019 22:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBHctFmS4iNVyPKlXPf+yccdqLTWTTvrAzzfZLHCGJGyUoX1dPGxb/fmrUH8mk2sg0HMWJGG9qbsDokTNLmSG/mLUuKb6RYaJtSnnX2aRR8KNmhxESWHlnCXGwEg22FDwi+tHQuZ/MAZRalrdhk5VGMuJxRk8n9iGZpol1zkFhZvLkAqaK1R1D9cUQc2UgEg8REjyMQhc/di8FjlMuo6KbMZyVGF+1/sQ+yvxspn2313vRUIe9wsr863tI20O0c/2Kd3aHXbnWqRHjAaOzNH6AIIq6hj2zHgYi/ueFiZ9PmD3RDvHL/3m/GzqGSqQSja9H9beVa9YR7L+DThWuXhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDXPNv6uzk9n1R8FNpe0pc54t5MGMGQrZbHj+cMypTM=;
 b=GpmA3Ea+ehVHx/Xbx/qOB3lV0PtY/V2JzDY40kBgiMEiBKt4JsVoLRdfO9Ay3dQ//njH4ou/B7ycylg0J12lps0Dpjqm/7mcybw4ruyPc7ZoyZ4kK8UpMXNDqcmz7Boj0HBbKUtV33dCVbh9GLFpZBdSP1E3D2mcPjjLTBZBOmeWr2lU+1LSqpyDorORZXthRsoLvmWRQC+EzZXuFF4vk82n6/WdapFZtWraTCsodOiChITj5/R2hsytOkSdG1qRikYTLZbUuTgjBRz/vRgY7vP9VgBgLeQk2n6Ai0XtRXciWrI6Z3kLrVXBiG2dvnLKie9P7nhPHa+vlRcfMV6Ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1424.namprd12.prod.outlook.com (10.169.206.135) by
 MWHPR12MB1456.namprd12.prod.outlook.com (10.172.55.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sun, 8 Sep 2019 22:07:22 +0000
Received: from MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2]) by MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::51d:602e:5ce9:1ae2%10]) with mapi id 15.20.2241.018; Sun, 8 Sep 2019
 22:07:22 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: enable error injection to XGMI block via
 debugfs
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable error injection to XGMI block via
 debugfs
Thread-Index: AQHVZpHJbDpklewGSU2SanWfWYnaqg==
Date: Sun, 8 Sep 2019 22:07:21 +0000
Message-ID: <1567980418-32146-2-git-send-email-Hawking.Zhang@amd.com>
References: <1567980418-32146-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567980418-32146-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To MWHPR12MB1424.namprd12.prod.outlook.com
 (2603:10b6:300:13::7)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43ce549c-c4ac-4749-ed27-08d734a8ec07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1456; 
x-ms-traffictypediagnostic: MWHPR12MB1456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1456D6C97D5AA533B3EE02A6FCB40@MWHPR12MB1456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:277;
x-forefront-prvs: 0154C61618
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(2616005)(26005)(476003)(2501003)(6116002)(3846002)(6636002)(66066001)(6486002)(446003)(102836004)(2906002)(53936002)(4744005)(64756008)(66556008)(66446008)(66476007)(11346002)(66946007)(386003)(71190400001)(6506007)(71200400001)(6436002)(486006)(4326008)(99286004)(81166006)(76176011)(36756003)(50226002)(14454004)(8676002)(81156014)(86362001)(256004)(186003)(8936002)(5660300002)(7736002)(6512007)(305945005)(316002)(25786009)(478600001)(52116002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1456;
 H:MWHPR12MB1424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: onKMORnY7ofSaorn6fw4iKGG5iWqIPJ8Sm4TvMeR/2lzY4aqeSWkdBuSn8xWBapv1gOcwW7bs1wGKTLdmz1TARld82TVnp8hza+d3tvOdAyT1Gzu0l3BpJYQ8uyZz64R26hXLN+0E/IaH+9yTtnUbcJshITOFtZ5+HvYzQvqN0TPrEfRBLRweudwRI9WlLSJe9Xxd3WgivaNMzqa+F8VzzmE8UNW2aofpaJRUuqi7/ShLjcHqWC6CdAat8Cq1RkUTKLbk45XgNToRQztZ1r8zqR2rG1cGNSiiDEifcWhtulFjfa2mgEV8OPHJm0v4zQ4nwPBgXbpGxB+yreHqcQvDHz9onwaXBarJPcITtxFYw+AOfY6saZObKwiODIDkmJG4e5KtoKDB0Rjh5+2MtKriPPU2Sr/4sTwLMQjFIdCNSc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ce549c-c4ac-4749-ed27-08d734a8ec07
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2019 22:07:21.9255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJCnaADf8Vz06TahO+WI4arLDu0aw4cxbu3a/Dl2Gpgf1wEeO1gbppHxouNjosG62yhekwf0WCEAkLROO4Er9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDXPNv6uzk9n1R8FNpe0pc54t5MGMGQrZbHj+cMypTM=;
 b=3r31DQnCH9JhF3MoBDJzCMmFr0Op9o0eYDI1nQvAcqA89SVtRkYcKwD3QgM4UrKEEwzC76BtEUKEx2mI6renawy6x+H/yHaVOfpfgKfwyePjLc/V2osKI0VhGwDuzK3d9zda1GD20YD/bMvBTyooqBEoK9ORN/Myrl1PZcW1FrY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

YWxsb3cgaW5qZWN0IGVycm9yIHRvIFhHTUkgYmxvY2sgdmlhIGRlYnVnZnMgbm9kZSByYXNfY3Ry
bAoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCmluZGV4IGQyNDM3ZTEuLjkzNDg4NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKQEAgLTY3OSw2ICs2NzksNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9p
bmplY3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWJyZWFrOwogCWNhc2UgQU1ER1BV
X1JBU19CTE9DS19fVU1DOgogCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fTU1IVUI6CisJY2FzZSBB
TURHUFVfUkFTX0JMT0NLX19YR01JX1dBRkw6CiAJCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJv
cigmYWRldi0+cHNwLCAmYmxvY2tfaW5mbyk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
