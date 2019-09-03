Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84BA765C
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 23:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828B189700;
	Tue,  3 Sep 2019 21:41:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7F389700
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 21:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf5Gn8pdmHO/7PbR3F9KxBtQJ4mx4NrZgWF601buIu0itfD1GW7QMD4IQWZM5SXHJDmtSg2/0iix1TyllV7HaAEcmeVXGtuQ7Wq2G0hMFaUMtOAYeiW5QECgTOcY8BenGGRof9REbNKX6QzK7UGDOglTmaxn2zK32AVrBLPtBy6frA6sLVJMBc0AzOHOwI8hhcBGfX1XBQBY6sgMW+qP7pXnLhZ4K8651ZMt8+W0wiiCIOy4TFyksknpa9+hWRdSsj8AVT2irutKCO8DdW7tql7Lk2+ak8TFIwze/l9JhW7eALrWqcX3ATgPFGxmQ/QSFEEK7CRpVYf2qrGjs65cWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/TG9I91Y4EH5kmwor5TUKfGqOBPgtLyNQsS8MQRPGY=;
 b=hYP5rPo4ZP6YCPjdZnxu8S/GZBvYf93IYM8OTwcdsjhVWeQ3w5gePyJV5BmU2JWzjtOGWC16nitFNxpLLy4UtBLXXrrj/LKiuy719uhPlJdm5a9a+/YFCPKio4apfncskr7ubY1p6xtsmeUYM7rkOyPL9HKTTBzJoK4rGWkuZvW3ktPkxBHJ0mMPwXQb9gp/ohfYyT+hqwxHNFP+bESDEKh3XYQ26DkRiice/4KjqlE3s5lg96qezR8CA9Ifphsq1MNjg5BHONpJt8Ea0lBCP8oW7i4u3tXSkE1WIgfh7hDDqq6NKHUdTu6asTg63YHMKLAcF9jdrcRZaskKizHpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3799.namprd12.prod.outlook.com (52.132.231.202) by
 CH2PR12MB4168.namprd12.prod.outlook.com (20.180.6.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 3 Sep 2019 21:41:10 +0000
Received: from CH2PR12MB3799.namprd12.prod.outlook.com
 ([fe80::207a:8f5b:63b5:f49a]) by CH2PR12MB3799.namprd12.prod.outlook.com
 ([fe80::207a:8f5b:63b5:f49a%3]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 21:41:10 +0000
From: "Jiang, Sonny" <Sonny.Jiang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: add drm device name
Thread-Topic: [PATCH] drm: add drm device name
Thread-Index: AQHVYqBNPdQwo0Y/qkekHi41SN/5fA==
Date: Tue, 3 Sep 2019 21:41:10 +0000
Message-ID: <20190903214040.2386-1-sonny.jiang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To CH2PR12MB3799.namprd12.prod.outlook.com
 (2603:10b6:610:21::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3021f01a-20bd-4bc6-9a7e-08d730b76f8c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB4168; 
x-ms-traffictypediagnostic: CH2PR12MB4168:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4168BFD4928E3CCA2EAA4363FDB90@CH2PR12MB4168.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(199004)(189003)(2906002)(2501003)(1076003)(2351001)(26005)(5660300002)(316002)(186003)(5640700003)(66066001)(6436002)(6512007)(53936002)(52116002)(99286004)(64756008)(66446008)(66476007)(66946007)(2616005)(476003)(6486002)(71190400001)(71200400001)(66556008)(36756003)(4326008)(25786009)(478600001)(14444005)(256004)(14454004)(8936002)(81166006)(50226002)(6506007)(386003)(7736002)(8676002)(102836004)(81156014)(6116002)(3846002)(305945005)(6916009)(86362001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4168;
 H:CH2PR12MB3799.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DKI/tc9NinQ7HmGP6qxtSPz2TdnGwAiAvGKFCGPKk7k/014B9BpNFDtBTkFO7B/tiwuX4lAr6PK6/Gi/wwXXWJUWj5QPXeNi2Ptc9/UOYpxruxVy40yeq6UGiMEUki57dGPcPtMG/v7Pc1nYR3whMnD1m/HicM8Rb2BGBrP3jflr3fl7BgP+DdS1FH2+vSBLHM6Q75QlhByTuGB+asUWulgis9bgFZvVlxWJDpDdAWXUb39qaXsKo6YGx175tkEpUPEsTKbrg2vv3u3B1+Z0kVHkgIvUtoCtDVgvn8DFbuAsHElXgLaZ5/JpylJkdi69qpEKhPjchks1YdUlc+AZxaqITFW/G7Hh0iLfODQE4bGGZT0DzMwJjeT7Ulxo/BmbYagXZirWRUzcWdc/fb19m+Tw9o/+tbZVyascp4Ii3lA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3021f01a-20bd-4bc6-9a7e-08d730b76f8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 21:41:10.6807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kn/kqSCPy76vteu/LCQ58WpLl6yCJ3tPIRaavKMcQH5hsm7I1yX1HW6ZfVopQoeb3T45508Za92X4x2XlDid5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/TG9I91Y4EH5kmwor5TUKfGqOBPgtLyNQsS8MQRPGY=;
 b=telLIKUww2HaVuOXjwnNclijRpybERpMc9xCJLVfy2Mr5CD+meTgq3LmzyErzi2rnATrz5Yn2wXXXJFyTbdnMH+lU4EhegON/kHo1DrdN76w1eVP59GFgrIqrvtGD5yDwgJu/GLUtdRhfrTX8k/7SzXA4mWEsaD3bSXJRXhoQS8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sonny.Jiang@amd.com; 
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIERSTSBkZXZpY2UgbmFtZSBhbmQgdXNlIERSTV9JT0NUTF9WRVJTSU9OIGlvY3RsIGRybVZl
cnNpb246OmRlc2MgcGFzc2luZyBpdCB0byB1c2VyIHNwYWNlCmluc3RlYWQgb2YgdW51c2VkIERS
TSBkcml2ZXIgbmFtZSBkZXNjcmlwdG9yLgoKQ2hhbmdlLUlkOiBJODA5ZjZkM2UwNTcxMTE0MTdl
ZmJlOGZhN2NhYjhmMDExM2JhNGIyMQpTaWduZWQtb2ZmLWJ5OiBTb25ueSBKaWFuZyA8c29ubnku
amlhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyAgICAgICAgICAgICAgICAg
IHwgMTcgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyAgICAg
ICAgICAgICAgICB8ICAyICstCiBpbmNsdWRlL2RybS9kcm1fZGV2aWNlLmggICAgICAgICAgICAg
ICAgICAgfCAgMyArKysKIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA2N2Iw
OWNiMmE5ZTIuLjhmMDk3MWNlYTM2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwpAQCAtMjgwOSw2ICsyODA5LDggQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkvKiBpbml0IHRoZSBtb2RlIGNvbmZpZyAq
LwogCWRybV9tb2RlX2NvbmZpZ19pbml0KGFkZXYtPmRkZXYpOwogCisJZHJtX2Rldl9zZXRfbmFt
ZShhZGV2LT5kZGV2LCBhbWRncHVfYXNpY19uYW1lW2FkZXYtPmFzaWNfdHlwZV0pOworCiAJciA9
IGFtZGdwdV9kZXZpY2VfaXBfaW5pdChhZGV2KTsKIAlpZiAocikgewogCQkvKiBmYWlsZWQgaW4g
ZXhjbHVzaXZlIG1vZGUgZHVlIHRvIHRpbWVvdXQgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCmluZGV4IDg2MjYyMTQ5
NGE5My4uNmMzMzg3OWJiNTM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKQEAgLTgwMiw2ICs4MDIsNyBAQCB2b2lk
IGRybV9kZXZfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCW11dGV4X2Rlc3Ryb3koJmRl
di0+c3RydWN0X211dGV4KTsKIAlkcm1fbGVnYWN5X2Rlc3Ryb3lfbWVtYmVycyhkZXYpOwogCWtm
cmVlKGRldi0+dW5pcXVlKTsKKwlrZnJlZShkZXYtPm5hbWUpOwogfQogRVhQT1JUX1NZTUJPTChk
cm1fZGV2X2ZpbmkpOwogCkBAIC0xMDc4LDYgKzEwNzksMjIgQEAgaW50IGRybV9kZXZfc2V0X3Vu
aXF1ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKQogfQogRVhQT1JU
X1NZTUJPTChkcm1fZGV2X3NldF91bmlxdWUpOwogCisvKioKKyAqIGRybV9kZXZfc2V0X25hbWUg
LSBTZXQgdGhlIG5hbWUgb2YgYSBEUk0gZGV2aWNlCisgKiBAZGV2OiBkZXZpY2Ugb2Ygd2hpY2gg
dG8gc2V0IHRoZSBuYW1lCisgKiBAbmFtZTogbmFtZSB0byBiZSBzZXQKKyAqCisgKiBSZXR1cm46
IDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KKyAqLwor
aW50IGRybV9kZXZfc2V0X25hbWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgY2hhciAq
bmFtZSkKK3sKKwlrZnJlZShkZXYtPm5hbWUpOworCWRldi0+bmFtZSA9IGtzdHJkdXAobmFtZSwg
R0ZQX0tFUk5FTCk7CisKKwlyZXR1cm4gZGV2LT5uYW1lID8gMCA6IC1FTk9NRU07Cit9CitFWFBP
UlRfU1lNQk9MKGRybV9kZXZfc2V0X25hbWUpOworCiAvKgogICogRFJNIENvcmUKICAqIFRoZSBE
Uk0gY29yZSBtb2R1bGUgaW5pdGlhbGl6ZXMgYWxsIGdsb2JhbCBEUk0gb2JqZWN0cyBhbmQgbWFr
ZXMgdGhlbQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9pb2N0bC5jCmluZGV4IDIyNjNlM2RkZDgyMi4uNjFmMDI5NjUxMDZiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9pb2N0bC5jCkBAIC01MDYsNyArNTA2LDcgQEAgaW50IGRybV92ZXJzaW9uKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCQkJZGV2LT5kcml2ZXItPmRhdGUpOwog
CWlmICghZXJyKQogCQllcnIgPSBkcm1fY29weV9maWVsZCh2ZXJzaW9uLT5kZXNjLCAmdmVyc2lv
bi0+ZGVzY19sZW4sCi0JCQkJZGV2LT5kcml2ZXItPmRlc2MpOworCQkJCWRldi0+bmFtZSk7CiAK
IAlyZXR1cm4gZXJyOwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RldmljZS5oIGIv
aW5jbHVkZS9kcm0vZHJtX2RldmljZS5oCmluZGV4IDdmOWVmNzA5YjJiNi4uZTI5OTEyYzQ4NGU0
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZGV2aWNlLmgKKysrIGIvaW5jbHVkZS9kcm0v
ZHJtX2RldmljZS5oCkBAIC0xMjMsNiArMTIzLDkgQEAgc3RydWN0IGRybV9kZXZpY2UgewogCS8q
KiBAdW5pcXVlOiBVbmlxdWUgbmFtZSBvZiB0aGUgZGV2aWNlICovCiAJY2hhciAqdW5pcXVlOwog
CisJLyoqIEBuYW1lOiBkZXZpY2UgbmFtZSAqLworCWNoYXIgKm5hbWU7CisKIAkvKioKIAkgKiBA
c3RydWN0X211dGV4OgogCSAqCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmggYi9p
bmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggNjhjYTczNmM1NDhkLi5mNzQyZTJiZGU0NjcgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHJ2
LmgKQEAgLTc5OCw2ICs3OTgsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZHJtX2Rydl91c2VzX2F0
b21pY19tb2Rlc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAKIAogaW50IGRybV9kZXZfc2V0
X3VuaXF1ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKTsKK2ludCBk
cm1fZGV2X3NldF9uYW1lKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKm5hbWUp
OwogCiAKICNlbmRpZgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
