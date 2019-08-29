Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13205A1B79
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4256E116;
	Thu, 29 Aug 2019 13:31:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812E86E118
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYrOfpzOD743UdJy8i6TqdkfWt84h0YYAUpjgCJR/WjCqjPM5caW+92DGpAy7Z3iGJ1E6gVfh8/aPefNNsPFilomdu6H6DpHQxIHjfikWijOEpWKvjfECBbsV0Nuj1fbNAoV7f4gflWEKeU6ez/Loh/imSRupk4y50g7JR+l9VUGtjVDkdtUFCWorSvrXWt6LFN1HaJDYz0ZmkPqGqXnCmXr+AbuodlFfQ73PYD/awDf5IGw1MudBbNw44ZVbYIsPXpOkTWVcjE7SiGiuSM1KeS3GofNtq0RmgYjtKDGEPygK4oWIX94jd4vW/ZlbbPdw79Ae2fJ9wZROcRvxKjEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdX8JZmhH6Gs5e1wwRRVrsBHbmOYsQL9hPxywpB1yHc=;
 b=ECkTi87vqGHPcbud2ac4jLYhOB/xBfV2PLknooks61nGrSE40uUPpF40NRaW/xqD67sBbF6rPL0cM8OEHHDU/ZK6qgTgwPGgES3GvGlV9l5uPX8LXePQYxAvUCie1GdXitdozlhTdRsjwD/1+gzn+bxH+lbaiGO/mYz9hiUpPv59Q951ZUCMIcvuzE4lVWBYM85dsWF7x6NK3lUU0CFb3Iuzi2PGc5EaXc6KwCAHLTcKS+Gg7FRxUmwOMGRgiVmFIpqLqVFsknH9WXMSMLF+CQ+wpoMOg4t4fvgLHNNKQ+t7BOFSo6R9MFCSgPAyQaGPjJb7cZpPWG0IRpsoYbm+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0047.namprd12.prod.outlook.com (2603:10b6:405:70::33)
 by BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 13:31:18 +0000
