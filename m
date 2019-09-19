Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A96B7BFF
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 16:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AE6F974;
	Thu, 19 Sep 2019 14:19:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710046.outbound.protection.outlook.com [40.107.71.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CEF6F96C
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbPc+EhHt6w9uGJthDMz8pUJD92vFxnSZ0AmGroQSXd57RQMlAVcMiXYL0JlLvMYLX8LW8GejEp2KcntqnGim3mQPG4kSWmrIZjRfJFYkwYHOjDr4sEaNlAcyH4EBrAJwShQvd/T3TcKOnaWVO90M6sHpjUKKBuTxnb/ClV0a+IJSjrJDmZ04A0D5iSbmm364L9BTkyAnlEAjDaOXx+/2h3Et4QaGwjC/sNI5m1UF4Ph8/nHiR0B7PHUWLrTBk8f28gR9zclc/HXmEJB+qfFaW2vAbqp0Y1WVvhk14bp2Z/mv7cp4so5ElcYeWoS3M6q9VeUYRnovCoIhecec6fsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcMCVYVPTBjH7+fEIvsJtSqDVMOgCZ5596tMTzrPQlg=;
 b=hShvo81pRhsX2lWBlKEE74TojOml1ZZsQ/zkn0ZNxQlPOXAUeO33FhOdxrzClkEvzaeqO850dkKUZmExG0Ya/Nl1hvgjatkUVgsxVrTke6ZyJZMpAuBoP8Z+6d+xk3/9rPaIzUjsVurwOp0Rgrb+A7g84jlLmaDt9NxsVb+csxIS9hV2B79lU6ifGKmYmjIZq24CTugsS/4f+6LdOEY4/wB5fwf8xdEOUmZscqJv1i4Ps9HQ45OVKdNFEqwa6hgEDg55FH4OtRWRmdr1xSLfujRUCV/+MIoIg3y1FCqx7yWW4/LplbZd/M9967GgKND1lmukaRxUzoQAO7j0VY9Jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3589.namprd12.prod.outlook.com (20.178.197.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 19 Sep 2019 14:19:11 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 14:19:11 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 00/21] RAS code refinements
Thread-Topic: [PATCH 00/21] RAS code refinements
Thread-Index: AQHVbrmYtE32o8te3ku+Z3JeoPDn4qczDG7g
Date: Thu, 19 Sep 2019 14:19:11 +0000
Message-ID: <BYAPR12MB2806DA87BD86F8ECBC8A0114F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.159.93.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d55d76-e603-4856-14d2-08d73d0c57cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3589; 
x-ms-traffictypediagnostic: BYAPR12MB3589:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3589A205579EB376AB4C5E05F1890@BYAPR12MB3589.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(13464003)(189003)(199004)(256004)(66066001)(66946007)(52536014)(66476007)(66556008)(64756008)(66446008)(5660300002)(76176011)(7696005)(186003)(26005)(486006)(53546011)(476003)(6506007)(76116006)(102836004)(446003)(110136005)(11346002)(99286004)(14444005)(71200400001)(71190400001)(316002)(86362001)(9686003)(14454004)(81166006)(81156014)(55016002)(2501003)(8676002)(7736002)(6116002)(478600001)(305945005)(3846002)(229853002)(33656002)(6436002)(6246003)(6636002)(8936002)(2906002)(74316002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3589;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +W1w4rlpI9x4R9OS3HQcivAQBSyYSdNyzmIR0EULIERQzbfqwGHBi1AOxxoLlTxkqz+0V48lVaRU6oi6N+qR/JWgPcFj6ZCjACkJA76bWdX5r8hhIr5Jg5fIFn3FDuFvLH75qG5cRGsh9tGFeQKc0nl2gpzVNfKpyYzBpnbuKiENF1c/Dm/oh8hw+vTimJ/nkWkJ2LVsdznPUtEP5Yuo79VCSlp3+Sd+RRYpJINDvnil1XPIuNqaoEUqyUSw/9XQfw6FTq8f8BGp3Z0wd/i2fNlwqjsI95ux/W3fayL7PXsbeyFE9jitjRIS6KIwFc40ir81CxQcGc9mKGY9+lvuzfKeSXEkWh8WkcpCl3sc92wC5AHc9tpxQKGO9IEyKrcxazVA5HfyUQnpOyifkj095zgraMPIsRT8c21mjwuXs8Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d55d76-e603-4856-14d2-08d73d0c57cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 14:19:11.7805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFHJtnJEui3wYEFyjE2NR5m2OzE3klKhCW0q0sA1kOdQn0W6zF7bLi+4MT2zm7irmAoyjRPaQb+fklUVnToaNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcMCVYVPTBjH7+fEIvsJtSqDVMOgCZ5596tMTzrPQlg=;
 b=x99mei3jRS//Pl/mfSsoz2FDjoL+zo85hmOsv0N3nXIN+rqFLZxi2mV13T98Dj7CfpbaQWXh7iOLcKsQAvVIigOBTs1u763wfAJL7692qz4nXs/72Qg8I2y1jR9Sg7wm2Yc5gnz4XpoUX/6lC8pWFq9vrC925AUovrmF65n6Fis=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

VHdvIGNvbW1lbnRzIGluIHBhdGNoIDUgYW5kIHBhdGNoIDExLiBBcGFydCBmcm9tIHRoYXQsIHRo
ZSBzZXJpZXMgaXM6ClJldmlld2VkLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNv
bT4KClJlZ2FyZHMsCkd1Y2h1bgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogWmhv
dTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+IApTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDE5
LCAyMDE5IDM6MTIgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBH
dWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPgpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+ClN1YmplY3Q6IFtQ
QVRDSCAwMC8yMV0gUkFTIGNvZGUgcmVmaW5lbWVudHMKCnNvbWUgcmVmaW5lbWVudHMgZm9yIFJB
Uywgbm8gZnVuY3Rpb25hbCBjaGFuZ2U6CgoxLiBtYWtlIG1vcmUgcmFzIGNvZGUgY2FuIGJlIHJl
dXNhYmxlIGFtb25nIGRpZmZlcmVudCBnZW5lcmF0aW9ucyBvZiByYXMgYmxvY2s7IDIuIG1ha2Ug
c29tZSByYXMgY29kZSBzaW1wbGVyOwoKVGFvIFpob3UgKDIxKToKICBkcm0vYW1kZ3B1OiB1cGRh
dGUgcGFyYW1ldGVyIG9mIHJhc19paF9jYgogIGRybS9hbWRncHU6IG1vdmUgdW1jIHJhcyBpcnEg
ZnVuY3Rpb25zIHRvIHVtYyBibG9jawogIGRybS9hbWRncHU6IG1vdmUgZ2Z4IGVjYyBmdW5jdGlv
bnMgdG8gZ2VuZXJpYyBnZnggZmlsZQogIGRybS9hbWRncHU6IG1vdmUgc2RtYSBlY2MgZnVuY3Rp
b25zIHRvIGdlbmVyaWMgc2RtYSBmaWxlCiAgZHJtL2FtZGdwdTogcmVmaW5lIHNkbWE0IHJhc19k
YXRhX2NiCiAgZHJtL2FtZGdwdTogbW92ZSB1bWNfcmFzX2lmIGZyb20gZ21jIHRvIHVtYyBibG9j
awogIGRybS9hbWRncHU6IGFkZCBjb21tb24gbW1odWIgbWVtYmVyIGZvciBhZGV2CiAgZHJtL2Ft
ZGdwdTogcmVwbGFjZSBtbWh1Yl9mdW5jcyB3aXRoIG1taHViLmZ1bmNzCiAgZHJtL2FtZGdwdTog
bW92ZSBtbWh1Yl9yYXNfaWYgZnJvbSBnbWMgdG8gbW1odWIgYmxvY2sKICBkcm0vYW1kZ3B1OiBh
ZGQgY29tbW9uIGdtY19yYXNfZmluaSBmdW5jdGlvbgogIGRybS9hbWRncHU6IGFkZCBjb21tb24g
Z2Z4X3Jhc19maW5pIGZ1bmN0aW9uCiAgZHJtL2FtZGdwdTogYWRkIGNvbW1vbiBzZG1hX3Jhc19m
aW5pIGZ1bmN0aW9uCiAgZHJtL2FtZGdwdTogcmVtb3ZlIGloX2luZm8gcGFyYW1ldGVyIG9mIHVt
Y19yYXNfbGF0ZV9pbml0CiAgZHJtL2FtZGdwdTogcmVtb3ZlIGloX2luZm8gcGFyYW1ldGVyIG9m
IGdmeF9yYXNfbGF0ZV9pbml0CiAgZHJtL2FtZGdwdTogc2ltcGxpZnkgdGhlIGFjY2VzcyB0byBl
ZXByb21fY29udHJvbCBzdHJ1Y3QKICBkcm0vYW1kZ3B1OiBhZGQgcmFzIGZpbmkgZm9yIG5iaW8K
ICBkcm0vYW1kZ3B1OiBhZGQgcmFzIGZpbmkgZm9yIHhnbWkKICBkcm0vYW1kZ3B1OiBtb3ZlIHVt
YyByYXMgZmluaSB0byB1bWMgYmxvY2sKICBkcm0vYW1kZ3B1OiBtb3ZlIG1taHViIHJhcyBmaW5p
IHRvIG1taHViIGJsb2NrCiAgZHJtL2FtZGdwdTogbW92ZSB4Z21pIHJhcyBmaW5pIHRvIHhnbWkg
YmxvY2sKICBkcm0vYW1kZ3B1OiBpbXBsZW1lbnQgY29tbW9uIGdtY19lY2NfbGF0ZV9pbml0Cgog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyAgIHwgIDY0ICsrKysrKysrKystLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oICAgfCAgMTAgKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYyAgIHwgIDI3ICsrKysrCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmggICB8ICAgNCArLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmMgfCAgMzggKysrKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmggfCAgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmMgIHwgIDE0ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X25iaW8uaCAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmggICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Nk
bWEuYyAgfCAgNDcgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c2RtYS5oICB8ICAgNyArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5j
ICAgfCAxMTcgKysrKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdW1jLmggICB8ICAxMiArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV94Z21pLmMgIHwgIDE0ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3hnbWkuaCAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAg
ICAgfCAgNTggKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgICAgIHwgMTE5ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jICAgIHwgIDc0ICsrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICB8ICAgMSArCiAyMSBmaWxlcyBjaGFuZ2VkLCAz
NTMgaW5zZXJ0aW9ucygrKSwgMjc5IGRlbGV0aW9ucygtKQoKLS0KMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
