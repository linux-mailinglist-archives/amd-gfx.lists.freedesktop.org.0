Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC0AE287
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 05:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB34589EFF;
	Tue, 10 Sep 2019 03:23:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD389EFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 03:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4s28Y2r2C3OFF3SwUOWjpzt0o56boybcKvWybObuYuJ3WNKeqOCtsjx0xl8hclf5OSwlPUeS6E1VqdZbxkG97xzH9N920Ppe85nJ7dl8u++ojQXEZBMyg11J9EKrHiFElcEFp9/y4l5Ilo3OB5FXvk3RvCiv6cpXQtUB5U7qHRw6Kw+vl7AOaKbKv/BNNEDWp0z2CEtrnYbLR7zyyUvb9jf+EWP6F+OsdsOA+gcP0TVKK00g6VPAnKHXKJfCLkmJ+etqQq28bqtzmTRzCZkVexp0HNL2DPdIGTQXqhL/yQqnjHYbtU4PvFsQREN2Yf3sR3mE9dalGPLUA0nTENWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tox6bQFh51CJJ2bK3fLmd3hk2dgEopzji6JFeliSVx8=;
 b=HCMbAxrmCZY87ytbP4Zr/uZVMNsUOk/XavfABDSnLAteVA9tWqy0gikmhUne9/L9dCEORsQMfvY+lKxbLuQ+6AyM7xVyjd3+FNqTbMfMjrYzt3uJYUucSmw8l0652reKpWfBJ0P3Z5wM6l1EUmCT5R43lszVqR3IB4pytBvz3xPEctNCK9+6oAiX1QEoSCcJV4sXt4aSy2EOjNRXvT2T/yIXrUvY1Lrzv2w5Cc5qs1OQHwehgZST1aO+FQj26JFO20aE4brKP68cr3g89JwLByU0GWWCYQpDGEsexYtzCkpYf9ZrE/F14mvZfmlvFHgetLi8c8g1Yjp7SfmyAMrYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1868.namprd12.prod.outlook.com (10.175.85.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 03:23:46 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 03:23:46 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: enable error injection to XGMI block via
 debugfs
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable error injection to XGMI block via
 debugfs
Thread-Index: AQHVZ4cn51sD8YcxBkaIvqjJ1qKplA==
Date: Tue, 10 Sep 2019 03:23:46 +0000
Message-ID: <1568085803-2202-2-git-send-email-Hawking.Zhang@amd.com>
References: <1568085803-2202-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1568085803-2202-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::28) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c9c05ee-e241-4d87-ec31-08d7359e49e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1868; 
x-ms-traffictypediagnostic: DM5PR12MB1868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1868C494588661E7BEA6874BFCB60@DM5PR12MB1868.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:277;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(189003)(81166006)(76176011)(36756003)(316002)(110136005)(86362001)(256004)(476003)(6636002)(6116002)(3846002)(8936002)(186003)(26005)(50226002)(11346002)(446003)(66556008)(64756008)(486006)(66446008)(66476007)(66946007)(99286004)(386003)(6506007)(2501003)(25786009)(4326008)(102836004)(6512007)(2616005)(8676002)(2906002)(478600001)(6486002)(7736002)(305945005)(14454004)(66066001)(53936002)(6436002)(71200400001)(4744005)(71190400001)(52116002)(81156014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1868;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BZM/XGHGcyXalEQmLritdDOZEoFOS38lbTSCSstY/FynDzPRBkSPM4DsaNZpQOmSijJjsCa7WMdbmrmMlIBmD21Kzd/7R0az90/LmhtbIkf40n46EjnV7dkKhWSNcx/OayQc7oTg6q/q1e4d7QTy0ROWJXa5HXdyvVndjWkxu6uHN7LnvjdRCl2xABHHDOKt2i/rcaJuLjvxy+/gV/JrZwPHnpPAnz8qisLq6AuDKMyzBFJ/+kfM7tKOTPQt1i4E6t4Vxxymyhs+ldROwtwp5jS6A13PaKJs0QddhZ/ypM9LIyVA8LNwxVSuMlbmMBhNM6S6JwIPX6et4u9q9S8jXkLXWzgoTWONj7WMgB05HKg/NbWBobESGmOTccbIdT6g4NR5hsv2k37R6WbNXk3IJ/QSUjMmFadKL/a9mTJXvwg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9c05ee-e241-4d87-ec31-08d7359e49e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 03:23:46.0914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/DGddb7aSOw+b8xPT7XcqR+4FdttYseHhWnZxmlhmg7QyL0HaI8Or7SlgPFcETn81TW4syhG6p/mQB/UvGThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tox6bQFh51CJJ2bK3fLmd3hk2dgEopzji6JFeliSVx8=;
 b=wyf3aZlfd0av7RilSnOX2zyKH8FLhuwnWS9o7VsIQfA3Q6LJal3J76uJOKvKq1CgPaVIMad0bT+yJITua+mhXED7YpBwWnPLckfsP1ARW0SBQ8Ot5mSpDJWohIMQ9fQ0Lr5k7l/cgUlcVnMhiFp2NVRXQW28M1r8tY9Zi765PyY=
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
X3Jhcy5jCmluZGV4IDExOWJlZGMuLmQwMTgxNDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKQEAgLTY3OSw2ICs2NzksNyBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9p
bmplY3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWJyZWFrOwogCWNhc2UgQU1ER1BV
X1JBU19CTE9DS19fVU1DOgogCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fTU1IVUI6CisJY2FzZSBB
TURHUFVfUkFTX0JMT0NLX19YR01JX1dBRkw6CiAJCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJv
cigmYWRldi0+cHNwLCAmYmxvY2tfaW5mbyk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