Received: from BY2NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN6PR12CA0047.outlook.office365.com
 (2603:10b6:405:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Thu, 29 Aug 2019 13:31:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT013.mail.protection.outlook.com (10.152.84.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:31:17 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:31:16 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for nbio
 v7_4 (v3)
Date: Thu, 29 Aug 2019 21:30:31 +0800
Message-ID: <1567085432-27452-6-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(189003)(199004)(5660300002)(86362001)(47776003)(6666004)(356004)(478600001)(16586007)(2906002)(6636002)(70586007)(316002)(70206006)(110136005)(50466002)(48376002)(53416004)(36756003)(4326008)(305945005)(8936002)(53936002)(186003)(26005)(51416003)(81156014)(50226002)(81166006)(76176011)(476003)(2616005)(11346002)(446003)(7696005)(126002)(486006)(426003)(336012)(8676002)(21314003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a18ff0-f7b9-453f-cc6d-08d72c852c11
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB270594ABE0D12448703A1A8FFCA20@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pE9acL7ctWNBQNazhedGY+ponObAK9BLVaNaPG6wpvCSOmgWCH1BkgWBlYDILRJz+ee4gvvKBgIJeorGcSxLbc26M0v4bj5sbl1mzEOGZQPs/wIM4qllW26wqocZXierZEJr7h70UntnXBQllIaBwINf/nOdLjAKvFtC0okfEFeR15Rlj9qpDkAdg0s8Zi4WfDhMkchfQGCT3dMhUMDU3aBEblikftF6BIc430bYLcHdueOpDlTWGFUnJGL73LlBxdCnS5ggd0dcNBwIoqlyKtTXu/KkBBEWz1OEdVvpblSXgpqsQTiyVmm4Y1ESId2Sz8hwsiGTWtEodeyLzwHfWt/RnqQ2q+B1kcIvv1jd0bJUsrvWCOwh2gZe5IoDFdy7LHpjh8qtyISI955LZSoEv9I5+H6lQpTLvJ3SREafgg4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:31:17.6369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a18ff0-f7b9-453f-cc6d-08d72c852c11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdX8JZmhH6Gs5e1wwRRVrsBHbmOYsQL9hPxywpB1yHc=;
 b=hNRvnZwOFaP0Q+QVz0BwILooCFkY9oVjb3nvDd0mouDfNqXVIgGRNcMFvGaiH1vRs7nm0A4daZB0rNQ4zqsBEOXfP6u8dZTc4pLNvgFXPcFegERRpUfkdwmhdMn9p3rvqEQh697v/3/UoxJhqyo3OJuPeKMNoS/AEfqX+8I4V28=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmFzX2xhdGVfaW5pdCBjYWxsYmFjayBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gZG8gY29tbW9u
IHJhcwppbml0IGluIGxhdGUgaW5pdCBwaGFzZS4KCnYyOiBjYWxsIHJhc19sYXRlX2ZpbmkgdG8g
ZG8gY2xlYW51cCB3aGVuIGZhaWxzIHRvIGVuYWJsZSBpbnRlcnJ1cHQKCnYzOiByZW5hbWUgc3lz
ZnMvZGVidWdmcyBub2RlIG5hbWUgdG8gcGNpZV9iaWZfeHh4CgpTaWduZWQtb2ZmLWJ5OiBIYXdr
aW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X25iaW8uaCB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9uYmlvX3Y3XzQuYyAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbmJpby5oCmluZGV4IGEwNGM1ZWEuLjUxMDc4ZGE2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKQEAgLTgxLDEyICs4MSwxNCBAQCBzdHJ1Y3QgYW1k
Z3B1X25iaW9fZnVuY3MgewogCXZvaWQgKCpoYW5kbGVfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRy
X25vX2JpZnJpbmcpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAlpbnQgKCppbml0X3Jh
c19jb250cm9sbGVyX2ludGVycnVwdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCWlu
dCAoKmluaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQpKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsKKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7CiB9OwogCiBzdHJ1Y3QgYW1kZ3B1X25iaW8gewogCWNvbnN0IHN0cnVjdCBuYmlvX2hk
cF9mbHVzaF9yZWcgKmhkcF9mbHVzaF9yZWc7CiAJc3RydWN0IGFtZGdwdV9pcnFfc3JjIHJhc19j
b250cm9sbGVyX2lycTsKIAlzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgcmFzX2Vycl9ldmVudF9hdGh1
Yl9pcnE7CisJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZjsKIAljb25zdCBzdHJ1Y3QgYW1k
Z3B1X25iaW9fZnVuY3MgKmZ1bmNzOwogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzQuYwppbmRleCBmYWY5MzAwLi41ZTc4NGJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9uYmlvX3Y3XzQuYwpAQCAtMjMsNiArMjMsNyBAQAogI2luY2x1ZGUgImFtZGdwdS5oIgogI2lu
Y2x1ZGUgImFtZGdwdV9hdG9tYmlvcy5oIgogI2luY2x1ZGUgIm5iaW9fdjdfNC5oIgorI2luY2x1
ZGUgImFtZGdwdV9yYXMuaCIKIAogI2luY2x1ZGUgIm5iaW8vbmJpb183XzRfb2Zmc2V0LmgiCiAj
aW5jbHVkZSAibmJpby9uYmlvXzdfNF9zaF9tYXNrLmgiCkBAIC00NjgsNiArNDY5LDQ5IEBAIHN0
YXRpYyBpbnQgbmJpb192N180X2luaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQgKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgbmJpb192
N180X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaW50IHI7
CisJc3RydWN0IHJhc19paF9pZiBpaF9pbmZvID0geworCQkuY2IgPSBOVUxMLAorCX07CisJc3Ry
dWN0IHJhc19mc19pZiBmc19pbmZvID0geworCQkuc3lzZnNfbmFtZSA9ICJwY2llX2JpZl9lcnJf
Y291bnQiLAorCQkuZGVidWdmc19uYW1lID0gInBjaWVfYmlmX2Vycl9pbmplY3QiLAorCX07CisK
KwlpZiAoIWFkZXYtPm5iaW8ucmFzX2lmKSB7CisJCWFkZXYtPm5iaW8ucmFzX2lmID0ga21hbGxv
YyhzaXplb2Yoc3RydWN0IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFhZGV2
LT5uYmlvLnJhc19pZikKKwkJCXJldHVybiAtRU5PTUVNOworCQlhZGV2LT5uYmlvLnJhc19pZi0+
YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19QQ0lFX0JJRjsKKwkJYWRldi0+bmJpby5yYXNfaWYt
PnR5cGUgPSBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOworCQlhZGV2LT5u
YmlvLnJhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsKKwkJc3RyY3B5KGFkZXYtPm5iaW8ucmFz
X2lmLT5uYW1lLCAicGNpZV9iaWYiKTsKKwl9CisJaWhfaW5mby5oZWFkID0gZnNfaW5mby5oZWFk
ID0gKmFkZXYtPm5iaW8ucmFzX2lmOworCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBh
ZGV2LT5uYmlvLnJhc19pZiwKKwkJCQkgJmZzX2luZm8sICZpaF9pbmZvKTsKKwlpZiAocikKKwkJ
Z290byBmcmVlOworCisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYtPm5i
aW8ucmFzX2lmLT5ibG9jaykpIHsKKwkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5u
YmlvLnJhc19jb250cm9sbGVyX2lycSwgMCk7CisJCWlmIChyKQorCQkJZ290byBsYXRlX2Zpbmk7
CisJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0
aHViX2lycSwgMCk7CisJCWlmIChyKQorCQkJZ290byBsYXRlX2Zpbmk7CisJfQorCisJcmV0dXJu
IDA7CitsYXRlX2Zpbmk6CisJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+bmJpby5y
YXNfaWYsICZpaF9pbmZvKTsKK2ZyZWU6CisJa2ZyZWUoYWRldi0+bmJpby5yYXNfaWYpOworCXJl
dHVybiByOworfQorCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgbmJpb192N180X2Z1
bmNzID0gewogCS5nZXRfaGRwX2ZsdXNoX3JlcV9vZmZzZXQgPSBuYmlvX3Y3XzRfZ2V0X2hkcF9m
bHVzaF9yZXFfb2Zmc2V0LAogCS5nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0ID0gbmJpb192N180
X2dldF9oZHBfZmx1c2hfZG9uZV9vZmZzZXQsCkBAIC00OTMsNCArNTM3LDUgQEAgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9uYmlvX2Z1bmNzIG5iaW9fdjdfNF9mdW5jcyA9IHsKIAkuaGFuZGxlX3Jhc19l
cnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nID0gbmJpb192N180X2hhbmRsZV9yYXNfZXJy
X2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZywKIAkuaW5pdF9yYXNfY29udHJvbGxlcl9pbnRl
cnJ1cHQgPSBuYmlvX3Y3XzRfaW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQsCiAJLmluaXRf
cmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQgPSBuYmlvX3Y3XzRfaW5pdF9yYXNfZXJyX2V2
ZW50X2F0aHViX2ludGVycnVwdCwKKwkucmFzX2xhdGVfaW5pdCA9IG5iaW9fdjdfNF9yYXNfbGF0
ZV9pbml0LAogfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
