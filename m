Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817DA63FB9
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C4B899E8;
	Wed, 10 Jul 2019 03:59:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1E0899B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:59:14 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 03:59:10 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:59:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amdgpu: Implement VRAM wipe on release
Thread-Topic: [PATCH 4/5] drm/amdgpu: Implement VRAM wipe on release
Thread-Index: AQHVNtPTBmXupwjJEE69VEQ7F9sY5A==
Date: Wed, 10 Jul 2019 03:59:09 +0000
Message-ID: <20190710035848.26966-4-Felix.Kuehling@amd.com>
References: <20190710035848.26966-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190710035848.26966-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39987caa-f3b4-4b12-320a-08d704eaf62e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3001; 
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-microsoft-antispam-prvs: <DM6PR12MB300120D463CF5965B51ED9F992F00@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(86362001)(76176011)(52116002)(68736007)(36756003)(2501003)(53936002)(71190400001)(71200400001)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(6512007)(2351001)(3846002)(6116002)(316002)(99286004)(478600001)(2906002)(6486002)(50226002)(14454004)(25786009)(1076003)(5660300002)(26005)(11346002)(476003)(186003)(486006)(446003)(2616005)(5640700003)(305945005)(7736002)(6436002)(102836004)(6506007)(81156014)(8936002)(81166006)(386003)(8676002)(256004)(66066001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MB/7gdjqx0kHfttzTIEBFCf1phUNAb30R0Lmyj0VP3YZ6n36AfhlhKhfQndB+Nyz/Q82BNPH3pjUGfwGj9Ay4O8s7Ep79RjSG8hyTsIvUn9vq96RIdHKrwlitrwF5HBEytvkTaRmKP1jE+niyij3P+NsVBKCqVn4ugjSHhxbCSWTbLdgCirLtWgPSwFAYNa/JxFOOLzHMAMgZ4HOVybY/KIxk6p0TV5RGG9lCUBgwi6a5PkbZx+1fdNZrIYqmGpTCqAihNlEtfUBUWf40+sZvJWO9mDVvAcM8VKwFCpvhReDFn40pUJruP7zRAQO9EkLdBuywNRQvqd4/PzFLi3GiytnCmpqNv8pbgJ7m5MlThXG3P5twF25MQpT2u6MXkHvw1rLBiYum0V+UuxyTIXXefpEzUYcfAUt8aY3GdBsTGw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39987caa-f3b4-4b12-320a-08d704eaf62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:59:09.7154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFQTIsvoFylvs1BYqS5+dRJlCxrmrpIZ0pc5Q8ZE5jA=;
 b=zYxNs2U+kV2xj6acgAmBWDxkjXOTE14b6sTqjIZRrZr7dPYHwgF0ZGhXAG0H/sUDpJ78WfjwYFfG20RTcCfxWLz9P3cbgGGs+OAeB/XPAxb69VyzYvX0KgIwvV99YFa2C8Xscu+DMIelqTB6oIDHfHWYIWxT5D3aGiA/JvOP4AA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2lwZSBWUkFNIG1lbW9yeSBjb250YWluaW5nIHNlbnNpdGl2ZSBkYXRhIHdoZW4gbW92aW5nIG9y
IHJlbGVhc2luZwpCT3MuIENsZWFyaW5nIHRoZSBtZW1vcnkgaXMgcGlwZWxpbmVkIHRvIG1pbmlt
aXplIGFueSBpbXBhY3Qgb24Kc3Vic2VxdWVudCBtZW1vcnkgYWxsb2NhdGlvbiBsYXRlbmN5LiBV
c2Ugb2YgYSBwb2lzb24gdmFsdWUgc2hvdWxkCmhlbHAgZGVidWcgZnV0dXJlIHVzZS1hZnRlci1m
cmVlIGJ1Z3MuCgpXaGVuIG1vdmluZyBCT3MsIHRoZSBleGlzdGluZyB0dG1fYm9fcGlwZWxpbmVk
X21vdmUgZW5zdXJlcyB0aGF0IHRoZQptZW1vcnkgd29uJ3QgYmUgcmV1c2VkIGJlZm9yZSBiZWlu
ZyB3aXBlZC4KCldoZW4gcmVsZWFzaW5nIEJPcywgdGhlIEJPIGlzIGZlbmNlZCB3aXRoIHRoZSBt
ZW1vcnkgZmlsbCBvcGVyYXRpb24sCndoaWNoIHJlc3VsdHMgaW4gcXVldWluZyB0aGUgQk8gZm9y
IGEgZGVsYXllZCBkZWxldGUuCgpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgICAgfCAxNyArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5oICAgIHwgIDIgKysKIDQgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRl
eCA5ODliN2I1NWNiMmUuLjA2NDk0Y2JjMjM0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYwpAQCAtMTIxMSw2ICsxMjExLDM5IEBAIHZvaWQgYW1kZ3B1X2Jv
X21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJdHJhY2VfYW1kZ3B1
X2JvX21vdmUoYWJvLCBuZXdfbWVtLT5tZW1fdHlwZSwgb2xkX21lbS0+bWVtX3R5cGUpOwogfQog
CisvKioKKyAqIGFtZGdwdV9ib19tb3ZlX25vdGlmeSAtIG5vdGlmaWNhdGlvbiBhYm91dCBhIEJP
IGJlaW5nIHJlbGVhc2VkCisgKiBAYm86IHBvaW50ZXIgdG8gYSBidWZmZXIgb2JqZWN0CisgKgor
ICogV2lwZXMgVlJBTSBidWZmZXJzIHdob3NlIGNvbnRlbnRzIHNob3VsZCBub3QgYmUgbGVha2Vk
IGJlZm9yZSB0aGUKKyAqIG1lbW9yeSBpcyByZWxlYXNlZC4KKyAqLwordm9pZCBhbWRncHVfYm9f
cmVsZWFzZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKK3sKKwlzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSA9IE5VTEw7CisJc3RydWN0IGFtZGdwdV9ibyAqYWJvOworCWludCBy
OworCisJaWYgKCFhbWRncHVfYm9faXNfYW1kZ3B1X2JvKGJvKSkKKwkJcmV0dXJuOworCisJYWJv
ID0gdHRtX3RvX2FtZGdwdV9ibyhibyk7CisKKwlpZiAoYm8tPm1lbS5tZW1fdHlwZSAhPSBUVE1f
UExfVlJBTSB8fCAhYm8tPm1lbS5tbV9ub2RlIHx8CisJICAgICEoYWJvLT5mbGFncyAmIEFNREdQ
VV9HRU1fQ1JFQVRFX1ZSQU1fV0lQRV9PTl9SRUxFQVNFKSkKKwkJcmV0dXJuOworCisJcmVzZXJ2
YXRpb25fb2JqZWN0X2xvY2soYm8tPnJlc3YsIE5VTEwpOworCisJciA9IGFtZGdwdV9maWxsX2J1
ZmZlcihhYm8sIEFNREdQVV9QT0lTT04sIGJvLT5yZXN2LCAmZmVuY2UpOworCWlmICghV0FSTl9P
TihyKSkgeworCQlhbWRncHVfYm9fZmVuY2UoYWJvLCBmZW5jZSwgZmFsc2UpOworCQlkbWFfZmVu
Y2VfcHV0KGZlbmNlKTsKKwl9CisKKwlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2
KTsKK30KKwogLyoqCiAgKiBhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkgLSBub3RpZmlj
YXRpb24gYWJvdXQgYSBtZW1vcnkgZmF1bHQKICAqIEBibzogcG9pbnRlciB0byBhIGJ1ZmZlciBv
YmplY3QKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAppbmRleCBk
NjA1OTNjYzQzNmUuLmUzMDIzODRmZTAwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaApAQCAtMjY1LDYgKzI2NSw3IEBAIGludCBhbWRncHVfYm9fZ2V0X21l
dGFkYXRhKHN0cnVjdCBhbWRncHVfYm8gKmJvLCB2b2lkICpidWZmZXIsCiB2b2lkIGFtZGdwdV9i
b19tb3ZlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJICAgYm9vbCBl
dmljdCwKIAkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSk7Cit2b2lkIGFtZGdwdV9i
b19yZWxlYXNlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKIGludCBhbWRn
cHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7
CiB2b2lkIGFtZGdwdV9ib19mZW5jZShzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UsCiAJCSAgICAgYm9vbCBzaGFyZWQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCmluZGV4IDVkODU2MTc4ODZiMy4uYWUwZWI2NGU3MzRiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCkBAIC00MzcsNiArNDM3LDIyIEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X21vdmVfYmxpdChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAog
CWlmIChyKQogCQlnb3RvIGVycm9yOwogCisJLyogY2xlYXIgdGhlIHNwYWNlIGJlaW5nIGZyZWVk
ICovCisJaWYgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9WUkFNICYmCisJICAgICh0dG1f
dG9fYW1kZ3B1X2JvKGJvKS0+ZmxhZ3MgJgorCSAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9X
SVBFX09OX1JFTEVBU0UpKSB7CisJCXN0cnVjdCBkbWFfZmVuY2UgKndpcGVfZmVuY2UgPSBOVUxM
OworCisJCXIgPSBhbWRncHVfZmlsbF9idWZmZXIodHRtX3RvX2FtZGdwdV9ibyhibyksIEFNREdQ
VV9QT0lTT04sCisJCQkJICAgICAgIE5VTEwsICZ3aXBlX2ZlbmNlKTsKKwkJaWYgKHIpIHsKKwkJ
CWdvdG8gZXJyb3I7CisJCX0gZWxzZSBpZiAod2lwZV9mZW5jZSkgeworCQkJZG1hX2ZlbmNlX3B1
dChmZW5jZSk7CisJCQlmZW5jZSA9IHdpcGVfZmVuY2U7CisJCX0KKwl9CisKIAkvKiBBbHdheXMg
YmxvY2sgZm9yIFZNIHBhZ2UgdGFibGVzIGJlZm9yZSBjb21taXR0aW5nIHRoZSBuZXcgbG9jYXRp
b24gKi8KIAlpZiAoYm8tPnR5cGUgPT0gdHRtX2JvX3R5cGVfa2VybmVsKQogCQlyID0gdHRtX2Jv
X21vdmVfYWNjZWxfY2xlYW51cChibywgZmVuY2UsIHRydWUsIG5ld19tZW0pOwpAQCAtMTU1OCw2
ICsxNTc0LDcgQEAgc3RhdGljIHN0cnVjdCB0dG1fYm9fZHJpdmVyIGFtZGdwdV9ib19kcml2ZXIg
PSB7CiAJLm1vdmUgPSAmYW1kZ3B1X2JvX21vdmUsCiAJLnZlcmlmeV9hY2Nlc3MgPSAmYW1kZ3B1
X3ZlcmlmeV9hY2Nlc3MsCiAJLm1vdmVfbm90aWZ5ID0gJmFtZGdwdV9ib19tb3ZlX25vdGlmeSwK
KwkucmVsZWFzZV9ub3RpZnkgPSAmYW1kZ3B1X2JvX3JlbGVhc2Vfbm90aWZ5LAogCS5mYXVsdF9y
ZXNlcnZlX25vdGlmeSA9ICZhbWRncHVfYm9fZmF1bHRfcmVzZXJ2ZV9ub3RpZnksCiAJLmlvX21l
bV9yZXNlcnZlID0gJmFtZGdwdV90dG1faW9fbWVtX3Jlc2VydmUsCiAJLmlvX21lbV9mcmVlID0g
JmFtZGdwdV90dG1faW9fbWVtX2ZyZWUsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmgKaW5kZXggY2FhNzZjNjkzNzAwLi5iY2NiOGM0OWU1OTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKQEAgLTM4LDYgKzM4LDggQEAKICNkZWZpbmUgQU1ER1BV
X0dUVF9NQVhfVFJBTlNGRVJfU0laRQk1MTIKICNkZWZpbmUgQU1ER1BVX0dUVF9OVU1fVFJBTlNG
RVJfV0lORE9XUwkyCiAKKyNkZWZpbmUgQU1ER1BVX1BPSVNPTgkweGQwYmVkMGJlCisKIHN0cnVj
dCBhbWRncHVfbW1hbiB7CiAJc3RydWN0IHR0bV9ib19kZXZpY2UJCWJkZXY7CiAJYm9vbAkJCQlt
ZW1fZ2xvYmFsX3JlZmVyZW5jZWQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
