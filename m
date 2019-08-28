Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2204A0062
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8B889B0C;
	Wed, 28 Aug 2019 11:00:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306E89B0C
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FK8p96n7cMotOsvoSf5UPAq0JA3Z/G2jpdhoGwyTSOl90vdxxIkJWZAgH1KOCmpel6sNqrFEjPrdwhXm4E5fU+dWP9VXPyr9gR2qlR6597rM+JywoP8W9z48hds5KQTogJnuW+yBaoKHYkJdAC0/WbzsBPu4GKYWMe6+92oVJ59UlB8hu7ykN267PSOK/x5sCrW04RTZpQWNolqoMaVqDkhg6DuEPq3pAhcHa3v9x5YiAv+PPJVnAjYBlEB4B9wBXPnhtCqhZE+JILOL3/vvFj+PrxmJNarHp9D6WSjl1ghLE56PgK4f+olgbpHFmEinsVSYeobIDwhFpW2s4StSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbzGjUFd7UCwVvoa3/w0/ASjS1g0tGQhnKkvORXOYs4=;
 b=hnwqWexDrIhzYeKYiMCRe3vzmP5JZjfJ0hVzvy2pKVD/BC7/yH9nf77sAt2ZKQqeXAXPfL8jS4t/hLrAEEiDCByGoxurvATt6lh+TjNbY9sFkE8MRelHUZVRZxhBAYkvvQHVunKr57zPqDxlVQUHkcRInZPdy8Wy/fzyyocckvx156K/PQ9mN6GVhkmzaR3YpABz+JPwhUcLKGYhuHB8blsEf+kaflRABCBQ9He5ZKZbzkDhuFluhlPidkBKZGVsDQzZCzbxct6Qle4JgH3bD1inLHwZURFdH9g5whXGfImuCiiZHivssDTPEDhIZSPKwnxCgoTwYB0lrClFrBX+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:301:4a::18) by DM6PR12MB2713.namprd12.prod.outlook.com
 (2603:10b6:5:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 28 Aug
 2019 11:00:34 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0008.outlook.office365.com
 (2603:10b6:301:4a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 11:00:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 11:00:32 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 06:00:29 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram region
Date: Wed, 28 Aug 2019 19:00:22 +0800
Message-ID: <1566990022-24240-2-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566990022-24240-1-git-send-email-tianci.yin@amd.com>
References: <1566990022-24240-1-git-send-email-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(199004)(189003)(86362001)(50466002)(48376002)(51416003)(2351001)(53936002)(305945005)(478600001)(16586007)(7696005)(70206006)(2906002)(5660300002)(54906003)(53416004)(76176011)(70586007)(4326008)(26005)(426003)(44832011)(486006)(6666004)(356004)(316002)(8936002)(36756003)(2616005)(50226002)(81166006)(81156014)(8676002)(47776003)(6916009)(186003)(126002)(446003)(11346002)(476003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db528208-5838-4fd3-cafe-08d72ba6f293
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2713A0A18AADBA42A74BB4E995A30@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /iJfyreVTUymJOWfVS1wtQcn39dgg4GMJftyFRY7/jVq+Qcts3Sah/FhHjgil42WkBT6t2OntUymNzSE4UzIGChwIhWcUgdoAjKIJY0s/lsqhKVGRtZGnc7RbE1+3nEMhqM7G5Wcm6/qwhRSY6eLvmuon81TTDhV9uOgucWycPdyXl2fJaJVskUyj59P/44PN/A4HqP4MfQ9kUqagtD0wiC4h3dCgV5Djns0bcLsa1sStBCz3iJM8WNauyc2Ys69V+77+vVuB9V9UjCmNdmPbV6wcX9ze1XCr44m4pRQDMK45KfD3OpzUyQ+VWslekPY46XfIcdQtmdFII/l8GsgrOEibKJf4jbLXMd51YD/poVzrjDQ72YVyeAUauk5GMEzjbrRuJ3O8erMYXvReXjKt9H3v+nSzC4AWBAGPsY00+A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 11:00:32.8610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db528208-5838-4fd3-cafe-08d72ba6f293
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbzGjUFd7UCwVvoa3/w0/ASjS1g0tGQhnKkvORXOYs4=;
 b=R1X1sn5edbN8Mw2+ijn7yVcYd2sGzayztBSteVlGS+I/fW/9bReFR7OwJhNsIfgp5Ye/wlz8HaXguXVFkkqc4/EZ7LeRKr0bwf1ll/ztl/H+lGB1tH9G/38T4vGoHc5jr2PXK6ozzc7zv/SYJ4K8lH8YmnUES54sJtKKQtzhjlA=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpzdG9sZW4gbWVtb3J5IHNo
b3VsZCBiZSBmaXhlZCBpbiB2aXNpYmxlIHJlZ2lvbi4KCkNoYW5nZS1JZDogSWNiYmJkMzlmZDEx
M2U5MzQyM2FhZDhkMjU1NWY0MDczYzA4MDIwZTUKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwg
NCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAyICstCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDExZTBmYzAuLmQxYThmODcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC04MTcsNiArODE3LDcgQEAgc3RydWN0IGFtZGdwdV9k
ZXZpY2UgewogCXVpbnQ4X3QJCQkJKmJpb3M7CiAJdWludDMyX3QJCQliaW9zX3NpemU7CiAJc3Ry
dWN0IGFtZGdwdV9ibwkJKnN0b2xlbl92Z2FfbWVtb3J5OworCXZvaWQJCQkJKnN0b2xlbl92Z2Ff
YnVmOwogCXVpbnQzMl90CQkJYmlvc19zY3JhdGNoX3JlZ19vZmZzZXQ7CiAJdWludDMyX3QJCQli
aW9zX3NjcmF0Y2hbQU1ER1BVX0JJT1NfTlVNX1NDUkFUQ0hdOwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggODAxZjkxMi4uNWFjOWE2NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtMTc4Nyw3ICsxNzg3LDcgQEAgaW50IGFt
ZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyID0gYW1kZ3B1X2Jv
X2NyZWF0ZV9rZXJuZWwoYWRldiwgYWRldi0+Z21jLnN0b2xlbl9zaXplLCBQQUdFX1NJWkUsCiAJ
CQkJICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCiAJCQkJICAgICZhZGV2LT5zdG9sZW5fdmdh
X21lbW9yeSwKLQkJCQkgICAgTlVMTCwgTlVMTCk7CisJCQkJICAgIE5VTEwsICZhZGV2LT5zdG9s
ZW5fdmdhX2J1Zik7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCURSTV9JTkZPKCJhbWRncHU6ICV1
TSBvZiBWUkFNIG1lbW9yeSByZWFkeVxuIiwKQEAgLTE4NTIsNyArMTg1Miw3IEBAIGludCBhbWRn
cHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB2b2lkIGFtZGdwdV90dG1f
bGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCS8qIHJldHVybiB0aGUg
VkdBIHN0b2xlbiBtZW1vcnkgKGlmIGFueSkgYmFjayB0byBWUkFNICovCi0JYW1kZ3B1X2JvX2Zy
ZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwgTlVMTCk7CisJYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwgJmFkZXYtPnN0
b2xlbl92Z2FfYnVmKTsKIH0KIAogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwppbmRleCBmNzcxMzhiLi42MDJkN2M3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTEyODAsNyArMTI4MCw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfc3dfZmluaSh2
b2lkICpoYW5kbGUpCiAJYW1kZ3B1X3ZtX21hbmFnZXJfZmluaShhZGV2KTsKIAogCWlmIChnbWNf
djlfMF9rZWVwX3N0b2xlbl9tZW1vcnkoYWRldikpCi0JCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgm
YWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsIE5VTEwpOworCQlhbWRncHVfYm9fZnJlZV9r
ZXJuZWwoJmFkZXYtPnN0b2xlbl92Z2FfbWVtb3J5LCBOVUxMLCAmYWRldi0+c3RvbGVuX3ZnYV9i
dWYpOwogCiAJYW1kZ3B1X2dhcnRfdGFibGVfdnJhbV9mcmVlKGFkZXYpOwogCWFtZGdwdV9ib19m
aW5pKGFkZXYpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
