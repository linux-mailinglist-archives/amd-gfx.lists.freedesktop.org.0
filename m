Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA5DC35A
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 12:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC936EB12;
	Fri, 18 Oct 2019 10:59:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720E6EB12
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 10:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtDFd/F6dlTYribYlOfe7k+UH2lW2tLWnd24vT3sZPbd5ngpG+9/Brx58SaLYKBrnh755udGfNLwqWKuPiKLa5ODd4CktL+/wlHkMBCm5j/hs2xfgYW9ckVdrkqIcL2gsgsXREzHDr/ULOKYcamOlkuUTjZ2DOcIqVzcwIzYbeuA/h0TsByzYb0MW+Eig1Qv60mPg5HAMZJLaW4tL7cwpQchxOsyHNo6I5Oo7O7N7SSxNz5chZaIsHD5E2uNguWTgDauZLIrHJ2sbLHPhoJ4esdWPzMlFpgFYxjqvgRzvojnYuxDDs5OVXhZUaxIrtGbR0f4DVYfC806dN1E0RvpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGeN7jm2bw0thX7j+5cvy+pQIbAPpzXl+YVSI2bMYRY=;
 b=I6tEUZT1wNDkVL2CYwOgDFSm4FtnyNCnb/l4Y8bKHCbMpSHSmAF9N5N+2cCiCwXY4VMDColzZm5c15vxmjJ4PuXkgBhefxV36MqPXZgiUijnJM3t0iUUJc58Pwza/G1Vl1c8n/metbIQ9/QwmWuodC43vig1USVH2rON9DdbypCv9Ae13iOoSf9ZCCq/U25hHS5r1TL/95dM0RBCv/GM6KJHzBAeH+UuSedJ7OvfSYGvh6SY8jSimxGKr3ge3lyoJl9YOuk8nAsQFti5CtqFuoybyMp8JGzNkaGAAWwoA6fChqC+630U0wUcGpjIpFc2fAcfTsV1IxQ1wI8p+gSOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2980.namprd12.prod.outlook.com (20.178.208.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 10:59:45 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 10:59:45 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu/psp11: fix typo in comment
Thread-Topic: [PATCH 2/2] drm/amdgpu/psp11: fix typo in comment
Thread-Index: AQHVhaMmN4zmYBn6Mk+E5b0aDtt2sA==
Date: Fri, 18 Oct 2019 10:59:45 +0000
Message-ID: <20191018105923.8277-2-xiaojie.yuan@amd.com>
References: <20191018105923.8277-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191018105923.8277-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:2f::15) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c1aa4be-0d72-4766-1552-08d753ba4904
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB2980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB298007C711BE72C6A00F8FCE896C0@BN8PR12MB2980.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(199004)(189003)(386003)(102836004)(52116002)(26005)(11346002)(14454004)(7736002)(76176011)(6916009)(486006)(478600001)(446003)(2616005)(186003)(36756003)(6506007)(3846002)(6116002)(2501003)(66066001)(25786009)(305945005)(81156014)(81166006)(71200400001)(8676002)(66446008)(8936002)(4326008)(66476007)(6436002)(64756008)(4744005)(2351001)(5640700003)(6486002)(5660300002)(14444005)(50226002)(2906002)(66946007)(256004)(316002)(6512007)(476003)(99286004)(71190400001)(54906003)(86362001)(1076003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2980;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tw1Kg2UMocV0kpwo9G3Q2hbu8Vm9qdO+5NuSeNGqou2abBId41d2PwZ3diYaOdqIGJ+l86jb1UZaGKuLr9oWCccWL7td554k+ZcgYfxd7La15HM0LSS5Xv3V14lv5yGR37uTlIDAkwIZKkNigQWEcz3MBaNEosXE4FlD1sjspR5jXA1iTt9AllTZlSLO6S51Jh0A/UkX1KbuobTwc+P1wzaXKUNEQDuHRkmPrnFH6LVRafxNKRr2dn/+li3eP/OvkM/jHono/zwIZpiBmdrISWTsDI5dJGnV+ST0ctNZIXhfQXmuJNYwHW9CPSIuyk8VGO2mYBYBOHadn6v7ieqTbetyl9xEYsM0uHeDu37aGuSSwPySBywbkMzFZGKK5Og7KMbz3yCRjM/VwwZrmY31jpMWUE4BmEGHbjjEUqd6k7A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1aa4be-0d72-4766-1552-08d753ba4904
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 10:59:45.5038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HvcWy9VBxYlytJ02+rJy4JpgAGbMlMoUPdEnWzUrFN0qr7baL+wNdXhvcX5YqeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2980
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGeN7jm2bw0thX7j+5cvy+pQIbAPpzXl+YVSI2bMYRY=;
 b=NOihWd9RtLT2pPHUZQ97SlTtSJrTm9kstM00+DitAHtWkq9lORha1FNCHf81fb4pYKvFFGeCRBOct8wjxOx/Md28Ez028VXlR97d4TO8RjWy1dYPJQylQN4q0KpVcPAUZwQcKT0xehOdEdin868kJpMNdYuFXC5GIs+4DrO9670=
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMKaW5kZXggZGZlODVhMWQ3OWE1Li40ZWI1YmFjYjU1ZjcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCkBAIC0yMzIsNyArMjMyLDcgQEAgc3RhdGlj
IGludCBwc3BfdjExXzBfYm9vdGxvYWRlcl9sb2FkX2tkYihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBz
cCkKIAkvKiBDb3B5IFBTUCBLREIgYmluYXJ5IHRvIG1lbW9yeSAqLwogCW1lbWNweShwc3AtPmZ3
X3ByaV9idWYsIHBzcC0+a2RiX3N0YXJ0X2FkZHIsIHBzcC0+a2RiX2Jpbl9zaXplKTsKIAotCS8q
IFByb3ZpZGUgdGhlIHN5cyBkcml2ZXIgdG8gYm9vdGxvYWRlciAqLworCS8qIFByb3ZpZGUgdGhl
IFBTUCBLREIgdG8gYm9vdGxvYWRlciAqLwogCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NN
Tl9DMlBNU0dfMzYsCiAJICAgICAgICh1aW50MzJfdCkocHNwLT5md19wcmlfbWNfYWRkciA+PiAy
MCkpOwogCXBzcF9nZnhkcnZfY29tbWFuZF9yZWcgPSBQU1BfQkxfX0xPQURfS0VZX0RBVEFCQVNF
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
