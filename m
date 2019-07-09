Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D685763005
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 07:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699D289E05;
	Tue,  9 Jul 2019 05:32:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622589D7D
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 05:32:55 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3116.namprd12.prod.outlook.com (20.178.31.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Tue, 9 Jul 2019 05:32:54 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 05:32:54 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: Implement clearing of sensitive VRAM
Thread-Topic: [PATCH 3/3] drm/amdgpu: Implement clearing of sensitive VRAM
Thread-Index: AQHVNhfBQF9aEWsL8ki8UIRe2w9mKg==
Date: Tue, 9 Jul 2019 05:32:53 +0000
Message-ID: <20190709053222.22588-3-Felix.Kuehling@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190709053222.22588-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7542ea45-9faf-41de-68a4-08d7042ee3de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3116; 
x-ms-traffictypediagnostic: DM6PR12MB3116:
x-microsoft-antispam-prvs: <DM6PR12MB3116FBAE56C43346469191DC92F10@DM6PR12MB3116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(478600001)(53936002)(316002)(26005)(8676002)(102836004)(2351001)(6916009)(1076003)(3846002)(66476007)(8936002)(5640700003)(6116002)(36756003)(81156014)(73956011)(81166006)(66556008)(64756008)(66446008)(6486002)(6436002)(186003)(5660300002)(86362001)(6512007)(66946007)(2906002)(486006)(14454004)(68736007)(71200400001)(2501003)(386003)(6506007)(52116002)(99286004)(76176011)(71190400001)(11346002)(2616005)(446003)(4326008)(305945005)(14444005)(72206003)(476003)(256004)(25786009)(50226002)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3116;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iN1boB1jieLUi6Fa53IbOL8DkQ3HqihIrJ7z9WTkpSRBDDXjhuWA7cIJ2OKZ2jOmd0rn/ifFKjdkYhiQiNOP+Tja1hsHsqCy83jMVsRugDtYvZUCd8Y564FYJyr/sEbDliBVinsneHktsGqIjtRfYecXRyX1tYu76IEqFx2U8T5+VAdrYvSvBnlVkNIapsH5Qq79XM9HPBd4l0AxjlRJnm01MN1czrb+oB/uFfhxjJPurZoWr5kDpImrBF00BZCQ85II8Okb8Z3pcBSf4kTydNmxdbMmkKOr9W+islQBR++4lzFObBsPGkHDHiU+HkiwEHWXWOQlUR4OqOi02/y1m/gnAxc93Ko5z1Q3qaRTgSgV6L63/3xqISjL6KKLju1ZYgrkIMicBIsfqM7oVwTLddjTe51m/RsecgkVBzOqWBo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7542ea45-9faf-41de-68a4-08d7042ee3de
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 05:32:53.7433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKd23cnOkW457VtpRR65n4zGGAv4PxuiQWDAi/18ReY=;
 b=WQsjOpIrdSCRA/xz1VlyORGIVr2BXrzCY7IOOi74d+LUy64yZ9MIdqquXebQBea561GgyJ6gAOl0pUFLXeVtzH/mLpEi4ogHPIfznWHQrMGCuAfhaEbqQRUs7/nVivFAO0NKfNhGU2gFcAGyrrhQFkCn/UL5X1O/AR7Y/Ovl9R8=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2xlYXIgVlJBTSBtZW1vcnkgY29udGFpbmluZyBzZW5zaXRpdmUgZGF0YSBiZWZvcmUgZnJlZWlu
ZyBpdC4gRG9pbmcKdGhpcyBpbiB0aGUgVlJBTSBtYW5hZ2VyJ3MgcHV0X25vZGUgY2FsbGJhY2sg
Y292ZXJzIGFsbCBjYXNlcyB0aGF0CnJlbGVhc2UgbWVtb3J5LCBpbmNsdWRpbmcgZnJlZWluZywg
bW92aW5nIG9yIGV2aWN0aW5nIEJPcy4gVG8KbWluaW1pemUgdGhlIHBlcmZvcm1hbmNlIGltcGFj
dCwgdXNlIHRoZSBtbWFuLT5tb3ZlIGZlbmNlIHRvIGRlbGF5CmZ1dHVyZSBtZW1vcnkgYWxsb2Nh
dGlvbnMgcmF0aGVyIHRoYW4gd2FpdGluZyBmb3IgY29tcGxldGlvbiBpbnNpZGUKdGhlIG1lbW9y
eSBmcmVlIGNvZGUgcGF0aC4gVGhpcyBpcyB0aGUgc2FtZSBtZWNoYW5pc20gdXNlZCB0byB3YWl0
CmZvciBwaXBlbGluZWQgZXZpY3Rpb25zIGZyb20gVlJBTS4KClNpZ25lZC1vZmYtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgOTQgKysrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwppbmRleCAxMTUwZTM0YmMyOGYuLjAyNTk0MjMwZDI5ZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKQEAgLTM1
OSw2ICszNTksMTIgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLAogCWF0b21pYzY0X2FkZCh2aXNfdXNhZ2UsICZtZ3ItPnZp
c191c2FnZSk7CiAKIAltZW0tPm1tX25vZGUgPSBub2RlczsKKwkvKiBSZW1lbWJlciB0aGUgc2Vu
c2l0aXZlIGZsYWcgaW4gdGhlIGNvbG9yIG9mIHRoZSBmaXJzdAorCSAqIG5vZGUuIFdoaWxlIHRo
ZSBub2RlIGlzIGFsbG9jYXRlZCwgZHJtX21tIGRvZXNuJ3QgdXNlCisJICogaXQgZm9yIGFueXRo
aW5nIGVsc2UuCisJICovCisJbm9kZXNbMF0uY29sb3IgPSAodHRtX3RvX2FtZGdwdV9ibyh0Ym8p
LT5mbGFncyAmCisJCQkgIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fU0VOU0lUSVZFKTsKIAogCXJl
dHVybiAwOwogCkBAIC0zNzIsNiArMzc4LDY5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdy
X25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAlyZXR1cm4gciA9PSAtRU5P
U1BDID8gMCA6IHI7CiB9CiAKKy8qKgorICogY2xlYXJfbWVtX3JlZyAtIGNsZWFyIFZSQU0gbWVt
b3J5IGZyb20gYSBtZW1fcmVnCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2VfcG9pbnRlcgor
ICogQG1lbTogVFRNIG1lbW9yeSBvYmplY3QKKyAqIEBmZW5jZTogdXNlZCB0byBzdG9yZSBhIHBv
aW50ZXIgdG8gdGhlIGZlbmNlIHNpZ25hbGluZyBjb21wbGV0aW9uCisgKgorICogVGhpcyBpcyB0
aGUgZmFzdCB2ZXJzaW9uIHVzaW5nIFNETUEuCisgKgorICogUmV0dXJuczoKKyAqIDAgb24gc3Vj
Y2VzcywgbmVnYXZpdGUgZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK3N0YXRpYyBpbnQgY2xl
YXJfbWVtX3JlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IHR0bV9tZW1fcmVn
ICptZW0sCisJCQkgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQoreworCWNvbnN0IHVpbnQzMl90
IG1heF9wYWdlcyA9CisJCWFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzLT5maWxsX21heF9ieXRlcyA+
PiBQQUdFX1NISUZUOworCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFkZXYtPm1tYW4uYnVm
ZmVyX2Z1bmNzX3Jpbmc7CisJc3RydWN0IGRybV9tbV9ub2RlICpub2RlczsKKwlzdHJ1Y3QgYW1k
Z3B1X2pvYiAqam9iOworCXVuc2lnbmVkIGludCBwYWdlcywgbnVtX2R3ID0gNjQ7IC8qIGZvciBJ
QiBwYWRkaW5nICovCisJaW50IHI7CisKKwlpZiAodW5saWtlbHkoIWFkZXYtPm1tYW4uYnVmZmVy
X2Z1bmNzX2VuYWJsZWQpKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCWZvciAocGFnZXMgPSBtZW0t
Pm51bV9wYWdlcywgbm9kZXMgPSBtZW0tPm1tX25vZGU7IHBhZ2VzOworCSAgICAgcGFnZXMgLT0g
bm9kZXMtPnNpemUsICsrbm9kZXMpCisJCW51bV9kdyArPSBESVZfUk9VTkRfVVAobm9kZXMtPnNp
emUsIG1heF9wYWdlcykgKgorCQkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3MtPmZpbGxfbnVtX2R3
OworCisJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihhZGV2LCBudW1fZHcgKiA0LCAmam9i
KTsKKwlpZiAodW5saWtlbHkocikpCisJCXJldHVybiByOworCisJZm9yIChwYWdlcyA9IG1lbS0+
bnVtX3BhZ2VzLCBub2RlcyA9IG1lbS0+bW1fbm9kZTsgcGFnZXM7CisJICAgICBwYWdlcyAtPSBu
b2Rlcy0+c2l6ZSwgKytub2RlcykgeworCQl1aW50NjRfdCBwYWdlX2NvdW50ID0gbm9kZXMtPnNp
emU7CisJCXVpbnQ2NF90IGRzdF9hZGRyID0gKG5vZGVzLT5zdGFydCA8PCBQQUdFX1NISUZUKSAr
CisJCQlhZGV2LT5nbWMudnJhbV9zdGFydDsKKworCQl3aGlsZSAocGFnZV9jb3VudCkgeworCQkJ
dWludDMyX3QgY3VyX3NpemVfaW5fcGFnZXMgPQorCQkJCW1pbl90KHVpbnQ2NF90LCBwYWdlX2Nv
dW50LCBtYXhfcGFnZXMpOworCisJCQlhbWRncHVfZW1pdF9maWxsX2J1ZmZlcihhZGV2LCAmam9i
LT5pYnNbMF0sIDAsIGRzdF9hZGRyLAorCQkJCQkJY3VyX3NpemVfaW5fcGFnZXMKKwkJCQkJCTw8
IFBBR0VfU0hJRlQpOworCQkJZHN0X2FkZHIgKz0gKHVpbnQ2NF90KWN1cl9zaXplX2luX3BhZ2Vz
IDw8IFBBR0VfU0hJRlQ7CisJCQlwYWdlX2NvdW50IC09IGN1cl9zaXplX2luX3BhZ2VzOworCQl9
CisJfQorCisJYW1kZ3B1X3JpbmdfcGFkX2liKHJpbmcsICZqb2ItPmlic1swXSk7CisJV0FSTl9P
Tihqb2ItPmlic1swXS5sZW5ndGhfZHcgPiBudW1fZHcpOworCXIgPSBhbWRncHVfam9iX3N1Ym1p
dChqb2IsICZhZGV2LT5tbWFuLmVudGl0eSwKKwkJCSAgICAgIEFNREdQVV9GRU5DRV9PV05FUl9V
TkRFRklORUQsIGZlbmNlKTsKKwlpZiAodW5saWtlbHkocikpCisJCWFtZGdwdV9qb2JfZnJlZShq
b2IpOworCisJcmV0dXJuIHI7Cit9CisKIC8qKgogICogYW1kZ3B1X3ZyYW1fbWdyX2RlbCAtIGZy
ZWUgcmFuZ2VzCiAgKgpAQCAtMzkwLDEwICs0NTksMzUgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Zy
YW1fbWdyX2RlbChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAlzdHJ1Y3QgZHJt
X21tX25vZGUgKm5vZGVzID0gbWVtLT5tbV9ub2RlOwogCXVpbnQ2NF90IHVzYWdlID0gMCwgdmlz
X3VzYWdlID0gMDsKIAl1bnNpZ25lZCBwYWdlcyA9IG1lbS0+bnVtX3BhZ2VzOworCXN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlOwogCiAJaWYgKCFtZW0tPm1tX25vZGUpCiAJCXJldHVybjsKIAorCWlm
IChub2Rlc1swXS5jb2xvciAmIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fU0VOU0lUSVZFKSB7CisJ
CWludCByID0gY2xlYXJfbWVtX3JlZyhhZGV2LCBtZW0sICZmZW5jZSk7CisKKwkJLyogRklYTUU6
IEl0IG1heSBiZSBiZXR0ZXIgdG8gbGVhayBtZW1vcnkgdGhhbiB0bworCQkgKiBhbGxvdyByZXVz
aW5nIGl0IHdpdGhvdXQgY2xlYXJpbmcuCisJCSAqLworCQlXQVJOX09OKHIpOworCisJCS8qIENs
ZWFyaW5nIG1lbW9yeSBoYXBwZW5zIGluIHRoZSBiYWNrZ3JvdW5kLiBCdXQgbmV3CisJCSAqIG1l
bW9yeSBjYW5ub3QgYmUgYWxsb2NhdGVkIHVudGlsIGNsZWFyaW5nIGlzCisJCSAqIGNvbXBsZXRl
ZC4gVXBkYXRlIHRoZSBtb3ZlIGZlbmNlIHRvIGVuc3VyZSB0aGF0LgorCQkgKi8KKwkJaWYgKCFy
ICYmIGZlbmNlKSB7CisJCQlzcGluX2xvY2soJm1hbi0+bW92ZV9sb2NrKTsKKwkJCWlmICghbWFu
LT5tb3ZlIHx8CisJCQkgICAgZG1hX2ZlbmNlX2lzX2xhdGVyKGZlbmNlLCBtYW4tPm1vdmUpKSB7
CisJCQkJZG1hX2ZlbmNlX3B1dChtYW4tPm1vdmUpOworCQkJCW1hbi0+bW92ZSA9IGRtYV9mZW5j
ZV9nZXQoZmVuY2UpOworCQkJfQorCQkJc3Bpbl91bmxvY2soJm1hbi0+bW92ZV9sb2NrKTsKKwkJ
CWRtYV9mZW5jZV9wdXQoZmVuY2UpOworCQl9CisJfQorCiAJc3Bpbl9sb2NrKCZtZ3ItPmxvY2sp
OwogCXdoaWxlIChwYWdlcykgewogCQlwYWdlcyAtPSBub2Rlcy0+c2l6ZTsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
