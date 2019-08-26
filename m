Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0A9D1DC
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 16:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2689F3B;
	Mon, 26 Aug 2019 14:45:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3102089F3B
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 14:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0HTFJgbWsUXgRzEXCg4TRoiGZLd0RU5UMlQ+RzX6SSsQ1f6YSkoea5q7lex6KUqN1R5ZORwhCjJdMleDB4DQjGMOni4Y5gLt/nqihA94t7UxaiDfOR34D1rPB4hM0k6WiW0nJcGq+SmSyvbLWpLoNe9NUkHZAtqupJOG9BxqiOFfiW1T9I8Ij/oCXIwZ76yA0d9Drl4TdRAGUMtT0s/O7OwPWtBm1YeAE0vTg5jkk0nMSgQmDFna05O+UwBFUIW05/brQbEzPKMAFPKP+qoizqinZLK6kx2ofErj71gpKddZuCcZc6+ZC0RYPSTdKng+DzJ6yPnKE4zTIupJHrE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7AIW8UvucDff8XhRrYQvVndt+1cWvVCYa9l0ekqGNY=;
 b=JgfsYMX4SwWPsAGGVKqsAkAHmMiHH9I2JWiMZYMGQcpGXiBQhh2YaxQBQyKLNxU3MnMHSh7FcPws2Qr7cN6XfUfsmmftoSKRZpCQNKAYLLmNWYGpXdmfjxKyS4zMDYuV8iAt9MZ9goBbkgbulsqjLWsC0VbWHTl69In1XVx/2AfujIewYU4IiuBBZJJoNkbvDNpgMB8emV0Olp1tV78D8RZO8AQ6y8CebsA5g5h6YOoUNw2NPC9yOcXIJc0iPcOjGGIC8x4NnJibGn84e1WmHUuol7Dl+5Fl2Es0siCzRJUa/f77WEh1Gvd5NKxTjE43FTDcERmmdu7BIn1LBooFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1250.namprd12.prod.outlook.com (10.168.224.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 14:45:28 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 14:45:28 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
Thread-Topic: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
Thread-Index: AQHVXBzm0unTcGqQPkiLxIxF/QkTGQ==
Date: Mon, 26 Aug 2019 14:45:28 +0000
Message-ID: <1566830720-20121-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3250690-afb9-4cbd-64a5-08d72a340901
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1250; 
x-ms-traffictypediagnostic: BN6PR12MB1250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB125061BAB0D2731E520EC419FFA10@BN6PR12MB1250.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:136;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(189003)(199004)(53936002)(6512007)(4326008)(25786009)(71200400001)(50226002)(5660300002)(2501003)(8676002)(81166006)(7736002)(81156014)(8936002)(256004)(71190400001)(14454004)(305945005)(3846002)(6116002)(2906002)(2616005)(476003)(99286004)(26005)(52116002)(6506007)(386003)(102836004)(478600001)(316002)(186003)(64756008)(66476007)(66556008)(2351001)(66446008)(66946007)(6486002)(6916009)(36756003)(66066001)(5640700003)(486006)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1250;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: STEOIdT4wnQ9mVFm5z9a6X8/0jQgyDIPEnMf2u7b11pByO2AGiRoOJh0z7yFS63bDmbgBgSKVaSizBEK9R1efVD6Cvm3+bu6KCV0/2TaxrQhBwGlr+bh8WeVdOYPlO5sSV3YZRjhaSvbEWcwICx6eNBBIlg/Z7mXkQTvyiVea7H5m0UKCBZIFDiL+s/ce158JPFFAEbOS7hwgK4mowFM/z8nFlJDOjXpZmDW0PEXnUwnAcXTeArL/sImX3bMmgEY7UuWh75oTxUVE7ORs80cJ01vsxiTL+pGXEMEY1B+JOm26d86o0Xr1hXlPBDI+2VzGzplR2jj03/iJbK+n3nQOl1kjcmOirItSjEIDhxDzhBfvZqUFKnuIyQBOVdtXzl31e6ngnzgtVTT2owFlI6KvZ2kMHKRIlijBK64DfkWtNU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3250690-afb9-4cbd-64a5-08d72a340901
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 14:45:28.1063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWQR5t/PvMaknPGgRS5lP4IWAB8mCDrbraplbF6dAoCW5KxJdwZ+gDo2B1MgG+Fm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7AIW8UvucDff8XhRrYQvVndt+1cWvVCYa9l0ekqGNY=;
 b=cj2f1gQIiy6kZOSN+ByzMOCAqnp0ErOlr2MvRvfULunXKW7sWJPBf0V5S/nchZ5W3rv+1tU74VWcCApi40CqFBPGqkH7HyMu/RvWZK4+hl3DmCCfrqEDSsxcfVkZYNoDCXCJBA7/i5zYgQTF89oHZ2AiUvSO+diQpzrCZCIG12g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA0ZjhiYzcyZmJmMTBmMmRjOGJjYTc0ZDVkYTA4YjNhOTgxYjJl
NWNkLgoKSXQgdHVybmVkIG91dCB0aGF0IGEgc2luZ2xlIHJlc2VydmVkIHF1ZXVlIHdvdWxkbid0
IGJlCnN1ZmZpY2llbnQgZm9yIHBhZ2UgZmF1bHQgaGFuZGxpbmcuCgpDaGFuZ2UtSWQ6IEk1Nzdi
YTIzNmUwNTcxZDExNDAwYTUxZjlkOTU4NDAyMzRhZWY2NzhhClNpZ25lZC1vZmYtYnk6IEdhbmcg
QmEgPGdhYmFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYyB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jCmluZGV4IGIzYjJjMjEuLjc3NTBiMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jCkBAIC0yNTAwLDggKzI1MDAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFt
ZGdwdV9idWZmZXJfZnVuY3Mgc2RtYV92NF8wX2J1ZmZlcl9mdW5jcyA9IHsKIHN0YXRpYyB2b2lk
IHNkbWFfdjRfMF9zZXRfYnVmZmVyX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
ewogCWFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzID0gJnNkbWFfdjRfMF9idWZmZXJfZnVuY3M7Ci0J
aWYgKGFkZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUgJiYgYWRldi0+c2RtYS5udW1faW5zdGFuY2Vz
ID4gMSkKLQkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2LT5zZG1hLmluc3Rh
bmNlWzFdLnBhZ2U7CisJaWYgKGFkZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUpCisJCWFkZXYtPm1t
YW4uYnVmZmVyX2Z1bmNzX3JpbmcgPSAmYWRldi0+c2RtYS5pbnN0YW5jZVswXS5wYWdlOwogCWVs
c2UKIAkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNl
WzBdLnJpbmc7CiB9CkBAIC0yNTIwLDIyICsyNTIwLDE1IEBAIHN0YXRpYyB2b2lkIHNkbWFfdjRf
MF9zZXRfdm1fcHRlX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXVuc2lnbmVk
IGk7CiAKIAlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9mdW5jcyA9ICZzZG1hX3Y0XzBfdm1fcHRl
X2Z1bmNzOwotCWlmIChhZGV2LT5zZG1hLmhhc19wYWdlX3F1ZXVlICYmIGFkZXYtPnNkbWEubnVt
X2luc3RhbmNlcyA+IDEpIHsKLQkJZm9yIChpID0gMTsgaSA8IGFkZXYtPnNkbWEubnVtX2luc3Rh
bmNlczsgaSsrKSB7CisJZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsg
aSsrKSB7CisJCWlmIChhZGV2LT5zZG1hLmhhc19wYWdlX3F1ZXVlKQogCQkJc2NoZWQgPSAmYWRl
di0+c2RtYS5pbnN0YW5jZVtpXS5wYWdlLnNjaGVkOwotCQkJYWRldi0+dm1fbWFuYWdlci52bV9w
dGVfcnFzW2kgLSAxXSA9Ci0JCQkJJnNjaGVkLT5zY2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlf
S0VSTkVMXTsKLQkJfQotCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRldi0+
c2RtYS5udW1faW5zdGFuY2VzIC0gMTsKLQkJYWRldi0+dm1fbWFuYWdlci5wYWdlX2ZhdWx0ID0g
JmFkZXYtPnNkbWEuaW5zdGFuY2VbMF0ucGFnZTsKLQl9IGVsc2UgewotCQlmb3IgKGkgPSAwOyBp
IDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKKwkJZWxzZQogCQkJc2NoZWQgPSAm
YWRldi0+c2RtYS5pbnN0YW5jZVtpXS5yaW5nLnNjaGVkOwotCQkJYWRldi0+dm1fbWFuYWdlci52
bV9wdGVfcnFzW2ldID0KLQkJCQkmc2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklPUklUWV9L
RVJORUxdOwotCQl9Ci0JCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX251bV9ycXMgPSBhZGV2LT5z
ZG1hLm51bV9pbnN0YW5jZXM7CisJCWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX3Jxc1tpXSA9CisJ
CQkmc2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklPUklUWV9LRVJORUxdOwogCX0KKwlhZGV2
LT52bV9tYW5hZ2VyLnZtX3B0ZV9udW1fcnFzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwog
fQogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lwX2Jsb2NrX3ZlcnNpb24gc2RtYV92NF8wX2lwX2Js
b2NrID0gewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
