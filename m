Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D8BC0C7
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 05:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4286E9EB;
	Tue, 24 Sep 2019 03:39:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249306E9EA
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 03:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6kvfj4ua0qZiozBJErSyqRsr9z/rxhJyfyYGlE31HH7/8myqpGnHjHEn+oCmo03F84Q3IcAAx0Zg+FQvlMhDBWUITm/a3rlqtcaZRxFZxF0vpYXpJT9yAV1NklhtQz/rBmYXjLxoHsDqjDTymBD6hCto8Lxk0nq5cOHbAUaXUABB0ZCY/r2T4VjgNp2nMaEbGNtXjPPE3VkVeaLb0oZR/ZSpqtkVuoR0zqr9MSjYAQtO6ITFogCUHlTli5l/x4qIjbmrbqyEhm9WIZyakkLYf9YqETQPREYXYX/3Dcv3bzQZAjuAcHVcUwr41FknIx2n7yl9NWqMCOdzanFbwwyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Pe+SlST3F9I9gACGc0IxWD6Gw9P75aNunKWZA3Q2q0=;
 b=MK0ghzjkEP8WXJ1FONifQDa/Fvz7jrDpTHCtqZEVkACT4PjP+M+hp6WWQ/J/DKpmXKEgWuyPbYNTk/e92G9dkkYdbfxwWphfZUl0vDu9XRKkB6jpPDlZwy/a/AOxSGrw7X4rqV0nFlkAYkK8jzlSggQrQKmTHHbGIETMkVmZUvn5aq9KRxZ/riRrqDOOF6zUGVUSRABItCI/LJv0DvDlXmLMBz0pY6vYCI6Tk9pMlx2tD6Cy+MOrPkMtKiJZo1CiRpnPj8pYPlUyc3LRs2/vHn2PegMTcETv9QGb9s/NLXvUY6AvC3GtJ1bFfncf6rW4LfPL6000ELE5mDojNVr/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:910:16::34) by CH2PR12MB4053.namprd12.prod.outlook.com
 (2603:10b6:610:7c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Tue, 24 Sep
 2019 03:38:57 +0000
Received: from BY2NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by CY4PR1201CA0024.outlook.office365.com
 (2603:10b6:910:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Tue, 24 Sep 2019 03:38:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT036.mail.protection.outlook.com (10.152.85.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 03:38:56 +0000
Received: from monk-build.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 23 Sep 2019
 22:38:56 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix an UMC hw arbitrator bug
Date: Tue, 24 Sep 2019 11:38:53 +0800
Message-ID: <1569296333-5386-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(428003)(199004)(189003)(36756003)(81166006)(81156014)(50466002)(486006)(2906002)(476003)(2616005)(70586007)(50226002)(70206006)(8936002)(2351001)(86362001)(14444005)(48376002)(426003)(8676002)(126002)(47776003)(6666004)(356004)(478600001)(7696005)(51416003)(16586007)(26005)(4326008)(336012)(5660300002)(186003)(316002)(6916009)(305945005)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4053; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 320d4d99-2a61-47d4-3c99-08d740a0babf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB4053; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4053:
X-Microsoft-Antispam-PRVS: <CH2PR12MB405357266B3184F8024DF10784840@CH2PR12MB4053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0170DAF08C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Ehxjwnm+vIwSfIfDQ0MstxmRCgh53f64RNbzaLGYL9qI8NTGV46HagH9P/gxcROfy2ZlDxHzFjr6tUkLmgzjfV8xp7d1SkUcZFTUV4CvhetuXzIVlnUs+nNvLCYMeEDVWFiItwlgproEHfEsdUK9KeYuUxqk0IVoXuXJntAuw4FdR5fMATGzSPGmRF9M4V18hWiSpt45LUDw/qHitjz20uvB4DmhJEg3/8HoLqs+T1DPEKuX2Aspp6SDq040qYcGr/jVIXHpo05+mU8q6rkm6nQZFg/+XsHxS1mWRz2fFBhTcRAYfBLxjHpfLd44Ymgs6uPCgJvZKQoV/i9Ot4Aq/BvXMWevqszuvEhodPZ4Jqu5K1Ry14qGzQHLe7vjNPRfLhixd84Ctu2ZCK/4QXAm9sr+gZolJlXY74mr+Yqbtwc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 03:38:56.6683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320d4d99-2a61-47d4-3c99-08d740a0babf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Pe+SlST3F9I9gACGc0IxWD6Gw9P75aNunKWZA3Q2q0=;
 b=uTU4jeCJFslojmindwYvnZirVkPR+ij1e8XLl2YKgJlfdDWHcOFlDnfxy3D0Qht09gPWiS0sztMBnroVTaQsrBWabZRt14VCEh7DAy9OK/whL+wD7YYUVifV8acss/4j/jsNpUC0nR8rKCd4gdhF7qUu8dsaBWMwS+Dw0VXWXKg=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aXNzdWU6CnRoZSBVTUMgaC93IGJ1ZyBpcyB0aGF0IHdoZW4gTUNMSyBpcyBkb2luZyB0aGUgc3dp
dGNoCmluIHRoZSBtaWRkbGUgb2YgYSBwYWdlIGFjY2VzcyBiZWluZyBwcmVlbXB0ZWQgYnkgaGln
aApwcmlvcml0eSBjbGllbnQgKGUuZy4gRElTUExBWSkgdGhlbiBVTUMgYW5kIHRoZSBtY2xrIHN3
aXRjaAp3b3VsZCBzdHVjayB0aGVyZSBkdWUgdG8gZGVhZGxvY2sKCmhvdzoKZml4ZWQgYnkgZGlz
YWJsaW5nIGF1dG8gUHJlQ2hnIGZvciBVTUMgdG8gYXZvaWQgaGlnaApwcmlvcml0eSBjbGllbnQg
cHJlZW1wdGluZyBvdGhlciBjbGllbnQncyBhY2Nlc3Mgb24KdGhlIHNhbWUgcGFnZSwgdGh1cyB0
aGUgZGVhZGxvY2sgY291bGQgYmUgYXZvaWRlZAoKU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1v
bmsuTGl1QGFtZC5jb20+CkNoYW5nZS1JZDogSWFmNmViMmEyMGE0Nzg1ZWM4NDQwZTY0ZDVlMGNh
ZTY3YWEwNjAzZGEKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwg
MTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDYxMDJkZWEuLjgyNzFiMGMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtMTMwNiw2ICsxMzA2LDI0
IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZ2FydF9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCSAodW5zaWduZWQpKGFkZXYtPmdtYy5nYXJ0X3NpemUgPj4gMjApLAogCQkgKHVu
c2lnbmVkIGxvbmcgbG9uZylhbWRncHVfYm9fZ3B1X29mZnNldChhZGV2LT5nYXJ0LmJvKSk7CiAJ
YWRldi0+Z2FydC5yZWFkeSA9IHRydWU7CisKKwkvKiBkaXNhYmxlIGF1dG8gUGNoZyBpcyBhIHcv
YSBmb3IgdGhlIHZlZ2ExMCBVTUMgaGFyZHdhcmUgYnVnICovCisJV1JFRzMyKDB4NTAxMGMvNCwg
MHgxMDAyKTsKKwlXUkVHMzIoMHg1MjEwYy80LCAweDEwMDIpOworCVdSRUczMigweDU0MTBjLzQs
IDB4MTAwMik7CisJV1JFRzMyKDB4NTYxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgxNTAxMGMv
NCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgxNTIxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgxNTQx
MGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgxNTYxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgy
NTAxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgyNTIxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIo
MHgyNTQxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgyNTYxMGMvNCwgMHgxMDAyKTsKKwlXUkVH
MzIoMHgzNTAxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgzNTIxMGMvNCwgMHgxMDAyKTsKKwlX
UkVHMzIoMHgzNTQxMGMvNCwgMHgxMDAyKTsKKwlXUkVHMzIoMHgzNTYxMGMvNCwgMHgxMDAyKTsK
IAlyZXR1cm4gMDsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
