Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4E8C0F4
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 20:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3286E0DB;
	Tue, 13 Aug 2019 18:44:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E086E0DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 18:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6nWGsOx0/jW6T9RoZJcfml8bHS8WHLF092rDaFf3gKH8GYW9taCGCX/9aybZVRFXifiouG5HFC1/3ieWy5kQOdu/xY57kzSOcNYiFC0N/R6niL8AHzq/QQO2Yz7U2NhLguHuhaLhrZECY0IsfDYpgh6p8dZOgJbItqNDIDV8xktS0FukWpbFF+55LTDTztD+hTNFyIE1BO3mCGGYA86OjB5fjdLydNjGtxzstbobEkyrnOJHNFrCwrx2sVBTOtRDbEI34CSIMZ4/KmKayimNVIOluZS59qoeSZfXUNH87CewMlAJA0IU/7i3ziTAyRQgcNp9jnY/4vYG122L62QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxsAwS+e+9WcqImQE8NWEl5V9XdSSp0xQY7jeERse4M=;
 b=l7rT6twLp9Fticc/TwUEcl18FrEFYXPNTj4UWaPNAYIC056pDfvSiC8AudXMpmH73jKngAj40ahNVuI+KUaODaMrKNeLI1zYf3ZjQ/JM7UayQWsSYDyz7xno3OQf2fel2oYVnB2g40pIoruqXYYQp2eLZrh66Ge9BQaT3iQK813UOjqaAGyN9DRUmIjAItVmfwGJsDhBHVk7x1nO8iG4gnwuzydOdpxymBu08Z2L4m+qw/eG+w2LHphhAvTCQvtLIYL/8F6ZYgR5qE8YLYPtl57OC4jJ8PkAerZwmGU29YqhrU7PDiO5u6apunDNob2bJcru2TYpqZv8eO/8/U+05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 13 Aug 2019 18:43:57 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 18:43:57 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Set VM_L2_CNTL.PDE_FAULT_CLASSIFICATION to 0 for
 GFX10
Thread-Topic: [PATCH] drm/amdgpu: Set VM_L2_CNTL.PDE_FAULT_CLASSIFICATION to 0
 for GFX10
