Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0139C1BDC
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 08:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695096E39B;
	Mon, 30 Sep 2019 06:58:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBA26E39B
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 06:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7ukNuiYd6+UVqvm9h9ZKo9Z0c4MivX+nR0g3zxZxguIIwyNUd6J1Q8L85npbBVUyGcLgp7MKTkH7dDblFpDiWE+pa22i/TCE/BFi9iian6xzqn+HG0qYijq9uRlDk2w56vET8lU03TfiTFMG2Byry7cUB8k6ITPjAjoSz6n8A8gk7lz86pKlXNdovOK9gZ2KYMBH2W588Pl5PKOM2YVUtQq12CGSZWWg80VMuZRjPLlNPhRrAjYSPEnar4djGrYAn/ccldGQ5WzjCPaJAmL5KQfDr6JDVptxtHykq4AQvQgo+xyLFjKrOzI9iGGDOWgts/Vz+cv0ahBAgoXvB3FSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWFuNJm8khimsCItUN6O63EQKDsEffa6wr8qxmLsQbc=;
 b=A3niRbFovxEKRGalwZMvIdNHJni7mxCdPYBCKTnRo+oILVIRcwabCg0Hbd9LUsnK5T36RqX+Hk2bTGexQgLdGdd0xKzJUdkY54IgXHC7HGvIdh6S1ZyFpI1Yg6hgZGN+aEzxcFn7LUWNs4Nk4D6btJT+IjbLHaXagspTRMG/EMd18e3EnhHRF9GIkM0EtlapENWAzNUFHd0Uhm/SHZpEzxyyR9SFZPgn5QNpRyaadbx4O5eKCmPBdUkOvnD6yN84CXymkOmlpr44vjZ+feSW6S7jBRsZK3jE4Zy55eg6M9MKFGvKrG3eo8vC0sncRGGRGTDTA2wCKRHw7QKBubDdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3342.namprd12.prod.outlook.com (20.178.240.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 06:58:25 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 06:58:25 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Topic: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Index: AQHVd1x03AHNLWAbRUS7wbpwyyAdWg==
Date: Mon, 30 Sep 2019 06:58:25 +0000
Message-ID: <20190930065810.15372-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0074.apcprd03.prod.outlook.com
 (2603:1096:203:72::14) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd41c22-d5b1-4862-579c-08d7457396ed
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33425B9F118860AA935159EEB0820@MN2PR12MB3342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(199004)(189003)(99286004)(486006)(110136005)(50226002)(476003)(2616005)(26005)(8936002)(186003)(8676002)(14454004)(66066001)(102836004)(386003)(6506007)(14444005)(256004)(81166006)(81156014)(316002)(52116002)(71200400001)(71190400001)(86362001)(6116002)(478600001)(6436002)(3846002)(6636002)(2906002)(36756003)(1076003)(5660300002)(6512007)(66946007)(66476007)(6486002)(64756008)(66446008)(66556008)(2501003)(305945005)(7736002)(4326008)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3342;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pdXkoUyEOEa4BvaX1lz1zNxG5BmllINwLTe1ZOtm6MOMJXyFg2IBbw2/cd3Zr3mwtaoB9fGcqhELcvaMZIZ4mzW8JrPIFXacfg88qzNADMGfqOxdu0bCiJdwA00LVZLwwR566BBptbL4njl9SxW7jXHV8QjIEgszpWFM5hm84EvSAEP5gCZVIxze5RBjoLny4ZtozfKKyl++DwCWtKXejvrT8TiRv2+zp5p966ggf4QoiDsvDl5s3AyvnX9SU7yElac7yrxWukTxKYU+loXh6QFMsYYHW2ubcD/QwH2WzaxbTE9heGBn6IAtvXE56ZOTpv6N+8PlV5PGUKRl5yqfxMgkzQoJfhb87Z6JjR3neOoCq4noxcEfWHvcvNjMkXnbOliNF128HyQQwoRYRE2a4yo9htV8oqrMORDkI1Ux7n0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd41c22-d5b1-4862-579c-08d7457396ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 06:58:25.4835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iO74gZtgIclHxPqoT0awTdDPLvhLU0miJTu0tEz5cQT5E3GCHVPaapeKyQE1M0N2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWFuNJm8khimsCItUN6O63EQKDsEffa6wr8qxmLsQbc=;
 b=ss+j5op4NU2yJ2v/KkqlN9SHWoW1O26UteePIzBVi0+GZWVuk8R4SHqbbsPfIP/FTzJfs9LKalYWg1jDPZR2eHhMcu7Lc5z9rSbSsZ+egTEE7Ndw7threZVzCRu2QYKHD2mAdmW+3Cgyu7GAJV2jCy6jcft/PPqfCvbKhvgLVIc=
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

Y2hlY2sgd2hldGhlciBhIHBhZ2UgaXMgYmFkIHBhZ2UgYmVmb3JlIGVycm9yIGluamVjdGlvbgoK
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGZlM2E1N2U1NjdjOC4uZDUwZTU2NWIwYjIwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC03MSw2ICs3MSw5IEBA
IGNvbnN0IGNoYXIgKnJhc19ibG9ja19zdHJpbmdbXSA9IHsKIAogYXRvbWljX3QgYW1kZ3B1X3Jh
c19pbl9pbnRyID0gQVRPTUlDX0lOSVQoMCk7CiAKK3N0YXRpYyBib29sIGFtZGdwdV9yYXNfY2hl
Y2tfYmFkX3BhZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJdWludDY0X3QgYWRk
cik7CisKIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWFkKHN0cnVjdCBmaWxl
ICpmLCBjaGFyIF9fdXNlciAqYnVmLAogCQkJCQlzaXplX3Qgc2l6ZSwgbG9mZl90ICpwb3MpCiB7
CkBAIC0yOTAsNiArMjkzLDEzIEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19j
dHJsX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyIF9fdXNlciAqCiAJCQlicmVhazsK
IAkJfQogCisJCS8qIGNlL3VlIGVycm9yIGluamVjdGlvbiBmb3IgYSBiYWQgcGFnZSBpcyBub3Qg
YWxsb3dlZCAqLworCQlpZiAoYW1kZ3B1X3Jhc19jaGVja19iYWRfcGFnZShhZGV2LCBkYXRhLmlu
amVjdC5hZGRyZXNzKSkgeworCQkJRFJNX1dBUk4oIkRSTSBXQVJOOiAweCVsbHggaGFzIGJlZW4g
bWFya2VkIGFzIGJhZCBiZWZvcmUgZXJyb3IgaW5qZWN0aW9uIVxuIiwKKwkJCQkJZGF0YS5pbmpl
Y3QuYWRkcmVzcyk7CisJCQlicmVhazsKKwkJfQorCiAJCS8qIGRhdGEuaW5qZWN0LmFkZHJlc3Mg
aXMgb2Zmc2V0IGluc3RlYWQgb2YgYWJzb2x1dGUgZ3B1IGFkZHJlc3MgKi8KIAkJcmV0ID0gYW1k
Z3B1X3Jhc19lcnJvcl9pbmplY3QoYWRldiwgJmRhdGEuaW5qZWN0KTsKIAkJYnJlYWs7CkBAIC0x
NDMwLDYgKzE0NDAsMzQgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2xvYWRfYmFkX3BhZ2VzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiByZXQ7CiB9CiAKKy8qIGNoZWNrIGlm
IGFuIGFkZHJlc3MgYmVsb25ncyB0byBiYWQgcGFnZSAqLworc3RhdGljIGJvb2wgYW1kZ3B1X3Jh
c19jaGVja19iYWRfcGFnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQl1aW50NjRf
dCBhZGRyKQoreworCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250
ZXh0KGFkZXYpOworCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKKwlpbnQgaSwg
cmV0ID0gZmFsc2U7CisKKwlpZiAoIWNvbiB8fCAhY29uLT5laF9kYXRhKQorCQlyZXR1cm4gcmV0
OworCisJbXV0ZXhfbG9jaygmY29uLT5yZWNvdmVyeV9sb2NrKTsKKwlkYXRhID0gY29uLT5laF9k
YXRhOworCWlmICghZGF0YSkKKwkJZ290byBvdXQ7CisKKwlhZGRyID4+PSBBTURHUFVfR1BVX1BB
R0VfU0hJRlQ7CisJZm9yIChpID0gMDsgaSA8IGRhdGEtPmNvdW50OyBpKyspCisJCWlmIChhZGRy
ID09IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2UpIHsKKwkJCXJldCA9IHRydWU7CisJCQlnb3Rv
IG91dDsKKwkJfQorCitvdXQ6CisJbXV0ZXhfdW5sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwor
CXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfY3JlYXRlX2JhZF9wYWdl
c19ibyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAkvKiBOb3RlOiB0aGUgY2FsbGVy
IHNob3VsZCBndWFyYW50ZWUgY29uIGFuZCBkYXRhIGFyZSBub3QgTlVMTCAqLwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
