Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6ACA08E
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C26EA06;
	Thu,  3 Oct 2019 14:46:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5D6EA06
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftCuEtDrYADYyfjjfKicvC55zmnoc0YJABkRSj4QsylIkZQEDO94L+8/qnQFOORv+w+JOqdNuAEiUSyUacfrJizWzk46Ns+oTiFQxuCwfwfZKwzYi2y0eK9D2GbG8W5F3JW3xBAP8/DnDKugZAYyihWmk5QkcLeJubh+uI15QK9DCB2S5dyhD0AjeF+BmiJ6YzPzYzRb9S3v2421+jP2NVFSGQs92B9A15PSJv0sSrmxYhkJAixZIDXYKBIVkcHiWU1llvSlFTCJ/92eKBHhSuTsX7NhHUaUw0y2dLsM/3QiBsfbRLDDo3PhyB4x6SoC+BFwCXzl1zQjNc1ZMwreog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5cXUQ6PcWakuZmunNxWnesNfyCz4TWA904kcXiNOfo=;
 b=NY+6yvF5p9lqDh1tVrmA4Vt+rLpr+MzsD3auSpObE9t2pyl756GnaaBfINNJmlWJAlNDPf647Ow+fPVQDZzhCmijQxgOX7/VDkeL1LNiPhCeatiEZGJNyoni9DS5yLJil8o87FOs0efCdrEPKAgzbOByVAJQJtCCNeGaafDbdontRK9rueZ1QNj2kxIvYYF6uVcCp9fKoG/gmvMn+J3G/1BNBncHE3+/5ZUJM2OeUG6OydT8dD1ZVXhUjL8YKCOfaoS4hVtCmiJL1j49q4CUFQe67o/vKqY2+XnkRyCbse6M3qIHfYInCapXtMGJG22rREqcURO7qjuppeMlSXLckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0046.namprd12.prod.outlook.com (2603:10b6:301:2::32)
 by DM5PR1201MB2489.namprd12.prod.outlook.com (2603:10b6:3:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Thu, 3 Oct
 2019 14:46:20 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MWHPR12CA0046.outlook.office365.com
 (2603:10b6:301:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.16 via Frontend
 Transport; Thu, 3 Oct 2019 14:46:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:46:20 +0000
Received: from kazvm.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:46:12 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Make plane z-pos explicit to userspace
Date: Thu, 3 Oct 2019 10:46:06 -0400
Message-ID: <20191003144606.8550-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(428003)(189003)(199004)(5660300002)(316002)(8936002)(476003)(81166006)(486006)(81156014)(356004)(50226002)(6666004)(48376002)(53416004)(7696005)(51416003)(2616005)(50466002)(6916009)(126002)(44832011)(5024004)(14444005)(186003)(2906002)(26005)(86362001)(4326008)(54906003)(2351001)(47776003)(70206006)(305945005)(8676002)(478600001)(2870700001)(426003)(70586007)(36756003)(336012)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2489; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11d03c8e-c335-485d-781e-08d748107454
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2489:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2489247A70F016A96CA60AEDEC9F0@DM5PR1201MB2489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rVqKjMIgZrAyp6E2wclGGxy0ttPCYUpHt/YzEq+844I79DnrSapwmyBeZOshdhwmvTRNGqAqw5MkM56ujsVbHrzQdao3Ak5NgW6Dc1deflhFP8qYTuzttM1UyUUhqfhXG+lxDZ1g5LwBQe2nS7xRLc/fEn7qBDXoJk4072Q1+2YoRdyqnZSYuIfvUW4AXXPJcbOqZ59Ji2zBT+LICaqFO2vTZcCfTpe4hKz75aQOXxJQ6ywzgrJ7rKF9DIwlON1yzR9NDaogWbCXjjEF088O4AaSeNAexQ2XEtz/QUtCgOYqSSwhXYOYD2mfpr9LfK8n8b8ok5t8SeudL7ND9fa6adzhXWOjwvGvv3l0p7lto5xAz09RYg8/78HQn0iiFJYDqOxZdgnK0jqO2zKxSCSU+oz9z/NZ3XkSFHG94GnScs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:46:20.2702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d03c8e-c335-485d-781e-08d748107454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5cXUQ6PcWakuZmunNxWnesNfyCz4TWA904kcXiNOfo=;
 b=JKzhA2+ZMJoH+Rl7gJZz8eoGV3BfMBbLCD5znaR18ZDKLIj0fvXHs2yNBJ0GwkXBZPjNASiStGy9wy+FBRrS+9AvwHcqnlxUgEM5uLwA/8QJSfnAusgCYR0tafQYyGSmPrmdjDr63TT7p5BoS3s3wzsNZuPg2OulSrI14LMIY8A=
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <rodrigo.siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KTWFueSB1c2Vyc3BhY2UgYXNzdW1lcyB0aGF0IHRoZSBEUk0gcGxhbmUgaW5kZXggaW5k
aWNhdGVzIHRoZSBwbGFuZQp6LW9yZGVyLCB3aXRoIGEgbG93ZXIgaW5kZXggYmVpbmcgbG93ZXIg
ZGVwdGggYW5kIGEgaGlnaGVyIGluZGV4IGJlaW5nCmhpZ2hlciBkZXB0aC4gVGhpcyBpcyBjdXJy
ZW50bHkgd2hhdCB3ZSBhc3N1bWUgaW4gRE0uCgpEUk0gaGFzIGEgenBvcyBwbGFuZSBwcm9wZXJ0
eSB0byBtYWtlIHRoaXMgZXhwbGljaXQgdG8gdXNlcnNwYWNlIGFuZAp0aGVyZSBhcmUgY2xpZW50
cyB0aGF0IG1ha2UgdXNlIG9mIHRoaXMgaW5mb3JtYXRpb24uCgpbSG93XQpBdHRhY2ggdGhlIGlt
bXV0YWJsZSB6cG9zIHByb3BlcnR5IHRvIHRoZSBwbGFuZS4KCldoaWxlIHdlIGNhbiB0ZWNobmlj
YWxseSBvcmRlciB0aGUgcGxhbmVzIGluIGFueSBtYW5uZXIgc2luY2Ugd2UKdmlydHVhbGl6ZSB0
aGVtIGluIERDIHdlIGRvbid0IGN1cnJlbnRseSBoYXZlIHRoZSBzb2Z0d2FyZSBzdXBwb3J0LgoK
VGhlIHotcG9zIGNvdWxkIHBvdGVudGlhbGx5IGJlY29tZSBpbW11dGFibGUgbGF0ZXIgYnV0IGZv
ciBub3cKanVzdCBsZXQgdXNlcnNwYWNlIGRvIHRoZSBvcmRlcmluZy4KCkNjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpDYzogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnby5zaXF1ZWlyYUBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMjM5YjFh
ZTg2MDA3Li5lNThiMGI3ZTNjNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNDg5Nyw2ICs0ODk3LDkgQEAgc3RhdGljIGlu
dCBhbWRncHVfZG1fcGxhbmVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0s
CiAJaWYgKHJlcykKIAkJcmV0dXJuIHJlczsKIAorCS8qIE1ha2Ugei1wb3Mgb2YgZWFjaCBwbGFu
ZSBleHBsaWNpdCAtIGxvd2VyIElEIGlzIGxvd2VyIGRlcHRoICovCisJZHJtX3BsYW5lX2NyZWF0
ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eShwbGFuZSwgcGxhbmUtPmluZGV4KTsKKwogCWlmIChw
bGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9PVkVSTEFZICYmCiAJICAgIHBsYW5lX2NhcCAm
JiBwbGFuZV9jYXAtPnBlcl9waXhlbF9hbHBoYSkgewogCQl1bnNpZ25lZCBpbnQgYmxlbmRfY2Fw
cyA9IEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSB8Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
