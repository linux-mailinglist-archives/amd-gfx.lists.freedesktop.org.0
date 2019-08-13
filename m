Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013E8C022
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 20:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF2D6E21F;
	Tue, 13 Aug 2019 18:08:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BBB6E21F
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 18:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ds1R7oGpsy0D3/ijV89vqY+p+KDRwxHaHFTu7qmY3POXHw53cbC4jgiX3swnGtEJUA5ReJV7fj6T6j9pM+Kr2mByyo8M0GJUtqpYJo9feTrbisJyqhqK9hfuXUrmksBqaLyrK4LskeUx76YOxcZnP/OG3aKvBhD/lejZclAwjgnzV2lAu/xaFdxhfdIEwNRNHNulORz3IEBIAZZFw+IzPr+EKX4iwOSy+sF8l4nQCRznoXubfxoRNhJVQ89aJcNXd6fbyXrpy7ZRoYma6s8zgVNcndYUzO+P5gNukJNLtl84+kAceD7v26xCqVWQDHc7e7moV+Ko4TLlIEKTJou6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft+a+m2OeHT9OBlYM5iicPdX18eYXElQA8gq4pU9mzA=;
 b=hrTdivjRJ+smFh3vk+6XGVI70xH/EAM/QMkpQlVH+sIssnT8pokfSTUkOJKoNdskB+0OL/Hlax7D4uWlEi1a63bWcw8p8MK3bWBFJgaU7/+/g8GAziwKIwWM7JeAlyJjsR7MTu8faMfP6jNaj/jESuSITFSFrYLoTfi0BVQcFr72f9CRkniKKmhYO9wazSUHLvzLj6A6BuqHXMK7MRQ2D8JRSqO4109edqYPMv05wc+MW7Xtn02KOZxgZoaZR83k1Ec3GGE/wb1W9vry8sXdCu++LodEMzi1XS5xp6E+SZWkTNpJZIB1pD6W6ZJG9rkfyn1Ap2A/v9BfutJc9yp5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3081.namprd12.prod.outlook.com (20.178.30.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 18:08:01 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 18:08:01 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Add printing for RW extracted from
 VM_L2_PROTECTION_FAULT_STATUS
Thread-Topic: [PATCH 1/2] drm/amdgpu: Add printing for RW extracted from
 VM_L2_PROTECTION_FAULT_STATUS
Thread-Index: AQHVUgILV3L5j6Tr2UmTJcqsC2DSjw==
Date: Tue, 13 Aug 2019 18:08:01 +0000
Message-ID: <20190813180744.10901-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a9ccfc5-662b-478a-90f1-08d720192dc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3081; 
x-ms-traffictypediagnostic: DM6PR12MB3081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3081D518D69B0DB7E854E0B0F0D20@DM6PR12MB3081.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(256004)(316002)(66446008)(66556008)(36756003)(66476007)(66946007)(64756008)(5640700003)(5660300002)(6436002)(8936002)(81156014)(81166006)(50226002)(486006)(6916009)(476003)(2616005)(7736002)(6486002)(305945005)(2501003)(86362001)(2351001)(6116002)(6512007)(53936002)(26005)(25786009)(186003)(4326008)(3846002)(102836004)(99286004)(6506007)(386003)(52116002)(478600001)(66066001)(2906002)(14454004)(71190400001)(71200400001)(1076003)(4744005)(8676002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3081;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /STMhRxYOL9+R5CHqTKaiOqJrrIQvwi8nlzTApglkiPTY76cRAhspJiLm86ZtMn+p0KqsejRbjPww/5HmIxgtrR9BtZryAtLN4dnwGxcn+myzU73zgtL02jTxLUjFHEWCCCha+Zh37TWpAdIzu9AZxcVyImdTqDRK1gttxrEKIRD4kNEv6h9DlpH0PvvF8Gb3+8j5VQYaWiYg33pMBC0t1MQj/uF9VkQxQNBAk17iB8RjaG9HpWR5xG95Z41ODfskPk/bX0B6beLMiy+WuKuzsJa75QuRJrrIQrqxEUqi3ZCNpQ6IIuaFGqGXutesPWKHFuJzaqUhPeD9ZmzcHjNaUam3SFwXALaF8KegO6R2VNesZgevxkgWdMKHoDWOzNMIi/WBhLB3d24PYMD+GpYllVCEZCIb9XYCI4rqylEV88=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9ccfc5-662b-478a-90f1-08d720192dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 18:08:01.3819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyKttJRLfxTFoRi22+Arf2ZQlf2bVQZWJ1OpMvgEJUUJGIIwteGIe0+dHmMJb02X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3081
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft+a+m2OeHT9OBlYM5iicPdX18eYXElQA8gq4pU9mzA=;
 b=taBTzE4TBgLvEr7wthc7AB03tl2Bgcb9akVXuXCB/4ET15riXinQEKCOyPINW+JklLl3FbzHDqP411hgjidbLam/+QxDSihF7+hkm5dmBfYOT5LjtvBWE5xA3xyhePOdvMuxRGY2dK7mzhrzInpL3TuXwHlKNll3AzYATwgNVh0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UlcgaXMgYWxzbyB1c2VmdWwgaW4gbW9zdCBjYXNlcy4KCkNoYW5nZS1JZDogSWNmNGJkNjVlYTE2
OGU1OTY1YTZhOGViZTMyY2U5MzI3YTJkZTI4NTEKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZ
b25nLlpoYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCAyOTZlMmQ5ODI1NzguLmVjNWU4NTg5MjZhZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC0zODcsNiArMzg3LDkgQEAg
c3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgTUFQUElOR19FUlJPUjogMHglbHhc
biIsCiAJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCiAJCQkJVk1fTDJfUFJPVEVDVElPTl9GQVVM
VF9TVEFUVVMsIE1BUFBJTkdfRVJST1IpKTsKKwkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgUlc6
IDB4JWx4XG4iLAorCQkJCVJFR19HRVRfRklFTEQoc3RhdHVzLAorCQkJCVZNX0wyX1BST1RFQ1RJ
T05fRkFVTFRfU1RBVFVTLCBSVykpOwogCiAJCX0KIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
