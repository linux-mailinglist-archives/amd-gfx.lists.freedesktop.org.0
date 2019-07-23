Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42C70EE9
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 04:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E8A89F55;
	Tue, 23 Jul 2019 02:02:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0760689F55
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 02:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKzclm/DvDb2DFrmgCPFZHk8756E4BzqMh5tcylvvhNvdUQ/OFkbfzEL/1PqnygAFeTRbaGrb/UqwEyftFAZ9ZGwPILcBIst0AB4bQICwg72kaQzt7vx6U8tdJ/po6Fg0LwMHoREswTYDSg6KL2Yhm/VLAww8fUiBlJ8Sh0cNzbgpHWgmrTRz9vHPHc28BPWBl5xsnGcTg1xI2wJYs9VcYxELIWmilPS14JTYIMqEC/qBgJ/rNqOqc3RtjoOvihSiEiJ8RXPEhWuZN4+2SR+tjrQyRPyqho1gHydVFYgV7qb6APQ8CSjRwfCdzntt7dTUtB91JDhxE0isaIvaGp3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBmaQhNahQfY/+LnIDB/uCy/eV3evJggNL1IYt/W17g=;
 b=FINtt76qt8tz+voO1g6vni7y2atLXVhGoakuBuifPl00BBGvcjVmTxebJjbpJBhNk1cwzykET03vza3/N15oZ/iChr7ghCpADQ/k3O1qmSEiHC7f/pd0uAT7EL9teL6JLc7JNft+UjByehhfZTx5mzhHw45AzRWvDkLBljRnr5YtIUk8kHB4R5h54ZMIUZsBQHwAO21SSq9Sjv0R8u/+yd/lO4IPoQauzwfZ1h5wURRegAup15/Y//SyKejWWc/3VY5eVplnmbvicoKpOftqyPDXWHnlEvaM9U2w/jv3ms1BR9/x4ZaqsI0SvjKikoWedKOI/dZ4pHRdulTQ7t5OIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3438.namprd12.prod.outlook.com (20.178.242.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 02:02:30 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 02:02:30 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm] tests/amdgpu: disable reset test for now
Thread-Topic: [PATCH libdrm] tests/amdgpu: disable reset test for now
Thread-Index: AQHVQPqvpDscuraMakmKsVwn7HrqdA==
Date: Tue, 23 Jul 2019 02:02:30 +0000
Message-ID: <1563847335-29017-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0211.apcprd02.prod.outlook.com
 (2603:1096:201:20::23) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9eaaf3a8-e00f-45f7-f52a-08d70f11d16d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3438; 
x-ms-traffictypediagnostic: MN2PR12MB3438:
x-microsoft-antispam-prvs: <MN2PR12MB34388C673CCE7EFD48EA58D4FAC70@MN2PR12MB3438.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:93;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(14444005)(86362001)(486006)(2351001)(476003)(6916009)(2616005)(81166006)(8936002)(81156014)(14454004)(68736007)(6506007)(386003)(6116002)(36756003)(6486002)(5640700003)(6436002)(6512007)(256004)(4326008)(52116002)(3846002)(50226002)(186003)(53936002)(99286004)(2906002)(4744005)(102836004)(305945005)(316002)(66946007)(25786009)(66476007)(66556008)(64756008)(66446008)(7736002)(66066001)(2501003)(71200400001)(71190400001)(8676002)(26005)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3438;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p2cP8lBWdXHXDtO4y7j+iDQEDxbp9Uvyhz3a+6Ulmuzcgc5pAmVfubxgzLdjinBHSTQ4IMUlTAoxITBGz5H5aSm8LWeVNzgpfaj6EhrkN6YL5iFV20CPgDDOEPT0hWKNklSa5MI3JFwbt+6MiRkOXNDRG+mqwfimmq7XRf/IU0558t79DjYukVK/lU+tP1jh/sCBdY6pbIoHYjfLByrj6nWSQfyxxmecxC688pA303fegoT70OgqfGJtuo1V1qlzUs5qUkKD6Z+DiEvY6lzadtsPHYE4djfvjebWN0gXufdD/N68OYYPNuMnb4MkwB6zFxC/uTsOytAtZ6nlCXYvBmOgKCC3siQa1mZ4Mtd47sa91i3X15Rp3QF4v/osCZXXm2aWaCmqM5ZXwcLf6ez8XcmxUVzl7/7Yp2/WnfAW/jU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaaf3a8-e00f-45f7-f52a-08d70f11d16d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 02:02:30.2577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBmaQhNahQfY/+LnIDB/uCy/eV3evJggNL1IYt/W17g=;
 b=lmc1mLYNoNXrjNnH2G2IUKJgMJMhBIIpRa7pBtcGXLwY8xR+tMo7C11LnrsaMAB2SDhvhZn3DGkvUr0tCrAjolTePUoy0Hlg1nArUS1J8lQRemPmuFz+nlpkSOQYGMBa12e+ThFeq8NzRfW0xy4uz1LRvdlDlKmnjglAMtHlVLs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QVNJQyBoYW5nIHJhbmRvbWx5LgoKU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlA
YW1kLmNvbT4KLS0tCiB0ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2FtZGdwdS9hbWRncHVfdGVzdC5jIGIvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMKaW5kZXgg
NmYxZTM3Mi4uYTRjZThjZSAxMDA2NDQKLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMK
KysrIGIvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMKQEAgLTQ4Miw3ICs0ODIsNyBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfZGlzYWJsZV9zdWl0ZXMoKQogCQkJZnByaW50ZihzdGRlcnIsICJ0ZXN0
IGRlYWN0aXZhdGlvbiBmYWlsZWQgLSAlc1xuIiwgQ1VfZ2V0X2Vycm9yX21zZygpKTsKIAogCS8q
IFRoaXMgdGVzdCB3YXMgcmFuIG9uIEdGWDkgb25seSAqLwotCWlmIChmYW1pbHlfaWQgPCBBTURH
UFVfRkFNSUxZX0FJIHx8IGZhbWlseV9pZCA+IEFNREdQVV9GQU1JTFlfUlYpCisJLy9pZiAoZmFt
aWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlfaWQgPiBBTURHUFVfRkFNSUxZX1JW
KQogCQlpZiAoYW1kZ3B1X3NldF90ZXN0X2FjdGl2ZShCQVNJQ19URVNUU19TVFIsICJHUFUgcmVz
ZXQgVGVzdCIsIENVX0ZBTFNFKSkKIAkJCWZwcmludGYoc3RkZXJyLCAidGVzdCBkZWFjdGl2YXRp
b24gZmFpbGVkIC0gJXNcbiIsIENVX2dldF9lcnJvcl9tc2coKSk7CiB9Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
