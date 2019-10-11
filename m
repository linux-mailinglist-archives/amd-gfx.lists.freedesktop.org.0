Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7906D3839
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 06:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454B26EB94;
	Fri, 11 Oct 2019 04:09:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680065.outbound.protection.outlook.com [40.107.68.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DC26EA88
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 04:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ah0smmqiYc0l63tYK5Zw/VYinGCAjiHIatp3QbYUwJ6q39BiDcRDNrxZk1kDEeg8EOGvJPPqMiyflSFjem4f256nYjdqFHUUKOMXtoSXQeJPsVwN53rgPeuwWPeGb52y/hdzqnJ5C71GLVXHe8PvR9m9iNwQFiOmEwdMg5qB+/3shyy0XDKncaXNIb6l+WoflXijjP0/yGeKMMJhAXJvj0thUalmyJIFj82OgbHOmw8m2/qFtvUQXxeRf9mqnphFcBZ8nFH+A+mx5C43cZLYUq15VdGbrE7CrcokhEvOJo/UIatqFrAHRRoen6GQ2BI60yesWoqKlGFpp3hl5DGFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQjPMTBJaMcso95XQeY8R0ulcdK+fYGZUCRGQSnSsfE=;
 b=JB1ghuV7Lc4DBADC1hpHbS0TXBIkzX52HxaYpg0EIPVB9n071i97ByDf6RpiNkA7qYLQW6nJPNY7rh0nOemeJMF88g/Amd0aEHZrX4CgTag/s2rqBqiOsF/jNOK+FOL2QMj+yoAl/cy7FXX/Wv0iYAYfM86jMA3ppWOuc32OjaYWfjOJB2K/Wz8YJMfLy2Hq4+LSQj68sJGHQ37GTu/CIpg6xDzFaUo3wl7g9U4w3ZRVQRa0OzQdpVRQ8kSjXLf7OX4JVDoEPfS0nYzHc6rxwx2qXIfgR0TDkL5rxB7a+SICN1iEhH582lAPjow80Gx9/ShPIozlkMbdufYWNZWB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (20.178.240.81) by
 MN2PR12MB3727.namprd12.prod.outlook.com (10.255.236.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 11 Oct 2019 04:09:56 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::45cd:4e10:3113:2c50]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::45cd:4e10:3113:2c50%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 04:09:56 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu/discovery: reserve discovery data at the top of
 VRAM
Thread-Topic: [PATCH v2] drm/amdgpu/discovery: reserve discovery data at the
 top of VRAM
Thread-Index: AQHVf+m9qyz+Oz/xWEityn09HHvF2g==
Date: Fri, 11 Oct 2019 04:09:56 +0000
Message-ID: <20191011040942.13931-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:202:16::18) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72f8a675-1745-4b48-242b-08d74e00dfd0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3727:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB372741F783BB84897F4F78C189970@MN2PR12MB3727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(4326008)(486006)(476003)(6486002)(102836004)(86362001)(5660300002)(6436002)(52116002)(2616005)(8936002)(6512007)(6506007)(386003)(66066001)(2501003)(50226002)(36756003)(99286004)(14454004)(81166006)(81156014)(256004)(54906003)(6116002)(8676002)(5640700003)(71200400001)(7736002)(71190400001)(305945005)(3846002)(478600001)(25786009)(66946007)(186003)(1076003)(66556008)(66476007)(26005)(6916009)(66446008)(64756008)(316002)(2906002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3727;
 H:MN2PR12MB3613.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6wn+LB2WdDpC/SnTXO4oZCW7FKY4iPJrmPV78WaMZsqcLcrTZn0u2Aeyh1tUIC/ML0svyomhiGArEo1wIBPSoDaV6dC1ibpkZvtEyNL1VGPaUDBFQNIvmldO0BSUK/bQYTFkxQfOTfX8LNEE6NVdsF7kVD6oQEeDOzqVmhr1BP3XZ7dSgOSJR+tQbV+f9pq5+6s0zd8RC+Zy4LKm83wyso/N17myHhKVUSAh40F5E7m2iO4JG99v82RC+uPsnRhZt/NuTgC6qduBXStOylzCBL9S5z829WGHWelx109rDEZRxhRTlRCT/uFjzsQzrFUhfC/zhwFfmOXSZVjUTXRIVWKhCX6oakO79g2leKrB1xDPcwLoXhmB7JsqE+/wFCM2z0AGKNtFwm4kAHCsU6GCcFTVd/8n/1pUovGZlQcnaE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f8a675-1745-4b48-242b-08d74e00dfd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 04:09:56.1379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnyb6zJKepvPUzlDniK02Ew1b8aDJ8GRIZ6N7fnb5ZEBFB8w90gE+Tfh2Dislzpl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQjPMTBJaMcso95XQeY8R0ulcdK+fYGZUCRGQSnSsfE=;
 b=BJBJIpXuSskCksqEPvG+zSXfJpQDq+id6+TYMRiHiiO4kHcISmQjug9zNY3XF8p26X8Cm9JKJi3PlsDrFMs8N1VWUt3bth0lIDmaqjRDVBEtRLFlyM9QPUlGl2ljIBtEnnH+jwEI6VXJAaD++ISTmsFSAlo6kzi8uBGC930keFo=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Yuan, 
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SVAgRGlzY292ZXJ5IGRhdGEgaXMgVE1SIGZlbmNlZCBieSB0aGUgbGF0ZXN0IFBTUCBCTCwKc28g
d2UgbmVlZCB0byByZXNlcnZlIHRoaXMgcmVnaW9uLgoKVGVzdGVkIG9uIG5hdmkxMC8xMi8xNCB3
aXRoIFZCSU9TIGludGVncmF0ZWQgd2l0aCBsYXRlc3QgUFNQIEJMLgoKdjI6IHVzZSBESVNDT1ZF
UllfVE1SX1NJWkUgbWFjcm8gYXMgYm8gc2l6ZQogICAgdXNlIGFtZGdwdV9ib19jcmVhdGVfa2Vy
bmVsX2F0KCkgdG8gYWxsb2NhdGUgYm8KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlh
b2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAg
ICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVy
eS5jIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVy
eS5oIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAg
ICB8IDE3ICsrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvZGlz
Y292ZXJ5LmggICAgICAgfCAgMSAtCiA1IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCBiZTBi
MmM2OWMyMjMuLjY3NzU2NDdmMGJhNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgK
QEAgLTgxMiw2ICs4MTIsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7CiAJdWludDhfdAkJCQkq
YmlvczsKIAl1aW50MzJfdAkJCWJpb3Nfc2l6ZTsKIAlzdHJ1Y3QgYW1kZ3B1X2JvCQkqc3RvbGVu
X3ZnYV9tZW1vcnk7CisJc3RydWN0IGFtZGdwdV9ibwkJKmRpc2NvdmVyeV9tZW1vcnk7CiAJdWlu
dDMyX3QJCQliaW9zX3NjcmF0Y2hfcmVnX29mZnNldDsKIAl1aW50MzJfdAkJCWJpb3Nfc2NyYXRj
aFtBTURHUFVfQklPU19OVU1fU0NSQVRDSF07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwppbmRleCAxNDgxODk5Zjg2YzEuLjcxMTk4YzUzMThlMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAt
MTM2LDcgKzEzNiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9yZWFkX2JpbmFyeShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDhfdCAqYmluCiB7CiAJdWludDMyX3QgKnAg
PSAodWludDMyX3QgKiliaW5hcnk7CiAJdWludDY0X3QgdnJhbV9zaXplID0gKHVpbnQ2NF90KVJS
RUczMihtbVJDQ19DT05GSUdfTUVNU0laRSkgPDwgMjA7Ci0JdWludDY0X3QgcG9zID0gdnJhbV9z
aXplIC0gQklOQVJZX01BWF9TSVpFOworCXVpbnQ2NF90IHBvcyA9IHZyYW1fc2l6ZSAtIERJU0NP
VkVSWV9UTVJfU0laRTsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJd2hpbGUgKHBvcyA8IHZy
YW1fc2l6ZSkgewpAQCAtMTc5LDcgKzE3OSw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5X2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdWludDE2X3QgY2hlY2tzdW07CiAJaW50IHI7
CiAKLQlhZGV2LT5kaXNjb3ZlcnkgPSBremFsbG9jKEJJTkFSWV9NQVhfU0laRSwgR0ZQX0tFUk5F
TCk7CisJYWRldi0+ZGlzY292ZXJ5ID0ga3phbGxvYyhESVNDT1ZFUllfVE1SX1NJWkUsIEdGUF9L
RVJORUwpOwogCWlmICghYWRldi0+ZGlzY292ZXJ5KQogCQlyZXR1cm4gLUVOT01FTTsKIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oCmluZGV4IDg1Yjhj
NGQ0ZDU3Ni4uNWE2NjkzZDdkMjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc2NvdmVyeS5oCkBAIC0yNCw2ICsyNCw4IEBACiAjaWZuZGVmIF9fQU1ER1BVX0RJ
U0NPVkVSWV9fCiAjZGVmaW5lIF9fQU1ER1BVX0RJU0NPVkVSWV9fCiAKKyNkZWZpbmUgRElTQ09W
RVJZX1RNUl9TSVpFICAoNjQgPDwgMTApCisKIGludCBhbWRncHVfZGlzY292ZXJ5X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9pZCBhbWRncHVfZGlzY292ZXJ5X2Zpbmkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9kaXNjb3ZlcnlfcmVnX2Jhc2Vf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMKaW5kZXggZWRmZmM4ODM1NDlhLi5lZDdiMTBlMDg0OGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTE5NTUsNiArMTk1NSwyMCBAQCBp
bnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCSAgICBO
VUxMLCAmc3RvbGVuX3ZnYV9idWYpOwogCWlmIChyKQogCQlyZXR1cm4gcjsKKworCS8qCisJICog
cmVzZXJ2ZSBvbmUgVE1SICg2NEspIG1lbW9yeSBhdCB0aGUgdG9wIG9mIFZSQU0gd2hpY2ggaG9s
ZHMKKwkgKiBJUCBEaXNjb3ZlcnkgZGF0YSBhbmQgaXMgcHJvdGVjdGVkIGJ5IFBTUC4KKwkgKi8K
KwlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwKKwkJCQkgICAgICAgYWRldi0+
Z21jLnJlYWxfdnJhbV9zaXplIC0gRElTQ09WRVJZX1RNUl9TSVpFLAorCQkJCSAgICAgICBESVND
T1ZFUllfVE1SX1NJWkUsCisJCQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkJ
ICAgICAgICZhZGV2LT5kaXNjb3ZlcnlfbWVtb3J5LAorCQkJCSAgICAgICBOVUxMKTsKKwlpZiAo
cikKKwkJcmV0dXJuIHI7CisKIAlEUk1fSU5GTygiYW1kZ3B1OiAldU0gb2YgVlJBTSBtZW1vcnkg
cmVhZHlcbiIsCiAJCSAodW5zaWduZWQpIChhZGV2LT5nbWMucmVhbF92cmFtX3NpemUgLyAoMTAy
NCAqIDEwMjQpKSk7CiAKQEAgLTIwMjQsNiArMjAzOCw5IEBAIHZvaWQgYW1kZ3B1X3R0bV9sYXRl
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdm9pZCAqc3RvbGVuX3ZnYV9idWY7
CiAJLyogcmV0dXJuIHRoZSBWR0Egc3RvbGVuIG1lbW9yeSAoaWYgYW55KSBiYWNrIHRvIFZSQU0g
Ki8KIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPnN0b2xlbl92Z2FfbWVtb3J5LCBOVUxM
LCAmc3RvbGVuX3ZnYV9idWYpOworCisJLyogcmV0dXJuIHRoZSBJUCBEaXNjb3ZlcnkgVE1SIG1l
bW9yeSBiYWNrIHRvIFZSQU0gKi8KKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmRpc2Nv
dmVyeV9tZW1vcnksIE5VTEwsIE5VTEwpOwogfQogCiAvKioKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9kaXNjb3ZlcnkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9kaXNjb3ZlcnkuaAppbmRleCA1ZGNiNzc2NTQ4ZDguLjdlYzQzMzFlNjdmMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9kaXNjb3ZlcnkuaApAQCAtMjUsNyArMjUsNiBAQAogI2Rl
ZmluZSBfRElTQ09WRVJZX0hfCiAKICNkZWZpbmUgUFNQX0hFQURFUl9TSVpFICAgICAgICAgICAg
ICAgICAyNTYKLSNkZWZpbmUgQklOQVJZX01BWF9TSVpFICAgICAgICAgICAgICAgICAoNjQgPDwg
MTApCiAjZGVmaW5lIEJJTkFSWV9TSUdOQVRVUkUgICAgICAgICAgICAgICAgMHgyODIxMTQwNwog
I2RlZmluZSBESVNDT1ZFUllfVEFCTEVfU0lHTkFUVVJFICAgICAgIDB4NTM0NDUwNDkKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
