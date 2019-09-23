Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2496ABADB0
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8866E0DF;
	Mon, 23 Sep 2019 06:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C906E0DF
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwtckEKO1EpkRf5PtBTypgnijFVkUHCWz+DWb0fxYYbG+esVLuG9t5j33Ae1Tf9FLuVqnUAnyTXJJc9c5AFUfc+W4qv+eg+MCdPmKq0dU6qELt6EDxeSJWfgupeOEZPQdodiN18KwAlh8bo7/uc+6RdyitKRhihSFsjie6n9c7Xu7H6TyhaGr+ZNCsa+AXj0GtCm8JPfnPw+Jio9SHROa40zYbHMCE9HTc+XIIoAqkWCj1K+SA7wnSQcMCnSrcAbVsRCowjtaIZFW+ZXLTQEqIhf03Iqhl1BBOG+H9EoYP4EMsh6d7+fqe4VIgvCQmkqx7s9Fv7oaFNRfS2ZuTTHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixDwOt0Qpv7H44emIXyh2B3IVHW1uYfDCvaXbBcBmnI=;
 b=CuYj17dHaUZQfAuIdCUExgESwmQCbgaVwHZG5hJZjSIEKcCtKLv1ZX0dsmClS8Mp/agQpZWbZ0EicI13Eg9ks/TeehDVUNFWYttN+mCTGBEbdlaEZG2P3NTJd/ofi7sLzabLJO1UiCrI0Dhm0lcv38ejzcjnaefVTB8UwybUDTzkCLDXRJ/aXVtYB8tYaycfZf0rYS2Faxzz2v4B3TJAo1noJldux+C3u/r4UC4GMU7N7mqzksWJtyJv9ewMKj9A/IWwQQPssSmLwTeWAqjzNSD87StVzxvEqsji4cUHhi9U6C+FWs1qV/nzYz+CNbl8Y6XOWW398YKjxeEgPveUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0013.namprd12.prod.outlook.com (2603:10b6:5:1c0::26)
 by MN2PR12MB3230.namprd12.prod.outlook.com (2603:10b6:208:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Mon, 23 Sep
 2019 06:14:29 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM6PR12CA0013.outlook.office365.com
 (2603:10b6:5:1c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Mon, 23 Sep 2019 06:14:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 06:14:28 +0000
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 23 Sep 2019 01:14:27 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Use mode2 mode to perform GPU RESET for Renoir
Date: Mon, 23 Sep 2019 14:14:08 +0800
Message-ID: <1569219248-29457-2-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
References: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39850400004)(346002)(428003)(189003)(199004)(48376002)(47776003)(4326008)(2906002)(486006)(2616005)(81156014)(81166006)(26005)(186003)(336012)(426003)(50466002)(476003)(8936002)(50226002)(11346002)(446003)(36756003)(76176011)(51416003)(7696005)(356004)(4744005)(126002)(8676002)(6666004)(16586007)(305945005)(70586007)(70206006)(316002)(54906003)(2351001)(53416004)(478600001)(5660300002)(6916009)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3230; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4d9a4dd-61e0-4b9d-b765-08d73fed4a8d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MN2PR12MB3230; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3230:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32306B331F6798561802AD6C9D850@MN2PR12MB3230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6+tDYEjhNGR2NnMsF8S6d7ZOos5ZS0CdvpYFqrcOmGnKdeheARdx9QxRjAWxZ2/X0GcBBizmUgkKlVR+of4rYHqvMf0J/dyQLHU+JQ22Oj5y7zNaFFen5QudZeMKuM6ef0sEnDDPESlpZMewkuJkJIdHRoaK1hS3HpcqeSAzInyqh5sO2huI4ipTzmGptI6leA7ZkeVZdb7ANbZ7xhJRgZoPKrllR76SK+ZVMwUgaYjJ2ci0gDNzW19BZNzy59KBfvHdaB6xddzaeGUWmDre+hAKcD7s20q4tvntLfBsoct3RR/eA7dNuHRtScUa3yrE61b5mZv/THLODeyonsh45oAH7L62vdNL0RuUzuPAe/IMgsov9C/Y2saCdQrQMAt3rzgV3l0YvwEoIr4aARexkubZ8F9htjxL8aCglUOrJTw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 06:14:28.5574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d9a4dd-61e0-4b9d-b765-08d73fed4a8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3230
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixDwOt0Qpv7H44emIXyh2B3IVHW1uYfDCvaXbBcBmnI=;
 b=r/NrRIlZHg7I+1FLc70vLXqZVYPwwK7HFuLEyf2+CGBgnA1WdikYjM1iVz3A+jecl8uVVSbwpngD2oPtfDmGLAiy1GwFUcKxgsrtE59buSfL2YS7WyEwMKeQPZiDkujZOPjDCPZK04BjyjEzGQ8smn/hmbPjr5/hIn4FBCyozvc=
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
Cc: chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNTg4MTg3NjEu
LjBmNjM5ZGY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTUxNCw2ICs1MTQs
OCBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfYmFjb19yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAogc3RhdGljIGludCBzb2MxNV9tb2RlMl9yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKKwlpZiAoaXNfc3VwcG9ydF9zd19zbXUoYWRldikpCisJCXJldHVybiBz
bXVfbW9kZTJfcmVzZXQoJmFkZXYtPnNtdSk7CiAJaWYgKCFhZGV2LT5wb3dlcnBsYXkucHBfZnVu
Y3MgfHwKIAkgICAgIWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+YXNpY19yZXNldF9tb2RlXzIp
CiAJCXJldHVybiAtRU5PRU5UOwpAQCAtNTI4LDYgKzUzMCw3IEBAIHNvYzE1X2FzaWNfcmVzZXRf
bWV0aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJc3dpdGNoIChhZGV2LT5hc2lj
X3R5cGUpIHsKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJcmV0dXJu
IEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI7CiAJY2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBf
VkVHQTEyOgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
