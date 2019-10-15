Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A1D7280
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 11:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143A56E7A3;
	Tue, 15 Oct 2019 09:50:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3D6E7A3
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 09:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPhK0Tjn/Pa3vQ+RcmGMOTUhqAbCBaD3qu+go5yhbBXp2S/FEKc66JmqrTzAOe4/ndZYU4OIg/RFtht6CufNhkF5SFd72ihhrfhlfADPWNuYjo5fHL+G4c9WwUFTZ6MWBmDN0obkDHrvc26p9CcteExqt6KPqCFSNjiaO/xA193d4PNINV1UNyVfHicM3V4f2cYkpC9HRJVlE82cMf8sCRp5CJv0xKIoYFGnv1gmPONnwtUqDuA+QQb1iiHE2vCGwmqhXk8EYeXmdNtsN4IezCqQwEzLXSaT8ApJe5UCGqGXH4JoRSmOKcx4vQ8tLvfTpAYuPuXxV2v75ks7uTlNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HG6jLKdxxyHDHKJPScrBTVfqGOmjU7uH1AyC0Bti6M8=;
 b=mdFQ19giVY39KUBcFRFOSreV1yaI2tEpxnCJwmyR4WSsg6+z/qdKOAOXxAeZRIKn5LOqEdHffE0l2aUO0w0j5BMtSEfkmJLf4CuM8+qStbsctSUD/4wIu4SE4LE0Co1tXsACLw0adeVsnsMC5fWThwdOfA0I9auJFATWJ8SBMWv+S4lOBh3vN8kB8PuCFJrV7koLmj3f1Jc5GiiLAhtQsqT7eeh+VWmh3n2RrSdFCKZeZCrQTzA3Jh/DO2WtsxGtJDmlyuEu+9CE+5BsSJHcl2xEhGPCpwnosgt4D0mXEBdf4+FZmYNUL/f9r0goq5N1T6xeorfWHkaV3Xj00gwodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3613.namprd12.prod.outlook.com (20.178.240.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 09:50:24 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3%5]) with mapi id 15.20.2347.021; Tue, 15 Oct 2019
 09:50:24 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: fix S3 failed as RLC safe mode entry stucked
 in polloing gfx acq
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix S3 failed as RLC safe mode entry
 stucked in polloing gfx acq
