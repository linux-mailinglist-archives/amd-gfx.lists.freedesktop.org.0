Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E436DCCD1
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 19:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF416EB7D;
	Fri, 18 Oct 2019 17:30:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030F6EB7D
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 17:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYZr2m90k/ojAxOJpJ4uSQt9ld+pxK8Y36RAXdSk0lMlioJIlhXMtiDCmcCecSlzHaPg4NlFqb2HNYva8Y3C5WInKGE7XLIL9rYvnVNrGBOJzQkBgAfpp9e/cy6xQUJbYUd2vvm6l+OvvDpFD2jdrZNQpuN1Pc7TOSZDYvIwzbF0Bcx7G2Yu7V22Urdk9ziA50RdMv//OfEZJscq//kx2qvg7PdWchNNl1JZtZ6tp33g9FtUbKolfYkKMrw9cS83Nhfpk7qAXRGootUIkfa9Ji4e2ECrhVMqf+828n0HuC9VcgHQoR8NrgX2S0Ep5uo/F2Zel9+fgpbKKAKnG/x57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsuZyhXNCX2gcrS/LpaPTrhCatpkDsCbBtD6lKRSiCg=;
 b=OpSQVAWR14Bgw7LC0Mhsa98NS9GoPwusu5B2+KQv7qFTpV/0sr4lHoqsuBesnUMWsqbs+8jdIPClV1ijGmPemXeamEvHa9diZ5WiX+HOpSA/eKrZH4Shi/GZwAl3h+F2HwnJ7Pz/3lmZAAx5tgZrcGugIRTj6poSgAeRdfT/RQnrMfnUXkqlBX5sHdOQ8LVY+EWQJgJLuMM/tRnIRoHrtm100a2ZSdgCEq6IyddIy7zF8BFH4027QhFFQPsehWvcKFIBFS5gVwUlwZAvyFkZVg4TVUc2s62u+lzUOpWUWn8oMA89x0gXAMW9AHKfbyFMtM9j/tvh2vWvtxpRcdgHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4039.namprd12.prod.outlook.com (20.180.6.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Fri, 18 Oct 2019 17:30:36 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 17:30:36 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi perfmons"
Thread-Topic: [PATCH 2/2] Revert "drm/amdgpu: disable c-states on xgmi
 perfmons"
Thread-Index: AQHVhdnAodq40U03NU2bTerld+JKCg==
Date: Fri, 18 Oct 2019 17:30:36 +0000
Message-ID: <20191018172934.24716-2-jonathan.kim@amd.com>
References: <20191018172934.24716-1-jonathan.kim@amd.com>
In-Reply-To: <20191018172934.24716-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85c030d8-4aab-4860-c25b-08d753f0e30b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB403941601C1766BE25F58B7C856C0@CH2PR12MB4039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(81156014)(6512007)(66946007)(66446008)(64756008)(5660300002)(66476007)(66556008)(2906002)(478600001)(5640700003)(6436002)(6916009)(4326008)(25786009)(305945005)(7736002)(81166006)(50226002)(8936002)(2351001)(8676002)(26005)(14444005)(256004)(1076003)(71200400001)(52116002)(99286004)(71190400001)(186003)(2501003)(102836004)(316002)(86362001)(14454004)(76176011)(6506007)(386003)(54906003)(6486002)(3846002)(486006)(66066001)(36756003)(6116002)(446003)(2616005)(11346002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4039;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yuF2URQ5AjDaabHMeHWRc6J2gTzMUUIJNE6JKhldtja9fsy3UUkSLlVSiz6wsBiINtpNurky90WeM4zQQTPsJ7bMNpPiST1yBoufyxjwdLOrRsElYWvjw/FD0hf1XJ9Cp8DcaffLOtHAWnDpstbIQqnr8GjgdPiR0rw3uTGQ2hzOFTdjTwooUJiDAv4Zcvla1P9q35q3AUP7hrlYsSszePc+EOUHGcft+CobWXXQ9R9SNfnrjCc/znmUOU4cYiDqWOCosw0XYveM83Yd1ec1JsyVzjgdx+xE90gJylwcO/3L/WuAJ6LP7K8Tqi3s6JOBOTdVk3QYpeGEFq3sq2Btm7heFxHPWfO89SHq3t4kyv82mxxkzS2Q7IskYRK0Luvvd2jc7YgYC1lHrDaAQJX8XzzGbL0eVez8dF0ylOn9/W7n/S3KeB7LXnXtnh3SwCUk
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c030d8-4aab-4860-c25b-08d753f0e30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 17:30:36.4918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1SMl27TDzyhRxYU9CpOP5l4HOcCtJv7QHh/r46dlO76SHvx9iMOlLjISNMz0tEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsuZyhXNCX2gcrS/LpaPTrhCatpkDsCbBtD6lKRSiCg=;
 b=LnONVwHCV8805LZ+B0nnhmAoCyqrA9zkwjVvDzjaoW29h+pl2ugY6pguxjBPfl1tl59VzRM6tlcNjbz0VFbBZ7giW2ALfY9cPL3/NwS6wAVMwfrLNJkkc8pGh+m+eBhmRsZMKLIYU5ZAnf8t5dTDyqtsGgGFSdK6YnifHxOffB4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA1NDI3NWNkMTY0OWY0MDM0YzY0NTBiNmM1YTgzNThmY2Q0Zjdk
ZGE2LgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgfCAzNiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDM1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3Yz
XzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwppbmRleCBmNDAzYzYy
Yzk0NGUuLjE2ZmJkMmJjOGFkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZGZfdjNfNi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwpA
QCAtOTMsMjEgKzkzLDYgQEAgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqZGZfdjNfNl9h
dHRyX2dyb3Vwc1tdID0gewogCQlOVUxMCiB9OwogCi1zdGF0aWMgZGZfdjNfNl9zZXRfZGZfY3N0
YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgYWxsb3cpCi17Ci0JaW50IHIgPSAw
OwotCi0JaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7Ci0JCXIgPSBzbXVfc2V0X2RmX2Nz
dGF0ZSgmYWRldi0+c211LCBhbGxvdyk7Ci0JfSBlbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBf
ZnVuY3MKLQkJCSYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2RmX2NzdGF0ZSkgewot
CQlyID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfZGZfY3N0YXRlKAotCQkJYWRldi0+
cG93ZXJwbGF5LnBwX2hhbmRsZSwgYWxsb3cpOwotCX0KLQotCXJldHVybiByOwotfQotCiBzdGF0
aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJCQkgdWludDMyX3QgZmljYWFfdmFsKQogewpAQCAtMTE3LDkgKzEwMiw2IEBAIHN0YXRpYyB1
aW50NjRfdCBkZl92M182X2dldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFk
ZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7CiAJ
ZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwogCi0J
aWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQotCQly
ZXR1cm4gMHhGRkZGRkZGRkZGRkZGRkZGOwotCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBj
aWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJy
aWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0FkZHJlc3MzKTsKIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFs
KTsKQEAgLTEzMiw4ICsxMTQsNiBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFk
ZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAotCWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2
LCBERl9DU1RBVEVfQUxMT1cpOwotCiAJcmV0dXJuICgoKGZpY2FkaF92YWwgJiAweEZGRkZGRkZG
RkZGRkZGRkYpIDw8IDMyKSB8IGZpY2FkbF92YWwpOwogfQogCkBAIC0xNDUsOSArMTI1LDYgQEAg
c3RhdGljIHZvaWQgZGZfdjNfNl9zZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
dWludDMyX3QgZmljYWFfdmFsLAogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNp
ZV9pbmRleF9vZmZzZXQoYWRldik7CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2ll
X2RhdGFfb2Zmc2V0KGFkZXYpOwogCi0JaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBE
Rl9DU1RBVEVfRElTQUxMT1cpKQotCQlyZXR1cm47Ci0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRl
di0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCVdSRUczMihhZGRyZXNzLCBzbW5ERl9QSUVfQU9O
X0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzQWRkcmVzczMpOwogCVdSRUczMihkYXRhLCBmaWNh
YV92YWwpOwpAQCAtMTU3LDkgKzEzNCw4IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwKIAogCVdSRUcz
MihhZGRyZXNzLCBzbW5ERl9QSUVfQU9OX0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzRGF0YUhp
Myk7CiAJV1JFRzMyKGRhdGEsIGZpY2FkaF92YWwpOwotCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAotCWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShh
ZGV2LCBERl9DU1RBVEVfQUxMT1cpOworCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBj
aWVfaWR4X2xvY2ssIGZsYWdzKTsKIH0KIAogLyoKQEAgLTE3NywxNyArMTUzLDEyIEBAIHN0YXRp
YyB2b2lkIGRmX3YzXzZfcGVyZm1vbl9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7
CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwog
Ci0JaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQot
CQlyZXR1cm47Ci0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxh
Z3MpOwogCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsKIAkqbG9fdmFsID0gUlJFRzMyKGRhdGEp
OwogCVdSRUczMihhZGRyZXNzLCBoaV9hZGRyKTsKIAkqaGlfdmFsID0gUlJFRzMyKGRhdGEpOwog
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKLQot
CWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfQUxMT1cpOwogfQogCiAvKgpA
QCAtMjA0LDE3ICsxNzUsMTIgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3dyZWcoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGxvX2FkZHIsCiAJYWRkcmVzcyA9IGFk
ZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsKIAlkYXRhID0gYWRl
di0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7CiAKLQlpZiAoZGZfdjNf
Nl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9ESVNBTExPVykpCi0JCXJldHVybjsKLQog
CXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAJV1JFRzMy
KGFkZHJlc3MsIGxvX2FkZHIpOwogCVdSRUczMihkYXRhLCBsb192YWwpOwogCVdSRUczMihhZGRy
ZXNzLCBoaV9hZGRyKTsKIAlXUkVHMzIoZGF0YSwgaGlfdmFsKTsKIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7Ci0KLQlkZl92M182X3NldF9kZl9j
c3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKIH0KIAogLyogZ2V0IHRoZSBudW1iZXIgb2Yg
ZGYgY291bnRlcnMgYXZhaWxhYmxlICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
