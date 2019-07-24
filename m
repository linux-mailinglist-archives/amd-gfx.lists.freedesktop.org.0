Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863D73A7F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 21:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36E16E645;
	Wed, 24 Jul 2019 19:50:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523BD6E645
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 19:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRT2YBJPSaBCNQTOau9nSRXEB3wiI3lPbosMZmFqLDDpMinhVsI5noSpCGgGTzyfhPKJ8M3GiiAUkbkFwj7I7OvohBUx8d8CfhNFJ5uk9VH8enI53HK2gj4WAoMoZ6poA1uBgzbM3fNAY8biaBOBQJjI7EsvX+DaOQaqGRSqlQZZz2KcIr0JtELXZcMRR6qxeODTbJoexMSquY8Z8TPoVA12367lDJSyA4z8uNS2kciE6EZqAY6s89Swzu7QxxE7uQQlQ1cpkCld+RQ+asOB1gj6Fi23YgotaIx9yRAYMxDNIuRvZHoOUGKpLFCpetfvXvHyJuYUp+W5kH7/EOC9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOKNENy5iilZGBfCqlT0xO8x+MXV6mgiwdhiOBoG6Eg=;
 b=Z5x3MWxfMQcLik+Lq4wQpyk+FfPeoh/X1nfOJ0OoLtJ3k9ITsmBh58PqcNPFHMDRgYq7Vh2wGdZfWabPgoyH406Kb1V9h0fo2hC/einGhx9m0+lewxWyTJsfwvtHlvvC+lP0xHd44I4CoPn3nt9C0zS6GOBmGP7zYeWmmef+L68gMVyqGK90a/Nj+wiWzlGM+Cwc57B4YsIAcan7/Y8pPvuacRpVITPoNyxL9vre11h7+2Re/qPWoi0AZKvF0Vhw+Omg+wLuPfOgYmQxF9+YMPkHZDrdhB/tbeHmklh5ilEHmVsajqWcZTyDjPKPJnfJBuJY70v6mpiiPZQ40AGOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB2464.namprd12.prod.outlook.com (10.172.109.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 19:50:47 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 19:50:47 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands
Thread-Topic: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands
Thread-Index: AdVCWRU+AoREmKtSQRm81C0QNw55IA==
Date: Wed, 24 Jul 2019 19:50:47 +0000
Message-ID: <BN6PR1201MB0178175C942E341FCEB0D07B9DC60@BN6PR1201MB0178.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7e3c871-781b-4419-448e-08d710703920
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB2464; 
x-ms-traffictypediagnostic: BN6PR1201MB2464:
x-microsoft-antispam-prvs: <BN6PR1201MB24647DB7F08F38635D148D789DC60@BN6PR1201MB2464.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(189003)(199004)(102836004)(71200400001)(476003)(76116006)(74316002)(66946007)(33656002)(186003)(66066001)(25786009)(316002)(66476007)(66556008)(2351001)(256004)(14444005)(71190400001)(66446008)(6916009)(8676002)(478600001)(64756008)(6506007)(6436002)(486006)(52536014)(2501003)(5660300002)(305945005)(7736002)(14454004)(7696005)(81166006)(9686003)(86362001)(3846002)(55016002)(81156014)(6116002)(8936002)(99286004)(5640700003)(53936002)(26005)(68736007)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2464;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p08NSu/OqYH9zTz3/v5ndLrsVQ/fwZkg4pxdT4ruHaey3wlyR+pW41HAyor7xQMeh/c1Alxs0C2fQY/ZQw1NkKeaVHWzLphVk9yzmcgSzDgwVKUWaMtSbJ3m27tbYx1vCghsbYeaCZxV7B49cVaMDF8MQZ4SpUkSL7qF/6EFG2UAxuoR1tD/52syA9SgrF13cGcZJLaGwfWK7a3ZqdUtwlJjSbdsw3dk8EH4Tq1G5Ukk94BCxcRB6cSC0/oYfU/SUQRc+dTF7Lh9vYf7OcyKZcBoKPi8/ZPBd7hyIrU8ASnIJ9muHWUFlaN7Vwzct4N+Igc0ftVTufGLJHEoVVZtuCblxvDW9kogjd+LxBwPgXIesJ9BciSIS0w58PX0gegt+V3/PMZ+OrBzCeecxIVVfrBObvXJU8fBw0z2RZ1yrX0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e3c871-781b-4419-448e-08d710703920
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 19:50:47.5512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2464
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOKNENy5iilZGBfCqlT0xO8x+MXV6mgiwdhiOBoG6Eg=;
 b=uZjZfD2ia4QG3xaPNhOiTtSk7azpRhTmm0h3rLtydK6eSCvwAve38PqCEUxm8vkqevPsHY98t/INmc9ivr0ORKwQBoL2zxYIU/MVVHJKA8T8oy/+CnLVKzYfepRDkW9ETbQ/UhXhyLE47dCOrrWFVPoB5dwv9PrYZ+4t4EbVck4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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

U2V0cyB0aGUgQ01EX1NPVVJDRSBiaXQgZm9yIFZDTiAyLjAgZGVjb2RlciByaW5nLWJ1ZmZlciBj
b21tYW5kcy4gVGhpcyBiaXQgd2FzIHByZXZpb3VzbHkgc2V0IGJ5IHRoZSBSQkMgSFcgb24gb2xk
ZXIgdmVyc2lvbnMgb2YgdGhlIGZpcm13YXJlLCBhbmQgbm93IG5lZWRzIHRvIGJlIHNldCBieSB0
aGUgZHJpdmVyIGluIG9yZGVyIHRvIHdvcmsgd2l0aCB0aGUgU1cgUkJDIGZvdW5kIGluIG5ld2Vy
IHZlcnNpb25zIG9mIHRoZSBmaXJtd2FyZS4KClNpZ25lZC1vZmYtYnk6IFRob25nIFRoYWkgPHRo
b25nLnRoYWlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYwppbmRleCBiYzk3MjY3ODdjOTcuLjhkYWVlMjM0MjVmOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0xNDg4LDcgKzE0ODgsNyBAQCBzdGF0aWMgdm9pZCB2
Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQog
CWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9EQVRBMF9J
TlRFUk5BTF9PRkZTRVQsIDApKTsKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsKIAlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFM
X09GRlNFVCwgMCkpOwotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1BBQ0tF
VF9TVEFSVCA8PCAxKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDgwMDAwMDAwIHwgKFZD
Tl9ERUNfQ01EX1BBQ0tFVF9TVEFSVCA8PCAxKSk7CiB9CiAKIC8qKgpAQCAtMTUwMSw3ICsxNTAx
LDcgQEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X3N0YXJ0KHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZykKIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9l
bmQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogewogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7Ci0JYW1k
Z3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURfUEFDS0VUX0VORCA8PCAxKTsKKwlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCAweDgwMDAwMDAwIHwgKFZDTl9ERUNfQ01EX1BBQ0tFVF9FTkQg
PDwgMSkpOwogfQogCiAvKioKQEAgLTE1NDYsNyArMTU0Niw3IEBAIHN0YXRpYyB2b2lkIHZjbl92
Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRk
ciwgdTY0CiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgdXBwZXJfMzJfYml0cyhhZGRyKSAmIDB4
ZmYpOwogCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BV
X0NNRF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05f
REVDX0NNRF9GRU5DRSA8PCAxKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDgwMDAwMDAw
IHwgKFZDTl9ERUNfQ01EX0ZFTkNFIDw8IDEpKTsKIAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9EQVRBMF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsKQEAgLTE1NTYsNyArMTU1Niw3IEBAIHN0YXRpYyB2
b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1NjQgYWRkciwgdTY0CiAKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZE
X0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwogCi0JYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgVkNOX0RFQ19DTURfVFJBUCA8PCAxKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5n
LCAweDgwMDAwMDAwIHwgKFZDTl9ERUNfQ01EX1RSQVAgPDwgMSkpOwogfQogCiAvKioKQEAgLTE2
MDAsNyArMTYwMCw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfcmVnX3dh
aXQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywg
UEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0NNRF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKIAotCWFt
ZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1JFR19SRUFEX0NPTkRfV0FJVCA8PCAx
KTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDgwMDAwMDAwIHwgKFZDTl9ERUNfQ01EX1JF
R19SRUFEX0NPTkRfV0FJVCA8PCAxKSk7CiB9CiAKIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19y
aW5nX2VtaXRfdm1fZmx1c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLApAQCAtMTYyOSw3ICsx
NjI5LDcgQEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF93cmVnKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywKIAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1V
VkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7CiAKLQlhbWRncHVfcmluZ193
cml0ZShyaW5nLCBWQ05fREVDX0NNRF9XUklURV9SRUcgPDwgMSk7CisJYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgMHg4MDAwMDAwMCB8IChWQ05fREVDX0NNRF9XUklURV9SRUcgPDwgMSkpOwogfQog
CiAvKioKQEAgLTIwODIsNiArMjA4MiwzNiBAQCBzdGF0aWMgaW50IHZjbl92Ml8wX3Byb2Nlc3Nf
aW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXJldHVybiAwOwogfQogCitp
bnQgdmNuX3YyXzBfZGVjX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykK
K3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CisJdWludDMyX3Qg
dG1wID0gMDsKKwl1bnNpZ25lZCBpOworCWludCByOworCisJV1JFRzMyKGFkZXYtPnZjbi5leHRl
cm5hbC5zY3JhdGNoOSwgMHhDQUZFREVBRCk7CisJciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcs
IDMpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNL
RVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5jbWQsIDApKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5n
LCAweDgwMDAwMDAwIHwgKFZDTl9ERUNfQ01EX1BBQ0tFVF9TVEFSVCA8PCAxKSk7CisJYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChhZGV2LT52Y24uaW50ZXJuYWwuc2NyYXRjaDksIDAp
KTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweERFQURCRUVGKTsKKwlhbWRncHVfcmluZ19j
b21taXQocmluZyk7CisJZm9yIChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7
CisJCXRtcCA9IFJSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDkpOworCQlpZiAodG1w
ID09IDB4REVBREJFRUYpCisJCQlicmVhazsKKwkJRFJNX1VERUxBWSgxKTsKKwl9CisKKwlpZiAo
aSA+PSBhZGV2LT51c2VjX3RpbWVvdXQpCisJCXIgPSAtRVRJTUVET1VUOworCisJcmV0dXJuIHI7
Cit9CisKKwogc3RhdGljIGludCB2Y25fdjJfMF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUodm9pZCAq
aGFuZGxlLAogCQkJCQkgIGVudW0gYW1kX3Bvd2VyZ2F0aW5nX3N0YXRlIHN0YXRlKQogewpAQCAt
MjE0NSw3ICsyMTc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB2
Y25fdjJfMF9kZWNfcmluZ192bV9mdW5jcyA9IHsKIAkuZW1pdF9pYiA9IHZjbl92Ml8wX2RlY19y
aW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNl
LAogCS5lbWl0X3ZtX2ZsdXNoID0gdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF92bV9mbHVzaCwKLQku
dGVzdF9yaW5nID0gYW1kZ3B1X3Zjbl9kZWNfcmluZ190ZXN0X3JpbmcsCisJLnRlc3RfcmluZyA9
IHZjbl92Ml8wX2RlY19yaW5nX3Rlc3RfcmluZywKIAkudGVzdF9pYiA9IGFtZGdwdV92Y25fZGVj
X3JpbmdfdGVzdF9pYiwKIAkuaW5zZXJ0X25vcCA9IHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9u
b3AsCiAJLmluc2VydF9zdGFydCA9IHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9zdGFydCwKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
