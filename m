Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABBDC74F
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 16:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579326E10B;
	Fri, 18 Oct 2019 14:27:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077F26E10B
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 14:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRfuR+mmdxEmxNkxK+zoSiujOHFxQ8qUzL0KfcqouOavDZ6zuXkP+JDp3+qrfbO96TT/a4M8ARg/9PReHPnki4O50a+OOLyRFMDZKyo7/4gnlfGvzE3xLiwqiCLC9Hl67/+cH6Eq8x1AnPG4jwHv98UZN5u+BQO/nXnip+c8RdWp1+6y/hPJb22nWAVDiWCJO2F84cLzLVfIgrKhgbTFtx8JFYGs9EaJ2/R0NVm0Rkd5Ph14fJGhgMLXkEow21EVGsrSLd878nLVScPGe2TIaspgk3xw2Nnh8myjpMzUqbcptfu931UkjMiYArXGzh8KwUg+Q0p9FkNM36BMnjLe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i1BsVblYxjj1Se3AsfucSXFO2QqBiXWNiCE3tHFDZQ=;
 b=aNYLMUGVgzXDvvH0lDRCF3x0wldSrYvG+3yOD8N6d9NYkRI2+WA3X0XJp/01UIQIeC5YU+o3NFYfBTQoyM0SvSuZfZPnK5NPEbas7RevJUyFlLs76pWaaAphZBEtZUSFlKzXeJujwzA9PIKDHB18isb5BjEOYjUb/eVvZIfg6GKJ40Ub+cb0oNjM+IFjIL7pLlJQiPAvm6V8YyptgIonu6oK0GaijbdISxb6epEtPlOMrAZP5Yyk7bL8VcdOumOQhm+yk7CvcMwO0LLkDVMwWV7ASNdoQBd5hfdmI/uq8jTSLrsrqhWttHo1vt3LswqJhvAw6HpKLWBnNrJ7yPsynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3264.namprd12.prod.outlook.com (20.179.83.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 18 Oct 2019 14:27:25 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 14:27:24 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Topic: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Index: AQHVhcApOQbEtJBw1kOd8JCAgRq7tA==
Date: Fri, 18 Oct 2019 14:27:24 +0000
Message-ID: <20191018142711.19261-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76772cd4-07c7-4a23-4133-08d753d74b61
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3264840B4C52033AE7DC21EFE66C0@MN2PR12MB3264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(189003)(199004)(26005)(478600001)(50226002)(6436002)(102836004)(186003)(6512007)(99286004)(7736002)(6486002)(5640700003)(52116002)(14444005)(6506007)(386003)(305945005)(14454004)(256004)(36756003)(25786009)(1076003)(2351001)(316002)(6116002)(3846002)(4326008)(2616005)(71200400001)(6916009)(2906002)(66066001)(486006)(71190400001)(86362001)(5660300002)(476003)(66946007)(8676002)(66556008)(64756008)(66446008)(81156014)(81166006)(8936002)(2501003)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3264;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13uxLYal7C8r7BrGXX2TB7mbZ8910HKO8UYdQBofh22ajuhoAgkSUnsnYCZGqZHMio61JrsUj8mzBvYW0mI97ih6+v5WOST+igsz9skTDR1q9h0UjXrn+H0yLZjtN6TYb6xcXZbJ59tdGeyVQXO5fFs1oQvsqNSTTI90uVh17NEI5AO3yKOM2nJ18HK0kDACYaJfGo9SC+m5zLoUZdiwIKFwmoyiJTaB0oIaMe9g1Iar1cfk6er4UQN0zKLVhlG75LyziL73OU4yrOo5eLD65s625NLwtMY14yW4AkcwZsRc1osfH5FiBYhOeLbNp0x5c1DSJMdXUcRpHcdpfLxpmQkJS9PxU2z/QDRMmLtZMiz1SxMA6IBRPv++o/gzRmrGbNt6ly6FqJCSz4kLtwahpixb0F433x5tsSODP+4tHR8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76772cd4-07c7-4a23-4133-08d753d74b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 14:27:24.6861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJSi3ojbFQtDBwRMOZBQ1Yo+AE4vx6JHRcnt5LBM1vXOhlQ9KsSIgg2ILC0CkfD/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i1BsVblYxjj1Se3AsfucSXFO2QqBiXWNiCE3tHFDZQ=;
 b=xusbvyTxy3jc5+ge330/8KEFJgLtq0zcRHn087VIN9FPBSuV514noVSki6o5/Sqsq88WNU4p5k8Ac4jx3UvdWkpCBWKzW7gl04R2qgSeDlYdfkg1/UTcsJErAFcMWkDxqz8hoZ1TpxAgG0eI/i7XDtqaqAne5cNvcNG492mbqDU=
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

SWYgZGV2aWNlIGlzIGxvY2tlZCBmb3Igc3VzcGVuZCBhbmQgcmVzdW1lLCBrZmQgb3BlbiBzaG91
bGQgcmV0dXJuCmZhaWxlZCAtRUFHQUlOIHdpdGhvdXQgY3JlYXRpbmcgcHJvY2Vzcywgb3RoZXJ3
aXNlIHRoZSBhcHBsaWNhdGlvbiBleGl0CnRvIHJlbGVhc2UgdGhlIHByb2Nlc3Mgd2lsbCBoYW5n
IHRvIHdhaXQgZm9yIHJlc3VtZSBpcyBkb25lIGlmIHRoZSBzdXNwZW5kCmFuZCByZXN1bWUgaXMg
c3R1Y2sgc29tZXdoZXJlLiBUaGlzIGlzIGJhY2t0cmFjZToKCltUaHUgT2N0IDE3IDE2OjQzOjM3
IDIwMTldIElORk86IHRhc2sgcm9jbWluZm86MzAyNCBibG9ja2VkIGZvciBtb3JlCnRoYW4gMTIw
IHNlY29uZHMuCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICAgICAgIE5vdCB0YWludGVkCjUu
MC4wLXJjMS1rZmQtY29tcHV0ZS1yb2NtLWRrbXMtbm8tbnBpLTExMzEgIzEKW1RodSBPY3QgMTcg
MTY6NDM6MzcgMjAxOV0gImVjaG8gMCA+Ci9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVv
dXRfc2VjcyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdlLgpbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5
XSByb2NtaW5mbyAgICAgICAgRCAgICAwICAzMDI0ICAgMjk0NwoweDgwMDAwMDAwCltUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldIENhbGwgVHJhY2U6CltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTld
ICA/IF9fc2NoZWR1bGUrMHgzZDkvMHg4YTAKW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIHNj
aGVkdWxlKzB4MzIvMHg3MApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgc2NoZWR1bGVfcHJl
ZW1wdF9kaXNhYmxlZCsweGEvMHgxMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgX19tdXRl
eF9sb2NrLmlzcmEuOSsweDFlMy8weDRlMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBf
X2NhbGxfc3JjdSsweDI2NC8weDNiMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBwcm9j
ZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKzB4MjQvMHgyZjAKW2FtZGdwdV0KW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gIHByb2Nlc3NfdGVybWluYXRpb25fY3BzY2grMHgyNC8weDJmMApbYW1kZ3B1
XQpbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XQprZmRfcHJvY2Vzc19kZXF1ZXVlX2Zyb21fYWxs
X2RldmljZXMrMHg0Mi8weDYwIFthbWRncHVdCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBr
ZmRfcHJvY2Vzc19ub3RpZmllcl9yZWxlYXNlKzB4MWJlLzB4MjIwClthbWRncHVdCltUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldICBfX21tdV9ub3RpZmllcl9yZWxlYXNlKzB4M2UvMHhjMApbVGh1
IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZXhpdF9tbWFwKzB4MTYwLzB4MWEwCltUaHUgT2N0IDE3
IDE2OjQzOjM3IDIwMTldICA/IF9faGFuZGxlX21tX2ZhdWx0KzB4YmEzLzB4MTIwMApbVGh1IE9j
dCAxNyAxNjo0MzozNyAyMDE5XSAgPyBleGl0X3JvYnVzdF9saXN0KzB4NWEvMHgxMTAKW1RodSBP
Y3QgMTcgMTY6NDM6MzcgMjAxOV0gIG1tcHV0KzB4NGEvMHgxMjAKW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIGRvX2V4aXQrMHgyODQvMHhiMjAKW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0g
ID8gaGFuZGxlX21tX2ZhdWx0KzB4ZmEvMHgyMDAKW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0g
IGRvX2dyb3VwX2V4aXQrMHgzYS8weGEwCltUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBfX3g2
NF9zeXNfZXhpdF9ncm91cCsweDE0LzB4MjAKW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGRv
X3N5c2NhbGxfNjQrMHg0Zi8weDEwMApbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZW50cnlf
U1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQoKU2lnbmVkLW9mZi1ieTogUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2NoYXJkZXYuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jCmluZGV4IGQ5ZTM2ZGJmMTNkNS4uNDBkNzVjMzlmMDhlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMKQEAgLTEyMCwxMyArMTIwLDEzIEBAIHN0YXRpYyBpbnQg
a2ZkX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQogCQlyZXR1
cm4gLUVQRVJNOwogCX0KIAorCWlmIChrZmRfaXNfbG9ja2VkKCkpCisJCXJldHVybiAtRUFHQUlO
OworCiAJcHJvY2VzcyA9IGtmZF9jcmVhdGVfcHJvY2VzcyhmaWxlcCk7CiAJaWYgKElTX0VSUihw
cm9jZXNzKSkKIAkJcmV0dXJuIFBUUl9FUlIocHJvY2Vzcyk7CiAKLQlpZiAoa2ZkX2lzX2xvY2tl
ZCgpKQotCQlyZXR1cm4gLUVBR0FJTjsKLQogCWRldl9kYmcoa2ZkX2RldmljZSwgInByb2Nlc3Mg
JWQgb3BlbmVkLCBjb21wYXQgbW9kZSAoMzIgYml0KSAtICVkXG4iLAogCQlwcm9jZXNzLT5wYXNp
ZCwgcHJvY2Vzcy0+aXNfMzJiaXRfdXNlcl9tb2RlKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
