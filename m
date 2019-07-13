Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A8678DB
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Jul 2019 08:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D97D6E3B5;
	Sat, 13 Jul 2019 06:42:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956CB6E3B5
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jul 2019 06:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FILHqAoKnyebDl4WpPakM+BvQD9Ah4tGk9hi6rpjaInwYxYmKyFcZ7Bgke4FKZ8xXZNa+cbumjT1Ga1qzNDXmcU6R/Lcsf/dw0Y7hg7tGKZ21WhRvjXk0QUa6HQ7pSaG4eNX0ssotHUwwiWvekcs3/NpI+H4BUu0CIeSc1YvAg6h7PoMhEZOkCxtvirS7bRVcobDsCve/V5u2xYJt63N2HeNIuWQO32K9yiQIAt4JWevkT/7JvnzJerVZe3ZPnwqKotQZrx/gqLclMOoay5/IbU9CKscmWBX9ZLaGf76uJHwCYUnTG5PUpftF4Bsw1WK0PlH1A0KhY4fXB5FpGuE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpLLiVETMcTLbEeH4ku1bKG6Pqb6inc9nW930FZHn5M=;
 b=kcJgcJEwmv/L+BWWTlKL8WxdZw+JOg0t1Rse9nXXRJA/GmxhaywnJRmQ+pLCIn75rPNyc5Nxf5Wvx3kdh0Z4DkwoENZSBeXilfEuEULJoHYKhKpw/3QttxFmPMKQdvE3/yWwWkK4qMb6qWBu26k/Cj40HUVdMIL3M9H8gLmU8dpXr7RwH59+GbfKz9WrH9t6pIWi37wEgNGXPBdwZzzOGT1/hIlVkG4RKvLJeqLrHbdlD8ArBktqAEh9Vp39OHXPGlx0ZJqkvf9pap0SHTqhqAX8wGXp45YEesR0aQwjBpEUafTs+mkgfV6uQD21lgnJZRGpmVGaKUi4lY+/R+zsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3067.namprd12.prod.outlook.com (20.178.30.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Sat, 13 Jul 2019 06:42:37 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Sat, 13 Jul 2019
 06:42:37 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Fix silent amdgpu_bo_move failures
Thread-Topic: [PATCH 2/2] drm/amdgpu: Fix silent amdgpu_bo_move failures
Thread-Index: AQHVOUYokMlUKFFN3Eek2MBcKMYmIA==
Date: Sat, 13 Jul 2019 06:42:36 +0000
Message-ID: <20190713064211.20047-2-Felix.Kuehling@amd.com>
References: <20190713064211.20047-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190713064211.20047-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70999a09-3b54-4090-ffdc-08d7075d4af3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3067; 
x-ms-traffictypediagnostic: DM6PR12MB3067:
x-microsoft-antispam-prvs: <DM6PR12MB30677144D5491FC0A3B49CB692CD0@DM6PR12MB3067.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00979FCB3A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(189003)(199004)(6486002)(11346002)(186003)(8676002)(26005)(446003)(2616005)(476003)(1076003)(71190400001)(2501003)(14454004)(71200400001)(6512007)(6436002)(5640700003)(2906002)(53936002)(25786009)(99286004)(66446008)(64756008)(66476007)(66556008)(316002)(256004)(6916009)(36756003)(68736007)(478600001)(305945005)(7736002)(5660300002)(6506007)(76176011)(52116002)(102836004)(386003)(66066001)(86362001)(81156014)(486006)(50226002)(81166006)(8936002)(3846002)(2351001)(66946007)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3067;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdAuSYb+N4jokEQLGoXZQDeR+rGIKNuEua/K5LkMMVPG1nAhDSFVe+Q5aTDObr0c0h8kItwFCWDqlcQNY6rHljo2Vdr1nnJHvRgdTkozWS8b0+mzjciz1Aungq91ze+JX1AvWK++LJaad5NLBI0rgtvoYSsZcG0L1prKC39d7hRQyMwQY3QRbleKLh01tjgcOU22cwKpkWXynujGeyatzY/6Im07cvBERsEfsq99JSmyXx8f5HrV8PF97mrsRWbdrchsOGZfyhOpZHfoxD2ut60twqP6fpEEztbqs6MZNdJzIz/tjqLYcmzZ4cJ+T99aSISRKIyaRxlZstG3hctAHlv+oLre2Hhi92LwktZ4Zx1Rbl5TOvT8oWLSSUqUKPwmybWPzCi6tEeZqQocj4ea+KoSeh013zh6Ff96At2L/CY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70999a09-3b54-4090-ffdc-08d7075d4af3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2019 06:42:37.0050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpLLiVETMcTLbEeH4ku1bKG6Pqb6inc9nW930FZHn5M=;
 b=XFtbpxOu1qgko/r/XJoRWG75mJDGEl9dUTGxkElYxq6YZptndctI8NXCqjK4MUwAPAYCnKqUUqV7Kly+GRZT5hdEsO4vypGkJl4alk1m5+wWTfhM/Gtvuj4P6/FPrehm6GkYI6yKy5kKG8wCGeQO6nT0wa/q2bQ3x2Lpz338rbU=
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

VW5kZXIgbWVtb3J5IHByZXNzdXJlLCBidWZmZXIgbW92ZXMgYmV0d2VlbiBSQU0gdG8gVlJBTSAg
Y2FuCmZhaWwgd2hlbiB0aGVyZSBpcyBubyBHVFQgc3BhY2UgYXZhaWxhYmxlLiBJbiB0aG9zZSBj
YXNlcwphbWRncHVfYm9fbW92ZSBmYWxscyBiYWNrIHRvIHR0bV9ib19tb3ZlX21lbWNweSwgd2hp
Y2ggc2VlbXMgdG8Kc3VjY2VlZCwgYWx0aG91Z2ggaXQgZG9lc24ndCByZWFsbHkgc3VwcG9ydCBu
b24tY29udGlndW91cyBvcgppbnZpc2libGUgVlJBTS4gVGhpcyBtYW5pZmVzdHMgYXMgVk0gZmF1
bHRzIHdpdGggY29ycnVwdGVkIHBhZ2UKdGFibGUgZW50cmllcyBpbiBLRkQgZXZpY3Rpb24gc3Ry
ZXNzIHRlc3RzLgoKUHJpbnQgc29tZSBoZWxwZnVsIG1lc3NhZ2VzIHdoZW4gbGFjayBvZiBHVFQg
c3BhY2UgaXMgY2F1c2luZyBidWZmZXIKbW92ZXMgdG8gZmFpbC4gQ2hlY2sgdGhhdCBzb3VyY2Ug
YW5kIGRlc3RpbmF0aW9uIG1lbW9yeSByZWdpb25zIGFyZQpzdXBwb3J0ZWQgYnkgdHRtX2JvX21v
dmVfbWVtY3B5IGJlZm9yZSB0YWtpbmcgdGhhdCBmYWxsYmFjay4KClNpZ25lZC1vZmYtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCA3ODQ0MDc0OGM4N2YuLjM3ZDlh
M2IwOTk0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtNDk4
LDYgKzQ5OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X21vdmVfdnJhbV9yYW0oc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKIAlwbGFjZW1lbnRzLmZsYWdzID0gVFRNX1BM
X01BU0tfQ0FDSElORyB8IFRUTV9QTF9GTEFHX1RUOwogCXIgPSB0dG1fYm9fbWVtX3NwYWNlKGJv
LCAmcGxhY2VtZW50LCAmdG1wX21lbSwgY3R4KTsKIAlpZiAodW5saWtlbHkocikpIHsKKwkJcHJf
ZXJyKCJGYWlsZWQgdG8gZmluZCBHVFQgc3BhY2UgZm9yIGJsaXQgZnJvbSBWUkFNXG4iKTsKIAkJ
cmV0dXJuIHI7CiAJfQogCkBAIC01NTYsNiArNTU3LDcgQEAgc3RhdGljIGludCBhbWRncHVfbW92
ZV9yYW1fdnJhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAogCXBs
YWNlbWVudHMuZmxhZ3MgPSBUVE1fUExfTUFTS19DQUNISU5HIHwgVFRNX1BMX0ZMQUdfVFQ7CiAJ
ciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZ0bXBfbWVtLCBjdHgpOwogCWlm
ICh1bmxpa2VseShyKSkgeworCQlwcl9lcnIoIkZhaWxlZCB0byBmaW5kIEdUVCBzcGFjZSBmb3Ig
YmxpdCB0byBWUkFNXG4iKTsKIAkJcmV0dXJuIHI7CiAJfQogCkBAIC01NzUsNiArNTc3LDMwIEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X21vdmVfcmFtX3ZyYW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywgYm9vbCBldmljdCwKIAlyZXR1cm4gcjsKIH0KIAorLyoqCisgKiBhbWRncHVfbWVtX3Zp
c2libGUgLSBDaGVjayB0aGF0IG1lbW9yeSBjYW4gYmUgYWNjZXNzZWQgYnkgdHRtX2JvX21vdmVf
bWVtY3B5CisgKgorICogQ2FsbGVkIGJ5IGFtZGdwdV9ib19tb3ZlKCkKKyAqLworc3RhdGljIGJv
b2wgYW1kZ3B1X21lbV92aXNpYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJICAg
ICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQoreworCXN0cnVjdCBkcm1fbW1fbm9kZSAqbm9k
ZXMgPSBtZW0tPm1tX25vZGU7CisKKwlpZiAobWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVN
IHx8CisJICAgIG1lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUKQorCQlyZXR1cm4gdHJ1ZTsKKwlp
ZiAobWVtLT5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkKKwkJcmV0dXJuIGZhbHNlOworCisJLyog
dHRtX21lbV9yZWdfaW9yZW1hcCBvbmx5IHN1cHBvcnRzIGNvbnRpZ3VvdXMgbWVtb3J5ICovCisJ
aWYgKG5vZGVzLT5zaXplICE9IG1lbS0+bnVtX3BhZ2VzKQorCQlyZXR1cm4gZmFsc2U7CisKKwly
ZXR1cm4gKChub2Rlcy0+c3RhcnQgKyBub2Rlcy0+c2l6ZSkgPDwgUEFHRV9TSElGVCkKKwkJPD0g
YWRldi0+Z21jLnZpc2libGVfdnJhbV9zaXplOworfQorCiAvKioKICAqIGFtZGdwdV9ib19tb3Zl
IC0gTW92ZSBhIGJ1ZmZlciBvYmplY3QgdG8gYSBuZXcgbWVtb3J5IGxvY2F0aW9uCiAgKgpAQCAt
NjE5LDggKzY0NSwxMCBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCiAJCXJldHVybiAwOwogCX0KIAotCWlmICghYWRl
di0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCkKKwlpZiAoIWFkZXYtPm1tYW4uYnVmZmVyX2Z1
bmNzX2VuYWJsZWQpIHsKKwkJciA9IC1FTk9ERVY7CiAJCWdvdG8gbWVtY3B5OworCX0KIAogCWlm
IChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVlJBTSAmJgogCSAgICBuZXdfbWVtLT5tZW1f
dHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7CkBAIC02MzUsMTAgKzY2MywxNiBAQCBzdGF0aWMgaW50
IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3Qs
CiAKIAlpZiAocikgewogbWVtY3B5OgotCQlyID0gdHRtX2JvX21vdmVfbWVtY3B5KGJvLCBjdHgs
IG5ld19tZW0pOwotCQlpZiAocikgeworCQkvKiBDaGVjayB0aGF0IGFsbCBtZW1vcnkgaXMgQ1BV
IGFjY2Vzc2libGUgKi8KKwkJaWYgKCFhbWRncHVfbWVtX3Zpc2libGUoYWRldiwgb2xkX21lbSkg
fHwKKwkJICAgICFhbWRncHVfbWVtX3Zpc2libGUoYWRldiwgbmV3X21lbSkpIHsKKwkJCXByX2Vy
cigiTW92ZSBidWZmZXIgZmFsbGJhY2sgdG8gbWVtY3B5IHVuYXZhaWxhYmxlXG4iKTsKIAkJCXJl
dHVybiByOwogCQl9CisKKwkJciA9IHR0bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVt
KTsKKwkJaWYgKHIpCisJCQlyZXR1cm4gcjsKIAl9CiAKIAlpZiAoYm8tPnR5cGUgPT0gdHRtX2Jv
X3R5cGVfZGV2aWNlICYmCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
