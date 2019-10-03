Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE699CAED7
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 21:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214F6E137;
	Thu,  3 Oct 2019 19:07:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA9C6E137
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 19:07:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqsoPUNkXPF5TJ74IIwruQUMdl/cNP19z8D+2e5rV0CgYI9WLtPjDEZfO5bco3gppxA2EN6yEGS0ZdWxnlCBvZ7SVZ4+98I0LZGsiSIVYCPq88fNc7hP/rAEP4x+pNl9UKocvT5O6PQrQHdJMPTN+2xcegctQQVjgXraloBUY3slKdM+GX8HsUsvj3j/LzxyS3hIW7WWOh6aZmSa+gsaZyStejMVMYEjctQXxP2+San0phvtoY01r80CMpvwyLBvTKGMXCXLkacmLbTGkWU/ViZpPPTLl4CNu3P4bcITWmVYj2nU1Sz02VBePZITmCV8dP4thfb+PnLQgzV8JOoeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTKUyW+6fgXeM/jULul0cc2KBLp36V6ODGXplrMJhZE=;
 b=R+097NoFdpl+zJu2iwfhkDgoyI/5kJjmrkxE+oxWVmc6Zgnc7V+AvS/X9XoCZbO58GfiWF50JiQ5K0jAo3AyDd4U4ouIct4+yfCeNSbG4XLriDuESJmPlYzl3SF6dMEb6vUwhBNLO8ih2krA9zSXfsiDOqepCUpGFd3rjcw3HtQvXyw5AS/7I4Hc3IvMkQ5Xdz5+6BWuuEYb9EJ/AEqnWP2HN4L5n5oNuk8xsmZ96FGo8pfHGRwo5+6E/0Cg8aVOMLud4I1PSktaMo4z3EHx2053pqopXwpMcNUke94C++TAInqDZw/wvDc+oGwVMMVTIqhd8no6wQT+QmN4HluHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1950.namprd12.prod.outlook.com (10.175.54.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 19:07:15 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 19:07:14 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "thejoe@gmail.com" <thejoe@gmail.com>
Subject: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVeh3EjL0JBbVRS0Op933q+SPrzQ==
Date: Thu, 3 Oct 2019 19:07:14 +0000
Message-ID: <20191003190653.15455-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9344b04a-d56e-4825-d993-08d74834e6aa
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1950:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1950AC43DE0AC3CAF5945E4BE69F0@MWHPR12MB1950.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(478600001)(3846002)(476003)(25786009)(66066001)(71190400001)(71200400001)(966005)(14454004)(4326008)(6306002)(186003)(8936002)(7736002)(486006)(2616005)(102836004)(6116002)(316002)(2501003)(14444005)(305945005)(36756003)(6436002)(6486002)(99286004)(5660300002)(256004)(52116002)(6512007)(26005)(50226002)(66476007)(66556008)(86362001)(66446008)(64756008)(6506007)(1076003)(386003)(2906002)(81156014)(110136005)(81166006)(8676002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1950;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /LrBxYL3Qoae8tpsE8kxaGMPO/T4uyKhKDj2pu7zd5y+AgqZsPTcuYXphZZu9CpODXh4AZf8w7DfGdiwut0JIAVrSMUQx2qt0wCXe0299XXpO/Ukvo9kssspdSJVNFAs5X5p5XI+HHoG0BkWGQ/luO6cKI6jnATXg0AMwtMghnwvrs2kS+fHOxwH0Qw0wJiHv2bxzjEwe7ZRhrz6xZubmltox6Qyx4uj1i+ErHZnbuZdYI4jEXr/NikAoFMpLRYMyjeuLeCNXfMsTAF4G1Rp6HSwRtfJ+xvfDOAcwMqqCu3aHwgq7m+ANymGX5FKGhlbiSwxMDmR08Dt3q+ux92RcQca8NmxqLs6xdJVQjo7N6XN0g0OG6/3pLMgCP1TNCZbm0ZgL+IsXg4qgXkhKJaaS6B4NlOBhBLIzKzr7N4bz8AAehzABOLKiTiuK/AtiJmPNoBF2PFiNDyftiIXUEK2zA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9344b04a-d56e-4825-d993-08d74834e6aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 19:07:14.5478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6WU/J6+7ag83E8c11WWG/E9MX+GDnESanJcvQOdEvM9qgnAf1fhnszpMkITIERU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTKUyW+6fgXeM/jULul0cc2KBLp36V6ODGXplrMJhZE=;
 b=DT6Nl7Zv6VlO3YHYyPay+NLuEUUch6Np11OdHAJrB9gT70aGUJ5gokG42LwCn8y8Ilwn8egHr6neOeJxGQmQWxg75oiqc2VXEMcto8so7tWWjq6LA+ZFZAtqNdPg7hOqPJsUdGWsNTJJkBseoPEIqI47d90+Sxh4nDphzmyLQaE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dXNlcl9wYWdlcyBhcnJheSBzaG91bGQgYmUgZnJlZWQgcmVnYXJkbGVzcyBpZiB1c2VyIHBhZ2Vz
IGFyZQppbnZhbGlkYXRlZCBhZnRlciBibyBpcyBjcmVhdGVkIGJlY2F1c2UgSE1NIGNoYW5nZSB0
byBhbHdheXMgYWxsb2NhdGUKdXNlciBwYWdlcyBhcnJheSB0byBnZXQgdXNlciBwYWdlcyB3aGls
ZSBwYXJzaW5nIHVzZXIgcGFnZSBiby4KCkRvbid0IG5lZWQgdG8gdG8gZ2V0IHVzZXIgcGFnZXMg
d2hpbGUgY3JlYXRpbmcgYm8gYmVjYXVzZSB1c2VyIHBhZ2VzCndpbGwgb25seSBiZSB1c2VkIGFm
dGVyIHBhcnNpbmcgdXNlciBwYWdlIGJvLgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5sYXVuY2hw
YWQubmV0L3VidW50dS8rc291cmNlL2xpbnV4LytidWcvMTg0NDk2MgoKU2lnbmVkLW9mZi1ieTog
UGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYyB8IDIzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYwppbmRleCA0OWI3NjdiNzIzOGYuLmU4NjFkZTI1OWRlZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTQ5OCw3ICs0OTgsNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpw
LAogCQlpZiAocikKIAkJCXJldHVybiByOwogCi0JCWlmIChiaW5kaW5nX3VzZXJwdHIpIHsKKwkJ
aWYgKGxvYmotPnVzZXJfcGFnZXMpIHsKIAkJCWt2ZnJlZShsb2JqLT51c2VyX3BhZ2VzKTsKIAkJ
CWxvYmotPnVzZXJfcGFnZXMgPSBOVUxMOwogCQl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2VtLmMKaW5kZXggYTgyOGUzZDBiZmJkLi4zY2NkNjFkNjk5NjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKQEAgLTI4Myw3ICsyODMsNiBAQCBpbnQgYW1k
Z3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
IGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAkJCSAgICAgc3RydWN0IGRybV9maWxlICpmaWxwKQogewotCXN0cnVjdCB0dG1f
b3BlcmF0aW9uX2N0eCBjdHggPSB7IHRydWUsIGZhbHNlIH07CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fYW1kZ3B1X2dlbV91c2Vy
cHRyICphcmdzID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmo7CkBAIC0zMjYs
MzIgKzMyNSwxMiBAQCBpbnQgYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCQlnb3RvIHJlbGVhc2Vfb2JqZWN0OwogCX0KIAotCWlm
IChhcmdzLT5mbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSkgewotCQlyID0gYW1k
Z3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBhZ2VzKTsKLQkJaWYg
KHIpCi0JCQlnb3RvIHJlbGVhc2Vfb2JqZWN0OwotCi0JCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShi
bywgdHJ1ZSk7Ci0JCWlmIChyKQotCQkJZ290byB1c2VyX3BhZ2VzX2RvbmU7Ci0KLQkJYW1kZ3B1
X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgQU1ER1BVX0dFTV9ET01BSU5fR1RUKTsKLQkJ
ciA9IHR0bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOwotCQlh
bWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKLQkJaWYgKHIpCi0JCQlnb3RvIHVzZXJfcGFnZXNfZG9u
ZTsKLQl9Ci0KIAlyID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZpbHAsIGdvYmosICZoYW5kbGUp
OwogCWlmIChyKQotCQlnb3RvIHVzZXJfcGFnZXNfZG9uZTsKKwkJZ290byByZWxlYXNlX29iamVj
dDsKIAogCWFyZ3MtPmhhbmRsZSA9IGhhbmRsZTsKIAotdXNlcl9wYWdlc19kb25lOgotCWlmIChh
cmdzLT5mbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSkKLQkJYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlc19kb25lKGJvLT50Ym8udHRtKTsKLQogcmVsZWFzZV9vYmplY3Q6CiAJ
ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdvYmopOwogCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
