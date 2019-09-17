Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776AB4742
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43016E147;
	Tue, 17 Sep 2019 06:17:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642136E147
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFPH6Uhq0sZSQsgagKoPnf0+H2i/KKbWXdeo4LK3cwQYt3yG5DRzgO+GB3lRZq1q77APoZayMXueypfhZwJ7707mmVcOAZqEBE2mcMiTfg2BbHnYK9wyTpec2cnNZrIRNeM8cOf4T5GcMAg2HwUuMmNW3dWNU6qlEZ7TuRDP/j0+wxsy8590maJuanGpuFWZJySQeb8bcP09ZVEVfU0y0iexxxs3+fgryHaxYeD023AOwB6LmvT3h/BLwum+HEOp6UTghFJL0klm0pVOZoVE4+kfIAt65HdxQVqHERr05YRRu2SH8w9pqN48N8bQ/KU0az6euzzSjlBrPJ6I+sy2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UhbLZb7peO07K+RA47H7gB18NZaAK2diQeAjRV/HPE=;
 b=jjlR3UUva8ujhfn/qHgeBAd/IhTDcg+RtUWFtDkXIL9aN+ZwVqX7Q6DFRls+w06XpARUdKBjx0HBSCk/7dVnHlRzzryHos2drT+VxoNZzXQNdmmUlNOeejtd16u5vKAJatHywbc5K9rVgZw0DBplGVuF9+8bQODdgzU7atYTF25pVFKSDAeYAqX3LpaAP0dQtJHPcrT2Yh4EyyuzbNG523av2iTW0sO9AxoIcLqiZ0AigcOL7z5PX3GmqsW/IRi6tH0w2Ey83amDonOzCqZgFS8f3JPAaMEL0VXcZZgMnxKdvOIkvqINvkWWT4t3vv18ZAyVftZYDRLbuTRV1g2rnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 17 Sep 2019 06:17:01 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:17:01 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: fix size calc error in bo_create_kernel_at
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix size calc error in
 bo_create_kernel_at
Thread-Index: AQHVbR+EvJAxO5MmTEO+j22vdet7JA==
Date: Tue, 17 Sep 2019 06:17:01 +0000
Message-ID: <20190917061643.29367-2-tao.zhou1@amd.com>
References: <20190917061643.29367-1-tao.zhou1@amd.com>
In-Reply-To: <20190917061643.29367-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0149.apcprd02.prod.outlook.com
 (2603:1096:202:16::33) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7294842-c932-4f11-2437-08d73b36a704
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34400754E228E50E4242F5DFB08F0@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(66946007)(66446008)(186003)(64756008)(66556008)(66476007)(99286004)(26005)(102836004)(66066001)(76176011)(52116002)(6636002)(2616005)(476003)(386003)(6506007)(2501003)(6436002)(486006)(11346002)(50226002)(36756003)(6486002)(6512007)(4326008)(110136005)(446003)(478600001)(25786009)(81156014)(8676002)(81166006)(8936002)(3846002)(1076003)(256004)(14444005)(4744005)(6116002)(86362001)(7736002)(2906002)(14454004)(316002)(71190400001)(305945005)(5660300002)(71200400001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6hxDKjdkXZkUNNNb9CAyX9sMFYlbZprdRP8C3W9tesjloKaspqpAV9Z7biuTFn2sBIjbvzYhGWNFJG70KKBocpyzNMIExLcH2YygMmY6APSWczoE8K4FwqvMuVtwfOGZJITnTApK0Ox79DhE2M9BSNoK55CS3EnD29ki5DdIqb2JDcihcZgivsnN6lTbnFrIRUORy7B+o+zf/MT59dxVU8LPrHWThTeSG6mXVAzRuCAjoy8zP8PCbYeVQkQYp0Estk3Kp+1CZzIZmlDtwd9RM+U3O9vd1mShYQDg5zdkZpAwoxuekpMHc0sjOjM6vs+nTL8yPGhtXBZdTwQeNEig3n+0JgHChHzatdR3iT+TveOq9xh/qS2ot3YNeximUYEq8m8oOEJWf3R/JvZk5IJ7w9MQ9VlGMbqluc930O2cjbg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7294842-c932-4f11-2437-08d73b36a704
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:17:01.8400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s00Qm/GF37Epbb+/7bCVqX+Op0CGMcyap5d/t5VqH8YWPIWVtYXGt3cM0dX6bgbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UhbLZb7peO07K+RA47H7gB18NZaAK2diQeAjRV/HPE=;
 b=NHWmhobONxiZ+7gyLQW+fVEwkgcKLPxwxFFVBgHPTOILA2TAr4lHSHqSy4ebXen287jze47PwcP4nIdZ8IJ4Z0kISYDwJp0qmt43U7F/q2F1bsfUlptMWkQE1snnXhkss7Etipfq4WqT2pRYa0B3ykjjZ/xfudsxjSxPtFytUS4=
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

cmVwbGFjZSBvZmZzZXQgd2l0aCBzaXplCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpo
b3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCmluZGV4IGVjYWQ4
NGUxYjRlMi4uMmZjZDJkMTRjYmYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5jCkBAIC0zNjYsNyArMzY2LDcgQEAgaW50IGFtZGdwdV9ib19jcmVhdGVfa2Vy
bmVsX2F0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWludCByOwogCiAJb2Zmc2V0ICY9
IFBBR0VfTUFTSzsKLQlzaXplID0gQUxJR04ob2Zmc2V0LCBQQUdFX1NJWkUpOworCXNpemUgPSBB
TElHTihzaXplLCBQQUdFX1NJWkUpOwogCiAJciA9IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQo
YWRldiwgc2l6ZSwgUEFHRV9TSVpFLCBkb21haW4sIGJvX3B0ciwKIAkJCQkgICAgICBOVUxMLCBO
VUxMKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
