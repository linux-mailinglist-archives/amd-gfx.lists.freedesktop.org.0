Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A1A992B
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 06:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB6289CA2;
	Thu,  5 Sep 2019 04:03:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B35A89CA2
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 04:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyBbVLCzuRItxSKD+JQ/b/zuOzKrt4Ba5Cv3yrl11DzL4u5CatvP82LDwmoWDaVMfhjxuw8kZCBp3zotbUnBPHW9LkWWVNZRJs6xJ05G+SN3+fqgzZT03YWBDCqRKWwI/401X1Yioz2Byo9eM/sZJ8gSDUlsNRglZjxQBvfijeLBVKlY/3/Yl5dhc4e0Ezz96sVLBJ7Py2OOmQ6DyNZ7ecgoxhHDU4MqX35GdjWrZNrnwUMaJ+yPzMCi8x1NG3nLpFdqIhSnJ7Wc1MHTfscRDJllIDOJM93Gg8n0YFB+BYN0xXD9KluGH43BfwkoyrUdeilZHpnAaS7HcasKxH97WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0eiaRSVL2kVupq4l3vx7I3H+0ANYedb6RLPSmsbTRs=;
 b=Y2JFeBlq+g3b8TVaRvR+eu/lKDzjAH+8SJrjggnk/K/UdE8SsY5cVlR1ZhmszbLO3A0M21zoTpfSsqN/WAwn6Qy+BYiiJPsOPBiM86YsyQzfSO62GTs6aDaKv6XhLwdtdwRajSJOB9gZVAxOUx9uNrAP3j75JNoUQ/y24WhI4F9XJLV469hM6L3kWyA6N92qmYMSW7dC1Y8RkKOLfCd5XtoRrorfGm9w7hXeqvzO2yh8kV5J16qhTDbjXPk3u2bRE5unH3jEZzUDrGHCtrK3QTGxnj2gU8j5dhCgid+pNeCDT2ti/3DY3YNnVsZeCD3f0jKkVOuzTomH580S/2rESA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3807.namprd12.prod.outlook.com (10.255.237.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 04:03:56 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 04:03:56 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Clements, John" <John.Clements@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: Hook EEPROM table to RAS
Thread-Topic: [PATCH 2/4] drm/amdgpu: Hook EEPROM table to RAS
Thread-Index: AQHVY57vL8uUuzUQoUStjyJpL7yYUg==
Date: Thu, 5 Sep 2019 04:03:55 +0000
Message-ID: <20190905040324.18741-2-tao.zhou1@amd.com>
References: <20190905040324.18741-1-tao.zhou1@amd.com>
In-Reply-To: <20190905040324.18741-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0030.apcprd03.prod.outlook.com
 (2603:1096:203:2f::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eab1490a-18b6-4ead-b46f-08d731b6122c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3807; 
x-ms-traffictypediagnostic: MN2PR12MB3807:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3807ACA8FF8738D69F2D4647B0BB0@MN2PR12MB3807.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(66556008)(2501003)(6512007)(446003)(14444005)(26005)(11346002)(6436002)(3846002)(2906002)(256004)(53936002)(2616005)(66476007)(64756008)(66446008)(66946007)(6486002)(6116002)(71200400001)(71190400001)(316002)(305945005)(110136005)(102836004)(7736002)(1076003)(6506007)(50226002)(386003)(8676002)(81166006)(6636002)(81156014)(86362001)(478600001)(36756003)(99286004)(486006)(186003)(25786009)(476003)(4326008)(5660300002)(8936002)(52116002)(14454004)(76176011)(66066001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3807;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YvQ6D7nwHh5pqohDsTO8dnmdi+IjIJI14UpKNK0zw/zPLJQoqyvcXA9f7v3wLXUL/O1V/ZRB8CY/F9vR6HxAyogHot0P5VbWKD8SBVT/DBIoCFAFXwq2crdalNwoqN2egjT8Xi3xeec/z7JwZiYAIF9CaUmEn+FlkwjXldmrAq7zl/ICdf9AhV2iyfRixEOOTQ4uvw0pymf3fe2ArVSDonlXm6rY5K3Y6QkMoZAOZmP06/tS1pLg7UrPPCzHPUKKfcgpQpwVNcziBZEHiurrGgjlmDI9V8KC7hx2uNqnICGZaKptGNKc1A/fUdFQsKElHadQ9Ss3PO8JvtcaIZdE6NrZlOERu7NQkvk7m16HIMX1oqCv/iuRMnRMg883Q/O3GU9bP5x4/rKxQg+XhKjrrDspXGEJ17C8u29YpFCvOhw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab1490a-18b6-4ead-b46f-08d731b6122c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 04:03:55.8551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIwcSBJPMzkjXvLgTNry6zKLw5SFDW2MDrBQ+w6Vd03Yt6w/KsGqGbkbptJvSREI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3807
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0eiaRSVL2kVupq4l3vx7I3H+0ANYedb6RLPSmsbTRs=;
 b=NxRhDav6W8dqVBw1sR+jpUO4a6FXl6l5PibXpijPnGdkY6pN/QFlCQrWFzx+B26kRmXjQhNxgqok9MNGjQS/KnrIrgztyw90viA0zHl71V2i3kGL57jecYR0Qr0ATIGUT7AMw6eVa9YfXqKClmuPo0UvIXmc7xwrIT8F0Jr0dlU=
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

c3VwcG9ydCBlZXByb20gcmVjb3JkcyBsb2FkIGFuZCBzYXZlIGZvciByYXMsCm1vdmUgRUVQUk9N
IHJlY29yZHMgc3RvcmluZyB0byBiYWQgcGFnZSByZXNlcnZpbmcKCnYyOiByZW1vdmUgcmVkdW5k
YW50IGNoZWNrIGZvciBjb24tPmVoX2RhdGEKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8u
emhvdTFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5n
cm9kem92c2t5QGFtZC5jb20+ClJldmlld2VkLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAx
MDkgKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9u
cygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCmluZGV4IGM2ZjRjMDFiOThhOC4uZTY4ZjQzZDFjZmVhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xMzY0LDYgKzEzNjQsNjkgQEAgaW50IGFtZGdwdV9y
YXNfYWRkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4gcmV0
OwogfQogCisvKgorICogd3JpdGUgZXJyb3IgcmVjb3JkIGFycmF5IHRvIGVlcHJvbSwgdGhlIGZ1
bmN0aW9uIHNob3VsZCBiZQorICogcHJvdGVjdGVkIGJ5IHJlY292ZXJ5X2xvY2sKKyAqLworc3Rh
dGljIGludCBhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQoreworCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0
KGFkZXYpOworCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKKwlzdHJ1Y3QgYW1k
Z3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCA9CisJCQkJCSZhZGV2LT5wc3AucmFzLnJh
cy0+ZWVwcm9tX2NvbnRyb2w7CisJaW50IHNhdmVfY291bnQ7CisKKwlpZiAoIWNvbiB8fCAhY29u
LT5laF9kYXRhKQorCQlyZXR1cm4gMDsKKworCWRhdGEgPSBjb24tPmVoX2RhdGE7CisJc2F2ZV9j
b3VudCA9IGRhdGEtPmNvdW50IC0gY29udHJvbC0+bnVtX3JlY3M7CisJLyogb25seSBuZXcgZW50
cmllcyBhcmUgc2F2ZWQgKi8KKwlpZiAoc2F2ZV9jb3VudCA+IDApCisJCWlmIChhbWRncHVfcmFz
X2VlcHJvbV9wcm9jZXNzX3JlY29kcygmY29uLT5lZXByb21fY29udHJvbCwKKwkJCQkJCQkmZGF0
YS0+YnBzW2NvbnRyb2wtPm51bV9yZWNzXSwKKwkJCQkJCQl0cnVlLAorCQkJCQkJCXNhdmVfY291
bnQpKSB7CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBzYXZlIEVFUFJPTSB0YWJsZSBkYXRhISIp
OworCQkJcmV0dXJuIC1FSU87CisJCX0KKworCXJldHVybiAwOworfQorCisvKgorICogcmVhZCBl
cnJvciByZWNvcmQgYXJyYXkgaW4gZWVwcm9tIGFuZCByZXNlcnZlIGVub3VnaCBzcGFjZSBmb3IK
KyAqIHN0b3JpbmcgbmV3IGJhZCBwYWdlcworICovCitzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9h
ZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJc3RydWN0IGFtZGdw
dV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wgPQorCQkJCQkmYWRldi0+cHNwLnJhcy5yYXMt
PmVlcHJvbV9jb250cm9sOworCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpicHMgPSBOVUxM
OworCWludCByZXQgPSAwOworCisJLyogbm8gYmFkIHBhZ2UgcmVjb3JkLCBza2lwIGVlcHJvbSBh
Y2Nlc3MgKi8KKwlpZiAoIWNvbnRyb2wtPm51bV9yZWNzKQorCQlyZXR1cm4gcmV0OworCisJYnBz
ID0ga2NhbGxvYyhjb250cm9sLT5udW1fcmVjcywgc2l6ZW9mKCpicHMpLCBHRlBfS0VSTkVMKTsK
KwlpZiAoIWJwcykKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlpZiAoYW1kZ3B1X3Jhc19lZXByb21f
cHJvY2Vzc19yZWNvZHMoY29udHJvbCwgYnBzLCBmYWxzZSwKKwkJY29udHJvbC0+bnVtX3JlY3Mp
KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGxvYWQgRUVQUk9NIHRhYmxlIHJlY29yZHMhIik7
CisJCXJldCA9IC1FSU87CisJCWdvdG8gb3V0OworCX0KKworCXJldCA9IGFtZGdwdV9yYXNfYWRk
X2JhZF9wYWdlcyhhZGV2LCBicHMsIGNvbnRyb2wtPm51bV9yZWNzKTsKKworb3V0OgorCWtmcmVl
KGJwcyk7CisJcmV0dXJuIHJldDsKK30KKwogLyogY2FsbGVkIGluIGdwdSByZWNvdmVyeS9pbml0
ICovCiBpbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHsKQEAgLTEzNzEsNyArMTQzNCw3IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVf
YmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN0cnVjdCByYXNfZXJyX2hh
bmRsZXJfZGF0YSAqZGF0YTsKIAl1aW50NjRfdCBicDsKIAlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsK
LQlpbnQgaTsKKwlpbnQgaSwgcmV0ID0gMDsKIAogCWlmICghY29uIHx8ICFjb24tPmVoX2RhdGEp
CiAJCXJldHVybiAwOwpAQCAtMTM5MSw5ICsxNDU0LDEyIEBAIGludCBhbWRncHVfcmFzX3Jlc2Vy
dmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlkYXRhLT5icHNfYm9b
aV0gPSBibzsKIAkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IGkgKyAxOwogCX0KKworCS8qIGNvbnRp
bnVlIHRvIHNhdmUgYmFkIHBhZ2VzIHRvIGVlcHJvbSBldmVuIHJlZXNydmVfdnJhbSBmYWlscyAq
LworCXJldCA9IGFtZGdwdV9yYXNfc2F2ZV9iYWRfcGFnZXMoYWRldik7CiBvdXQ6CiAJbXV0ZXhf
dW5sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwotCXJldHVybiAwOworCXJldHVybiByZXQ7CiB9
CiAKIC8qIGNhbGxlZCB3aGVuIGRyaXZlciB1bmxvYWQgKi8KQEAgLTE0MjUsMzMgKzE0OTEsMTEg
QEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlbGVhc2VfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGFtZGdwdV9yYXNfc2F2
ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCi17Ci0JLyogVE9ETwotCSAq
IHdyaXRlIHRoZSBhcnJheSB0byBlZXByb20gd2hlbiBTTVUgZGlzYWJsZWQuCi0JICovCi0JcmV0
dXJuIDA7Ci19Ci0KLS8qCi0gKiByZWFkIGVycm9yIHJlY29yZCBhcnJheSBpbiBlZXByb20gYW5k
IHJlc2VydmUgZW5vdWdoIHNwYWNlIGZvcgotICogc3RvcmluZyBuZXcgYmFkIHBhZ2VzCi0gKi8K
LXN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19sb2FkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKLXsKLQlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqYnBzID0gTlVMTDsKLQlp
bnQgcmV0OwotCi0JcmV0ID0gYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKGFkZXYsIGJwcywKLQkJ
CQlhZGV2LT51bWMubWF4X3Jhc19lcnJfY250X3Blcl9xdWVyeSk7Ci0KLQlyZXR1cm4gcmV0Owot
fQotCiBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRf
Y29udGV4dChhZGV2KTsKIAlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKipkYXRhID0gJmNv
bi0+ZWhfZGF0YTsKKwlpbnQgcmV0OwogCiAJKmRhdGEgPSBrbWFsbG9jKHNpemVvZigqKmRhdGEp
LAogCQkJR0ZQX0tFUk5FTHxfX0dGUF9aRVJPKTsKQEAgLTE0NjMsOCArMTUwNywxOCBAQCBzdGF0
aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAlhdG9taWNfc2V0KCZjb24tPmluX3JlY292ZXJ5LCAwKTsKIAljb24tPmFkZXYgPSBhZGV2
OwogCi0JYW1kZ3B1X3Jhc19sb2FkX2JhZF9wYWdlcyhhZGV2KTsKLQlhbWRncHVfcmFzX3Jlc2Vy
dmVfYmFkX3BhZ2VzKGFkZXYpOworCXJldCA9IGFtZGdwdV9yYXNfZWVwcm9tX2luaXQoJmFkZXYt
PnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsK
KworCWlmIChhZGV2LT5wc3AucmFzLnJhcy0+ZWVwcm9tX2NvbnRyb2wubnVtX3JlY3MpIHsKKwkJ
cmV0ID0gYW1kZ3B1X3Jhc19sb2FkX2JhZF9wYWdlcyhhZGV2KTsKKwkJaWYgKHJldCkKKwkJCXJl
dHVybiByZXQ7CisJCXJldCA9IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7CisJ
CWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KIAogCXJldHVybiAwOwogfQpAQCAtMTQ3NSw3
ICsxNTI5LDYgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhID0g
Y29uLT5laF9kYXRhOwogCiAJY2FuY2VsX3dvcmtfc3luYygmY29uLT5yZWNvdmVyeV93b3JrKTsK
LQlhbWRncHVfcmFzX3NhdmVfYmFkX3BhZ2VzKGFkZXYpOwogCWFtZGdwdV9yYXNfcmVsZWFzZV9i
YWRfcGFnZXMoYWRldik7CiAKIAltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
