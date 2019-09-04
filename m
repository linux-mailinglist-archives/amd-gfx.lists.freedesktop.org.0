Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A294A8629
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8895389BF1;
	Wed,  4 Sep 2019 15:48:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA5C89BF1
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzpOWqbIXsN3l5BqJrbSXJzBsHGkLeP2u4j+blEyvgBKLsy+GD4guOPK1AvEujdTWYefSZPc9lWmVyQLiHpCiWvJQQQzBXohYk0+/+cO4bgpqBmFYUdMu39bV107J2sh4yXIdv/a/U9rkRADtPe7u6nlhEC84Vuu24Sdt5brAFurSTqUH9Ku++TJ7s9HF/4hv7g//+m7G0ZG2mUGaEBIA2C78VVMIOnZqVnweV5n2EFzU9+txKC4K8jk2O4Cyr06jgbExWb76paP11+1s5qgFqqWTXEwiQISQIp3Ad4WV81Euwt2gSZhcWb3oeGhmPEvrt3ubQj+2hM5KaZvGwONjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CepI1WIJya25led72opNJc6WkaBh/FzmK+w75Fw6PIs=;
 b=CSwqdQqo7oAf7HMUY5LtJtg5w+YReFHlK5SjPY3cNELgTi/yUBUWATRECFnygjT5iGoA2deRpBFtdwJY+ufqLTXV0BiTxPctQu73FiXLF5bmky0VZqzKvb3iw3m5SxdglZOTn3scVmKvkqVbCuyHrr1bPary6LkoUAh1+vlUlz0V/rjSb/y3LQf6rvOeq3tfQZQdf9kbKA7znB+xcoleJnVV0qM/fC3OQku1irZInW++KTnbcLyG89m4Ms4G5OdXcMOOEjx6G0IIRWYN/rB/jHu1Gn19MlG2QG517pQfvJC7I9b/yq+jsy6aefHuw2YMoPW87xlpdZGVAZ8Nu4IlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:28 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:28 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/amdkfd: add renoir typs for the workaround of iommu
 v2
Thread-Topic: [PATCH 04/10] drm/amdkfd: add renoir typs for the workaround of
 iommu v2
Thread-Index: AQHVYzgxVWbgRhV8YU27Iv5b6gwrNA==
Date: Wed, 4 Sep 2019 15:48:28 +0000
Message-ID: <20190904154803.5102-5-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b45e809f-d3e4-4581-97d9-08d7314f542e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB286310690B78199A5835F942ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(14444005)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D5iTALhRxhBBFQ5ex/N0ZGCos4ujv+Q/gv8UL0EAqXWj4vy9QcuNo3vywjrozsnHBa7U+M8fPGrGQnYO30XLABik/2Taw4jsrE1nAwiTWmUN/b56ob4jBw8hfnwUl9DmhUnAFXh/UofUgE9OaddRLDZ8nptJ4HzSVFc/p/l0j5iMiQmag7zSWjE6XZnmJm02M8VAndoV2UyvXeqj3V6DG4A7PK1XuNwkI9zbP2fu5U56CJXKGNM2ARsJnJ0bipJL9L0YkqkDoNIBPdLl/XY7LhfQC2QfBsdLuwm0xurUP26i2xdmuRiqlrwcBJglfNRbju01slUlY9G2Ghfb6HXKJuINSeobtZi0OnXs23qQNhxd3x4MBgHPMrtWpPg0icXbsDlvg+iFMkVpyB47XrE6zeEJ6z/bnlPBdTDSk91dg00=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45e809f-d3e4-4581-97d9-08d7314f542e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:28.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+1Bc31ETadOYfCQR7d5YmxfyhiNU83+0Um5UfLaxq2fm2GBAEEQBnrvKjjireoYL8a1228cSw2Gni1G1K6Zqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CepI1WIJya25led72opNJc6WkaBh/FzmK+w75Fw6PIs=;
 b=OfKTBhWxTbGYpHwmUXsNDbyn7959+UJOiz2PSOARS4sVuQ/WspPBX13cBpyQtE6xKvdqGIkRkM9Shj8L7Okb/0FL64OOAs7Swaqgnj96OZ5I9EfR/oOYCuqIeZeiKPUlt1M+/9vuDh5uzFmaF5VfQC6yKXoLbS0kUb0uNG2AXR4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVub2lyIGlzIHRoZSBzYW1lIHdpdGggUmF2ZW4sIHdpbGwgZW5hYmxlIGlvbW11IGV2ZW50IGlu
IGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2V2ZW50cy5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZXZlbnRzLmMKaW5kZXggM2UyMmZhMy4uYmIzYTY0MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2V2ZW50cy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9ldmVudHMuYwpAQCAtOTg3LDcgKzk4Nyw4IEBAIHZvaWQg
a2ZkX3NpZ25hbF9pb21tdV9ldmVudChzdHJ1Y3Qga2ZkX2RldiAqZGV2LCB1bnNpZ25lZCBpbnQg
cGFzaWQsCiAJICogYmVmb3JlIElPTU1VIGlzIGFibGUgdG8gZmluaXNoIHByb2Nlc3NpbmcgYWxs
IHRoZSBleGNlc3NpdmUgUFBScwogCSAqIHRyaWdnZXJlZCBkdWUgdG8gSFcgZmxhd3MuCiAJICov
Ci0JaWYgKGRldi0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5ICE9IENISVBfUkFWRU4pIHsKKwlp
ZiAoZGV2LT5kZXZpY2VfaW5mby0+YXNpY19mYW1pbHkgIT0gQ0hJUF9SQVZFTiB8fAorCSAgICBk
ZXYtPmRldmljZV9pbmZvLT5hc2ljX2ZhbWlseSAhPSBDSElQX1JFTk9JUikgewogCQltdXRleF9s
b2NrKCZwLT5ldmVudF9tdXRleCk7CiAKIAkJLyogTG9va3VwIGV2ZW50cyBieSB0eXBlIGFuZCBz
aWduYWwgdGhlbSAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
