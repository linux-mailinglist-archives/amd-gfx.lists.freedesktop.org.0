Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42D69CF6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 22:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8254589B4D;
	Mon, 15 Jul 2019 20:43:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F219289B4D
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 20:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmZ94EFbM/gCqBkX+jVxO2kLUa5n0oKPVb5x1b68+JcnNyGMiH6FxMCQvPeUtOxquAh4zq4hzqm5LhrlqmjX31/liPXiUmQUfvUnyaQRPt/+DGw/xYTwk2FjZYCyPn7yBp9SL5UugZDdBdgY71tU9HwpTv0AAn3u0sS1LTuUKDmyKHw11SyO2SAHXqEZAaj49cDs6qC3/7U/5Ak3WBCPvZTJM1T6BfslHOtprNOcfr+9EM1UHfsJmIbzvZM0ydCwR7Zp4xG1yT6/bL/rb+Ng94FCHq7GUlVJobNPNYxpdMYJnAG7d+YiE13KkrXUr23C1mcNOuuD84yPxRdmrbMFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aKJGaCulRfBlEHkEz20e7Lj8mybVqdwL4v78Pt/6YA=;
 b=h1popsPfv6WJKGJAbGEy90Cf1sS9eY5yMtFyOj2DnlOJ/amRJfzBuSFg6Xm8mOARCneqpjGSmXk9DIbEE8xIDeRrdQfeDIS1y6uLH5F7eijm6ATR7xPkOBjnm/wdATFH0Fel8UgizEBL15sF9/NomGQTwMAfH+lNUoldgi7VJCUNVRrLFe2eJeKlcSmxaonrZnaBFmLzabjIeq06GB+ZWbYalRoRVua361AmC9VAXaBbXXIP0UR7Y+rnDi902nNQvhk8lJDRZGWv+x4DCf1hQ0Wuc5jOCq9065o9cfXpjZtp1nItAmk/df09BhzCrjh0ndtrWeUlw7KzvWLY3GLlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2922.namprd12.prod.outlook.com (20.179.104.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 20:43:35 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 20:43:35 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Optimize KFD page table reservation
Thread-Topic: [PATCH 1/1] drm/amdgpu: Optimize KFD page table reservation
Thread-Index: AQHVO034JnmEdtL4iUmHUqsujiOtcw==
Date: Mon, 15 Jul 2019 20:43:35 +0000
Message-ID: <20190715204323.10681-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec72ec83-fb94-431b-e5c0-08d709651b3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2922; 
x-ms-traffictypediagnostic: DM6PR12MB2922:
x-microsoft-antispam-prvs: <DM6PR12MB2922D06DD4728B3FA4B48C1092CF0@DM6PR12MB2922.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(199004)(189003)(26005)(102836004)(186003)(25786009)(99286004)(52116002)(53936002)(305945005)(6506007)(6116002)(3846002)(476003)(2616005)(486006)(14444005)(6512007)(8676002)(256004)(6916009)(71190400001)(386003)(7736002)(81156014)(5660300002)(66066001)(66946007)(478600001)(66476007)(81166006)(66556008)(71200400001)(64756008)(66446008)(2906002)(1076003)(14454004)(2351001)(2501003)(5640700003)(6486002)(68736007)(36756003)(50226002)(316002)(8936002)(86362001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2922;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: goLRDOs7iiZTjskq/X2jxpX7JeaMdKkHgz7Y6RZFxoqPjBHW6EcwY6FGmpHXxw2S8FVBgL445aK8a8EzHo3wr8MaAGAH5I5VSy6GbsFGXtFQq5whw/nrydE+qZ/rn10l19+eTuCSCaaN2lFYlfhwQBmdNS8nflj796rdlb5B17iM9QfardEB0TcTP+E3RgwoCQBSY78OaQdRzHrzIGVSu4EdUZJNyCRQ9OM2dlYrAr968D2f9NQFMBana1AKibfXb8Jt9Z2bquH0FqVW5NxddTJce+Aou7wZ7XldQJy4tWiB4Og5ZAiYI59SrkRMtsWgpdHMyhyVuHOZnMSgi9chfayL2dLba/H13BhI46EKpfvtoP4oQZUFE/nXWJP7moRkH7R9RhH1+9JRgQzNzfkjku5Rm6dnqxrG4ZKJW2Mls78=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec72ec83-fb94-431b-e5c0-08d709651b3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 20:43:35.1950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aKJGaCulRfBlEHkEz20e7Lj8mybVqdwL4v78Pt/6YA=;
 b=DDX+PrmEqAnNMI+xlhY898GwJX5eeI7W5OQg0eEkpWnXPMrrAbW/wuhxkegSFlhN68JnU0jQnwE5dcK/KlchTDZFX8aLoQullH4ItZnVX+bdPVUK36ki4Z6D7PRDiPjeHTd+68OsFEWxbBzApHe/BoUzGkGaRcyJDKb+aqzpdGE=
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

QmUgbGVzcyBwZXNzaW1pc3RpYyBhYm91dCBlc3RpbWF0ZWQgcGFnZSB0YWJsZSB1c2UgZm9yIEtG
RC4gTW9zdAphbGxvY2F0aW9ucyB1c2UgMk1CIHBhZ2VzIGFuZCB0aGVyZWZvcmUgbmVlZCBsZXNz
IFZSQU0gZm9yIHBhZ2UKdGFibGVzLiBUaGlzIGFsbG93cyBtb3JlIFZSQU0gdG8gYmUgdXNlZCBm
b3IgYXBwbGljYXRpb25zIGVzcGVjaWFsbHkKb24gbGFyZ2Ugc3lzdGVtcyB3aXRoIG1hbnkgR1BV
cyBhbmQgaHVuZHJlZHMgb2YgR0Igb2Ygc3lzdGVtIG1lbW9yeS4KCkV4YW1wbGU6IDggR1BVcyB3
aXRoIDMyR0IgVlJBTSBlYWNoICsgMjU2R0Igc3lzdGVtIG1lbW9yeSA9IDUxMkdCCk9sZCBwYWdl
IHRhYmxlIHJlc2VydmF0aW9uIHBlciBHUFU6ICAxR0IKTmV3IHBhZ2UgdGFibGUgcmVzZXJ2YXRp
b24gcGVyIEdQVTogMzJNQgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZF9ncHV2bS5jIHwgMTUgKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCAyZGI2ZTQ5OGMwNjkuLmRiZmEzZjMwOGUw
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYwpAQCAtMTEyLDExICsxMTIsMjQgQEAgdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX2luaXRf
bWVtX2xpbWl0cyh2b2lkKQogCQkoa2ZkX21lbV9saW1pdC5tYXhfdHRtX21lbV9saW1pdCA+PiAy
MCkpOwogfQogCisvKiBFc3RpbWF0ZSBwYWdlIHRhYmxlIHNpemUgbmVlZGVkIHRvIHJlcHJlc2Vu
dCBhIGdpdmVuIG1lbW9yeSBzaXplCisgKgorICogV2l0aCA0S0IgcGFnZXMsIHdlIG5lZWQgb25l
IDggYnl0ZSBQVEUgZm9yIGVhY2ggNEtCIG9mIG1lbW9yeQorICogKGZhY3RvciA1MTIsID4+IDkp
LiBXaXRoIDJNQiBwYWdlcywgd2UgbmVlZCBvbmUgOCBieXRlIFBURSBmb3IgMk1CCisgKiBvZiBt
ZW1vcnkgKGZhY3RvciAyNTZLLCA+PiAxOCkuIFJPQ20gdXNlciBtb2RlIHRyaWVzIHRvIG9wdGlt
aXplCisgKiBmb3IgMk1CIHBhZ2VzIGZvciBUTEIgZWZmaWNpZW5jeS4gSG93ZXZlciwgc21hbGwg
YWxsb2NhdGlvbnMgYW5kCisgKiBmcmFnbWVudGVkIHN5c3RlbSBtZW1vcnkgc3RpbGwgbmVlZCBz
b21lIDRLQiBwYWdlcy4gV2UgY2hvb3NlIGEKKyAqIGNvbXByb21pc2UgdGhhdCBzaG91bGQgd29y
ayBpbiBtb3N0IGNhc2VzIHdpdGhvdXQgcmVzZXJ2aW5nIHRvbworICogbXVjaCBtZW1vcnkgZm9y
IHBhZ2UgdGFibGVzIHVubmVjZXNzYXJpbHkgKGZhY3RvciAxNkssID4+IDE0KS4KKyAqLworI2Rl
ZmluZSBFU1RJTUFURV9QVF9TSVpFKG1lbV9zaXplKSAoKG1lbV9zaXplKSA+PiAxNCkKKwogc3Rh
dGljIGludCBhbWRncHVfYW1ka2ZkX3Jlc2VydmVfbWVtX2xpbWl0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogCQl1aW50NjRfdCBzaXplLCB1MzIgZG9tYWluLCBib29sIHNnKQogeworCXVp
bnQ2NF90IHJlc2VydmVkX2Zvcl9wdCA9CisJCUVTVElNQVRFX1BUX1NJWkUoYW1kZ3B1X2FtZGtm
ZF90b3RhbF9tZW1fc2l6ZSk7CiAJc2l6ZV90IGFjY19zaXplLCBzeXN0ZW1fbWVtX25lZWRlZCwg
dHRtX21lbV9uZWVkZWQsIHZyYW1fbmVlZGVkOwotCXVpbnQ2NF90IHJlc2VydmVkX2Zvcl9wdCA9
IGFtZGdwdV9hbWRrZmRfdG90YWxfbWVtX3NpemUgPj4gOTsKIAlpbnQgcmV0ID0gMDsKIAogCWFj
Y19zaXplID0gdHRtX2JvX2RtYV9hY2Nfc2l6ZSgmYWRldi0+bW1hbi5iZGV2LCBzaXplLAotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
