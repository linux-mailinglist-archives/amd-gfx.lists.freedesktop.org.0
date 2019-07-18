Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18B6CAD7
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492136E351;
	Thu, 18 Jul 2019 08:20:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720058.outbound.protection.outlook.com [40.107.72.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EFE6E351
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6UTHo1FfKJP9laUVUDB/tCmpLJvwMjW8cQDnqjS5EA/JoFstLcE9RuK8U4cQ/4h9yMOhxNYbihqCP6wQ0B4MnlUuHiNtLtlrmuJw7Bcxe3eg4hrKWvmzIQ6dvwjv9RNS4jvp3jZdGH9ki1uQr3abcE0jnMmlKVs6pAJmry2UpgTI2m/Q04XDLGJT79J9FN50rZ7G4L/OGyGYkPRR0e8kIimBujzrHqbg2Tp+p/k/hmadmWGhc4tl78C3XSNEg/xvAx7kBCEaB95lcK5YIhu7GZBdX50LgrNKOn8sVUzVvWiqtaW6eaNSd/QB+K6M9wvofd5lUvMp3VCn6YLmI9TYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLrRspZAf+DlUE8PjFgTpprPUkNWcUhGf+MFWrGNPD0=;
 b=GuvNNXvF+2k95+tpAy4wccdhci0+x45Qk/rshDEJrsSy2Dmo4yT66/6zJqcANuhnRuqvOS/IKJGfoKc3boke33G0Hb53yB/ytiAnZ8Vx8Ongx98mG3760TaTpsiRvPlCMaU3IYUG9AFy7AWbSxTZuP/mb1X7ppOXI/t6IYTOpmylXow0S4IX2KvTV8SsdhPyzPoK/UB44yyEJE9/+Yf88OYRVHOji6Os+guP/tfYI09ho/aPKELswUXWOSgPCDzqLNOMxoJn+lueJJduK9sIXYDIzPncKNjKhUYza25sH34NfLGCqFtm8znsHFZOCCMKm0pphu/X4De0TTDVFNKdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0038.namprd12.prod.outlook.com (2603:10b6:301:2::24)
 by BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.11; Thu, 18 Jul
 2019 08:20:32 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MWHPR12CA0038.outlook.office365.com
 (2603:10b6:301:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Thu, 18 Jul 2019 08:20:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 08:20:31 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 18 Jul 2019 03:20:30 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: disable GFX RAS by default
Date: Thu, 18 Jul 2019 16:20:12 +0800
Message-ID: <1563438014-29690-2-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
References: <1563438014-29690-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(2351001)(70586007)(6916009)(53936002)(478600001)(70206006)(2616005)(53416004)(476003)(126002)(11346002)(4326008)(5660300002)(26005)(86362001)(51416003)(47776003)(446003)(336012)(76176011)(426003)(68736007)(48376002)(305945005)(14444005)(7696005)(36756003)(50226002)(316002)(8676002)(16586007)(186003)(486006)(4744005)(50466002)(6666004)(356004)(81166006)(8936002)(81156014)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3094; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41de111d-6b71-4415-764f-08d70b58ccf4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3094; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3094:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3094893E4B1327283A83E424FCC80@BYAPR12MB3094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: I3K+GVLFLaHVL/o0SCuofwi5MC3gerKqJYskDBlM0Qg02++qrfvqbVlpajmYZ1qR0/8+RYzPrmofjADcVe8k+rYxExFx5f9XvD+gWY4HoASdgJhqGaotpIYFk0C9+t1UG5gksaX2Sib21UN6RWPvN7alIETwTHvMFyNoJXcCLnbKZJsTGZy+Q+RjMo2mu7m/FmkRq/OMAMSh2yxq45cbNY4eGCwE1e72buek1scsyP2exYbqwLb48dp4Fkjfi2wkPd/4ZpKGxL4BB9m2bFwh2WYcbGb2npi79+3xwOtVDirXdciXSQKYvv/hyXXkuxWDTS1kgy5QUWKT3ixRm/O6tibCpi5x9vsRNSQLwy49ClDIU/wFc8FTNk4aSonl2x6VdvkL8d5Uzhx10F/4QA/ajgAbfICMwMqU7MkMT7vT1GI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 08:20:31.8312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41de111d-6b71-4415-764f-08d70b58ccf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLrRspZAf+DlUE8PjFgTpprPUkNWcUhGf+MFWrGNPD0=;
 b=RhsGaOjwH4ghVXp8i8A4hf9DLXCj1UHEctFb8yAj34Nlojap3j9Nj+QRJXQjElCE5PB/CKwTBAC7W3/6ZuJ6B+f+RFHSaOhEyL5HGPMHCv0bxH5rVWH3AIjKY5YIN0NCcStEPVxC0YrKFSfKLon1tMOZ0QmSaI3mV1uywHneT8w=
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

R0ZYIFJBUyBoYXMgbm90IGJlZW4gc3RhYmxpemVkIHlldC4gZGlzYWJsZSBHRlggcmFzIHVudGls
Cml0IGlzIGZ1bGx5IGZ1bmNpdG9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDYzZTI0
NDkuLjk4NTZhNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAg
LTE1NCw3ICsxNTQsNyBAQCBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CiAJ
Lm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLAogfTsKIGludCBh
bWRncHVfcmFzX2VuYWJsZSA9IC0xOwotdWludCBhbWRncHVfcmFzX21hc2sgPSAweGZmZmZmZmZm
OwordWludCBhbWRncHVfcmFzX21hc2sgPSAweGZmZmZmZmZiOwogCiAvKioKICAqIERPQzogdnJh
bWxpbWl0IChpbnQpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
