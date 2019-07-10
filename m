Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF3264460
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 11:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405789468;
	Wed, 10 Jul 2019 09:29:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800085.outbound.protection.outlook.com [40.107.80.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220989244
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 09:29:39 +0000 (UTC)
Received: from MWHPR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:301:4a::24) by BN6PR12MB1185.namprd12.prod.outlook.com
 (2603:10b6:404:1e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Wed, 10 Jul
 2019 09:29:38 +0000
Received: from DM3NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR1201CA0014.outlook.office365.com
 (2603:10b6:301:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Wed, 10 Jul 2019 09:29:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT023.mail.protection.outlook.com (10.152.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 09:29:37 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 10 Jul 2019
 04:29:36 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Fix the memory delay free issue
Date: Wed, 10 Jul 2019 17:29:31 +0800
Message-ID: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(126002)(478600001)(7696005)(356004)(186003)(16586007)(70206006)(8676002)(70586007)(486006)(476003)(48376002)(50466002)(51416003)(81166006)(2616005)(4326008)(47776003)(426003)(5660300002)(6666004)(316002)(305945005)(336012)(86362001)(26005)(68736007)(6916009)(50226002)(81156014)(14444005)(2906002)(53936002)(8936002)(2351001)(53416004)(36756003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1185; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f1b0d49-b6c7-4f57-472a-08d70519208a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1185; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1185:
X-Microsoft-Antispam-PRVS: <BN6PR12MB118585E307E2B8362FDCE7B78FF00@BN6PR12MB1185.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gwXc33jxHbjhriSaUaAJHTrpLQ3vLCBP+PUgYW6YLs6KKBIZ94DqfRcwL4ThHu70VfDT8RFU4UQFikJZTNbfPVtjc5huhXZWCEW3XJYWC/ENZV99eVcWNHYIs7J2xD66p0MsPWG5JVnP2A+wzsvkNgbe5GTbdfgiOCSGcvyiD6quqgEWLtWkgYV5rH62BiD0e4wuP5HVPFEhRzTEFAFywuGvlfrKDuHaX1cuSUV3Y9rub0PiqFLbLtGU25jpeuVvjIPUxw19XMoKfuQZce46NFsFWuGnPRW8nUQeSn2GbtnCy4h8CeTiS4XaC+IOIsgeaLbOgDcm80EEefHr5sqVafece9OZOHSVOHp+2PfJM5g34bYPgpbIaIimnSEJx+TlUQ2kcH7HuqatQ+ujQQGNNb0dxJh9y64jYygVzz6Y9XU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 09:29:37.3438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1b0d49-b6c7-4f57-472a-08d70519208a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1185
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXZRdXn74Tu5iuRwt20/v5sr6YVdQIXINk8OqhxCD3A=;
 b=XMMVvfaBRUr3PiQBAyVFHjKgtTWwI1xBPSkh2zHAEgK90I08wzQlgb6IAiuuk0XrE25OOGX+yDYG0j2JDjQbtosdUhNBgRmVnBn8q5tnDq4G1SaL5WqJ5HYOW5dho3IiUFCuoG27SdKKxdJS7TESUSRUnb2LTwwJHCVN4kyNoV4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHZ1bGthbiBjdHMgYWxsb2NhdGlvbiB0ZXN0IGNhc2VzLCB0aGV5IHdpbGwgY3JlYXRlIGEg
c2VyaWVzIG9mIGJvcywgYW5kIHRoZW4gZnJlZQp0aGVtLiBBcyBpdCBoYXMgbG90cyBvZiBhbGxv
Y3Rpb24gdGVzdCBjYXNlcyB3aXRoIHRoZSBzYW1lIHZtLCBhcyBwZXIgdm0KYm8gZmVhdHVyZSBl
bmFibGUsIGFsbCBvZiB0aG9zZSBib3MnIHJlc3YgYXJlIHRoZSBzYW1lLiBCdXQgdGhlIGJvIGZy
ZWUgaXMgcXVpdGUgc2xvdywKYXMgdGhleSB1c2UgdGhlIHNhbWUgcmVzdiBvYmplY3QsIGZvciBl
dmVyeSB0aW1lLCBmcmVlIGEgYm8sCml0IHdpbGwgY2hlY2sgdGhlIHJlc3Ygd2hldGhlciBzaWdu
YWwsIGlmIGl0IHNpZ25hbCwgdGhlbiB3aWxsIGZyZWUgaXQuIEJ1dAphcyB0aGUgdGVzdCBjYXNl
cyB3aWxsIGNvbnRpbnVlIHRvIGNyZWF0ZSBibywgYW5kIHRoZSByZXN2IGZlbmNlIGlzIGluY3Jl
YXNpbmcuIFNvIHRoZQpmcmVlIGlzIG1vcmUgc2xvd2VyIHRoYW4gY3JlYXRpbmcuIEl0IHdpbGwg
Y2F1c2UgbWVtb3J5IGV4aGF1c3RpbmcuCgpNZXRob2Q6CldoZW4gdGhlIHJlc3Ygc2lnbmFsLCBy
ZWxlYXNlIGFsbCB0aGUgYm9zIHdoaWNoIGFyZSB1c2UgdGhlIHNhbWUKcmVzdiBvYmplY3QuCgpT
aWduZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwppbmRleCBmOWEzZDRjLi41N2VjNTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAg
LTU0Myw2ICs1NDMsNyBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIHsKIAlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJv
LT5iZGV2LT5nbG9iOwogCXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJlc3Y7CisJc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpyZXN2X2JvLCAqcmVzdl9ib19uZXh0OwogCWludCByZXQ7CiAK
IAlpZiAodW5saWtlbHkobGlzdF9lbXB0eSgmYm8tPmRkZXN0cm95KSkpCkBAIC01NjYsMTAgKzU2
NywxNCBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibywKIAkJCQkJCQkgICBpbnRlcnJ1cHRpYmxlLAogCQkJCQkJCSAgIDMwICogSFop
OwogCi0JCWlmIChscmV0IDwgMCkKKwkJaWYgKGxyZXQgPCAwKSB7CisJCQlrcmVmX3B1dCgmYm8t
Pmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7CiAJCQlyZXR1cm4gbHJldDsKLQkJZWxz
ZSBpZiAobHJldCA9PSAwKQorCQl9CisJCWVsc2UgaWYgKGxyZXQgPT0gMCkgeworCQkJa3JlZl9w
dXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOwogCQkJcmV0dXJuIC1FQlVT
WTsKKwkJfQogCiAJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogCQlpZiAodW5sb2NrX3Jl
c3YgJiYgIWtjbF9yZXNlcnZhdGlvbl9vYmplY3RfdHJ5bG9jayhiby0+cmVzdikpIHsKQEAgLTU4
Miw2ICs1ODcsNyBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywKIAkJCSAqIGhlcmUuCiAJCQkgKi8KIAkJCXNwaW5fdW5sb2NrKCZn
bG9iLT5scnVfbG9jayk7CisJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVh
c2VfbGlzdCk7CiAJCQlyZXR1cm4gMDsKIAkJfQogCQlyZXQgPSAwOwpAQCAtNTkxLDE1ICs1OTcs
MjkgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCiAJCWlmICh1bmxvY2tfcmVzdikKIAkJCWtjbF9yZXNlcnZhdGlvbl9vYmplY3Rf
dW5sb2NrKGJvLT5yZXN2KTsKIAkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKKwkJa3Jl
Zl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOwogCQlyZXR1cm4gcmV0
OwogCX0KIAogCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwogCWxpc3RfZGVsX2luaXQoJmJvLT5k
ZGVzdHJveSk7CiAJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWZfYnVnKTsKLQog
CXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7CiAJdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91
c2UoYm8pOworCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsK
KworCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShyZXN2X2JvLCByZXN2X2JvX25leHQsICZiby0+YmRldi0+ZGRlc3Ryb3ksIGRkZXN0cm95KSB7
CisJCWlmIChyZXN2X2JvLT5yZXN2ID09IGJvLT5yZXN2KSB7CisJCQl0dG1fYm9fZGVsX2Zyb21f
bHJ1KHJlc3ZfYm8pOworCQkJbGlzdF9kZWxfaW5pdCgmcmVzdl9iby0+ZGRlc3Ryb3kpOworCQkJ
c3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKKwkJCXR0bV9ib19jbGVhbnVwX21lbXR5cGVf
dXNlKHJlc3ZfYm8pOworCQkJa3JlZl9wdXQoJnJlc3ZfYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3Jl
bGVhc2VfbGlzdCk7CisJCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKKwkJfQorCX0KKwlz
cGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogCiAJaWYgKHVubG9ja19yZXN2KQogCQlrY2xf
cmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVzdik7CkBAIC02MzksOSArNjU5LDggQEAg
c3RhdGljIGJvb2wgdHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCBib29sIHJlbW92ZV9hbGwpCiAJCQl0dG1fYm9fY2xlYW51cF9yZWZzKGJvLCBmYWxzZSwg
IXJlbW92ZV9hbGwsIHRydWUpOwogCQl9IGVsc2UgewogCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxy
dV9sb2NrKTsKKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0
KTsKIAkJfQotCi0JCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0
KTsKIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7CiAJfQogCWxpc3Rfc3BsaWNlX3RhaWwo
JnJlbW92ZWQsICZiZGV2LT5kZGVzdHJveSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
