Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36946AE3C1
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 08:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6543B89F43;
	Tue, 10 Sep 2019 06:31:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F342C89F43
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 06:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaDVyMHNGJvi7fD83HQFFFh+sj9GMMUjoUcnyfKBolm6vHEa6grI8dfzdqys+9ljG/wLwQociwuBwQ0tnjEJGj8+1pA6p3pbvbbVkoq8PBiA273dRfKMHcyL+MMa4y8YccEsWs/k4uJ8jQDv/76QUpb+nnQ2fwRZ6JROxQnW56PbD6Aosr5yBN9ZF+c9vqeBtNCZV4tDJjrrnTQGy8/kdlMXlywFhgRObLanRMvrxOV4X1Cct5elhgJvp1gEBG6f0yTy3gjLK7AbuaNlW6T05bCQZdJXPGf2beZcoenuiSMoeFXs1iDfIjdvlOBMiyjzI90Kx0Lsd7y7SPSaZ6jQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1WVx74M+qo7F4PeMX/7kgU4g/BHhpW+sRqszv6Tf8E=;
 b=DNGCqJCL8mdywQaOs1EddE9NZV74EK640p+EBU4/zsvGLOh85dfQwWlB0hec6NuAeKbzm0ch0G65eEss7URQBSFJdsisjvQJzrp03lbAZaHtqE36G2j5bg+uSX8bD6bB4Mm5SYxf92rAgTyvK135252RrofENx4z/cHMy4CnpJGgiXnyyWCLIzSzfyxlsZtBwrwTNxI352FLbCQDMd9NbiPA7A2B3IGgfFcWsDLUdXhx2QnMXlJ5fW07Z167ri+ycaIJz1YUiiREr53wD3qiNu2m23m8ym2LVZvaPYbORYG+RdPBE/Ri6RaVC/du3hO+xfoQaqansbnIAyQAcCGmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 06:31:20 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 06:31:20 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: move umc late init from gmc to umc block
Thread-Topic: [PATCH 1/3] drm/amdgpu: move umc late init from gmc to umc block
Thread-Index: AQHVZ6FbHlJq8oYKc0yXTtBoGTVF3A==
Date: Tue, 10 Sep 2019 06:31:19 +0000
Message-ID: <20190910063103.14099-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0061.apcprd03.prod.outlook.com
 (2603:1096:203:52::25) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14816f9e-7d04-43a1-89ab-08d735b87dba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3389; 
