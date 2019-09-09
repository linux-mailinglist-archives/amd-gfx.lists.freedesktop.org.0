Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD217ADFC6
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 22:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8910F89091;
	Mon,  9 Sep 2019 20:04:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC74F89091
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 20:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJfcFbEJqLIRc710xoIgCFDahrQ13HSEHLK2GGxN/q2svyN7/xRf7RKGP8hncov0GTp8ruanMgOVqJuA/JP3fgJjzDh3ujuiFnxaRWJxqQt/IB4mZAF6K1LHlLAuV+2zbR58Zd6zW6Pp8TTMr0Sx03e9lDvtqifirl2DkJ9SiYAL+haChGCg7Thq6kZFfsok0oufeKbKq4SkdGBQX6bozs8NXo/QQWadPY7OOMd0Ep1MEjVzb1blSbSIU//gJOSmehQS8TlxiK8zbF3Hb/eUnQnPUDJWhp+NgdlqWIjMr15bFmj/QdVEW1PEoYekGPAXybDJshtogMMh9KfHB98/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo6w3tgE/Hu2rPrMXnfoI+e/wazUQ5bkE+NGeAMLiS0=;
 b=MOWaIe20jqvTbTTag6d4cTuLv4z/6P+DmJsEJ55wjvoP/+goZpwa6vbO3cCBwlUCXLuPwEAMgqcmz2fZ1OUiYe9vE7jpJ3Lh6s0GHuL9WwemQMEFCKB/f4UNGkrw/JK5vU6QsUWqJ7xjA64GcXLUSIgqEf0rpevLBYLCjB0FDkZEpm9vaP8xhRwNEF2UmR4er5n+oLlbBcX4tVwohDFTx9/WBB2dGRk4wmRcErn0PAZW7XNPoC8xBNZizNFp7YNvDH3tmi+YVNqS8NRuuObzS9rapTJO4PfiGe1FzaFsxTErb9BeuAZ/B0iCCJrbKGlwZeflhUqPeFb+5sjEe4e1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:301:4a::17) by BL0PR12MB2532.namprd12.prod.outlook.com
 (2603:10b6:207:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Mon, 9 Sep
 2019 20:04:43 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0007.outlook.office365.com
 (2603:10b6:301:4a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Mon, 9 Sep 2019 20:04:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 20:04:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 9 Sep 2019 15:04:40 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Allow to reset to EERPOM table.
Date: Mon, 9 Sep 2019 16:04:29 -0400
Message-ID: <1568059469-29450-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(126002)(7696005)(11346002)(446003)(356004)(6666004)(478600001)(305945005)(2351001)(16586007)(54906003)(50466002)(316002)(5660300002)(53416004)(48376002)(47776003)(2906002)(70586007)(70206006)(6916009)(53936002)(86362001)(336012)(8676002)(426003)(76176011)(50226002)(26005)(486006)(476003)(4326008)(36756003)(81166006)(81156014)(8936002)(186003)(51416003)(2616005)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2532; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6abae429-80e1-4aa5-7736-08d73560f3fd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BL0PR12MB2532; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2532:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2532239AF378D72639594290EAB70@BL0PR12MB2532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bkwgDgj3V1uKGIb2cztm1EMP1DmUkQu6RZ3c5I4t+y5s5HwULISUwMazJ4FrJC9Fmh8ffW27pMB1AhbWzZOGlEFNNAB1zbOW2oqDqo8VNIle4v3yyMrDoltX36WZXTp8sPPXoO8Ce5Er3fJ12EqNoet8d7I7Ow/tee7zAxnu+4oaSTPukLojhaZUYtFqqSPip22pHuwrvOCzPwpPjGhuhXWXe9+aq2s8WiD85tBDLQPNq4+/BH+DRd3bvOzi7GFx0NR1Pgywx3+ooeGnQTGtp6I6AgGUi4fYSFMcgXtfUYlFrKmdAuPUmw7bnjhxmtRfpjv84W7ssLId9DEQpeSWarAcAMjRFjcRdJRMA+wgOQb1jtrqnLEP7X1FUYw5Lo1uTNjgple6sKjvXtgLwEVh0ES1pi+gMj7VE0UkbwnP4ZI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 20:04:42.1400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abae429-80e1-4aa5-7736-08d73560f3fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo6w3tgE/Hu2rPrMXnfoI+e/wazUQ5bkE+NGeAMLiS0=;
 b=WN5yOqEMSqCPJttXYBnkiUTnKiHXIDGxH1yeQr0r/tS8iMknQ57RfrseKbf1KpUt6Ynz8bf6odc9vHATOlC8qbfnEvHA9k69UgXecAJ7No6WGbuMEgVxp3y767uNjMvNNkffKu+5seYYWg2g7GnmdtrR1pkGK707NfABOU8tetI=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Tao.Zhou1@amd.com, Guchun.Chen@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHRhYmxlIGdyb3dzIHF1aWNrbHkgZHVyaW5nIGRlYnVnL2RldmVsb3BtZW50IGVmZm9ydCB3
aGVuCm11bHRpcGxlIFJBUyBlcnJvcnMgYXJlIGluamVjdGVkLiBBbGxvdyB0byBhdm9pZCB0aGlz
IGJ5IHNldHRpbmcKdGFibGUgaGVhZGVyIGJhY2sgdG8gZW1wdHkgaWYgbmVlZGVkLgoKdjI6IFN3
aXRjaCB0byBkZWJ1Z2ZzIGVudHJ5IGluc3RlYWQgb2YgbG9hZCB0aW1lIHBhcmFtZXRlci4KClNp
Z25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDIwICsrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAxMTliZWRjLi41MmM1YzYxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0zMDMsNiArMzAzLDE3
IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKHN0cnVjdCBm
aWxlICpmLCBjb25zdCBjaGFyIF9fdXNlciAqCiAJcmV0dXJuIHNpemU7CiB9CiAKK3N0YXRpYyBz
c2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNv
bnN0IGNoYXIgX191c2VyICpidWYsCisJCXNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykKK3sKKwlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWZpbGVf
aW5vZGUoZiktPmlfcHJpdmF0ZTsKKwlpbnQgcmV0OworCisJcmV0ID0gYW1kZ3B1X3Jhc19lZXBy
b21fcmVzZXRfdGFibGUoJmFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbCk7CisKKwly
ZXR1cm4gcmV0ID09IDEgPyBzaXplIDogLUVJTzsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBm
aWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzID0gewogCS5vd25lciA9
IFRISVNfTU9EVUxFLAogCS5yZWFkID0gTlVMTCwKQEAgLTMxMCw2ICszMjEsMTMgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3Bz
ID0gewogCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2VlawogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVj
dCBmaWxlX29wZXJhdGlvbnMgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2VlcHJvbV9vcHMgPSB7CisJLm93
bmVyID0gVEhJU19NT0RVTEUsCisJLnJlYWQgPSBOVUxMLAorCS53cml0ZSA9IGFtZGdwdV9yYXNf
ZGVidWdmc19lZXByb21fd3JpdGUsCisJLmxsc2VlayA9IGRlZmF1bHRfbGxzZWVrCit9OworCiBz
dGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX3N5c2ZzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LAog
CQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogewpAQCAtOTUxLDYg
Kzk2OSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGVfY3RybF9ub2Rl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNvbi0+ZGlyID0gZGVidWdmc19jcmVhdGVf
ZGlyKCJyYXMiLCBtaW5vci0+ZGVidWdmc19yb290KTsKIAljb24tPmVudCA9IGRlYnVnZnNfY3Jl
YXRlX2ZpbGUoInJhc19jdHJsIiwgU19JV1VHTyB8IFNfSVJVR08sIGNvbi0+ZGlyLAogCQkJCSAg
ICAgICBhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsKKwljb24tPmVudCA9IGRl
YnVnZnNfY3JlYXRlX2ZpbGUoInJhc19lZXByb21fcmVzZXQiLCBTX0lXVUdPIHwgU19JUlVHTywg
Y29uLT5kaXIsCisJCQkJCSAgICAgICBhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2VlcHJvbV9v
cHMpOwogfQogCiB2b2lkIGFtZGdwdV9yYXNfZGVidWdmc19jcmVhdGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
