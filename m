Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81551B5A23
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 05:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE16EDD8;
	Wed, 18 Sep 2019 03:37:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790082.outbound.protection.outlook.com [40.107.79.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97166EDD8
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 03:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyiREjXcrFACSup6jjWVi+JgYD1uw5/Dwz+bQpy04Mh6EcfKp0w62SG84Kjz+7mg7fuE1z7eDhg8/F6EPqSs/gEJD1uejdAL/5H3oo1wHbdpek/THMel7nIAXJ8L600BiUF/hVbsYpCY8lzDHMizzifrVLIOgZKMMoQ5P1EoCXxURCN/kvWjQWRxDUesq9tMWhIToZWH8VRu7htT8ZsfPOcO8mfrAWS/9jCuL13xc4yTqdkwnY1ngjithJWGLKzDQ6oy6crBSGhJnWs7TXvvO2uAvbes/xn1jeEMlhb9mZFS7ZC1mAzBqcuyAzB0clf+mEkotG8D6xSv6S+c5JCTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ7cEoAlBYMfi1xMeYIYNen7ceppVC1ygz0bx9FSWcM=;
 b=N0sfalkuyHKbYoPVp0oojNQkwiXlDMaBIXuNXGW8gQlP88q37ii9JOWrimKo4rm9O/t8gBFRn/4pZdFau6d1RJMik462F7vQA2qFusQkk0HBLVXr0FPRyGUO+y01ylojFrUt8WIkDnAwa0JBFjhIyMv09ME+FwT/g+Yv5+ro/zwkDxOPIFNUg7RobFofT/g0rpnyujyxRHZh4Jj9OacebeOafEaxPoyhDa3P0XpaJ0qXhJDTg/TVg/Dv9nZucBAWkVe1uh51KRE6Z02w/GH2wdm8pbbOofZCIq58X4E6suoN/hlbQ9jVfP9TMi8ho0SAJz2zrDI1aJBJfV8HaTpJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3478.namprd12.prod.outlook.com (20.178.196.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 03:37:47 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 03:37:47 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: avoid null pointer dereference
Thread-Topic: [PATCH 1/2] drm/amdgpu: avoid null pointer dereference
Thread-Index: AQHVbdJwrZgxAhfTiUifG3oXE/GU7Q==
Date: Wed, 18 Sep 2019 03:37:47 +0000
Message-ID: <20190918033721.19070-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e22fb4f-068a-477d-e678-08d73be992ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3478; 
x-ms-traffictypediagnostic: BYAPR12MB3478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3478AF7CC14B65792C494470F18E0@BYAPR12MB3478.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:376;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(26005)(305945005)(81166006)(4744005)(478600001)(2616005)(1076003)(186003)(386003)(36756003)(6116002)(52116002)(6506007)(81156014)(4326008)(66066001)(316002)(102836004)(2906002)(25786009)(3846002)(2501003)(71200400001)(71190400001)(99286004)(8936002)(476003)(486006)(66446008)(66946007)(50226002)(66556008)(66476007)(64756008)(110136005)(6512007)(14454004)(6436002)(7736002)(14444005)(5660300002)(6486002)(6636002)(86362001)(256004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3478;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qWPahwPBRxQxwR2obXW7uIgzMDBhY7B4c/PnsHyxoCszy02sFgeMmfyX91GG202AmT1w+SuIESIYFeTNc1qFs1BxciYjjaTUtE4bOu06nxl489AZzR/mG0iqhZNNoBdnPYFyE6QzomU/AA9x6qLFJrPieCOZZERKeo6/1cahhpFEbcGZ2/yT0FB5Aj896IQE+aqBsyUr9K7m/gDS0+C4494MhaGdSvasDbFotYKmiI98VYJ96sW9m4OJAZ4kNeDIBpXHQMZo+HevI6CUkbBvrEaP0JxTHItZz9pX1Jsgs0IrRavawaJMszVBnUVbP4Jq0aqwLprkY0a9Pexug0BdRytyH89wF8/uwGPL01pHi9+GStccm8ZL3OoOhZo8nGV06JPwEqNMNuF8oHOSWDFCI6ojgwX3kJP+sm6ilbtsj2E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e22fb4f-068a-477d-e678-08d73be992ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 03:37:47.5211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vG5LolTUQHfo6TIpUTJZ+JJmUMUxZzVltKLkl5tQudP+L7fuFuC+rMpl4gr+2mRaHS3LklyFpS+XlHFEh8mS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3478
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ7cEoAlBYMfi1xMeYIYNen7ceppVC1ygz0bx9FSWcM=;
 b=jL0E34u8fkeBhThHj11+rTXTM4kUSOUh/xF9lYJR0gYPSkc3KHLVFFQ5DpHuw2XbEhKlAjIZjofm+RIiQ5KTMbe2fA8l1+SeJRDw5V9VFSFQfbdS773/S6a45lAsZaHNsHDwqQvzZ4qC9kQLPU8xqbb7oqPGFNGgsGI/rY6B+5o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bnVsbCBwdHIgc2hvdWxkIGJlIGNoZWNrZWQgZmlyc3QgdG8gYXZvaWQgbnVsbCBwdHIgYWNjZXNz
CgpDaGFuZ2UtSWQ6IEk4NWMwYTA5NmVlZjc3Y2FkM2EzNDI2NWM5OTViMTg0NTQ1MWUwNGQwClNp
Z25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggMDkwZGFmNTk1NDY5Li5jMzA5MGYwZWI2MDQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTEzMzQsMTMgKzEzMzQsMTMg
QEAgc3RhdGljIGludCBhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogewogCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9j
b250ZXh0KGFkZXYpOwogCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKLQlzdHJ1
Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCA9Ci0JCQkJCSZhZGV2LT5wc3Au
cmFzLnJhcy0+ZWVwcm9tX2NvbnRyb2w7CisJc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRy
b2wgKmNvbnRyb2w7CiAJaW50IHNhdmVfY291bnQ7CiAKIAlpZiAoIWNvbiB8fCAhY29uLT5laF9k
YXRhKQogCQlyZXR1cm4gMDsKIAorCWNvbnRyb2wgPSAmYWRldi0+cHNwLnJhcy5yYXMtPmVlcHJv
bV9jb250cm9sOwogCWRhdGEgPSBjb24tPmVoX2RhdGE7CiAJc2F2ZV9jb3VudCA9IGRhdGEtPmNv
dW50IC0gY29udHJvbC0+bnVtX3JlY3M7CiAJLyogb25seSBuZXcgZW50cmllcyBhcmUgc2F2ZWQg
Ki8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
