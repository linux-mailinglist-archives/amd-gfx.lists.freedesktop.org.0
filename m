Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926063FB8
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22708899B0;
	Wed, 10 Jul 2019 03:59:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F0D899BE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:59:14 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 03:59:10 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:59:10 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amdgpu: Fix potential integer overflows
Thread-Topic: [PATCH 5/5] drm/amdgpu: Fix potential integer overflows
Thread-Index: AQHVNtPUUrYP8FS43U+j4/KPFiCeAg==
Date: Wed, 10 Jul 2019 03:59:10 +0000
Message-ID: <20190710035848.26966-5-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: d23631ff-1156-4ddf-ac5a-08d704eaf669
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3001; 
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-microsoft-antispam-prvs: <DM6PR12MB3001CF78C5C7AA5A7D68A4E792F00@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(86362001)(76176011)(52116002)(68736007)(36756003)(2501003)(53936002)(71190400001)(71200400001)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(6512007)(2351001)(3846002)(6116002)(316002)(99286004)(478600001)(2906002)(6486002)(50226002)(14454004)(25786009)(1076003)(5660300002)(26005)(11346002)(476003)(186003)(486006)(446003)(2616005)(5640700003)(305945005)(7736002)(6436002)(102836004)(6506007)(81156014)(8936002)(81166006)(386003)(8676002)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DBbfzGlOSpjgEc9jff+7j0H8aG7s7pv3ZmRCjDftq+cUUBGeW+kD+WYoty6WAxxyJONe1Rp7NOtud9Y7aXtFqd1xK/2bb1v4uTLMpdo+m3b4fFfHsquaJYx9k83SrnzzhO3TMz7UpuYJp8O7WwyRMq4ssSAwam/yXSIdTrBSUNtCUxjPoOaOnx4zQDVP6GeIbgvMXppyaYBMhsWpJwL52vpxy7UbvFObsWM8b+JtenTXgRney85oj06dpopaDWpEObfRNu2nLksOT58ggEbKF3EjnO09k1LMoBHpSIZ3WJrdw2XFBw1ax4HOPNI3KxhwTrBAtd45sp6kNS9i0Nr4tHTIy3p9JorpKSSK7Ab9rOWghRXAj23nMzC9Fk3/oyLMyZZhmWO4E90H3YOI/D7iO6ZENYc5LE3tZ+S9LxWcvag=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23631ff-1156-4ddf-ac5a-08d704eaf669
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:59:10.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnrsO7RpCRjZ3vTw9SsILiikN2e2tfXpoIsenm1/9jk=;
 b=fdwVD3NSvZglX4vs4S+2B+wJ2swM94+xsN3M29QqcltJjbP3fMlaI9yFhoxCxM1qKLZTE16bGHgv+ydkCNL2vnLDjYs33RmVyYD6s8mIhyCdIGmGKqbSdqNIe9jV0IymX3wOYHTVXjilSkPcO02/HmQQWu2JVpEpCMqFNyV4LpM=
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

V2l0aCBtbV9ub2RlcyBsYXJnZXIgdGhhbiA0R0IsIGJ5dGVfY291bnQgaW4gYW1kZ3B1X2ZpbGxf
YnVmZmVyIHdvdWxkCm92ZXJmbG93LgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmlu
ZGV4IGFlMGViNjRlNzM0Yi4uYmJiZjA2OWVmYjc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCkBAIC0yMDcxLDkgKzIwNzEsOSBAQCBpbnQgYW1kZ3B1X2ZpbGxfYnVm
ZmVyKHN0cnVjdCBhbWRncHVfYm8gKmJvLAogCW1tX25vZGUgPSBiby0+dGJvLm1lbS5tbV9ub2Rl
OwogCW51bV9sb29wcyA9IDA7CiAJd2hpbGUgKG51bV9wYWdlcykgewotCQl1aW50MzJfdCBieXRl
X2NvdW50ID0gbW1fbm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUOworCQl1aW50NjRfdCBieXRlX2Nv
dW50ID0gbW1fbm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUOwogCi0JCW51bV9sb29wcyArPSBESVZf
Uk9VTkRfVVAoYnl0ZV9jb3VudCwgbWF4X2J5dGVzKTsKKwkJbnVtX2xvb3BzICs9IERJVl9ST1VO
RF9VUF9VTEwoYnl0ZV9jb3VudCwgbWF4X2J5dGVzKTsKIAkJbnVtX3BhZ2VzIC09IG1tX25vZGUt
PnNpemU7CiAJCSsrbW1fbm9kZTsKIAl9CkBAIC0yMDk5LDEyICsyMDk5LDEzIEBAIGludCBhbWRn
cHVfZmlsbF9idWZmZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sCiAJbW1fbm9kZSA9IGJvLT50Ym8u
bWVtLm1tX25vZGU7CiAKIAl3aGlsZSAobnVtX3BhZ2VzKSB7Ci0JCXVpbnQzMl90IGJ5dGVfY291
bnQgPSBtbV9ub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQ7CisJCXVpbnQ2NF90IGJ5dGVfY291bnQg
PSBtbV9ub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQ7CiAJCXVpbnQ2NF90IGRzdF9hZGRyOwogCiAJ
CWRzdF9hZGRyID0gYW1kZ3B1X21tX25vZGVfYWRkcigmYm8tPnRibywgbW1fbm9kZSwgJmJvLT50
Ym8ubWVtKTsKIAkJd2hpbGUgKGJ5dGVfY291bnQpIHsKLQkJCXVpbnQzMl90IGN1cl9zaXplX2lu
X2J5dGVzID0gbWluKGJ5dGVfY291bnQsIG1heF9ieXRlcyk7CisJCQl1aW50MzJfdCBjdXJfc2l6
ZV9pbl9ieXRlcyA9IG1pbl90KHVpbnQ2NF90LCBieXRlX2NvdW50LAorCQkJCQkJCSAgIG1heF9i
eXRlcyk7CiAKIAkJCWFtZGdwdV9lbWl0X2ZpbGxfYnVmZmVyKGFkZXYsICZqb2ItPmlic1swXSwg
c3JjX2RhdGEsCiAJCQkJCQlkc3RfYWRkciwgY3VyX3NpemVfaW5fYnl0ZXMpOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
