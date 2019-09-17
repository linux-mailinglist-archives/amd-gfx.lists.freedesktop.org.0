Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84AB45CF
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 05:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AB36EAD8;
	Tue, 17 Sep 2019 03:06:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325546EAD8
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 03:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDS6E4O/1s+2QlIX4XOGn5shGNFXAYTR6Jfj9fcYMFRNBZd/E60NcDrV8nTccO02Hekt6wphEmJTC6G4hSyFJq0KPEQ3Wo/+mKBXxnFm+H/8AF6Iig1KaejIH5kjJ+fcaFrVdxkfUbeF1jmqeM1GT71m4//OfPmDRGumLCb7SUP0HHPOplEREe7/95BL2YVYOFvuJFHjub5LaBmZIiw2+xX1BVLNJDrrrA+rYTv4T2QV9CJ1w2yA4C6kyIREWiQXuh+5eyzlMQBv1MhvDy83jqJXZ03zp3/zhttNwvuWEK+0gZUm+Jv4fzNTOdACS6DqzU0hw02s6p85wOpAKhGGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD//3j5kNXiCv4yS8DiB1MCpMs1ZV8G00eFZbtZ5HsY=;
 b=mTwkwRfMh/eXOMk6fTDl4Klm+JP51QCyVatSEmAl6ZhZPi0lNwVoBq3yQDceIZU7neCUVkVXOs/U2N/Kwtm2Dus16EYAXdvBGK+d+QcPjwy8d/NH5rDzeAj9JWWJbc5w4PtjonX8FkclTm2NbKlAYuw+BQPwhAkqqw3mKmpMnIIWqt4V3OHuVQTyW3v7UYz4XtGpneacwy0+rekbnqvHjRvg7a/WFbrOZm7kdmdUYf8SFG8F0EkW1BKA9Q1+WAPtXQTYNfg3LdZods9NMcybBhznCh8uYIbwJmecvBY+0OIDhDUyw8oqBIyYmPd1TervJrJKH8YglJkkD94uzgxEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3551.namprd12.prod.outlook.com (20.179.83.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Tue, 17 Sep 2019 03:06:15 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 03:06:15 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: implement VCN power gating control
 interface
Thread-Topic: [PATCH] drm/amd/powerplay: implement VCN power gating control
 interface
Thread-Index: AQHVbQMsQbXuyZm8QEWEg8BfaqYjsKcvL6JQ
Date: Tue, 17 Sep 2019 03:06:14 +0000
Message-ID: <MN2PR12MB33440426B959E159DBB0161AE48F0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1568688837-21350-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1568688837-21350-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 154eaba6-148e-4b93-b756-08d73b1c00a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3551; 
x-ms-traffictypediagnostic: MN2PR12MB3551:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35519A21A6480CCC0680DB91E48F0@MN2PR12MB3551.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(189003)(199004)(13464003)(476003)(6436002)(26005)(229853002)(76176011)(14444005)(256004)(53546011)(86362001)(55016002)(7696005)(102836004)(99286004)(66066001)(3846002)(6506007)(74316002)(316002)(7736002)(6116002)(110136005)(52536014)(2906002)(54906003)(5660300002)(66556008)(8936002)(71190400001)(81156014)(66476007)(66946007)(71200400001)(66446008)(8676002)(478600001)(64756008)(2501003)(14454004)(81166006)(186003)(11346002)(486006)(76116006)(9686003)(25786009)(446003)(4326008)(6246003)(33656002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3551;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WPI20QMMGnz/UW/No2uYjNvbffg81sxVt9qIsyY3SOErSAWSTaKETDa6iVkY80RndyS4uE3LDhB97E1OrC/J5Btf5BQyOJO4wEL32Up+BNEC99xAmgRZOi6eR+oqWy/YQuqNadKEMrOM1sch4iIWfZ/laKaKGaD/pj551NBAtfkwtTWeBLN+9i3hcd8eTdcP3TujEKNHS4t5nKAL91a9RDr+TGVerHmAOq6z1gchBpK/YAynS+b9yu12UNXFKCujhpFFutkQDQll9MqY/1O1PNEc2DW9jk/gkf64/cC6eVxx1zU4KrQnxWlaIo1ZyljbHS/N0pQK2mCxt/d3gouGaWjLl0NqeCJgb9h8xbUJlfsEw3E715CVI/Y0CiIRffrko/dqT/9vtRK+Va3Qhckx0NwvLP0TMHnowdUaP0R6F4Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154eaba6-148e-4b93-b756-08d73b1c00a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 03:06:15.0875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eocSKFlWbl8WPXAcDfdKWX4QxmE72ER0CXyeX296gU++U6owA9CGawypdrXP1RRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD//3j5kNXiCv4yS8DiB1MCpMs1ZV8G00eFZbtZ5HsY=;
 b=mzOyB7onWMwx6FTHHBvXBDlOdRQm8swgoZ80KNfALz8UV1sxNvt3/qXiN8tdBCqkPdN3CXmOW+qbQOk6ABy6bwGgCJ4egqbHJZvPHadI95fKZbsMwUcWlux8v+XG4DIfPDs020LtwKvcUJtfvIj1S1vkWeYZQ/OOnsbMkX7mA5s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CgotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQpGcm9tOiBMaWFuZywgUHJpa2UgPFByaWtlLkxpYW5nQGFtZC5jb20+IApT
ZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMTkgMTA6NTQgQU0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEZl
bmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5n
QGFtZC5jb20+OyBMaXUsIEFhcm9uIDxBYXJvbi5MaXVAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8
UHJpa2UuTGlhbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTog
aW1wbGVtZW50IFZDTiBwb3dlciBnYXRpbmcgY29udHJvbCBpbnRlcmZhY2UKClZDTiBHYXQvVW5n
YXQgYnkgcHJvY2Vzc2luZyB0aGUgU01VIHBvd2VyIHVwL2Rvd24gbWVzc2FnZSwgb3RoZXJ3aXNl
ClMzIHdpbGwgcmVzdW1lIGZhaWxlZCBhcyBKUEVHIGFsd2F5cyBwb3dlciBvZmYgZHVyaW5nIHN0
YXJ0IFZDTiBzdGFnZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8
IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
cmVub2lyX3BwdC5jCmluZGV4IDJjMjJiYTQuLjkzMTFiNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKQEAgLTI3OCw2ICsyNzgsMzIgQEAgc3RhdGljIGVu
dW0gYW1kX3BtX3N0YXRlX3R5cGUgcmVub2lyX2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlKHN0cnVj
dCBzbXVfY29udGV4dAogCXJldHVybiBwbV90eXBlOwogfQogCitzdGF0aWMgaW50IHJlbm9pcl9k
cG1fc2V0X3V2ZF9lbmFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQor
eworCXN0cnVjdCBzbXVfcG93ZXJfY29udGV4dCAqc211X3Bvd2VyID0gJnNtdS0+c211X3Bvd2Vy
OworCXN0cnVjdCBzbXVfcG93ZXJfZ2F0ZSAqcG93ZXJfZ2F0ZSA9ICZzbXVfcG93ZXItPnBvd2Vy
X2dhdGU7CisJaW50IHJldCA9IDA7CisKKwlpZiAoZW5hYmxlKSB7CisJCS8qIHZjbiBkcG0gb24g
aXMgYSBwcmVyZXF1aXNpdGUgZm9yIHZjbiBwb3dlciBnYXRlIG1lc3NhZ2VzICovCisJCWlmIChz
bXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfVkNOX1BHX0JJVCkpIHsKKwkJ
CXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfUG93ZXJVcFZj
biwgMSk7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiByZXQ7CisJCX0KKwkJcG93ZXJfZ2F0ZS0+
dmNuX2dhdGVkID0gZmFsc2U7CisJfSBlbHNlIHsKKwkJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJs
ZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklUKSkgeworCQkJcmV0ID0gc211X3NlbmRfc21j
X21zZyhzbXUsIFNNVV9NU0dfUG93ZXJEb3duVmNuKTsKKwkJCWlmIChyZXQpCisJCQkJcmV0dXJu
IHJldDsKKwkJfQorCQlwb3dlcl9nYXRlLT52Y25fZ2F0ZWQgPSB0cnVlOworCX0KKworCXJldHVy
biByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5vaXJfcHB0
X2Z1bmNzID0gewogCS5nZXRfc211X21zZ19pbmRleCA9IHJlbm9pcl9nZXRfc211X21zZ19pbmRl
eCwKIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9IHJlbm9pcl9nZXRfc211X3RhYmxlX2luZGV4LApA
QCAtMjg2LDcgKzMxMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5v
aXJfcHB0X2Z1bmNzID0gewogCS5nZXRfZHBtX3VjbGtfbGltaXRlZCA9IHJlbm9pcl9nZXRfZHBt
X3VjbGtfbGltaXRlZCwKIAkucHJpbnRfY2xrX2xldmVscyA9IHJlbm9pcl9wcmludF9jbGtfbGV2
ZWxzLAogCS5nZXRfY3VycmVudF9wb3dlcl9zdGF0ZSA9IHJlbm9pcl9nZXRfY3VycmVudF9wb3dl
cl9zdGF0ZSwKLQorCS5kcG1fc2V0X3V2ZF9lbmFibGUgPSByZW5vaXJfZHBtX3NldF91dmRfZW5h
YmxlLAogfTsKIAogdm9pZCByZW5vaXJfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