Thread-Index: AQHVgz330jiQYHB4n0+ocVApOBr9iA==
Date: Tue, 15 Oct 2019 09:50:23 +0000
Message-ID: <1571133012-19837-2-git-send-email-Prike.Liang@amd.com>
References: <1571133012-19837-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1571133012-19837-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::20) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71d3c012-c9d3-4f9b-c31d-08d751551974
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3613992E1F9FF9FA032925B1FB930@MN2PR12MB3613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(189003)(64756008)(66946007)(305945005)(2906002)(36756003)(6116002)(6916009)(26005)(2351001)(6436002)(478600001)(5660300002)(6506007)(386003)(102836004)(66446008)(66476007)(52116002)(66556008)(7736002)(6486002)(3846002)(186003)(76176011)(66066001)(71190400001)(71200400001)(99286004)(14454004)(2501003)(2616005)(486006)(6512007)(4326008)(5640700003)(446003)(476003)(81166006)(8676002)(81156014)(11346002)(50226002)(316002)(25786009)(14444005)(86362001)(54906003)(256004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3613;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rPXcib01w3Be1pyXLpmw7ArxeZpcn2PpUIp8579Jhx3g6x0Uyr7ic3+tMQ49AxmOlOqZ/tRGjcXJgtOEHbiBxFkkjAylT+TnU0g427vNog9BEx+PWW7rz4V9snagErTaNdSnjnbZtzbsIRGkcgBHyYy/darykwYltxdGDBDQ2j5XR/YOR7wqA4kf28o7JS+Hq0LK1pUIN2zbbbkiuZtth6n/jO3zxPGa18rIzRW/RtWaVd6xP6LHSsfLEW083O3/kGVFjLWRqC4L1zZM4JA1ilvLoQ8U+5p7/wxPdyJa2pkSF5k8DHYLhPDin4ynP0Dt8GTMcEZQl3Fh48TkaN7na6f0CjSOgF0i07KhsRTC0qyQ3z1oIC0IaSv9A79aZgbyDwzS3cJP7jSYV+g/xi8+RMT1FfLiTmAoL6dokGwjYRs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d3c012-c9d3-4f9b-c31d-08d751551974
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 09:50:23.9925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tInDx4EgdNz07NqNwG51y+zVREemKRh22kCkE+/y0Yq+U0hh1hCgsmT0/Sxwm8xI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HG6jLKdxxyHDHKJPScrBTVfqGOmjU7uH1AyC0Bti6M8=;
 b=kF8fnHYmZcKe5ijwg6JsVFcik6+V9Um+DyF9VGQPUDRhgeKM7RIC8FA04cA/BPGuKRov9Dr21cnanw0DRIJOCav1j8h+cpJQR74zszUuHhE+gOsxhAGynv8lYjp83c15aVKBOBRw6RnoV2Qb2/fQ2CprIc7TzQcEVa4LWYQDuxs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IGdmeCBjZ3BnIHNldHRpbmcgc2VxdWVuY2UgZm9yIFJMQyBkZWFkbG9jayBhdCBzYWZlIG1v
ZGUgZW50cnkgaW4gcG9sbGluZyBnZnggcmVzcG9uc2UuClRoZSBwYXRjaCBjYW4gZml4IFZDTiBJ
QiB0ZXN0IGZhaWxlZCBhbmQgREFMIGdldCBkaXNwYWx5IGNvdW50IGZhaWxlZCBpc3N1ZS4KClNp
Z25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgICB8IDUgLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQgKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMKaW5kZXggZGU4ZjlkNi4uZGQzNDVmYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCkBAIC00Mjg3LDkgKzQyODcsNiBAQCBzdGF0aWMgdm9pZCBnZnhf
djlfMF91cGRhdGVfZ2Z4X2NnX3Bvd2VyX2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIHsKIAlhbWRncHVfZ2Z4X3JsY19lbnRlcl9zYWZlX21vZGUoYWRldik7CiAKLQlpZiAoaXNf
c3VwcG9ydF9zd19zbXUoYWRldikgJiYgIWVuYWJsZSkKLQkJc211X3NldF9nZnhfY2dwZygmYWRl
di0+c211LCBlbmFibGUpOwotCiAJaWYgKChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JU
X0dGWF9QRykgJiYgZW5hYmxlKSB7CiAJCWdmeF92OV8wX2VuYWJsZV9nZnhfY2dfcG93ZXJfZ2F0
aW5nKGFkZXYsIHRydWUpOwogCQlpZiAoYWRldi0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9H
RlhfUElQRUxJTkUpCkBAIC00NTY2LDggKzQ1NjMsNiBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3Nl
dF9wb3dlcmdhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJCQlnZnhfdjlfMF9lbmFibGVfY3Bf
cG93ZXJfZ2F0aW5nKGFkZXYsIGZhbHNlKTsKIAogCQkvKiB1cGRhdGUgZ2Z4IGNncGcgc3RhdGUg
Ki8KLQkJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpICYmIGVuYWJsZSkKLQkJCXNtdV9zZXRf
Z2Z4X2NncGcoJmFkZXYtPnNtdSwgZW5hYmxlKTsKIAkJZ2Z4X3Y5XzBfdXBkYXRlX2dmeF9jZ19w
b3dlcl9nYXRpbmcoYWRldiwgZW5hYmxlKTsKIAogCQkvKiB1cGRhdGUgbWdjZyBzdGF0ZSAqLwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDZjYjUyODgu
Ljg0ZDhhYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
QEAgLTExODgsNiArMTE4OCw3IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxl
KQogCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpIHsKIAkJc211X3Bvd2VyZ2F0ZV9zZG1h
KCZhZGV2LT5zbXUsIGZhbHNlKTsKIAkJc211X3Bvd2VyZ2F0ZV92Y24oJmFkZXYtPnNtdSwgZmFs
c2UpOworCQlzbXVfc2V0X2dmeF9jZ3BnKCZhZGV2LT5zbXUsIHRydWUpOwogCX0KIAogCWlmICgh
c211LT5wbV9lbmFibGVkKQpAQCAtMTM1MCw2ICsxMzUxLDkgQEAgc3RhdGljIGludCBzbXVfcmVz
dW1lKHZvaWQgKmhhbmRsZSkKIAlpZiAocmV0KQogCQlnb3RvIGZhaWxlZDsKIAorCWlmIChzbXUt
PmlzX2FwdSkKKwkJc211X3NldF9nZnhfY2dwZygmYWRldi0+c211LCB0cnVlKTsKKwogCW11dGV4
X3VubG9jaygmc211LT5tdXRleCk7CiAKIAlwcl9pbmZvKCJTTVUgaXMgcmVzdW1lZCBzdWNjZXNz
ZnVsbHkhXG4iKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
