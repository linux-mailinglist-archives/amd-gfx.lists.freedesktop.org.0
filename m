Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6DA641A
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 10:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C2489235;
	Tue,  3 Sep 2019 08:41:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34F289235
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 08:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5cM9gZbQiX7ACBHD5j+dwZxDImifLDGObBCUOs68ifTav7oOTxU30hgvTbdreSV8+YGMIOoZRM3rWQJWmeoNP5M+WgE62nKvipRhO/MckQgDEgidrOZ1clKw0NeR1pso6Vbw5rOxkhBmekIwCMTjm0gep5MSZAWYg45IsRQyn0HFqBukh4nN3w1vTEtceGFHHuBq8K7Ck2b4V+A4cxZfJ71t1As7ZlO2pgMfq7kR1NZnDvOOyH2tHsS3nDxhaVg1ZczcQAx1o52lrE3pqTJxW3DwkJ5uFqnAzrE/UAQCMkSrCWC0aQD4EFcNEZUxqodpVCjrXkEiQPvMPEGh99lHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iji1ypPpEiAyFQNCGOPJXY+1KkxyYZHATbHQR9p9ZP8=;
 b=jE5ZXr/abOJRYAEqWjdX0ISA2a0TWssHvsKrchUYVk2L3+IeN33SIo5AFYCM0q+i/yDkCN+dUkLjAO8gXagvUve9YCxNf5lf7aO/vtaFEAq0nt8k+0uy4yVwYMgnMLLEE0xUCNf7qxg8qGU3rtWrCVtp/O8bIzvpBwVlq8U8C7QW54ChSzYywZAf0vKMnNMvJVuL72bOvHr2XDFTsy4FoKtGX0+qZop4An5xi/OXPyzhgXTZopby0T4lnu5GOjgD6FGpaYtz6nyti2Q+o62+AmXSC+PdNxBM7iCjmEEeISf1nMGQgLoPs+a+9Rk2qREatyx4M7J87UbOtFdkwMVoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3359.namprd12.prod.outlook.com (20.178.241.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Tue, 3 Sep 2019 08:41:46 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.020; Tue, 3 Sep 2019
 08:41:46 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li, 
 Dennis" <Dennis.Li@amd.com>
Subject: [PATCH] drm/amdgpu: change r type to int in gmc_v9_0_late_init
Thread-Topic: [PATCH] drm/amdgpu: change r type to int in gmc_v9_0_late_init
Thread-Index: AQHVYjNrOScUOa7h4UyX3UFXK1QYvg==
Date: Tue, 3 Sep 2019 08:41:45 +0000
Message-ID: <20190903084125.10698-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e69f7fe-3ca9-429c-1eb0-08d7304a8d7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3359; 
x-ms-traffictypediagnostic: MN2PR12MB3359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33597DDF8558AE86C28B4C21B0B90@MN2PR12MB3359.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(486006)(476003)(2616005)(305945005)(8676002)(81156014)(36756003)(26005)(8936002)(102836004)(386003)(6506007)(186003)(256004)(14444005)(53936002)(6486002)(6636002)(7736002)(6512007)(5660300002)(71190400001)(25786009)(86362001)(71200400001)(4326008)(6116002)(3846002)(52116002)(2501003)(2906002)(6436002)(110136005)(316002)(50226002)(99286004)(478600001)(1076003)(66946007)(14454004)(66446008)(64756008)(66556008)(81166006)(4744005)(66066001)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3359;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hC/wqPi5SYNGek+nwbLNar5t6bT7vJ9/+hp7Uj9Ug66Ozv+riTsRu03fFOGCtu1HQDrJceFGCU3TW/+9BHQ0PGd6obhuMANvImCaKYh6Glx9fzmFfHHwFfUBc9wnR2Q2KyIzxK1yHo4i16SvLy1EXPboyZCopG7Yiu/qoj2FjTjVRf4JvwMOB1TbYmHAmR0rSUlfxmJ2Cav0EpGXZEz2nEVuMi8zqFjofzFIRbhfOjW4jVbAijBn0LqPgpQd53MoLFQv7hRUA6QOioYQAtz77Y38JAIubOPnoLMqXxmFo3rjSwylC6jyLFMXQD3i1oEbSoa1BpyxMY2fsS+86ZL1lnsk7HBwidDkihl0Q1vHTKhWQytvAsRwACAKHILsc4PqQJQFOHvuOofUtC13FHH89eYHn1HVKv6NpO4UkM9BRrM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e69f7fe-3ca9-429c-1eb0-08d7304a8d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:41:45.9968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JXusHFW67iQ5MvS4hlJCKedWNwoKbhbhZSqiaJrxA3VLMEbuz8MUmDj6PMNBolyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iji1ypPpEiAyFQNCGOPJXY+1KkxyYZHATbHQR9p9ZP8=;
 b=F+ciD0wBEhbGZaJcLoI/dP00nU58l2o1udLsGIyY25/Lfbd5rwGLRYIUwLAe/LOA6HvMCWAJ56/d8jgJdeKlesEAJg9AuhQU0BhvP6Y55xPJwZJdMQkhHhmYtWQN57kqCgClJxGeRWGtwDHBLeEpBET7MqjIHe9+Yb6Z/vjnXEk=
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

Y2hhbmdlIHIgdHlwZSBmcm9tIGJvb2wgdG8gaW50LCBzdWl0YWJsZSBmb3IgYm90aCBib29sIGFu
ZCBpbnQgcmV0dXJuCnZhbHVlCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDBmZTI0OTQzZDUwZS4uZjE0MGE0OTFhMmQx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTgzMSw3ICs4MzEsNyBA
QCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogc3RhdGlj
IGludCBnbWNfdjlfMF9sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwotCWJvb2wgcjsK
KwlpbnQgcjsKIAogCWlmICghZ21jX3Y5XzBfa2VlcF9zdG9sZW5fbWVtb3J5KGFkZXYpKQogCQlh
bWRncHVfYm9fbGF0ZV9pbml0KGFkZXYpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
