Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3271B183
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 09:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A5E89736;
	Mon, 13 May 2019 07:53:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C8B89736
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 07:53:15 +0000 (UTC)
Received: from BN8PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:60::36)
 by SN6PR12MB2670.namprd12.prod.outlook.com (2603:10b6:805:6f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Mon, 13 May
 2019 07:53:12 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0023.outlook.office365.com
 (2603:10b6:408:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.22 via Frontend
 Transport; Mon, 13 May 2019 07:53:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 07:53:11 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 02:53:09 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/powerplay: drop unnecessary sw smu check
Date: Mon, 13 May 2019 15:53:00 +0800
Message-ID: <20190513075302.10731-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(2351001)(68736007)(356004)(72206003)(6666004)(36756003)(316002)(426003)(1076003)(2616005)(478600001)(48376002)(476003)(486006)(50466002)(336012)(44832011)(126002)(2906002)(47776003)(53416004)(8676002)(26005)(6916009)(51416003)(7696005)(53936002)(70206006)(70586007)(4326008)(2870700001)(77096007)(5660300002)(14444005)(305945005)(8936002)(50226002)(81156014)(186003)(81166006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2670; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e6a6c1-b7f6-4134-8088-08d6d7780bf7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN6PR12MB2670; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2670:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2670DB70A392558A8EAD49B6E40F0@SN6PR12MB2670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Xm7l+tuEOSNaxAsk6/IsPprd75f0P/0Pr4uWrN6S/19EeODq/Y6VL31NkY9Bv6uCA0+hJaMttmfl+iA9FULO8vKOYF+nwSZ/sdP+KihUCxWJhxKI8Nj80Gc3U44vGWf6P/08qY1WRk2l1hIG+AxvFuDkoyKb6ahwfdizQLctmEg/Ayj+aSLxEFvqTjtwXcXgUGGPsyY2ivOjXxfYrG6ZYqJvUt8WqaTOb2PvWyhcD0phxxU4qvKMHbILPamjK73xQJwNKZl0RpzG+W1Gjcse6FBZQxgfPwrKpi4DPiYu1f0Hu3VHCsrhlwTEiaJq1aoJTY+QuZivUoUXppT/OMmo5gwAUVf4Oy9vzaXqw+aHKs6Dal3xWUGUqUiPpDESgyboFKgLv/Rmj1n84XeeNcMNINyT1LPqaRU01g5CP2NENbI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 07:53:11.3939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e6a6c1-b7f6-4134-8088-08d6d7780bf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAkkO8in5NSs8mhn8MQM7b9gT/y/ZY4zpQd1xq5PzdI=;
 b=4Kv9iIQlaredhR0h0IHa8ZsGgM0snoUMxMmr44ACOB/KwYVgoSLMOxMOQa4+HqRG+LZP5zRXDnKb/kuGWm4erAkKXNP5IjQzFfDtWHbtObPlM3JP1TAJRqp1ST/HNLB12C5Ou7tjL7mU9Wstep5rQ3mGNkSWX8ubu31pKMWMaOk=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYWxyZWFkeSBzdyBzbXUgY2hlY2sgb24gSVAgYmxvY2sgYWRkaW5nLgoKQ2hhbmdl
LUlkOiBJMDcwMjkwZjRmZDdhY2IyYzQyNWU4ZmRlZDU2OTZkNGFjOWU4MGVkOApTaWduZWQtb2Zm
LWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYwppbmRleCA1MmQ5MTlhOGI3MGEuLmVkODg0MDAyNmU1OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtNDM2LDkgKzQzNiw2IEBA
IHN0YXRpYyBpbnQgc211X3N3X2luaXQodm9pZCAqaGFuZGxlKQogCXN0cnVjdCBzbXVfY29udGV4
dCAqc211ID0gJmFkZXYtPnNtdTsKIAlpbnQgcmV0OwogCi0JaWYgKCFpc19zdXBwb3J0X3N3X3Nt
dShhZGV2KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlzbXUtPnBvb2xfc2l6ZSA9IGFkZXYtPnBt
LnNtdV9wcnZfYnVmZmVyX3NpemU7CiAJc211LT5zbXVfZmVhdHVyZS5mZWF0dXJlX251bSA9IFNN
VV9GRUFUVVJFX01BWDsKIAltdXRleF9pbml0KCZzbXUtPnNtdV9mZWF0dXJlLm11dGV4KTsKQEAg
LTQ5MCw5ICs0ODcsNiBAQCBzdGF0aWMgaW50IHNtdV9zd19maW5pKHZvaWQgKmhhbmRsZSkKIAlz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7CiAJaW50IHJldDsKIAotCWlmICgh
aXNfc3VwcG9ydF9zd19zbXUoYWRldikpCi0JCXJldHVybiAtRUlOVkFMOwotCiAJcmV0ID0gc211
X3NtY190YWJsZV9zd19maW5pKHNtdSk7CiAJaWYgKHJldCkgewogCQlwcl9lcnIoIkZhaWxlZCB0
byBzdyBmaW5pIHNtYyB0YWJsZSFcbiIpOwpAQCAtODE4LDkgKzgxMiw2IEBAIHN0YXRpYyBpbnQg
c211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
KHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCXN0cnVjdCBzbXVfY29udGV4dCAqc211
ID0gJmFkZXYtPnNtdTsKIAotCWlmICghaXNfc3VwcG9ydF9zd19zbXUoYWRldikpCi0JCXJldHVy
biAtRUlOVkFMOwotCiAJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSAhPSBBTURHUFVfRldf
TE9BRF9QU1ApIHsKIAkJcmV0ID0gc211X2xvYWRfbWljcm9jb2RlKHNtdSk7CiAJCWlmIChyZXQp
CkBAIC04NzksOSArODcwLDYgQEAgc3RhdGljIGludCBzbXVfaHdfZmluaSh2b2lkICpoYW5kbGUp
CiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+c211X3Rh
YmxlOwogCWludCByZXQgPSAwOwogCi0JaWYgKCFpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKLQkJ
cmV0dXJuIC1FSU5WQUw7Ci0KIAlrZnJlZSh0YWJsZV9jb250ZXh0LT5kcml2ZXJfcHB0YWJsZSk7
CiAJdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGUgPSBOVUxMOwogCkBAIC05MzYsOSArOTI0
LDYgQEAgc3RhdGljIGludCBzbXVfc3VzcGVuZCh2b2lkICpoYW5kbGUpCiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAJc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OwogCi0JaWYgKCFpc19zdXBwb3J0X3N3X3Nt
dShhZGV2KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlyZXQgPSBzbXVfc3lzdGVtX2ZlYXR1cmVz
X2NvbnRyb2woc211LCBmYWxzZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKQEAgLTk1NCw5
ICs5MzksNiBAQCBzdGF0aWMgaW50IHNtdV9yZXN1bWUodm9pZCAqaGFuZGxlKQogCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwogCXN0
cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKIAotCWlmICghaXNfc3VwcG9ydF9z
d19zbXUoYWRldikpCi0JCXJldHVybiAtRUlOVkFMOwotCiAJcHJfaW5mbygiU01VIGlzIHJlc3Vt
aW5nLi4uXG4iKTsKIAogCW11dGV4X2xvY2soJnNtdS0+bXV0ZXgpOwotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
