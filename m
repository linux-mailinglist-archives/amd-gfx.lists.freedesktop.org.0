Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1DA5E5B
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932128996E;
	Tue,  3 Sep 2019 00:02:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800071.outbound.protection.outlook.com [40.107.80.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383AE8995F
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5+BsCWEn3GAIRw4Y0FKD0U+9ZpX8c1IAuZe2g6FMtLjjOtutzuhsD3nS+xyGbJNwed6YwiZZa4KE+pHHkrDOce8u9KXVcWYfDFb3i1zecBAbkwvFpVkWHXF0SJe0iRIp29z2zCtt6i9GKVQAdvXAksKJoBqX7xmhkgF4dwcJW5p5p7M6UA7S8Twp4EYZgOEb48mGZmpL1imokqWCfLeOqgZW3CEC9Fy6ac6G35BSr2LVnLGDiMix7DvOs+o9ICQHTPrO0vZcgaCoNFXCJGw9cvN9td7Xkx0kmWMDdF9GM/RzwXVu9dU5z+z6uI9NNmYTYIkVOc16XbBT0Lxx9XvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ExIvxkB2+K0mSwp18uH7dGh9FdOSZ1C5b+QZVoKViY=;
 b=jsPh1RQnDf7P1YZmtB3eZYVp0new1sGo4BU/DenoiJ9anvEe5rJWVH4Hq28Vm3ZfFvyzrk8/eXUmUVswdr/TLTOjyislSg/VhM8Sq87Z8BSPUG7eC6EZb0r4Iif5RMAq8FUP1aWZPvkgy7vouUU5kb5c9RIEKbQnsDOqPVOwyYiwsnIiKQTuiHS+nVAZuILS2w4xisq2oW5kq1wBNSGOKIlqzKtQoJta7GtKI1sri0tvkMErDL18xxbigtSuWBf8nxh2AyopIIl+vA4qfNyYvhTxfqMO+DkLKqUQyyqwkBRj3r0swjSDW8cCxQQY1eTl9fvvu5T/Bf4S0hQMJfBvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:02:29 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:02:23 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 10/10] drm/amdgpu: init mmhub ras functions for arcturus
Thread-Topic: [PATCH 10/10] drm/amdgpu: init mmhub ras functions for arcturus
Thread-Index: AQHVYerdTqq6ArP7zkm2R78v7SsvWA==
Date: Tue, 3 Sep 2019 00:02:23 +0000
Message-ID: <1567468894-11852-10-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ce6bd64-3ca8-49f3-7ba2-08d73001ff6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18185B4B536FB83536CC54A2FCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uk/weQHb4ITiiakq+DKk3R1KbvrsUkgrHCxzMVwTrggzSsoCVJOWaSs4qYZlp6yyYjqwru51Y0gySYWtwk9TWvd+GcnRlOoySLKcwDKMst/K1nhhtlg709MVbA3B/y1gFBeNG+L7Qt6C6siAWkDAiHlTGtkMlcgGpSQnI0s0EeTJm+Y4psZUA3pmtL0fW3MA91XgvyHZtTz/4z7WVNzi6r9wA0SdwaJjAabh9w1oFn2wRj8H/WVM49iBicWs/ORMehkamx9W6Gff8Ziz+/8MJwhmIYOAF1zUtGvWDflUYGoHJATI77Z+yrzStlaz+l1GqnyVNbEin28Tdj24/eIaFOhWQJX6ndBI6OF7wsaVkrDlg4rVEVQOtoCOGo2cBcwEkAVpSZdDb42CIlzy25An8xfFQI6MJdQTjzp8ZrRYYGA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce6bd64-3ca8-49f3-7ba2-08d73001ff6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:02:23.7192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3xhOTbZbGv4WF8yiiEqIhAxd5rIJt8SX3D6ufhv3Yv5R8ag82YXzJNNSBOqtVQhHvaCnW0jV0J96J8HhyKlUaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ExIvxkB2+K0mSwp18uH7dGh9FdOSZ1C5b+QZVoKViY=;
 b=1J5ZFLxY/Q+OzI/VmLsN4U1lPhp5puNp7pK4MtBkwovRwpBOKLsFkqmNV7+lejyRdSPUu6osa2L+3F02UGLBCWVAkG3urColZkilQf5YI+Ml2rFtHcTG5y14VLidSt4j4VBkxsaeu5OBq3fi2NOfEoKTTS1ez8jc9PBpWE8hRsc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YXJjdHVydXMgbW1odWIgcmFzIGlzIGRpZmZlcmVudCBmcm9tIHZnMjAgYW5kIG5lZWQgdG8KaW1w
