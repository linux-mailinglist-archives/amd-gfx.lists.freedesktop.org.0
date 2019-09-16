Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C941B3F06
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 18:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0EB6E9FE;
	Mon, 16 Sep 2019 16:33:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5B6E9FE
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 16:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdSJPyWpzLA1E5uhOnVELHEzJAqoSak4DGEFuF6LvLLsx8bXlJlPbBh+wbcAlzEYGuEKcA5TPFsQJvWFcyU+/pGO1YkxjiQlnp8ALp0/TCwOniRU8DvUcci5rIbqEesI2QMNfFSElq9Y6QO8O2h9qOSFf6PDHNGlxrAypS9s77RwV+OmzcrHFgp587i7yb4OW/Xt8wV46qmib5VZkURT0ra7kyomOZyIi7ZbMhOl05IDHbREnw4lE09+By9p/5r7M7I9Y1wWp9Ug0XDMrt16R2d6VcLtgdwwXohRNA5BHnG5XWuRrmf3liqG4ltGw3j9Npo9Wc89dQeRBU9f7+KPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMkuCx8jtaMMct0c9SIMfSB/t/XYNO2juHhrBhsTfk4=;
 b=QUxmRu6SlS2IksmsCL+gHzdP8zMFQGiE5ndxHEBZNNIknzh6Je//kKkitnAyomUb7OAI5ecAYk8VBTjqQUYSD1HeFncv27wswExZ535nMi6AMw+DBFonnzDrfGvzWq4HD3pHkl8NEArgz4hQbc30Hxgm/cHm7f7OFx5E8o/4/y9q7mIp4+XJaVj217V4TQ/0JCMdQPV8czkga6yNhlwuRakFaLG2pYhP2sMdhWH5nJiHR+n1VVt7hPuuOVHHBdwHp396jtu6F4aJ7gOGdGI3T5nQO8tg2R83Rmhm8OMR7w/UMuAt4PBM9oQOnrRpvOKKpqxyJKA/Eccy23HW7oQBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2684.namprd12.prod.outlook.com (20.176.116.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 16:33:05 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2241.018; Mon, 16 Sep 2019
 16:33:05 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Topic: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Index: AQHVbKxqAZyQIFcNBEuqzE/XNaiBQw==
Date: Mon, 16 Sep 2019 16:33:05 +0000
Message-ID: <20190916163252.23684-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 135f9ee2-86aa-4e77-5968-08d73ac38ca2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2684; 
x-ms-traffictypediagnostic: DM6PR12MB2684:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2684D0DAAAF467F16CA525EFF08C0@DM6PR12MB2684.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(186003)(53936002)(66066001)(4326008)(6486002)(478600001)(64756008)(5640700003)(2351001)(6436002)(6506007)(476003)(8676002)(6116002)(66476007)(99286004)(66946007)(256004)(14444005)(26005)(52116002)(66446008)(102836004)(3846002)(50226002)(6512007)(386003)(316002)(305945005)(2616005)(2906002)(4744005)(6916009)(81156014)(81166006)(486006)(86362001)(8936002)(66556008)(71200400001)(1076003)(71190400001)(5660300002)(14454004)(7736002)(25786009)(36756003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2684;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sZtsEZFwa+LYwLWBFcgR4ucQbwq1w2BiKmUez4mgqXEyCLX5iguNlP3K95+27D1/iApSkrpjLkF3lySnkukzZtyal+T64lmGXXjOtiNfetzMsGYToiVojSm3RAZF/T1KM49vcPHWlrs6yRtjMn5BNEEGQhUP8Ci5Ls4h/jXyMZu4jOZzw39mlepyA7q/sgSzCtSAVCUu6k9VWXOlJS0s8d57Z+iickv5+QVOsc4V8aIrF7Ez7WJ9VzJVdRrqE7M8FmnvabB4tseSFhUFuv9lhq2uQacaqR/eF/KzqSp5bccF/p+IqYWN9TPhzWq6KY1jBs5TfpjuyQAKyr1ylG/t/HnIZaSM7x8Bf6rKxUjMzxBlGcdHWIN4ylkP8YHa3BfyJ9yFWLS6iWc6Y+egyOmevxU3R3uNjWKoUAL8i65MCQQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135f9ee2-86aa-4e77-5968-08d73ac38ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 16:33:05.0996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtM62t3CIZ7GlSZ3umWGeE2KsXn1JAJTe6dK60WGfPbKuK4zUSaLXt64JL29diyG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2684
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMkuCx8jtaMMct0c9SIMfSB/t/XYNO2juHhrBhsTfk4=;
 b=avyAczptJvtk7RGHPHadQ7fbK3cpxpcwF8sxrmU2t2OuKYEQT5gwmMQ1Ha1RBTsbQu3xc1x4oiNZk4yrmsEujAxLRdbziS1RjLgpZAWrvoL191+tvZlji5L8qb8/34z7W0jziAul7iS98gkriVflG8YeRERh6g9Rj/resU7K1+g=
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

VGhlc2Ugd2VyZSBkZWxldGVkIGJlZm9yZSwgYnV0IHNvbWVob3cgc2hvd2VkIHVwIGFnYWluLiBE
ZWxldGUgdGhlbSBhZ2Fpbi4KCkNoYW5nZS1JZDogSTE5YjMwNjM5MzIzODBjYjc0YTAxZDUwNWU4
ZTkyZjg5N2EyYzJjYjcKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIHwgNCAtLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaAppbmRleCAwNmJiMmQ3YTliMzkuLjA3NzNkYzRkZjRmZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfcHJpdi5oCkBAIC0xNzksMTAgKzE3OSw2IEBAIGVudW0gY2FjaGVfcG9s
aWN5IHsKIAljYWNoZV9wb2xpY3lfbm9uY29oZXJlbnQKIH07CiAKLSNkZWZpbmUgS0ZEX0lTX1ZJ
KGNoaXApICgoY2hpcCkgPj0gQ0hJUF9DQVJSSVpPICYmIChjaGlwKSA8PSBDSElQX1BPTEFSSVMx
MSkKLSNkZWZpbmUgS0ZEX0lTX0RHUFUoY2hpcCkgKCgoY2hpcCkgPj0gQ0hJUF9UT05HQSAmJiBc
Ci0JCQkgICAoY2hpcCkgPD0gQ0hJUF9OQVZJMTApIHx8IFwKLQkJCSAgIChjaGlwKSA9PSBDSElQ
X0hBV0FJSSkKICNkZWZpbmUgS0ZEX0lTX1NPQzE1KGNoaXApICgoY2hpcCkgPj0gQ0hJUF9WRUdB
MTApCiAKIHN0cnVjdCBrZmRfZXZlbnRfaW50ZXJydXB0X2NsYXNzIHsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
