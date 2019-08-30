Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EDEA2CAB
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 04:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BF76E0EF;
	Fri, 30 Aug 2019 02:10:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA086E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 02:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW8HYS4IjoFl5BKmuIKX2/TRHagDIGU7Tbdhe1B/N+f7+7sU5yU7PxuQj7tI7UApGnYoimzhWkdx/LhnPfc/wA6HQO5Dt8pEg0FuAd50cuPPitao2jVnNKOeFvDvea2qYANYgX7rNeUrVhetyp47Pdm3zASsGqF180QHc5jNgPhq7uToQ6OESMU2qPt4WmyvkoFbOlHx6cPaCKG0m7/OQReHA+alpLEtmmFWRffgg9S3mIazlr8ayGw1/o1NdTP949+GBbePtfD+omcuJbnIMO/nqOuQMwqNivaIrujCiJO5dOuD6mxCZ4H6MB1GGbJ78Hhn/zCKyXEDsq11qgLayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxLjE9ahnuNidGOQMaokFEfmxeZqnZpTMfRHy3/uIdQ=;
 b=RiED9TdXayfu1rrVnCGKFqNP4c53X912h6s93gradCY5DmDUrpzvOVUiGvnT0Mrja6DPC98cvfClya0Mft1cDx0PYbAgU0manoppL+NqeJTYzsaBzDEYJOztteBLOAFWyf/issOgEblnNLg6m6aDNB2mcDBcZsouX8wUvdAoMCLBS1QKQhIjju59RrpDry7eiSOmQfZRd1M204X0LBZ4+NWfuBkLT9iepBUYzIkFfdoZWbZYI2jtNIqDaflPUMaDOsvNn4fLf5gZxW30O0BV93ZGD6KXKmsMU30YEsbXtaFelLeYo0VLVMPJMST/hRrcRonszW158BRiRGUekiLDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0039.namprd12.prod.outlook.com (2603:10b6:903:129::25)
 by DM5PR1201MB0171.namprd12.prod.outlook.com (2603:10b6:4:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Fri, 30 Aug
 2019 02:10:45 +0000
Received: from BY2NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by CY4PR12CA0039.outlook.office365.com
 (2603:10b6:903:129::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 02:10:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT062.mail.protection.outlook.com (10.152.85.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 02:10:44 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 21:10:27 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Date: Fri, 30 Aug 2019 10:10:24 +0800
Message-ID: <1567131024-7241-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(478600001)(305945005)(6666004)(5660300002)(50226002)(476003)(81156014)(36756003)(86362001)(2616005)(53416004)(44832011)(486006)(81166006)(51416003)(2906002)(126002)(8676002)(7696005)(70206006)(16586007)(356004)(6916009)(47776003)(336012)(53936002)(8936002)(26005)(50466002)(4326008)(54906003)(186003)(316002)(426003)(4744005)(48376002)(2351001)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0171; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65b7e7fd-5672-4908-ab9e-08d72cef4435
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB0171; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0171:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0171B930A5B579E7FDB9F106F0BD0@DM5PR1201MB0171.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BPXat8uAUnl+G2Obw/SitrFIy7El68K274ZNTvH+izC82cyLhkHCjhYO3vEmlN3qW0o3w/KqWYmn6iDy7bqAsPaD0QjZFfQ0amlmjNSVtxtw225fzjjqgrhgmgopr8N2DkGq6k+9/FmIgbevsKTMZcb8WhfDq0FSBhdMeL6JmzAqoqfBLkoT8lzGzM3xlqvXk4XXf5FdWAUNQbv1WALWCl+zqZKA3vPvfc9eVgvb593UmY0ynPM1Qhevxlv2hjC7Nb3wOaA0yUmy9AzgczW4F/V/2Mbf+JxWWIhHu1ynreZdtmdmflnvZcNvaf+pTa/EHQ1Pf66BOd+YndbSqMZleQrqgAk03b4ZEKfcTpwD4KbhRkaSrzObSbZ/CQFgiM1/BqoNWg+3tdv9w1/ovFjUDu6XrRhzZRH0hnPRIY57U8c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 02:10:44.7805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b7e7fd-5672-4908-ab9e-08d72cef4435
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0171
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxLjE9ahnuNidGOQMaokFEfmxeZqnZpTMfRHy3/uIdQ=;
 b=vUHRVUzP7AUJRtbuA8Z6mw9TS5L3UBol3nc7D2cR+r9pEboDLCkiK8T5hpYROVJiUB1LrbGNNiMDAtCw3C8TOjHXw9SQynFEaHDbuNAtIaTjq/W7Y8wyrSFnkwT9hOYEQ+65ACy1hHTRWOHHd9WwewZgadCXGB3dVctrhtlcpfU=
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
Cc: Alexander.Deucher@amd.com, Ray.Huang@amd.com, Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGFwdSwgU01VX01TR19PdmVycmlkZVBjaWVQYXJhbWV0ZXJzIGlzIHVuc3VwcG9ydC4KU28g
cmV0dXJuIGRpcmVjdGx5IGluIHNtdV9vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jCmluZGV4IDhjNjE3NzguLmI3MjY1NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTEwMDEsNiArMTAwMSw5IEBAIHN0YXRpYyBpbnQg
c211X292ZXJyaWRlX3BjaWVfcGFyYW1ldGVycyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAl1
aW50MzJfdCBwY2llX2dlbiA9IDAsIHBjaWVfd2lkdGggPSAwLCBzbXVfcGNpZV9hcmc7CiAJaW50
IHJldDsKIAorCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpCisJCXJldHVybiAwOworCiAJ
aWYgKGFkZXYtPnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JU
X0dFTjQpCiAJCXBjaWVfZ2VuID0gMzsKIAllbHNlIGlmIChhZGV2LT5wbS5wY2llX2dlbl9tYXNr
ICYgQ0FJTF9QQ0lFX0xJTktfU1BFRURfU1VQUE9SVF9HRU4zKQotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
