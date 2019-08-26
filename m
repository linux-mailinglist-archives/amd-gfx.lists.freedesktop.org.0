Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4CC9D17A
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 16:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D2989CAA;
	Mon, 26 Aug 2019 14:16:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A469889CAA
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 14:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amRRX7poKL5y4X537OPVBXCO3sD3QV3XMeAPKbvPnOHpGB62lV5l5YqnFI+jm7w60ztYK2E3j/5FczpwfExC0LTey94l4DXJqXoC+WoTxwy0FvdxkYazBmu6WRcinvGgpoF87GzyZxrWOTpizfFuRe04uyUUELHcLJVid8klfkgUu4K23vOrhjl2EaMW/3C0IselJogItF01zY9WtAZ+58Pdcyw+XTx44Gz6//KimbNPP+UBUoqOYv+gDypIEWFeaJ9jk4X0M6eQ8ECzkS5zVqLL+GCiTryIy9YBPgSmsS4it2kVK+NB/fmbzL57rXvRBI1/Xrms8l7hjdgda7AwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXknAjhmyuiaPcZBtZRaDkuQ2uUjrTK82tSPu1eojfI=;
 b=YcuAaGbJLbwJHE2naIACLNqVvfa0FgfdsrAHW/5cGx5Kzmn0PqiL1ed39H2WQYuTPBJ6G+bkkZPjJwME2zWN0hQ5M50aKOVggFj11g1rrcz0UtQIGcPygkpkflNEDl0KY/3NguM3hvWvRiAt+1r4EO3sxAP3MqVlHgAggUdSpolpAceA0APEdhQ7Z3AAjPye7iuJDzi+yGtgmRQpZsiq+igqTc++z2CCZvcqICSdvLpt08XrgzIY1cepzfPxAO7IX7M+CvHJjk3ID9ArPL4fDN3noY6X9jRuDEWU9SBXEobz4mKqeykBgos9re8+PEfIgUNt9WQfNEswSkf/2pH8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0087.namprd12.prod.outlook.com (2603:10b6:0:57::31) by
 BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 14:16:55 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0087.outlook.office365.com
 (2603:10b6:0:57::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 14:16:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:16:54 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 26 Aug 2019 09:16:53 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Fix error message
Date: Mon, 26 Aug 2019 10:16:49 -0400
Message-ID: <1566829009-6929-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(16586007)(186003)(5660300002)(305945005)(2906002)(8936002)(53416004)(8676002)(36756003)(2351001)(336012)(81156014)(44832011)(81166006)(126002)(356004)(6666004)(4326008)(478600001)(6916009)(486006)(2616005)(476003)(7696005)(53936002)(4744005)(316002)(15650500001)(70586007)(70206006)(47776003)(48376002)(50226002)(50466002)(426003)(26005)(51416003)(86362001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc57275c-3fee-47b5-f82d-08d72a300c59
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27102F99BCC2483971AA5E27EAA10@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L4t+9fh3mgbkVfqfxJM/nSZ5kg18cxj1uJ0QmAbQPabnXR8FX5LyiSx56VxG9lx16I8KWLXeQCVpinHaaR7ap30Z8qTBhzWQUuy2urFHPt734EuSNELaqfYSlJMN6UCBE1p7CzkPgg0WaOkijN27NjQY+XuroiT+y3fyBk+sRYjaTGel1OijuDX4QoDNevqKUwACEz0jYpQKq0FG0374+GxFvFZTlYInd36Zc/5aJoJ74vB5CJuRh28NYF60Q+/wjpXNbYmEqGdLpfLNTfnmL/VwGGW/lhb9yHdjojrq2KHKk2zKuj10IkLITPU0temXjzTT0vORhflqRzNvJaHxC34cp2r5RWr7APfKVK1Zj9BF9qpZciVY17gTeivCPUaPfpcYjAHh5k1UA2VqGj4ashn/S/CpF6L8yCApQtkG3I4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:16:54.9253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc57275c-3fee-47b5-f82d-08d72a300c59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXknAjhmyuiaPcZBtZRaDkuQ2uUjrTK82tSPu1eojfI=;
 b=GAeHb1NmkU280/3ro1h+p8f+T3Ng78rUR2/2FQp0AmG16810qALHLru34HmHBF3PVTXTiwApX5I/w7uygyZUrTuwYQUluuCMeQus+ca0xMl8N+06JCr5tvn0ejyvLReDiqdEv+qW750FqkiTG6bkDzF/Nv/18OPt20h0+8zJofU=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXRfdGltZW91dF9yY3UgaXMgY2FsbGVkIHdpdGgK
aW50ZXJydXB0YWJsZSBzZXQgdG8gZmFsc2UgaXQncyB3cm9uZyB0byBzYXkKJ29yIGludGVycnVw
dGVkJyBpbiB0aGUgZXJyb3IgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA5M2Y2NDQ2Li5kYTNkNzYyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
QEAgLTU2ODUsNyArNTY4NSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVz
KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkJCQlmYWxzZSwKIAkJCQkJCQlt
c2Vjc190b19qaWZmaWVzKDUwMDApKTsKIAkJaWYgKHVubGlrZWx5KHIgPD0gMCkpCi0JCQlEUk1f
RVJST1IoIldhaXRpbmcgZm9yIGZlbmNlcyB0aW1lZCBvdXQgb3IgaW50ZXJydXB0ZWQhIik7CisJ
CQlEUk1fRVJST1IoIldhaXRpbmcgZm9yIGZlbmNlcyB0aW1lZCBvdXQhIik7CiAKIAkJLyoKIAkJ
ICogVE9ETyBUaGlzIG1pZ2h0IGZhaWwgYW5kIGhlbmNlIGJldHRlciBub3QgdXNlZCwgd2FpdAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