x-ms-traffictypediagnostic: MN2PR12MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3389CD2F9F2B7E2646E7D96FB0B60@MN2PR12MB3389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(52116002)(316002)(256004)(14444005)(4326008)(6636002)(25786009)(6512007)(102836004)(36756003)(186003)(2906002)(6486002)(71190400001)(71200400001)(6116002)(5660300002)(66066001)(6436002)(3846002)(53936002)(66556008)(66476007)(66946007)(66446008)(64756008)(486006)(50226002)(478600001)(2501003)(86362001)(1076003)(476003)(2616005)(81166006)(8936002)(8676002)(26005)(81156014)(110136005)(7736002)(6506007)(386003)(14454004)(305945005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3389;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tmLqCxLjnT2KvYMVqQfjJ9i/7Mex+HRcHlQYgWZtuuKfbYhwNbC2lHnNNF15NQ5jYacAQ5OrK+F3dlhbf0OcNUr+7roQ3EKIRICGGlc40I3RZRImbH5Z1C1XiOaSYW2RNCUXvyQZgo+toQg+8cAtt0kK1c2deRcPwxQuXPRXnToX8qcUaxZ6TvbzM0UO+Z2Y3PCR54LHoHsQizll+X1o0IylqOrufBpn1RfuaGSWJbT6GGJ7gSQBq6ZtCZI7SYNeGeAI2sqPZXQA9Bylta8+9PBKeIfhf6hWFyfalOGvNHBb0DBhoxmYhrjxSpDHyCTGTMHh/yGq3Ot3Bxzv6WaA1bgZGmAH2fsyJ0Nm3nzAkl5fCpmW7611jCv2+vfKbPzhQM+/DztwgLtu315mD1w4HDAWUkJGz6T2StkujpDof6A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14816f9e-7d04-43a1-89ab-08d735b87dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 06:31:19.9883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nnNLV97U2ihtOCcK5IMXVo201FXr4ut7TwgnSp7zPzwh6D2vO/4vl4F2Egf5SHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1WVx74M+qo7F4PeMX/7kgU4g/BHhpW+sRqszv6Tf8E=;
 b=Ec/uXD8j1bzY4YoPAS+irDVSgR0nbewWU1pdygoXwKhGpMZi5q2wAiSYLdQlqNef1LxPivr6dxvR4InTsHhqG2thqWTIhf14KTuUIMIYXlAg3DqNtkyN1mFWczbUGgpnNYGr7ZjEQGha136ifVrIkqzqn0mxDShdcPZlfOj2CDc=
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

dW1jIGxhdGUgaW5pdCBpcyB1bWMgc3BlY2lmaWMsIGl0J3MgbW9yZSBzdWl0YWJsZSB0byBiZSBw
dXQgaW4gdW1jIGJsb2NrCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyB8IDQ4IC0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8ICAyIC0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYyB8IDczICsrKysrKysrKysrKysr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaCB8ICAy
ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8ICA4ICsrLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyAgIHwgIDEgKwogNyBmaWxlcyBjaGFu
Z2VkLCA4MiBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L01ha2VmaWxlCmluZGV4IDg0NjE0YTcxYmI0ZC4uOTEzNjljODIzY2UyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQpAQCAtNTUsNyArNTUsNyBAQCBhbWRncHUteSArPSBh
bWRncHVfZGV2aWNlLm8gYW1kZ3B1X2ttcy5vIFwKIAlhbWRncHVfdmZfZXJyb3IubyBhbWRncHVf
c2NoZWQubyBhbWRncHVfZGVidWdmcy5vIGFtZGdwdV9pZHMubyBcCiAJYW1kZ3B1X2dtYy5vIGFt
ZGdwdV9tbWh1Yi5vIGFtZGdwdV94Z21pLm8gYW1kZ3B1X2NzYS5vIGFtZGdwdV9yYXMubyBhbWRn
cHVfdm1fY3B1Lm8gXAogCWFtZGdwdV92bV9zZG1hLm8gYW1kZ3B1X3BtdS5vIGFtZGdwdV9kaXNj
b3ZlcnkubyBhbWRncHVfcmFzX2VlcHJvbS5vIGFtZGdwdV9uYmlvLm8gXAotCXNtdV92MTFfMF9p
MmMubworCWFtZGdwdV91bWMubyBzbXVfdjExXzBfaTJjLm8KIAogYW1kZ3B1LSQoQ09ORklHX1BF
UkZfRVZFTlRTKSArPSBhbWRncHVfcG11Lm8KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5jCmluZGV4IDUxODkwYjFkODUyMi4uZGMwNDRlZWMxODhlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCkBAIC0zMDQsNTEgKzMwNCwzIEBAIGJvb2wgYW1k
Z3B1X2dtY19maWx0ZXJfZmF1bHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRf
dCBhZGRyLAogCWdtYy0+ZmF1bHRfaGFzaFtoYXNoXS5pZHggPSBnbWMtPmxhc3RfZmF1bHQrKzsK
IAlyZXR1cm4gZmFsc2U7CiB9Ci0KLWludCBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkgICAgIHZvaWQgKnJhc19paF9pbmZvKQotewotCWlu
dCByOwotCXN0cnVjdCByYXNfaWhfaWYgKmloX2luZm8gPSAoc3RydWN0IHJhc19paF9pZiAqKXJh
c19paF9pbmZvOwotCXN0cnVjdCByYXNfZnNfaWYgZnNfaW5mbyA9IHsKLQkJLnN5c2ZzX25hbWUg
PSAidW1jX2Vycl9jb3VudCIsCi0JCS5kZWJ1Z2ZzX25hbWUgPSAidW1jX2Vycl9pbmplY3QiLAot
CX07Ci0KLQlpZiAoIWloX2luZm8pCi0JCXJldHVybiAtRUlOVkFMOwotCi0JaWYgKCFhZGV2LT5n
bWMudW1jX3Jhc19pZikgewotCQlhZGV2LT5nbWMudW1jX3Jhc19pZiA9IGttYWxsb2Moc2l6ZW9m
KHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghYWRldi0+Z21jLnVt
Y19yYXNfaWYpCi0JCQlyZXR1cm4gLUVOT01FTTsKLQkJYWRldi0+Z21jLnVtY19yYXNfaWYtPmJs
b2NrID0gQU1ER1BVX1JBU19CTE9DS19fVU1DOwotCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+dHlw
ZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7Ci0JCWFkZXYtPmdtYy51
bWNfcmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOwotCQlzdHJjcHkoYWRldi0+Z21jLnVtY19y
YXNfaWYtPm5hbWUsICJ1bWMiKTsKLQl9Ci0JaWhfaW5mby0+aGVhZCA9IGZzX2luZm8uaGVhZCA9
ICphZGV2LT5nbWMudW1jX3Jhc19pZjsKLQotCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2
LCBhZGV2LT5nbWMudW1jX3Jhc19pZiwKLQkJCQkgJmZzX2luZm8sIGloX2luZm8pOwotCWlmIChy
KQotCQlnb3RvIGZyZWU7Ci0KLQlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRl
di0+Z21jLnVtY19yYXNfaWYtPmJsb2NrKSkgewotCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRldiwg
JmFkZXYtPmdtYy5lY2NfaXJxLCAwKTsKLQkJaWYgKHIpCi0JCQlnb3RvIGxhdGVfZmluaTsKLQl9
IGVsc2UgewotCQlyID0gMDsKLQkJZ290byBmcmVlOwotCX0KLQotCXJldHVybiAwOwotCi1sYXRl
X2Zpbmk6Ci0JYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVtY19yYXNfaWYs
IGloX2luZm8pOwotZnJlZToKLQlrZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7Ci0JYWRldi0+
Z21jLnVtY19yYXNfaWYgPSBOVUxMOwotCXJldHVybiByOwotfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5oCmluZGV4IDIzMmE4ZmY1NjQyYi4uZDNiZTUxYmE2MzQ5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCkBAIC0yMzQsNyArMjM0LDUgQEAg
dm9pZCBhbWRncHVfZ21jX2FncF9sb2NhdGlvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJCSAgICAgc3RydWN0IGFtZGdwdV9nbWMgKm1jKTsKIGJvb2wgYW1kZ3B1X2dtY19maWx0ZXJf
ZmF1bHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBhZGRyLAogCQkJICAg
ICAgdWludDE2X3QgcGFzaWQsIHVpbnQ2NF90IHRpbWVzdGFtcCk7Ci1pbnQgYW1kZ3B1X2dtY19y
YXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJICAgICB2b2lkICpp
aF9pbmZvKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdW1jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5jOGRlMTI3MDk3YWIKLS0t
IC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmMK
QEAgLTAsMCArMSw3MyBAQAorLyoKKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4KKyAqCisgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwK
KyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGlu
ZyB3aXRob3V0IGxpbWl0YXRpb24KKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnks
IG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwg
Y29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhl
CisgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOgorICoKKyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisgKiBhbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyAqCisgKiBUSEUgU09G
VFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwg
RVhQUkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUg
V0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwKKyAqIFRI
RSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJ
TSwgREFNQUdFUyBPUgorICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBP
RiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCisgKiBBUklTSU5HIEZST00sIE9VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IKKyAqIE9USEVS
IERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqCisgKi8KKworI2luY2x1ZGUgImFtZGdwdS5o
IgorI2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKKworaW50IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pCit7CisJaW50
IHI7CisJc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbyA9IChzdHJ1Y3QgcmFzX2loX2lmICopcmFz
X2loX2luZm87CisJc3RydWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQkuc3lzZnNfbmFtZSA9
ICJ1bWNfZXJyX2NvdW50IiwKKwkJLmRlYnVnZnNfbmFtZSA9ICJ1bWNfZXJyX2luamVjdCIsCisJ
fTsKKworCWlmICghaWhfaW5mbykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoIWFkZXYtPmdt
Yy51bWNfcmFzX2lmKSB7CisJCWFkZXYtPmdtYy51bWNfcmFzX2lmID0KKwkJCWttYWxsb2Moc2l6
ZW9mKHN0cnVjdCByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7CisJCWlmICghYWRldi0+Z21j
LnVtY19yYXNfaWYpCisJCQlyZXR1cm4gLUVOT01FTTsKKwkJYWRldi0+Z21jLnVtY19yYXNfaWYt
PmJsb2NrID0gQU1ER1BVX1JBU19CTE9DS19fVU1DOworCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+
dHlwZSA9IEFNREdQVV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7CisJCWFkZXYtPmdt
Yy51bWNfcmFzX2lmLT5zdWJfYmxvY2tfaW5kZXggPSAwOworCQlzdHJjcHkoYWRldi0+Z21jLnVt
Y19yYXNfaWYtPm5hbWUsICJ1bWMiKTsKKwl9CisJaWhfaW5mby0+aGVhZCA9IGZzX2luZm8uaGVh
ZCA9ICphZGV2LT5nbWMudW1jX3Jhc19pZjsKKworCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChh
ZGV2LCBhZGV2LT5nbWMudW1jX3Jhc19pZiwKKwkJCQkgJmZzX2luZm8sIGloX2luZm8pOworCWlm
IChyKQorCQlnb3RvIGZyZWU7CisKKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwg
YWRldi0+Z21jLnVtY19yYXNfaWYtPmJsb2NrKSkgeworCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRl
diwgJmFkZXYtPmdtYy5lY2NfaXJxLCAwKTsKKwkJaWYgKHIpCisJCQlnb3RvIGxhdGVfZmluaTsK
Kwl9IGVsc2UgeworCQlyID0gMDsKKwkJZ290byBmcmVlOworCX0KKworCXJldHVybiAwOworCits
YXRlX2Zpbmk6CisJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+Z21jLnVtY19yYXNf
aWYsIGloX2luZm8pOworZnJlZToKKwlrZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7CisJYWRl
di0+Z21jLnVtY19yYXNfaWYgPSBOVUxMOworCXJldHVybiByOworfQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3VtYy5oCmluZGV4IDk3NWFmYTA0ZGYwOS4uNmYyMmM5NzA0NTU1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oCkBAIC01NSw2ICs1NSw3IEBA
CiAKIHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHsKIAl2b2lkICgqcmFzX2luaXQpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pOwogCXZvaWQgKCpxdWVyeV9yYXNfZXJy
b3JfY291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQl2b2lkICpyYXNfZXJy
b3Jfc3RhdHVzKTsKIAl2b2lkICgqcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LApAQCAtNzksNCArODAsNSBAQCBzdHJ1Y3QgYW1kZ3B1X3VtYyB7CiAJ
Y29uc3Qgc3RydWN0IGFtZGdwdV91bWNfZnVuY3MgKmZ1bmNzOwogfTsKIAoraW50IGFtZGdwdV91
bWNfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZCAqcmFzX2lo
X2luZm8pOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCAw
ZDA2Yzc5MDFkMjYuLjdlYzAxYjIyYThmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jCkBAIC03OTMsOSArNzkzLDExIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVf
aW5pdCh2b2lkICpoYW5kbGUpCiAJCS5jYiA9IGdtY192OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Is
CiAJfTsKIAotCXIgPSBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoYWRldiwgJnVtY19paF9pbmZv
KTsKLQlpZiAocikKLQkJcmV0dXJuIHI7CisJaWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBhZGV2LT51
bWMuZnVuY3MtPnJhc19sYXRlX2luaXQpIHsKKwkJciA9IGFkZXYtPnVtYy5mdW5jcy0+cmFzX2xh
dGVfaW5pdChhZGV2LCAmdW1jX2loX2luZm8pOworCQlpZiAocikKKwkJCXJldHVybiByOworCX0K
IAogCWlmIChhZGV2LT5tbWh1Yl9mdW5jcyAmJiBhZGV2LT5tbWh1Yl9mdW5jcy0+cmFzX2xhdGVf
aW5pdCkgewogCQlyID0gYWRldi0+bW1odWJfZnVuY3MtPnJhc19sYXRlX2luaXQoYWRldik7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwppbmRleCAwOWUzMTZhMjJmMWEuLjRjZGI1
YzA0Y2QxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCkBAIC0yNzMsNiAr
MjczLDcgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAKIGNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHVtY192Nl8xX2Z1bmNz
ID0gewogCS5yYXNfaW5pdCA9IHVtY192Nl8xX3Jhc19pbml0LAorCS5yYXNfbGF0ZV9pbml0ID0g
YW1kZ3B1X3VtY19yYXNfbGF0ZV9pbml0LAogCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSB1bWNf
djZfMV9xdWVyeV9yYXNfZXJyb3JfY291bnQsCiAJLnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzID0g
dW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MsCiAJLmVuYWJsZV91bWNfaW5kZXhfbW9k
ZSA9IHVtY192Nl8xX2VuYWJsZV91bWNfaW5kZXhfbW9kZSwKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