Thread-Index: AQHVUgcQB1sn5XbgREm8QCy64mOfSQ==
Date: Tue, 13 Aug 2019 18:43:57 +0000
Message-ID: <20190813184344.13781-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::28) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5ebeecd-2a66-4441-ba90-08d7201e3307
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4089; 
x-ms-traffictypediagnostic: DM6PR12MB4089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB408957EBFB219E3A69C35113F0D20@DM6PR12MB4089.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(71190400001)(66066001)(386003)(316002)(478600001)(2501003)(6506007)(14454004)(305945005)(102836004)(186003)(2351001)(7736002)(99286004)(8936002)(71200400001)(86362001)(26005)(52116002)(1076003)(6916009)(5660300002)(256004)(53936002)(6512007)(66446008)(66556008)(64756008)(66946007)(5640700003)(6486002)(4326008)(81166006)(6436002)(2906002)(50226002)(25786009)(81156014)(8676002)(14444005)(476003)(36756003)(3846002)(486006)(66476007)(2616005)(6116002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4089;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bJddz/xT98bbBMC2bbn6y2AhOSErhKinkB2YPGnx6GYIWJOBtkM9bQsFbfPxG2n9KUc7dmwuiOeONBmxi///UGQnUoM+sGM3VjTsc37bK8YLA3ZiccllXiGWExoWH8Ss9Dl0I66IJKmokHYmzzjn2pWtSb0W27rWdxnhEBxEn8IOOJk1fxoIqPUGv9djlCUmvrVXXnSXLSPq+D8hajPQAr8JWgybduabTU4eBAey5BDskHZfi7X7z9/7wO9/WbrYTBcYUp9NvheVWkcQlEaM3oxZ+5+Q2I4ZzCLWQSirwgZLGehk0p5uW3+iN4nITNTtFRUxXCSrb/SwTbyN6Dajpb4zDJPlauk/o8zVYqHntuXN7fdL/DRososSVxJBokibKAJUvFsjNyVYmjBhfmHIPcviFLCfdvsw1ybWrR4xAks=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ebeecd-2a66-4441-ba90-08d7201e3307
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 18:43:57.5505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+tEW5fmVD7B+1Odubki3YginmjQPzBmH+gjbIxw6ymE3fg302Za+rVidwfLe8ZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxsAwS+e+9WcqImQE8NWEl5V9XdSSp0xQY7jeERse4M=;
 b=Iwsy22mjBBRaHpD8YTMSOgYvFZeOn2QEfgJym9sUyc1psIntT/Z0YYcjcPUMIUQGY4u9d8b0rIO8VUB5K6hPrHdpAZ0YfeIYTcISSSAeeJ6k7YRTYqk2otqxCS692/yBsS895TpAacOw0tIJUA7WHUkaYlOYXBjHauZuIkGFXX4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgaGF2ZSBkb25lIHRoaXMgZm9yIHByZS1HRlgxMCBhc2ljcywgYnV0IEdGWDEwIGRpZCBub3Qg
cGljayB1cCB0aGUKbmV3IGNoYW5nZS4gVGhlIGJlbG93IGlzIHRoZSBjb21taXQgbWVzc2FnZSBm
b3IgdGhhdCBjaGFuZ2UuCgpUaGlzIGlzIHJlY29tbWVuZGVkIGJ5IEhXIGRlc2lnbmVycy4gUHJl
dmlvdXNseSB3aGVuIGl0IHdhcyBzZXQgdG8gMSwKdGhlIFBERSB3YWxrIGVycm9yIGluIFZNIGZh
dWx0IHdpbGwgYmUgdHJlYXRlZCBhcwpQRVJNSVNTSU9OX09SX0lOVkFMSURfUEFHRV9GQVVMVCBy
YXRoZXIgdGhhbiB1c3VhbGx5IGV4cGVjdGVkIE9USEVSX0ZBVUxULgpBcyBhIHJlc3VsdCwgdGhl
IHJldHJ5IGNvbnRyb2wgaW4gVk1fQ09OVEVYVCpfQ05UTCB3aWxsIGNoYW5nZSBhY2NvcmRpbmds
eS4KClRoZSBhYm92ZSBiZWhhdmlvciBpcyBraW5kIG9mIGFibm9ybWFsLiBGdXJ0aGVybW9yZSwg
dGhlClBERV9GQVVMVF9DTEFTU0lGSUNBVElPTiA9PSAxIGZlYXR1cmUgd2FzIHRhcmdldGVkIGZv
ciB2ZXJ5IG9sZCBBU0lDcwphbmQgaXQgbmV2ZXIgbWFkZSBpdCB3YXkgdG8gcHJvZHVjdGlvbi4g
VGhlcmVmb3JlLCB3ZSBzaG91bGQgc2V0IGl0IHRvIDAuCgpDaGFuZ2UtSWQ6IElmMWJlZWRiNjMx
ZDE2Yjg1ZDA3MmFhOTY2NTdhN2E3NWZhMzc4NDgwClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8
WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHVi
X3YyXzAuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwppbmRleCA4Y2U1YmY1ZmVi
NDUuLjhiNzg5Zjc1MGI3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4aHViX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJf
MC5jCkBAIC0xNDAsNyArMTQwLDcgQEAgc3RhdGljIHZvaWQgZ2Z4aHViX3YyXzBfaW5pdF9jYWNo
ZV9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCS8qIFhYWCBmb3IgZW11bGF0aW9u
LCBSZWZlciB0byBjbG9zZWQgc291cmNlIGNvZGUuKi8KIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRt
cCwgR0NWTV9MMl9DTlRMLAogCQkJICAgIEwyX1BERTBfQ0FDSEVfVEFHX0dFTkVSQVRJT05fTU9E
RSwgMCk7Ci0JdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fTDJfQ05UTCwgUERFX0ZBVUxU
X0NMQVNTSUZJQ0FUSU9OLCAxKTsKKwl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NWTV9MMl9D
TlRMLCBQREVfRkFVTFRfQ0xBU1NJRklDQVRJT04sIDApOwogCXRtcCA9IFJFR19TRVRfRklFTEQo
dG1wLCBHQ1ZNX0wyX0NOVEwsIENPTlRFWFQxX0lERU5USVRZX0FDQ0VTU19NT0RFLCAxKTsKIAl0
bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NWTV9MMl9DTlRMLCBJREVOVElUWV9NT0RFX0ZSQUdN
RU5UX1NJWkUsIDApOwogCVdSRUczMl9TT0MxNShHQywgMCwgbW1HQ1ZNX0wyX0NOVEwsIHRtcCk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMKaW5kZXggOGVlMTIyNWQxYTE4
Li4zNTQyYzIwM2MzYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21t
aHViX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMK
QEAgLTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX2luaXRfY2FjaGVfcmVn
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkvKiBYWFggZm9yIGVtdWxhdGlvbiwgUmVm
ZXIgdG8gY2xvc2VkIHNvdXJjZSBjb2RlLiovCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1N
Vk1fTDJfQ05UTCwgTDJfUERFMF9DQUNIRV9UQUdfR0VORVJBVElPTl9NT0RFLAogCQkJICAgIDAp
OwotCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBNTVZNX0wyX0NOVEwsIFBERV9GQVVMVF9DTEFT
U0lGSUNBVElPTiwgMSk7CisJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fTDJfQ05UTCwg
UERFX0ZBVUxUX0NMQVNTSUZJQ0FUSU9OLCAwKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
TU1WTV9MMl9DTlRMLCBDT05URVhUMV9JREVOVElUWV9BQ0NFU1NfTU9ERSwgMSk7CiAJdG1wID0g
UkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fTDJfQ05UTCwgSURFTlRJVFlfTU9ERV9GUkFHTUVOVF9T
SVpFLCAwKTsKIAlXUkVHMzJfU09DMTUoTU1IVUIsIDAsIG1tTU1WTV9MMl9DTlRMLCB0bXApOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
