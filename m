Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633A753BB
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA16E785;
	Thu, 25 Jul 2019 16:19:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE206E785
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzzMpoNcOpQpzQOjDrj0zP4VZmN4+hN2yz+YKo4MD/7gOKBh+JwWQAJYjml8sy9ebEcFgNLgb5+YnmB0kBzhTG4Vp1g2EW6pbOjMrbh8tRoJi70GtLHS5+AJuNeDRQ4wNrSxx3z1aL9prdij2yDxvn7+IVL9M+h+a5d5kFlmYzqwEGC3cqe+mDvBvqmh82zPp+sFdLYkrXq8dw7NUPuI/0pH7U5M6Y8Qo4L0J7Ra8E5qks5gLKBFYmzyyB8GZLLp2RLVh8nS6MKSoBIcaIbhM9W9uNuGCzH25dLyO8SoAV+gqkMLBuHaGrIaqDXRsYhBeE1hMANedNuNu2HTIB/EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LITm38QK2X7QOlAPNT9WSu20HfxkhhB29aKwYFqNXIs=;
 b=F/LEddv+z4GcbE/obAiPFtOQh1aAEa1YNdRp5xnecw203gTOKymUGRKtPLLYMOUAoWiSWhhgiNmt5mlXWtZaUROYyaM6BoJC2P6sReNHArIFwXR//nDoITgAWAGbFoHWt0D4cmjnSucpskfFFD/xHvAVHXqZ0js2jS3yC/bKG1WvYTg+cvdLGswnny6wE/Bg7TRMu/1jICCYb/L7E0EWPwXmsMA8CaHKnI0l74AZMZ9uDNk55saAWdHa/5dxXzuIzn3mjmnLVOANAfKI66L3YCAJ9hYQc+rBmZwA7bt3p0/b2fH3k/spxtpEeWI4L1Z6jU4fFctS90a+Wc8oTQzPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0068.namprd12.prod.outlook.com (10.174.113.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 16:19:55 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 16:19:55 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD commands
