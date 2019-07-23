Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF47155B
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8C48995F;
	Tue, 23 Jul 2019 09:39:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810054.outbound.protection.outlook.com [40.107.81.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD8890DF
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8dMJuyJOWqbjq2zDMJac/5nOdAxFIFTHnkqTYjcOBaIrjqaVrh7REeLm5qcHoTBuz930Ly1Cp3HVxDNJeHJi0umbwJ9PdSLJBKsT0IvMl396euHSCRGGi/MWiwV1Ne9nmSS1lnY0OXHZqm+qm7DLo1E1wA+tTmCyYrTSFRKLQqUBi51hCxQsppixyOFWuDayOPvnWrX4C3Uv1e8MSgRf1WACMFm0xBJQyGNwdmQWM/mrpRV07UQrZALEXIUzGwCljZEyEAYR67Nl0wkfgqBCe13Cvaoou7qKNqLyF8Dknh5JXafDMM43LDxjkZ0pfhLaXPg1ODqQoUBx8wy8WHhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMXM71R8RQ+cEONAQrXSYBcho0fntjPm+6yKRdMv1ZA=;
 b=ebBurD5+hAhDzSicPyFKcj1CCXgq0A8o0NOOLQemsJdzNGpOql9dbj4NXZsemEgI68tVJ6uBgGJz/pX787vCR8pq3K2D21yslDpSZU7Ooe8FVxlAJJazotZCXzndAOyXaMtzIZaQBgaDiQkTPr4OjDxhuqZMud912+YDszS0fk9vwdHsoUTq0CUNU1wSxHIIt5GXEF9Tc3aAVAZ3M/c97qCPiuQkh3JX1iloNOxsLWEXYeFaxwVsi/mRWcrJ3OGXKdRY1gPqX7PVDHyiap7ufr59t8ZlNPdn1LRBtg0HOK0Z46wN1k6VNAF238gO50PYa2WvRRsEzyETLfMtLIl8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN4PR12CA0013.namprd12.prod.outlook.com (2603:10b6:403:2::23)
 by BN6PR1201MB2483.namprd12.prod.outlook.com (2603:10b6:404:a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14; Tue, 23 Jul
 2019 09:39:19 +0000
Received: from BY2NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by BN4PR12CA0013.outlook.office365.com
 (2603:10b6:403:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Tue, 23 Jul 2019 09:39:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT049.mail.protection.outlook.com (10.152.85.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 09:39:18 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 23 Jul 2019
 04:39:17 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
Date: Tue, 23 Jul 2019 17:39:06 +0800
Message-ID: <1563874746-6318-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(53416004)(51416003)(478600001)(7696005)(186003)(126002)(50226002)(70206006)(476003)(36756003)(2616005)(5660300002)(81156014)(70586007)(47776003)(26005)(81166006)(8936002)(336012)(426003)(6916009)(486006)(4326008)(305945005)(86362001)(2351001)(16586007)(6666004)(356004)(50466002)(8676002)(316002)(68736007)(53936002)(44832011)(2906002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2483; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f74d670-32b9-472c-d4b6-08d70f51a26d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB2483; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2483:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB24835053D673F7B8ED76FAA28EC70@BN6PR1201MB2483.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7xS9yROqZGB6sy1LgQVsvNycHYvebA/HwwZQfvQf5PHwmrZTSg3fgtNx7v0cWL/lVIC8gLdx66wESpVI4QFSqx22WCNPwt6eixrfyEa1glc0dOJ3KapUQ6mBiWHUXUgUdce7gR/x44iRxakIdsr6kwBYHdaVkbNq2ufmf8tRBqL5QWrTQHDvNUGB4zQtX+iC+vGLdi4PWR4AsKTZs5VBo0vdOPweuZa2psRVahk3RRabLbjqGTB9J2NQ3dqwQA+kmPq2in7DauVnMVJ30lBQXCWYMcjey6zV5ZwRrqEG6R3Znlcn5AyvcE19UQIQQ/4JqA84+4pBiqS6ug1XlXon2FXH+FoCrBDtS74FJs7tCSg9kqYssjYmMoi7oMuvxrqVN2r1mdkjOKDr+9F6jLQGnPKK6WWXEkfMkjPgEqW3vTU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 09:39:18.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f74d670-32b9-472c-d4b6-08d70f51a26d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2483
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMXM71R8RQ+cEONAQrXSYBcho0fntjPm+6yKRdMv1ZA=;
 b=NdcGVcPT/EGrXe5fRbB3jpRY1ChJnRYlgxV266ufOu3D2sD2zWpFjkLJG039AZ1xcF3trb3pa5nfgmTB4SRQlngb7khXRaVc/LG/UffL+qlEAGWCzjygpsL//si6rhWfFr3OZSrsoaH+PO5EAHCfnRNoOmBmQ7J6csirLdgpTLY=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2hhbmdlIHRoZSBzbXVfcmVhZF9zZW5zb3Igc2VxdWVuY2UgdG86Cgphc2ljIHNwZWNpZmljIHNl
bnNvciByZWFkIC0+IHNtdSB2MTEgc3BlY2lmaWMgc2Vuc29yIHJlYWQgLT4gc211IHYxMSBjb21t
b24gc2Vuc29yIHJlYWQKClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5n
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
ICAgICB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3Nt
dS5oIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMg
ICAgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMg
ICAgICB8IDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9w
cHQuYyAgICAgfCA1ICsrKystCiA1IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
CmluZGV4IDQxNmY5YTguLjhmZjE4YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKQEAgLTMxNSw2ICszMTUsOSBAQCBpbnQgc211X2NvbW1vbl9yZWFkX3Nl
bnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3Is
CiB7CiAJaW50IHJldCA9IDA7CiAKKwlpZighZGF0YSB8fCAhc2l6ZSkKKwkJcmV0dXJuIC1FSU5W
QUw7CisKIAlzd2l0Y2ggKHNlbnNvcikgewogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9TVEFCTEVf
UFNUQVRFX1NDTEs6CiAJCSooKHVpbnQzMl90ICopZGF0YSkgPSBzbXUtPnBzdGF0ZV9zY2xrOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXgg
YjcwMmM5ZS4uZmFiYjM3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCkBAIC04MTksOSArODE5LDkgQEAgc3RydWN0IHNtdV9mdW5jcwogI2Rl
ZmluZSBzbXVfc3RhcnRfdGhlcm1hbF9jb250cm9sKHNtdSkgXAogCSgoc211KS0+ZnVuY3MtPnN0
YXJ0X3RoZXJtYWxfY29udHJvbD8gKHNtdSktPmZ1bmNzLT5zdGFydF90aGVybWFsX2NvbnRyb2wo
KHNtdSkpIDogMCkKICNkZWZpbmUgc211X3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBz
aXplKSBcCi0JKChzbXUpLT5mdW5jcy0+cmVhZF9zZW5zb3I/IChzbXUpLT5mdW5jcy0+cmVhZF9z
ZW5zb3IoKHNtdSksIChzZW5zb3IpLCAoZGF0YSksIChzaXplKSkgOiAwKQotI2RlZmluZSBzbXVf
YXNpY19yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSkgXAogCSgoc211KS0+cHB0
X2Z1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPnBwdF9mdW5jcy0+cmVhZF9zZW5zb3IoKHNtdSks
IChzZW5zb3IpLCAoZGF0YSksIChzaXplKSkgOiAwKQorI2RlZmluZSBzbXVfc21jX3JlYWRfc2Vu
c29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKSBcCisJKChzbXUpLT5mdW5jcy0+cmVhZF9zZW5z
b3I/IChzbXUpLT5mdW5jcy0+cmVhZF9zZW5zb3IoKHNtdSksIChzZW5zb3IpLCAoZGF0YSksIChz
aXplKSkgOiAtRUlOVkFMKQogI2RlZmluZSBzbXVfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzbXUs
IGJ1ZikgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5nZXRfcG93ZXJfcHJvZmlsZV9tb2RlID8gKHNt
dSktPnBwdF9mdW5jcy0+Z2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSgoc211KSwgYnVmKSA6IDApCiAj
ZGVmaW5lIHNtdV9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlKHNtdSwgcGFyYW0sIHBhcmFtX3NpemUp
IFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBjOGNl
OWJiLi42NDA5NzE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCkBAIC0xMzY2LDYgKzEzNjYsOSBAQCBzdGF0aWMgaW50IG5hdmkxMF9yZWFkX3NlbnNvcihz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxl
X2NvbnRleHQgPSAmc211LT5zbXVfdGFibGU7CiAJUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVf
Y29udGV4dC0+ZHJpdmVyX3BwdGFibGU7CiAKKwlpZighZGF0YSB8fCAhc2l6ZSkKKwkJcmV0dXJu
IC1FSU5WQUw7CisKIAlzd2l0Y2ggKHNlbnNvcikgewogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9N
QVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVtUnBt
OwpAQCAtMTM4Nyw3ICsxMzkwLDcgQEAgc3RhdGljIGludCBuYXZpMTBfcmVhZF9zZW5zb3Ioc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCSpzaXplID0gNDsKIAkJYnJlYWs7CiAJZGVmYXVsdDoK
LQkJcmV0dXJuIC1FSU5WQUw7CisJCXJldCA9IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5z
b3IsIGRhdGEsIHNpemUpOwogCX0KIAogCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IGUzYTE3ODQuLjUyNjdiNjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC0xMjY3LDYgKzEyNjcsMTAgQEAg
c3RhdGljIGludCBzbXVfdjExXzBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAJCQkJIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQogewogCWludCByZXQgPSAwOworCisJ
aWYoIWRhdGEgfHwgIXNpemUpCisJCXJldHVybiAtRUlOVkFMOworCiAJc3dpdGNoIChzZW5zb3Ip
IHsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfR0ZYX01DTEs6CiAJCXJldCA9IHNtdV9nZXRfY3Vy
cmVudF9jbGtfZnJlcShzbXUsIFNNVV9VQ0xLLCAodWludDMyX3QgKilkYXRhKTsKQEAgLTEyODks
MTAgKzEyOTMsNiBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKIAkJYnJlYWs7CiAJfQogCi0JLyogdHJ5IGdldCBzZW5zb3IgZGF0YSBi
eSBhc2ljICovCi0JaWYgKHJldCkKLQkJcmV0ID0gc211X2FzaWNfcmVhZF9zZW5zb3Ioc211LCBz
ZW5zb3IsIGRhdGEsIHNpemUpOwotCiAJaWYgKHJldCkKIAkJKnNpemUgPSAwOwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOWVhZDM2MS4uZTg2NGE1
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwpAQCAtMzE2
Myw2ICszMTYzLDkgQEAgc3RhdGljIGludCB2ZWdhMjBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCiAJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0g
JnNtdS0+c211X3RhYmxlOwogCVBQVGFibGVfdCAqcHB0YWJsZSA9IHRhYmxlX2NvbnRleHQtPmRy
aXZlcl9wcHRhYmxlOwogCisJaWYoIWRhdGEgfHwgIXNpemUpCisJCXJldHVybiAtRUlOVkFMOwor
CiAJc3dpdGNoIChzZW5zb3IpIHsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06
CiAJCSoodWludDMyX3QgKilkYXRhID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKQEAgLTMxODYs
NyArMzE4OSw3IEBAIHN0YXRpYyBpbnQgdmVnYTIwX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LAogCQkqc2l6ZSA9IDQ7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0JCXJldHVybiAt
RUlOVkFMOworCQlyZXQgPSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBz
aXplKTsKIAl9CiAKIAlyZXR1cm4gcmV0OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
