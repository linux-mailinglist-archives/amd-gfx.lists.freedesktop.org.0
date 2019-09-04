Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9FA7B16
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 08:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC91589A61;
	Wed,  4 Sep 2019 06:01:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317189A61
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 06:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S64Y7m6HleY+DIMcxqKjNSXDQtlpUR92RPcW+gE5a333llTAR/Cez3IT+/9pdSY2BtqZTB7GgZZewRfwzT07yYXe6e2EAZajwFKFjQDheNZnj3it7SgPpy8JjbHv3i6NFBnJBVI6gxJprN9OmzGPzhL+3NcuH/woDhFkgiLaRAiMOTl090IwBf6qb/7w3yfKZ1SRy/EUgLjDdhqh13ia51IWVj5Ha9vfjBaMgYo5EQAeBJbwdKXfI5k9QR+sRsHs3xa4Ai8IJYqXg9K1iDMVUo9ne+cRmhbpRjzn8up+eVfT5RNma62KsrE7P9GpdwnJh+Sqm08BEanAHqmoTotaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2vpZmNrtyhTUKlwDC89cdPxsr+OwJGroKvMzStS36c=;
 b=Z3KV1kE7HVdg7VvFXo9m9/CwkLcPgA02PZLzKYcbBIdyNDqTJZEqg60sObt/BUL49M+axfuu2Wpk8ldfYfTZfvHIVQ8xIZDdwX1iDTb5mEg5BKCZkSr227PqUUEc9uGOCfwUuE16D8JBzUp5Ps0Mxsl9mV7PLfTywTFBeqv3pVxWDyWJBkCbYudOYHu+Q/MjFbo++iqXLP4LCLmjBE88C8/RPNOUa0eu6vBdW84VrqOOCxjgNVbyeAa7sH5rDPWW0kb/bC5pASqyL2KHvQM1n4SwXsQRuDFibEZpiojRtF9WDHX81xmlTGihUNghU13QbUXtXr7HzMf5oK9NghnAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3390.namprd12.prod.outlook.com (20.178.242.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Wed, 4 Sep 2019 06:01:36 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 06:01:36 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Parameters
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg
 Parameters
Thread-Index: AQHVYuY1zl6E+ns+R0GkmmmDplyMYA==
Date: Wed, 4 Sep 2019 06:01:35 +0000
Message-ID: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:203:36::13) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d119f41-4abd-4723-886a-08d730fd57d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3390; 
x-ms-traffictypediagnostic: MN2PR12MB3390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3390F17C9150F9EDF19BE935FBB80@MN2PR12MB3390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(86362001)(2501003)(6512007)(8676002)(6116002)(3846002)(71190400001)(5640700003)(6436002)(99286004)(54906003)(316002)(71200400001)(5660300002)(2351001)(36756003)(4744005)(2906002)(14454004)(66946007)(66556008)(476003)(486006)(305945005)(66446008)(64756008)(66066001)(256004)(66476007)(186003)(386003)(14444005)(2616005)(26005)(53936002)(6916009)(6486002)(7736002)(478600001)(4326008)(25786009)(81166006)(50226002)(6506007)(102836004)(52116002)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3390;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5TSOtpvsieYs4Ud1ikhBpUCVmk7Y9YLf8cZU9Oy7D7vd+huooen1A6f7JZXK6YE+AfjAoOABOiVypQcYaNlVAYh++fN0iIKuhughVdjAXG9kZwy0sdiRUpBKlxnrIHUjxrUaNP4yCIDjwihp/7nu3CYAbUlPY4inDLSYtmuIoS3dpgoKPEX/UDONDsdrivaLazRc4q+5WYrXcMsw3WBqhjYYu7PywQW8SE5qPrBuIK9ptUw5Dn8vS+wJyb0W1hrQsQXvDN5VZyDkeWW5OqCITD76ZC8tXsj/kpaaWz2MZBRg9faql6V6DlwbXHitMUXmONk5+ObLwHVBF4lVPOASdaUxmk9On3Y/wrpTmkth+c1vCvR3ktu/xLm1+J7LpSs9ZmrN35L3XCBpjhFAxsjjrC/Oc8Y6k5YfC7gwXV1vyYw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d119f41-4abd-4723-886a-08d730fd57d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 06:01:36.0478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJ9mIA8i01bHZhDzCeaWM9nWLMrV6ls/lswKHzi1b5pBNsegllVtMtbkONFgjL0z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2vpZmNrtyhTUKlwDC89cdPxsr+OwJGroKvMzStS36c=;
 b=tMnl89WixLvlDOZO07O2nlXKPcFrGohUcen9xyp/gJI9Q5K8qZ+GMhOrFvojJvYW6KNg3phz3rwEEWDOk+q+j0j8UhNP2Sl2/SaQpAzVjT7kEYtYz26uE4wPfN6jSFsJ0Thx8sWKdsXoJD9AX7OXPrjS3+o9B7M+t30JUHxrQzk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIFVNRCBQU3RhdGUgbWFjcm8gZGVmaW5pdGlvbiBmb3IgUFN0YXRlIHVwZGF0ZS4KClNpZ25l
ZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgpyZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9yZW5vaXJfcHB0LmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2ly
X3BwdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5oCmluZGV4
IGU5YjcyMzcuLmEwMTdhNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3Jlbm9pcl9wcHQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5v
aXJfcHB0LmgKQEAgLTI1LDQgKzI1LDkgQEAKIAogZXh0ZXJuIHZvaWQgcmVub2lyX3NldF9wcHRf
ZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCisvL1VNRCBQU3RhdGUgUmVub2lyIE1z
ZyBQYXJhbWV0ZXJzIGluIE1IegorI2RlZmluZSBSRU5PSVJfVU1EX1BTVEFURV9HRlhDTEsgICAg
ICAgNzAwCisjZGVmaW5lIFJFTk9JUl9VTURfUFNUQVRFX1NPQ0NMSyAgICAgICA2NzgKKyNkZWZp
bmUgUkVOT0lSX1VNRF9QU1RBVEVfRkNMSyAgICAgICAgIDgwMAorCiAjZW5kaWYKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