Thread-Topic: [PATCH v2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Index: AQHVQwTLMYtoiSDuqEGXDAqUIuqrqQ==
Date: Thu, 25 Jul 2019 16:19:55 +0000
Message-ID: <20190725161943.4178-1-thong.thai@amd.com>
References: <20190725155204.5739-2-thong.thai@amd.com>
In-Reply-To: <20190725155204.5739-2-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To BN6PR1201MB0178.namprd12.prod.outlook.com
 (2603:10b6:405:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b806100-6649-4f48-0a63-08d7111bee22
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0068; 
x-ms-traffictypediagnostic: BN6PR1201MB0068:
x-microsoft-antispam-prvs: <BN6PR1201MB0068FE412971D2D261BE3F169DC10@BN6PR1201MB0068.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(189003)(199004)(66476007)(66556008)(11346002)(64756008)(6512007)(68736007)(476003)(305945005)(2351001)(446003)(66446008)(66946007)(7736002)(2616005)(99286004)(8676002)(52116002)(256004)(2906002)(6506007)(102836004)(186003)(478600001)(26005)(71190400001)(71200400001)(386003)(86362001)(1076003)(6916009)(4326008)(6436002)(76176011)(2501003)(5640700003)(36756003)(486006)(66066001)(316002)(25786009)(6116002)(3846002)(81166006)(50226002)(53936002)(8936002)(6486002)(14454004)(81156014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0068;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y8fEnK67c4zXUvcRyfYmFHwQ4cgnK4DI80RwzCHFJMCqZGE1pPrMnYRaj651WAOpqfzCw9BNFkUiuH6/M77+7tLiKt8J1AC2YjXb39+2LbX3y64hlY2/4TafMb1+G+6glmYievG8swLOY5TudXy7N4HxzFioW/hMBf+HNdirPulG415h++r157qaCllVD+i5BDqLW/af6VjRxblc/l+sgXlCAmyvmkMipuahkU5De8yDOGfL/gBjS0obySgXkefqDgx9z3Cq/FrAGlcdSClQ6unamM9kcHQVRBMyqjBuajuwa5yd6iDNOC3O/b2XLcBs6i8+LRbl4TXIqXmoYjMHL/EIIxKvhdIqBeqWvxMjgzw4FqmZPMJfm2Y0woUa+gElGm76NTUAw8ewal0XEOpoJa+s+3J0kG5no9IAbR0zepk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b806100-6649-4f48-0a63-08d7111bee22
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 16:19:55.5281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0068
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LITm38QK2X7QOlAPNT9WSu20HfxkhhB29aKwYFqNXIs=;
 b=AOE30MHtsQxP3/I3pfdxy3VwekHmgN/C8X/Bs2Y9xLmHNIbKB3ZWAeoFauAlhIaSr7Zv+3NuupSxoAjZ2InaUVpTHdI70UNae9rLd+4O/EY5WRfor1R0IDfVfOou3BJ/AMsCSrFFwiZfHrjoEd3QH9CmlmorZB1DPDRlgGQORmY=
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
Cc: "Thai, Thong" <Thong.Thai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0cyB0aGUgQ01EX1NPVVJDRSBiaXQgZm9yIFZDTiAyLjAgRGVjb2RlciBSaW5nIEJ1ZmZlciBj
b21tYW5kcy4gVGhpcwpiaXQgd2FzIHByZXZpb3VzbHkgc2V0IGJ5IHRoZSBSQkMgSFcgb24gb2xk
ZXIgZmlybXdhcmUuIE5ld2VyIGZpcm13YXJlCnVzZXMgYSBTVyBSQkMgYW5kIHRoaXMgYml0IGhh
cyB0byBiZSBzZXQgYnkgdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IFRob25nIFRoYWkgPHRo
b25nLnRoYWlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgfCA0
NCArKysrKysrKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Zjbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
bi5oCmluZGV4IDVlMjQ1M2VlNmIyOS4uNGQzYmY0YWRmMWViIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCkBAIC0zMCw2ICszMCw3IEBACiAjZGVmaW5lIEFNREdQVV9W
Q05fRklSTVdBUkVfT0ZGU0VUCTI1NgogI2RlZmluZSBBTURHUFVfVkNOX01BWF9FTkNfUklOR1MJ
MwogCisjZGVmaW5lIFZDTl9ERUNfS01EX0NNRAkJCTB4ODAwMDAwMDAKICNkZWZpbmUgVkNOX0RF
Q19DTURfRkVOQ0UJCTB4MDAwMDAwMDAKICNkZWZpbmUgVkNOX0RFQ19DTURfVFJBUAkJMHgwMDAw
MDAwMQogI2RlZmluZSBWQ05fREVDX0NNRF9XUklURV9SRUcJCTB4MDAwMDAwMDQKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IGJjOTcyNjc4N2M5Ny4uZGU5MjhmMWIxNTI4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTE0ODgsNyArMTQ4OCw3
IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2luc2VydF9zdGFydChzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcpCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChtbVVWRF9H
UENPTV9WQ1BVX0RBVEEwX0lOVEVSTkFMX09GRlNFVCwgMCkpOwogCWFtZGdwdV9yaW5nX3dyaXRl
KHJpbmcsIDApOwogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01f
VkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7Ci0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywg
VkNOX0RFQ19DTURfUEFDS0VUX1NUQVJUIDw8IDEpOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IFZDTl9ERUNfS01EX0NNRCB8IChWQ05fREVDX0NNRF9QQUNLRVRfU1RBUlQgPDwgMSkpOwogfQog
CiAvKioKQEAgLTE1MDEsNyArMTUwMSw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5n
X2luc2VydF9zdGFydChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiBzdGF0aWMgdm9pZCB2Y25f
djJfMF9kZWNfcmluZ19pbnNlcnRfZW5kKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIHsKIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVS
TkFMX09GRlNFVCwgMCkpOwotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1BB
Q0tFVF9FTkQgPDwgMSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19LTURfQ01E
IHwgKFZDTl9ERUNfQ01EX1BBQ0tFVF9FTkQgPDwgMSkpOwogfQogCiAvKioKQEAgLTE1NDYsNyAr
MTU0Niw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Uoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRkciwgdTY0CiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgdXBwZXJfMzJfYml0cyhhZGRyKSAmIDB4ZmYpOwogCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0NNRF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKLQlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9GRU5DRSA8PCAxKTsKKwlhbWRncHVf
cmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfRkVOQ0UgPDwg
MSkpOwogCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BV
X0RBVEEwX0lOVEVSTkFMX09GRlNFVCwgMCkpOwogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDAp
OwpAQCAtMTU1Niw3ICsxNTU2LDcgQEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfZW1p
dF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2NCBhZGRyLCB1NjQKIAogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxf
T0ZGU0VULCAwKSk7CiAKLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9UUkFQ
IDw8IDEpOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfS01EX0NNRCB8IChWQ05f
REVDX0NNRF9UUkFQIDw8IDEpKTsKIH0KIAogLyoqCkBAIC0xNjAwLDcgKzE2MDAsNyBAQCBzdGF0
aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X3JlZ193YWl0KHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywKIAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01f
VkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7CiAKLQlhbWRncHVfcmluZ193cml0ZShyaW5n
LCBWQ05fREVDX0NNRF9SRUdfUkVBRF9DT05EX1dBSVQgPDwgMSk7CisJYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgVkNOX0RFQ19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX1JFR19SRUFEX0NPTkRfV0FJ
VCA8PCAxKSk7CiB9CiAKIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfdm1fZmx1
c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLApAQCAtMTYyOSw3ICsxNjI5LDcgQEAgc3RhdGlj
IHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF93cmVnKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywKIAogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9D
TURfSU5URVJOQUxfT0ZGU0VULCAwKSk7CiAKLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05f
REVDX0NNRF9XUklURV9SRUcgPDwgMSk7CisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RF
Q19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX1dSSVRFX1JFRyA8PCAxKSk7CiB9CiAKIC8qKgpAQCAt
MjA4Miw2ICsyMDgyLDM2IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfcHJvY2Vzc19pbnRlcnJ1cHQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJcmV0dXJuIDA7CiB9CiAKK2ludCB2Y25fdjJf
MF9kZWNfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQoreworCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gcmluZy0+YWRldjsKKwl1aW50MzJfdCB0bXAgPSAwOwor
CXVuc2lnbmVkIGk7CisJaW50IHI7CisKKwlXUkVHMzIoYWRldi0+dmNuLmV4dGVybmFsLnNjcmF0
Y2g5LCAweENBRkVERUFEKTsKKwlyID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgNCk7CisJaWYg
KHIpCisJCXJldHVybiByOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAoYWRldi0+
dmNuLmludGVybmFsLmNtZCwgMCkpOworCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNf
S01EX0NNRCB8IChWQ05fREVDX0NNRF9QQUNLRVRfU1RBUlQgPDwgMSkpOworCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIFBBQ0tFVDAoYWRldi0+dmNuLmludGVybmFsLnNjcmF0Y2g5LCAwKSk7CisJ
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHhERUFEQkVFRik7CisJYW1kZ3B1X3JpbmdfY29tbWl0
KHJpbmcpOworCWZvciAoaSA9IDA7IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgeworCQl0
bXAgPSBSUkVHMzIoYWRldi0+dmNuLmV4dGVybmFsLnNjcmF0Y2g5KTsKKwkJaWYgKHRtcCA9PSAw
eERFQURCRUVGKQorCQkJYnJlYWs7CisJCURSTV9VREVMQVkoMSk7CisJfQorCisJaWYgKGkgPj0g
YWRldi0+dXNlY190aW1lb3V0KQorCQlyID0gLUVUSU1FRE9VVDsKKworCXJldHVybiByOworfQor
CisKIHN0YXRpYyBpbnQgdmNuX3YyXzBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRs
ZSwKIAkJCQkJICBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBzdGF0ZSkKIHsKQEAgLTIxNDUs
NyArMjE3NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNuX3Yy
XzBfZGVjX3Jpbmdfdm1fZnVuY3MgPSB7CiAJLmVtaXRfaWIgPSB2Y25fdjJfMF9kZWNfcmluZ19l
bWl0X2liLAogCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZSwKIAku
ZW1pdF92bV9mbHVzaCA9IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfdm1fZmx1c2gsCi0JLnRlc3Rf
cmluZyA9IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9yaW5nLAorCS50ZXN0X3JpbmcgPSB2Y25f
djJfMF9kZWNfcmluZ190ZXN0X3JpbmcsCiAJLnRlc3RfaWIgPSBhbWRncHVfdmNuX2RlY19yaW5n
X3Rlc3RfaWIsCiAJLmluc2VydF9ub3AgPSB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfbm9wLAog
CS5pbnNlcnRfc3RhcnQgPSB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQsCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