bGVtZW50IGFyY3R1cnVzL21taHViXzlfNF8xIHNwZWNpZmljIG1taHViIGNhbGxiYWNrcwoKU2ln
bmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8ICAzICsrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5jIHwgMTEgKysrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuaCB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4
IGFlMzdiMDguLjk1ZjdmYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpA
QCAtNjgzLDYgKzY4Myw5IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF9tbWh1Yl9mdW5jcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTIwOgogCQlhZGV2LT5t
bWh1Yl9mdW5jcyA9ICZtbWh1Yl92MV8wX2Z1bmNzOwogCQlicmVhazsKKwljYXNlIENISVBfQVJD
VFVSVVM6CisJCWFkZXYtPm1taHViX2Z1bmNzID0gJm1taHViX3Y5XzRfZnVuY3M7CisJCWJyZWFr
OwogCWRlZmF1bHQ6CiAJCWJyZWFrOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L21taHViX3Y5XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHVi
X3Y5XzQuYwppbmRleCAwY2Y3ZWY0Li5hOTI5ZmNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbW1odWJfdjlfNC5jCkBAIC02NDAsMyArNjQwLDE0IEBAIHZvaWQgbW1odWJfdjlfNF9nZXRf
Y2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiAqZmxhZ3MpCiAJaWYg
KGRhdGEgJiBBVENMMl8wX0FUQ19MMl9NSVNDX0NHX19NRU1fTFNfRU5BQkxFX01BU0spCiAJCSpm
bGFncyB8PSBBTURfQ0dfU1VQUE9SVF9NQ19MUzsKIH0KKworc3RhdGljIHZvaWQgbW1odWJfdjlf
NF9xdWVyeV9yYXNfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJ
CSAgICAgdm9pZCAqcmFzX2Vycm9yX3N0YXR1cykKK3sKKwkvKlRPRE8qLworfQorCitjb25zdCBz
dHJ1Y3QgYW1kZ3B1X21taHViX2Z1bmNzIG1taHViX3Y5XzRfZnVuY3MgPSB7CisJLnJhc19sYXRl
X2luaXQgPSBhbWRncHVfbW1odWJfcmFzX2xhdGVfaW5pdCwKKwkucXVlcnlfcmFzX2Vycm9yX2Nv
dW50ID0gbW1odWJfdjlfNF9xdWVyeV9yYXNfZXJyb3JfY291bnQsCit9OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjlfNC5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjlfNC5oCmluZGV4IGQ0MzVjZmMuLjUzMjJlNDIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmgKQEAgLTMzLDQgKzMzLDUgQEAgaW50IG1t
aHViX3Y5XzRfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJ
ICAgICAgIGVudW0gYW1kX2Nsb2NrZ2F0aW5nX3N0YXRlIHN0YXRlKTsKIHZvaWQgbW1odWJfdjlf
NF9nZXRfY2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiAqZmxhZ3Mp
OwogCitleHRlcm4gY29uc3Qgc3RydWN0IGFtZGdwdV9tbWh1Yl9mdW5jcyBtbWh1Yl92OV80X2Z1
bmNzOwogI2VuZGlmCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
