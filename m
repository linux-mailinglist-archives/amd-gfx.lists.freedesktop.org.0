Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD887FE0B
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 18:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCA6EEC1;
	Fri,  2 Aug 2019 16:04:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7226EEC1
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 16:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKvdnJR0er9LHE/iYqPHrH3jijpS7/Q82gfujX2nQrsya13YdHiOOiGjnwz+Qo46NWKXnPGsLK6X0jUUKetv0EdrKsgrV+ltGUw2Lbz0r5hjMLLTh2gc/LviQl0NGmYEYuNsVWsFkV7I8esWYVWJRryaIpGm74x07yS+OSG+YU8TwPodM5v6oB/ZEM7unRm2iKEHRc5l8Zf40xLdhxLc7EF9+n0CHnBQaD64YT4C1YH6PwPwTrmrgZRZ+mzARkKw2u+WNksgBxCSjjJKTlwEXE4LgyDjo/NQYPPA0BTLUEOEo3Ur1WdNlNRchfLVREsmZxSxVUj9t3lD0T05+TdIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JiMjLb0qjITt38iLHgnO8aq2T20SUxfjOri1KBJztc=;
 b=LNRh7tsVmB3dhJ4NJxdXnDtSWP92RsipD9g1lUzFOQjogSQq50bj+HREwQS1ZSWb/3DUYos+OfrxrLhUWkf7JVJFCnk99r2FLCiVcWWt7psEoGIk6M31BEkL6vULhUdE206yAggsVROrIWJclKAnytfmCWXubQIzqF2FXyxMGrpV4shvNMZCZhSBnWJ2sttq230gvF4r2u/UbqN3jAWst3yDSmlOYhlFarOVXhkHgIikKcX++8BnWl11JKul6lmbv72Q9nBUO04wUEMnfaDNyNpCZm8pwzHp/nQjY2QsHJAszwbK26J32Pqx6h/H9KG0ctF7CMQmxM+mN4NUyZk/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2371.namprd12.prod.outlook.com (52.132.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 16:04:01 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 16:04:01 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific vm
 hub
Thread-Topic: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
Thread-Index: AQHVSUvmAo7H+DIhNU2zNHDc6cD8ig==
Date: Fri, 2 Aug 2019 16:04:01 +0000
Message-ID: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30c6d104-1176-466b-ba57-08d7176308ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2371; 
x-ms-traffictypediagnostic: BL0PR12MB2371:
x-microsoft-antispam-prvs: <BL0PR12MB2371DA90BB2D3AFE6CA85EDE80D90@BL0PR12MB2371.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(52116002)(68736007)(3846002)(6116002)(2351001)(8936002)(8676002)(6486002)(5660300002)(66066001)(81166006)(186003)(50226002)(476003)(2616005)(486006)(81156014)(316002)(26005)(2906002)(256004)(36756003)(386003)(6506007)(66446008)(7736002)(6436002)(66556008)(66476007)(305945005)(6916009)(14454004)(478600001)(71190400001)(71200400001)(66946007)(25786009)(5640700003)(4326008)(2501003)(53936002)(64756008)(6512007)(86362001)(102836004)(54906003)(99286004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2371;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NVlPxl2EAxtNmfvx7ubtdJ9zRXYzis2f0aCUhqIa3lPURGaYrcv1SjFhzLV4DMblleWXAdJXIV3wToA21Efr/1N3fZe2CTgRLPmarRKbrgZTI0hOQZM+4x/V4xKhBBDS6ufO1QB+E0JFrewxAbR7mGRy0wUdPOhhCRp7duXg5LKlpo4tZDTPl31pDshTmLTUm50VE1G4poLN8oZQop8GBkOKAXH7SkiTkcKyWZ9G4vr/3rg5dZRJSaN51iwWgknHTSpeDUrCToNoYjFHvk7GCqjx1MUqFNJFEka0Nv0L3tVzvxolu6UX6j/WXOhdAOo/hCIjkqD5AiRrWQwrz1ZsW4oguBIqavaRXG9EWOi6WNrvNUx0k4Tkmr3kNfJSDozcWYQ1ufcIft6yF0QOjBwqIqUBOrZtVLMOSLbqfm7KVbU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c6d104-1176-466b-ba57-08d7176308ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 16:04:01.7085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2371
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JiMjLb0qjITt38iLHgnO8aq2T20SUxfjOri1KBJztc=;
 b=OdieVkwmaJXIjeEsMIdXtGLNzuyxoRW0cOWU+B2WRamSFcCQ+pinfGlAfM+LKbNvasRdg4TzWsEEMnuvpWXU03bgZeGmI2pFUX9VIweBbf8fHDc9+RnImBslQ8WwgmGY5wDbyiWMvTdjCyzLFS+wn+RLib6cmBshoAUZ9vxdJ8Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBmb3Iga2ZkIHRvIHJldXNlIGFtZGdwdSBUTEIgaW52YWxpZGF0aW9uIGZ1bmN0aW9u
LiBUaGVyZQppcyBhbHJlYWR5IGEgZ21jIGZ1bmN0aW9uIGZsdXNoX2dwdV90bGIgdG8gZmx1c2gg
VExCIG9uIGFsbCB2bQpodWIuIE9uIGdmeDEwLCBrZmQgb25seSBuZWVkcyB0byBmbHVzaCBUTEIg
b24gZ2Z4IGh1YiBidXQgbm90Cm9uIG1tIGh1Yi4gU28gZXhwb3J0IGEgZnVuY3Rpb24gZm9yIEtG
RCBmbHVzaCBUTEIgb25seSBvbiBnZngKaHViLgoKQ2hhbmdlLUlkOiBJNThmZjAwOTY5Zjg4NDM4
Y2ZkM2RjN2U5ZGViN2JmZjBjMWJiNDEzMwpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlpl
bmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgg
fCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jICB8IDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ21jLmgKaW5kZXggMDcxMTQ1YS4uMGJkNGE0ZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nbWMuaApAQCAtODgsNiArODgsOSBAQCBzdHJ1Y3QgYW1kZ3B1X3Zt
aHViIHsKICAqIEdQVSBNQyBzdHJ1Y3R1cmVzLCBmdW5jdGlvbnMgJiBoZWxwZXJzCiAgKi8KIHN0
cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsKKwkvKiBmbHVzaCB2bSB0bGIgb2Ygc3BlY2lmaWMgaHVi
ICovCisJdm9pZCAoKmZsdXNoX3ZtX2h1Yikoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVp
bnQzMl90IHZtaWQsCisJCQkJICAgdW5zaWduZWQgaW50IHZtaHViLCB1aW50MzJfdCBmbHVzaF90
eXBlKTsKIAkvKiBmbHVzaCB0aGUgdm0gdGxiIHZpYSBtbWlvICovCiAJdm9pZCAoKmZsdXNoX2dw
dV90bGIpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgICAgdWludDMyX3Qgdm1p
ZCwgdWludDMyX3QgZmx1c2hfdHlwZSk7CkBAIC0xODAsNiArMTgzLDcgQEAgc3RydWN0IGFtZGdw
dV9nbWMgewogCXN0cnVjdCByYXNfY29tbW9uX2lmICAgICpyYXNfaWY7CiB9OwogCisjZGVmaW5l
IGFtZGdwdV9nbWNfZmx1c2hfdm1faHViKGFkZXYsIHZtaWQsIHZtaHViLCB0eXBlKSAoKGFkZXYp
LT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF92bV9odWIoKGFkZXYpLCAodm1pZCksICh2bWh1YiksICh0
eXBlKSkpCiAjZGVmaW5lIGFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYihhZGV2LCB2bWlkLCB0eXBl
KSAoYWRldiktPmdtYy5nbWNfZnVuY3MtPmZsdXNoX2dwdV90bGIoKGFkZXYpLCAodm1pZCksICh0
eXBlKSkKICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X2ZsdXNoX2dwdV90bGIociwgdm1pZCwgYWRk
cikgKHIpLT5hZGV2LT5nbWMuZ21jX2Z1bmNzLT5lbWl0X2ZsdXNoX2dwdV90bGIoKHIpLCAodm1p
ZCksIChhZGRyKSkKICNkZWZpbmUgYW1kZ3B1X2dtY19lbWl0X3Bhc2lkX21hcHBpbmcociwgdm1p
ZCwgcGFzaWQpIChyKS0+YWRldi0+Z21jLmdtY19mdW5jcy0+ZW1pdF9wYXNpZF9tYXBwaW5nKChy
KSwgKHZtaWQpLCAocGFzaWQpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwpp
bmRleCA0ZTNhYzEwLi4yNDc1MTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEw
XzAuYwpAQCAtNDE2LDYgKzQxNiw3IEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9nZXRfdm1fcGRl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsCiB9CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjEwXzBfZ21jX2Z1bmNzID0geworCS5mbHVz
aF92bV9odWIgPSBnbWNfdjEwXzBfZmx1c2hfdm1faHViLAogCS5mbHVzaF9ncHVfdGxiID0gZ21j
X3YxMF8wX2ZsdXNoX2dwdV90bGIsCiAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192MTBfMF9l
bWl0X2ZsdXNoX2dwdV90bGIsCiAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192MTBfMF9lbWl0
X3Bhc2lkX21hcHBpbmcsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
