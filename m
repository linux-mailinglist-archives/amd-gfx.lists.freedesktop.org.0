Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E28E9DE95
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 09:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31A289428;
	Tue, 27 Aug 2019 07:20:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C334389428
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 07:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0tsUFKm5tRLPoI3MA6/xCIpbB/31isIcA7Pt+mcudsMErQa/69XGp+t++iiUzrB7JqYbDxuKsds9hVNaM/7Hw5JLXyQrYKwS6sxAsrxOjWvAiBUdCFlpOPAsTxWmZohtWs+0rJ6bIiNuT0yfcvEPme0NKMlHjAD61FljNWC8IN7lSyULnF1MNkip/u+zv63h0dy2PnDpfSsDdpWK2yZdmPwgfHHNdmwwSNXHoJnMnZfFOcFnXzG9w3T9eAosmN9OZuXHl0Bw01qsxctQ7WCfs75erR4EDpb+wco7WiO3RnKs72T2+0O8JjECn0V7r9AiHfnt40BzaTVQJnCjsUT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcCswv5pNbOJS1uddknTOT8BCLQSk4OJqwWTFAT+TGE=;
 b=kmZBcAlEvVC0RQixc4BqsPTo8j7rd2cRMbEBIblgzUflRyf6n23XhHPFB2LSENWKKkpLhmQ+g6VUCKyUMiR2U5DGZObObvuWthChhVtt3nzHPyuWmn2gVx2YmuP5AEthCZvno8BkxqqWb2k8Tt9dZ8jnL72FdC1elyDbfLd0lhGBrNLzZQ/EkJx1dVScAzDybTzx3TDC40t+Oj7aCkA2z6C7noy+Au3ufnYm/JP6ViWJqMQ8f+6RuKPEQDtdIL7pumJMLSvRI8zjBdOm7arOJ+iAt7J+e2Y3R0aRlaKHimzcm4s25ncZlHgq1+w/mQDbQIuCOEuNXvjvktGrmNs7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3601.namprd12.prod.outlook.com (20.178.211.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 07:20:03 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12%6]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 07:20:03 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: enable athub powergating for navi12
Thread-Topic: [PATCH 2/3] drm/amdgpu: enable athub powergating for navi12
Thread-Index: AQHVXKfYnw8CErOaQEyUKTD09Yc2Gw==
Date: Tue, 27 Aug 2019 07:20:03 +0000
Message-ID: <20190827071941.23862-2-xiaojie.yuan@amd.com>
References: <20190827071941.23862-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190827071941.23862-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8ab4494-f1f0-4a34-1291-08d72abefa8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3601; 
x-ms-traffictypediagnostic: BN8PR12MB3601:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB36012D8083756F7FC30DFB4B89A00@BN8PR12MB3601.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(66446008)(102836004)(14444005)(81156014)(26005)(3846002)(2906002)(6436002)(6116002)(4326008)(25786009)(6916009)(2616005)(486006)(66066001)(76176011)(6486002)(5660300002)(52116002)(50226002)(11346002)(99286004)(5640700003)(6512007)(53936002)(14454004)(476003)(86362001)(256004)(305945005)(36756003)(2351001)(66946007)(446003)(54906003)(316002)(71200400001)(71190400001)(7736002)(8676002)(2501003)(4744005)(8936002)(6506007)(386003)(186003)(64756008)(1076003)(478600001)(66556008)(66476007)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3601;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XeC2QlIN+cPDz3CswDbzN+it4S/ZhpHRimB1o9S9Jrn0wBj7vrGpk5BbQyMI8lH2FsahHyNCz1L/8uAYHWbzkPRqEvfg+wyBicCPxL8VmVahTrJAaFrYtrsNzY/lPCrB0nDx5JK9z+l52DwV6gRp7iagpDZrTdMLcMJpWuNsby0BfadoMjEml0TJgKK/AbX/bJS+tOta7jwLyDoRcAyVnkBSqrZSYZWGmfoLhmcY1QEbO4RtS6i4s7UigOmiVjvQRylZulJ7vvk/FsqVXZ2r3ifoZ2IU19p7r9CQFvBXO0A7S/127ARMRoM+FdhNyrwfwQehAATpZNbP/KeezJAz7u5KjugDAduRoGkdOR2d5iRKFbQlHDlQW4uKm5913GgmwDmQJHSipMMcbYdGUGl1hEKui7x7jV9TOxbdW7Vgrak=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ab4494-f1f0-4a34-1291-08d72abefa8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:20:03.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0VY/I9J7mzq6OBBMd2q8uCaBbzwcPtOW17K0Qolj8fi4+Dzcjy7S2mq7CNhifbL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3601
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcCswv5pNbOJS1uddknTOT8BCLQSk4OJqwWTFAT+TGE=;
 b=X7okTMx4d8cTBJBA55fZqsoHXjGysD9JNKvukUXbS2aCB19fTXBwT7zQQgnzMbbhQ5vuCK+666u1HanN+MsglXUl4gLkVQ+JduM+MTHJFnfzBtAJMbfoLWw3HeSCkpIC34xYw7J2VeGsypEOEJT6tesG8r0KcGt/ky0z8B43IQg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRl
eCA5ZWRhODJkNDQzMGUuLjM4NGY4ZjUxMmZjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBA
IC02NTAsNyArNjUwLDggQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpo
YW5kbGUpCiAJCQlBTURfQ0dfU1VQUE9SVF9BVEhVQl9MUyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9W
Q05fTUdDRzsKIAkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ04gfAotCQkJQU1E
X1BHX1NVUFBPUlRfVkNOX0RQRzsKKwkJCUFNRF9QR19TVVBQT1JUX1ZDTl9EUEcgfAorCQkJQU1E
X1BHX1NVUFBPUlRfQVRIVUI7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9p
ZCArIDB4YTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
