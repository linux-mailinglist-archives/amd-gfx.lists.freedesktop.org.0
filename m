Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B5B71D4
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 05:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4206FC47;
	Thu, 19 Sep 2019 03:15:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680070.outbound.protection.outlook.com [40.107.68.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8240A6FCF4
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 03:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8lG+JODCMjoSlWB3h2nJwKWIzG7Id/AGsXmgCiKDwMT0T1W0fKKdfawnxtL2RelDHGzN/WLGEe+yRz2q7DxpoOVNy4cHYtkwkhf0zk8D0x98HWlKgUoP7sWf1SXiFWnkdIHCLI5MhiJcU5eIwxMpBCddhsG3/AWBmvpyCgMnAw/l6jE2ZcMViamxCcohbfOUdXJ5f/X8+jYajcdcFD7I+yMj8LwC6I/m6Kd8eIsyw6TrF9+mMxnPBm/0FW3f2jwOmKseHMVQPzW+vlU1IpNUB5gfFf+OqvzZuIdhIc0eWjbNmdwV9Q3BmcFlVA8vTpvjqPz9BX/Tc9/hvB/sTUEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5P2HqjcksShm+jbeL2YrLGwTmo8CXlvv+ONi8AswIf4=;
 b=Ud0RdasNUjywOVTf1cDgpg/C09HDEAfjDOKa7Y3aMfkcL8cCrMhiLYdOvWwZ3Mza/0uI9r935wqDZuZRCOASdZbOYEybqVYp2tKCH+aH45ilWGLuR+GR0rMtyiWK1T+HxxeEce6cUUABOKHBzgOLfK9tnPJZtAyjoB2BMIOYbMxGIjWo08Wn2JhkWip60vojLWD9Labfa40vYTK5ZKIVP/K3HRp2sF3WwRhmgz1ALNHQuj4WvNEBQbcnqS62dnET/Kg9Nb+sTew5F13wGjs5HXV0fwkd1obhMv03eXLaZnDscMSV7H7FPVrGhzxq9pGufddrd++1HPBQzBvgSbJxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3015.namprd12.prod.outlook.com (20.178.55.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Thu, 19 Sep 2019 03:15:01 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 03:15:01 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH] drm/amdgpu: enable full ras by default
Thread-Topic: [PATCH] drm/amdgpu: enable full ras by default
Thread-Index: AQHVbphsHrQFEaRd+EqgEbUQy6y/cQ==
Date: Thu, 19 Sep 2019 03:15:01 +0000
Message-ID: <20190919031444.8203-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80122d4f-2f01-4593-9404-08d73caf8f11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3015; 
x-ms-traffictypediagnostic: BYAPR12MB3015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3015CF68862291EF9495B9FEF1890@BYAPR12MB3015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(7736002)(8676002)(305945005)(2501003)(81156014)(8936002)(81166006)(6506007)(52116002)(386003)(102836004)(86362001)(6636002)(186003)(2616005)(476003)(66446008)(64756008)(66556008)(66476007)(66946007)(6486002)(6436002)(6512007)(2906002)(50226002)(99286004)(66066001)(71190400001)(71200400001)(36756003)(25786009)(4744005)(486006)(1076003)(5660300002)(316002)(26005)(110136005)(54906003)(4326008)(14444005)(256004)(14454004)(6116002)(478600001)(3846002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3015;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BuNAGjJTGcDt98LVY+oPxjw5LUDSUD0KIsAvPGooDFxwGtwPdrOsl4WmuM2WpN3q6/It9X+JnH0XOokjC4plwHCj4J10XrnKPKTpPahNzYQq2ZUgHDyXrhkRVstA/WKuP86h+xNLKBV5+XLuH+DV4tD9gCN89ZhLgX4HY0+uOIBFP18JqFCiJJIi013nSjnGk/f4SqmDS6HQeICsuWeRjFsTbTgRdBd8AyO2C/V0epng01lmpK2HjtQ9+lOnRpPcLfA9wkZTy+oiy6wzUj9PHDu92jCvkAGLigxVW+tyxyLHw9bU/6vcAs/05Cd92xflrM1Ggn6z1BqpBx+p8V71l8M/K7//z4swUqg4khDnUVwcvtpI40fZeckNYu01u4aivVTrAELiTb8lQKKidefaM+RoFymHGNJsfsiUT5BaPwk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80122d4f-2f01-4593-9404-08d73caf8f11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 03:15:01.8368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hs4dw0nyvN5GmleCEuM7O942J46P8H7FbYm5NW2btEQlX7XbyNEoobMMR56WK2pISMHZQtUlF+9cFk1dIpbcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5P2HqjcksShm+jbeL2YrLGwTmo8CXlvv+ONi8AswIf4=;
 b=Ht43Wtgm53Dvs3bwI5vyOyj4LUEUzebHl5bzS6OuLsrhhec5zyiML7TgwAHFw6YwXw5ODlvuj8vWpaHnitTB2UEuKZENdpmYUGKOXsfkXhR0Rz7TvsSisuV4w690ld42HpJJAhzTJ6CBlqf4UL43o6pN9PCvBwzoheR+JLpw82g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RW5hYmxlIGZ1bGwgcmFzIGJ5IGRlZmF1bHQsIHVzZXIgZG9lcyBub3QgbmVlZCB0byBlbmFibGUg
aXQgYnkKYm9vdCBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVu
LmNoZW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZTk0MWRm
Li5kZDNiNWRmYWFhNzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
QEAgLTE1MCw3ICsxNTAsNyBAQCBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7
CiAJLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLAogfTsKIGlu
dCBhbWRncHVfcmFzX2VuYWJsZSA9IC0xOwotdWludCBhbWRncHVfcmFzX21hc2sgPSAweGZmZmZm
ZmZiOwordWludCBhbWRncHVfcmFzX21hc2sgPSAweGZmZmZmZmZmOwogCiAvKioKICAqIERPQzog
dnJhbWxpbWl0IChpbnQpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
