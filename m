Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2EDA379
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 04:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2989EA9;
	Thu, 17 Oct 2019 02:06:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66D089EA9
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 02:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9ORUL64rV9tc3pVyDuF3w9qQpqKRO7uW76lWoe7B2o7hhkZSFvtTPWJLWGZ60xRt+7PtkpVJF80rRI7eYy4+6eP9BTeUWNsemVjkSUyPEjqFO0X4U6BVN/BkbZsDBuxThe/9Pjfjl4GHJXpyROZ32jK9Pajc1+EqYptRrtbZmhDQz0xWRGaM14TV9JfAxfnI2XqkYIaaNDD1snRxWYqUuvzqvLoS8Xn+UBXpyz6ONPj6oSCQjHywSfnSwtrTjy6XFjfmquT/umU7MPI4pFGgWfshS4g83V/X8IRZmUPYhymBMuZFCVx2gsuKwCrTBKDI0UNZs7nIsBQYk2dk5UC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp7rkqPiBPUlaAe0oGi7TnI1oht4E4tvRXVLlzF21bU=;
 b=AN5aQylzUEY0W5VyP49guU0C9t9T0zyj83Pt6nEx7Vs0PGP/6M4124dx7ay6Km10gSYw00cNQrEmTsfQSAt019Kq2QmBqBxKMnW+8JfEdYMRYjIIww62TJwK+mPRVf9uUWvrSx6qf27ZwkWEiJWOgF/R9EVtb87k4n/QOuxwAVpudkkjkP8+nrWOcvk42gb7Yi5tuKWBHIFsGKUOz7Z6mNlZTnYvdyqYGw8ZDJnzzgqMs3y4HSh2QvlHUwMTybm42bmJ4E6e3TguHJboomr+KaZZD9POSM2ue5cGygutl13bl+abqC9O94KNei4c7AwqmuxKmNT8xDUk4NjWbEOCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3750.namprd12.prod.outlook.com (52.132.247.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 02:06:07 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 02:06:07 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhI9wMQL/TKmDH0aicDX3Ey3L2w==
Date: Thu, 17 Oct 2019 02:06:07 +0000
Message-ID: <20191017020555.52200-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5bf00d8-6000-4c2a-2b31-08d752a692b7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3750EA9B31411C426B9CE086856D0@CH2PR12MB3750.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(1076003)(66446008)(66946007)(36756003)(66476007)(8936002)(66556008)(4326008)(186003)(52116002)(6916009)(478600001)(26005)(386003)(102836004)(2351001)(2616005)(6506007)(476003)(71200400001)(486006)(64756008)(71190400001)(25786009)(14454004)(8676002)(81166006)(81156014)(6486002)(316002)(54906003)(14444005)(2501003)(3846002)(50226002)(6116002)(256004)(66066001)(99286004)(2906002)(6436002)(5660300002)(305945005)(5640700003)(6512007)(86362001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3750;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jhd4ckVctPNNxjMIoRXu2Lrc7Ill1xZeTyj+HpZ18ex6+TGjLaIKJjIEx8I+r/3/FLQukb8oiCklNPbUOLZERkZJytj3uqsn5Q0YTyH832KhhZr48cnBl3D16ey/jxqgdsmOjHrMuiEk8vP6O3LZAK1S375O1vUHcU+dU6v/KbxFRY7BhsaxPnOJSLLz9xbF6/t1Ean5e00Nntw0NWalH7te3qAJQpPXVNfU5qWl/bBUAgMrX2+oKu94jko4vUs6AeyzRoiWUPubU6sWd+/HmBurXgEAUpqi4TWyqk8rLwRwdDFZOchfjPiWKqzFaZQyuE1LD/w1lbYoWxNxACuBQ4DvcUC9ODJdUo9M83rC/vN6COThGsxXfFFZzoxPDcj0ao2/L4GrRDUuKGOKBhR3q9hGgqjxzA2l5ID46Ygyh0Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf00d8-6000-4c2a-2b31-08d752a692b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 02:06:07.8029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GkJoZz3DlCj8W5GryCu7J+viY9ClbqZkaAGPhp4OL6azxEuVIzerTzmSLeeiUNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp7rkqPiBPUlaAe0oGi7TnI1oht4E4tvRXVLlzF21bU=;
 b=uhY0ENA5Trp72dcThG3HkjlNvRw8vkjnHrFasnEv8gTbY2Hv9FJ4HD89HyvyvPYTwnB39zng8g9EmaAlf/myf6qH0INc7tD8NsUMFjDt9u8HrAszgwA7AZp87kXWjega5f9b8FQYT4P8JxnUPNsYg22oD4iU9p/wh2YbJEKRB1Q=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVhZCBvciB3cml0ZXMgdG8gZGYgcmVnaXN0ZXJzIHdoZW4gZ3B1IGRmIGlzIGluIGMtc3RhdGVz
IHdpbGwgcmVzdWx0IGluCmhhbmcuICBkZiBjLXN0YXRlcyBzaG91bGQgYmUgZGlzYWJsZWQgcHJp
b3IgdG8gcmVhZCBvciB3cml0ZXMgdGhlbgpyZS1lbmFibGVkIGFmdGVyIHJlYWQgb3Igd3JpdGVz
LgoKdjI6IHVzZSBvbGQgcG93ZXJwbGF5IHJvdXRpbmVzIGZvciB2ZWdhMjAKCkNoYW5nZS1JZDog
STZkNWE4M2U0ZmUxM2UyOWM3M2RmYjAzYTk0ZmU3YzYxMWU4NjdmZWMKU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9kZl92M182LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwppbmRleCAxNmZiZDJiYzhhZDEuLmY0MDNjNjJjOTQ0ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwpAQCAtOTMsNiArOTMsMjEgQEAgY29u
c3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqZGZfdjNfNl9hdHRyX2dyb3Vwc1tdID0gewogCQlO
VUxMCiB9OwogCitzdGF0aWMgZGZfdjNfNl9zZXRfZGZfY3N0YXRlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgYWxsb3cpCit7CisJaW50IHIgPSAwOworCisJaWYgKGlzX3N1cHBvcnRf
c3dfc211KGFkZXYpKSB7CisJCXIgPSBzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCBhbGxv
dyk7CisJfSBlbHNlIGlmIChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MKKwkJCSYmIGFkZXYtPnBv
d2VycGxheS5wcF9mdW5jcy0+c2V0X2RmX2NzdGF0ZSkgeworCQlyID0gYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzLT5zZXRfZGZfY3N0YXRlKAorCQkJYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSwg
YWxsb3cpOworCX0KKworCXJldHVybiByOworfQorCiBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9n
ZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgdWludDMyX3QgZmljYWFf
dmFsKQogewpAQCAtMTAyLDYgKzExNyw5IEBAIHN0YXRpYyB1aW50NjRfdCBkZl92M182X2dldF9m
aWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1
bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVu
Y3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwogCisJaWYgKGRmX3YzXzZfc2V0X2RmX2Nz
dGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQorCQlyZXR1cm4gMHhGRkZGRkZGRkZGRkZG
RkZGOworCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsK
IAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vz
c0FkZHJlc3MzKTsKIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsKQEAgLTExNCw2ICsxMzIsOCBA
QCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZs
YWdzKTsKIAorCWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfQUxMT1cpOwor
CiAJcmV0dXJuICgoKGZpY2FkaF92YWwgJiAweEZGRkZGRkZGRkZGRkZGRkYpIDw8IDMyKSB8IGZp
Y2FkbF92YWwpOwogfQogCkBAIC0xMjUsNiArMTQ1LDkgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9z
ZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgZmljYWFfdmFsLAog
CWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7
CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwog
CisJaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQor
CQlyZXR1cm47CisKIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxh
Z3MpOwogCVdSRUczMihhZGRyZXNzLCBzbW5ERl9QSUVfQU9OX0ZhYnJpY0luZGlyZWN0Q29uZmln
QWNjZXNzQWRkcmVzczMpOwogCVdSRUczMihkYXRhLCBmaWNhYV92YWwpOwpAQCAtMTM0LDggKzE1
Nyw5IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwKIAogCVdSRUczMihhZGRyZXNzLCBzbW5ERl9QSUVf
QU9OX0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzRGF0YUhpMyk7CiAJV1JFRzMyKGRhdGEsIGZp
Y2FkaF92YWwpOwotCiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9j
aywgZmxhZ3MpOworCisJZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9BTExP
Vyk7CiB9CiAKIC8qCkBAIC0xNTMsMTIgKzE3NywxNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3Bl
cmZtb25fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+
bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5u
YmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAorCWlmIChkZl92M182X3Nl
dF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkKKwkJcmV0dXJuOworCiAJc3Bp
bl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRk
cmVzcywgbG9fYWRkcik7CiAJKmxvX3ZhbCA9IFJSRUczMihkYXRhKTsKIAlXUkVHMzIoYWRkcmVz
cywgaGlfYWRkcik7CiAJKmhpX3ZhbCA9IFJSRUczMihkYXRhKTsKIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CisKKwlkZl92M182X3NldF9kZl9j
c3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsKIH0KIAogLyoKQEAgLTE3NSwxMiArMjA0LDE3
IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcGVyZm1vbl93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCBsb19hZGRyLAogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5n
ZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7CiAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdl
dF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwogCisJaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShh
ZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQorCQlyZXR1cm47CisKIAlzcGluX2xvY2tfaXJxc2F2
ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwogCVdSRUczMihhZGRyZXNzLCBsb19hZGRy
KTsKIAlXUkVHMzIoZGF0YSwgbG9fdmFsKTsKIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7CiAJ
V1JFRzMyKGRhdGEsIGhpX3ZhbCk7CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNp
ZV9pZHhfbG9jaywgZmxhZ3MpOworCisJZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NT
VEFURV9BTExPVyk7CiB9CiAKIC8qIGdldCB0aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJzIGF2YWls
YWJsZSAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
