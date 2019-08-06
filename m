Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6582BED
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106689DB5;
	Tue,  6 Aug 2019 06:46:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750043.outbound.protection.outlook.com [40.107.75.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B79589DB5
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6RVkhobTGxCbMlilX4TJcVaRLoh/lQmv27Dmdd1KXRXzG1OMydwAy8n0aW8+WTl8Ov58ci4sfTivZHS+VFFJkSNlHKp3nU7tvgq2eXuqQVCVH2GgQw/XCy304MdhEVqs0ivc2LBzbt5Xrg+LWxbOF0jC4I15rqyzMMrrUPg1x2z5GjmBoQw9LHFEvohFGIetaIgZCapNjeMp4ODNHSf/LcwbTmc5yY21ZcUh7SeJkEcCM/lEtINL2linDUUw45t+lcAYhVTMtu/KweEHq/Ox4GYhFUloKwE41Ytxb+xtC4gvCpXL9Q1OxpgQHbWAGXem8DLgI6IUpbt/c8kLeE1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU0R/mPn+tgVq1ratQNvktkvlwBAmN+g05d8ryiPcVY=;
 b=I0dp1Ccw3ObnU0jxVYksuHPt3DMO+AjDgdLT37pq+VxjvVnsNyfLqrLKUvz6bmB3+VFFHU0J4fUA3aIO7DhGetgPELeuudaoST+6ujw1E/806DrjV0sTVe2nvB63kmwslkV5q8TqDtEIHacIWyIWLU0Rhuu0TpLHy2g9VZGEI/C9amLz/XqUL9O3qns5+RePeKzhrENlnszXi4UjDNAClEuZTDb9JOMfDeQUYVCJIkmQJYA1ghf+y8Rkto1REn4GLA0MAV3wsVBzw0qBT1ej2/KGaK2SRqkLNfadPs9PdzY99OPuenNsv3V+9SOErD5i09MfxEF10Y2PmKWHNCwQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:23 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:23 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/amdgpu: enable gfx clock gatings for navi12
Thread-Topic: [PATCH 01/10] drm/amdgpu: enable gfx clock gatings for navi12
Thread-Index: AQHVTCKpEu6uqmuS/UCTLK1YBscH8A==
Date: Tue, 6 Aug 2019 06:46:23 +0000
Message-ID: <20190806064546.19434-2-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1232189d-7945-40e3-acf7-08d71a39cbcc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540A61CD1E909FD121E95B289D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zOLU3j7rWRH6hA1pwZWoO4gPZJ5gM9pd17G5Jyq3k36mb9n4qOv3iRA0jOtTJSxvIC4oDlp7n8umtXql8TEFwHbYGF7js61iZ1+o5a5Fl9MU56JqlOF8tnd8k28Xd8NFwHx/0nyuOQwjBHMNLailX5jN89BsCVuXAG0d5zavz+7zuiGHmVZY1H3njAM87pNFJPfKkFWa7+ir6z9cfk4Zuo9/8Urz7M/r85ixdZ1qjnGTif5mGEtjjPMTY81wBtHn0fvcKS5zGA6b0YezUO9J1BCDnDcbd9lpQcLomo/IfHI1Qseej7rVmKs2NUIWKBJAmhcdOIHdxel2IV0rVW2qL8bImELmNGNaB3zktc6IaA0EOro1yqMG9ZYrOfMyt0XP8EKQ1e6GiKnnGpJnIykNd4+GgLoMLbq3Qd3b3e0GWm4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1232189d-7945-40e3-acf7-08d71a39cbcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:23.7017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU0R/mPn+tgVq1ratQNvktkvlwBAmN+g05d8ryiPcVY=;
 b=ksnSw+KkA+0cskB8OQt4mJq4EK8LIfXI/W0TDM97aQlb+BU4J/Pomr4pLkxy0uU+TfjGWh2nAF9oSgCxzSVGhWIEb9ZpFnfQX8wYv40w0oSXmT8mzSnbhV9jO792gvYKX5AQQD9ROs6EzMjk9Rnugk7jn3GPnZ7bSK3QBOdkzSA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlcyBmb2xsb3dpbmcgZ2Z4IGNsb2NrIGdhdGluZyBmZWF0dXJlczoKCi0gbWVkaXVtIGdy
YWluZWQgY2xvY2sgZ2F0aW5nCi0gbWVkaXVtIGdyYWluZWQgbGlnaHQgc2xlZXAKLSBjb2Fyc2Ug
Z3JhaW5lZCBjbG9jayBnYXRpbmcKLSBjcCBtZW1vcnkgbGlnaHQgc2xlZXAKLSBybGMgbWVtb3J5
IGxpZ2h0IHNsZWVwCgpDR0xTIChDb2Fyc2UgR3JhaW5lZCBMaWdodCBTbGVlcCkgd2lsbCBicmVh
ayBzMywgc28gZG9uJ3QgZW5hYmxlIGl0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4
aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwg
NiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCA3NGJlYWNlNTMyM2MuLmFlZjdhNWIzMmIzNCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC01NjEsNyArNTYxLDExIEBAIHN0YXRpYyBpbnQg
bnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQlhZGV2LT5leHRlcm5hbF9yZXZf
aWQgPSBhZGV2LT5yZXZfaWQgKyAweDE7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTI6Ci0J
CWFkZXYtPmNnX2ZsYWdzID0gMDsKKwkJYWRldi0+Y2dfZmxhZ3MgPSBBTURfQ0dfU1VQUE9SVF9H
RlhfTUdDRyB8CisJCQlBTURfQ0dfU1VQUE9SVF9HRlhfTUdMUyB8CisJCQlBTURfQ0dfU1VQUE9S
VF9HRlhfQ0dDRyB8CisJCQlBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgfAorCQkJQU1EX0NHX1NV
UFBPUlRfR0ZYX1JMQ19MUzsKIAkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ05f
RFBHOwogCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweGE7CiAJCWJy
ZWFrOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
