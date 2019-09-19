Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A5B73D3
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C2F6F961;
	Thu, 19 Sep 2019 07:13:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCB06F961
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mijg4xXFTFCSIMgLrA/XmEY/wUSny470sqzslX0B7o7ujCQdUIPaHltZgjkDSyFKLTBRyo732rqp/uK5ySRSBQn+X0D3wEhJ0zx2dODBwCDNgRXsnoYbqJOKPmlnYGlRYeF0UykatXJkkQamrb5ixPxiY1zt9Y1FFJpFquxTjr2g6IkCVSG8Z52Tyu3/ZjHowRAauDjaCa/gXk6qS5nKb2roFac/6smYK3YnQMW3NWM3Vs+Q4Utbp6QH3Xs9lo7yqiQR4jW+TtK3hzq+QR/f8HJYHOSO9B24cEjVSKbK2FevJxc3NR7NWn5heHUUCuKJHs/4FxNwuX/nRzaaQcbEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JUt2RBwoOYTycqnaEtfvmWtiJJPQDK2pxklKD3rFII=;
 b=JkSS+kV7pHLOOGiNXOdZgjHy7KOxmfVgoCrI1qYf6k/qdafGg9VbkFwQ7pidX33mYRasEvN/e6/6e2/LO5aFb9nNVcsxp7Jrju3yuPsdzAOxx6m/Wbq0Gf5okRQ7FXFH4ZhmEIEV9h1Aay95QR2P7r649yYt9aENVQzI131pS9dy4zwDlpD7A7hjcD0bomxt0K9EGh6hbIbw83o5CPFY7RGp1dM6HMF1KlguchZbVrd4XrRZGIjL8kpRZiFRzJFtpGSIUyyYq8aHqJe6WiHNZqgehsfatYJ2qNYnB4UpJI1g5IlaR/LkntVJ9wFQReMhrmze9ZPxohMFImYjoH6+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:13:08 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:13:08 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 17/21] drm/amdgpu: add ras fini for xgmi
Thread-Topic: [PATCH 17/21] drm/amdgpu: add ras fini for xgmi
Thread-Index: AQHVbrmvuJIlVjRDLUugW1ClfbR8dg==
Date: Thu, 19 Sep 2019 07:13:07 +0000
Message-ID: <20190919071115.16552-18-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fb8aea4-8ce5-4adc-e44c-08d73cd0d231
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440117933105175EDA17B54B0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(4744005)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LlkQAbKo+1BD7lfPmp5O30A2zxsxH3lAngOD3U7OV5thT6KD+2OdMVR7jGIx11hBd0IfNFYtskMcm8q5kDag2c85VtWjOT3jKqkDjEpoG6q96F+zZ3QHu32cC2TodO45wmigEYx2r34GOrEc0XiOcrDz7MXxDmTAyDyeeRSsb2ADq3sMNPGZWSFQVzH7Sv/6PLNgK/cuypqlC+260g+mxbCPPHz24gdtC8hkZ6QT6qDFKV02c6C/nSzkjCSh6b8JaDt3maRXoXMxvTe7gFtCUrrVhmR+31EDa7gpdPXlT46jYp9b+7RY4sHKDOeYk4tNhJhkH/zAs6c/2fV7vp2Z7Z1fpsnM176jPZXlBJ7P2s+QbxhGogzlUmtyqi67D0tg/UcchQ1lSwqO8OdW9QXo4mZS3EceYNcDIFrOzPRmjOE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb8aea4-8ce5-4adc-e44c-08d73cd0d231
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:13:08.0259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAWtNyPaIJIcmasC8ksYpGKAbXHeUzj8vx3Yr9wwP9ZCygrRMmhelVSGZHIFabj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JUt2RBwoOYTycqnaEtfvmWtiJJPQDK2pxklKD3rFII=;
 b=vUFW7Prim2FKtgcnG07cJRs66Yo4wkPz+tty3OX1tFVCQXrioWTljT0ZjPbRZdBc5vA+EUVxZf9fqf3jtD825rYnjdN2NqDwNMKNdCr/vUj02cs0N2udlJT8heAIcwHPd4dUpYLXgI6eVRdZlVyUFWYATz7G5Rj7qealE8rQwXs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIHJhcyBmaW5pIGZvciB4Z21pIHRvIGNsZWFudXAgeGdtaSByYXMgZnJhbWV3b3JrCgpTaWdu
ZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dt
Yy5jCmluZGV4IDU4YTk1YTY3MzM2YS4uNGNkMjA2ZWUzZTBiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5jCkBAIC0zMjksNCArMzI5LDE1IEBAIHZvaWQgYW1kZ3B1X2dt
Y19yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X3Jhc19sYXRl
X2ZpbmkoYWRldiwgcmFzX2lmLCAmaWhfaW5mbyk7CiAJCWtmcmVlKHJhc19pZik7CiAJfQorCisJ
aWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX1hHTUlf
V0FGTCkgJiYKKwkJCWFkZXYtPmdtYy54Z21pLnJhc19pZikgeworCQlzdHJ1Y3QgcmFzX2NvbW1v
bl9pZiAqcmFzX2lmID0gYWRldi0+Z21jLnhnbWkucmFzX2lmOworCQlzdHJ1Y3QgcmFzX2loX2lm
IGloX2luZm8gPSB7CisJCQkuY2IgPSBOVUxMLAorCQl9OworCisJCWFtZGdwdV9yYXNfbGF0ZV9m
aW5pKGFkZXYsIHJhc19pZiwgJmloX2luZm8pOworCQlrZnJlZShyYXNfaWYpOworCX0KIH0KLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
