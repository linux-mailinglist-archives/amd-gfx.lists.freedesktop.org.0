Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B9D59B6
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 04:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136E6E1B4;
	Mon, 14 Oct 2019 02:57:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730074.outbound.protection.outlook.com [40.107.73.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6EA6E1B4
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 02:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOGyO2nIB5iInNxwZtGXaWZvKl//VqL8fTEu+u4SAr8vBEJXF4zcRfg0BfVqi7vrVZLXGxg5CkFAWQxBizc1tI1g6yzO2JDUfnsE5sPpXoqIrBAYdVAPZJOglp+YFj05d4w4oF0BIqI2EoDsH4zQsO+IVoJ0khZTWIqwwn5aK6VlXu+XZ+QPXGiO991fZ1NbtC8lXN4sV8rXujHnPx0S1kJh3V8aQYroZbF8FIcmig5aVyplIynp0UQZcI2gEjCNhewpSOOvQd2T+ZHpTu7h8i758QY6yB6qs0lXII+YjjjAc2SdBjvBpBni1sTu8t209ztUG1YfvwJMnrgwQbIhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBuvi05D3MkHOy0q9FaBu9GaByBuZd7kp8kgl2wlyFI=;
 b=GQaSSfQtMjU3UiCs98vL/8qyezthU7+G8JK9s6G+YFv9XgUmy1jUFfM2arNfOE9+LDagfhkS3nVBJuXxwAz+GgzhrMPQXCCXIQR6DsVqRiKjLcAU1etmC3aCwgW7Ej1xBw7nG65esJarw2qP36irI80uaSZZq7wWEgAVtxFqNeAAZLYNFaKoYRTSdBJQYMsVmr84M5ntFpwD379vYHoZSsg0jypZDKKdV4ChkvNPeySlHZ3WiyQcx5dkPNOE8521uXA9qD1Pm8tczDEca+q/XI92G8tkemq7qJw3ER8WBVqAZqYU15q6M/cRcYTf95k9iuttnGg+uUvvlWqJzAB7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0017.namprd12.prod.outlook.com
 (2603:10b6:301:4a::27) by BYAPR12MB2616.namprd12.prod.outlook.com
 (2603:10b6:a03:66::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Mon, 14 Oct
 2019 02:57:39 +0000
Received: from CO1NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MWHPR1201CA0017.outlook.office365.com
 (2603:10b6:301:4a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Mon, 14 Oct 2019 02:57:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT064.mail.protection.outlook.com (10.152.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 02:57:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 21:57:37 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 21:57:37 -0500
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 13 Oct 2019 21:57:36 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: No need to check gfxoff status after enable
 gfxoff feature
Date: Mon, 14 Oct 2019 10:57:34 +0800
Message-ID: <1571021854-25722-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(428003)(189003)(199004)(36756003)(26005)(50466002)(186003)(14444005)(336012)(70586007)(70206006)(53416004)(426003)(478600001)(476003)(47776003)(2351001)(486006)(126002)(2616005)(2906002)(5660300002)(48376002)(356004)(81166006)(305945005)(4326008)(86362001)(6916009)(8676002)(316002)(51416003)(8936002)(7696005)(16586007)(81156014)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2616; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a95ad439-4533-458b-c594-08d75052460d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2616:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2616C2A2398CB638B5E3B29F9D900@BYAPR12MB2616.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fg4syyvCNXAltYG4OwGK75d18RMIzIFSGvkAFvjFqoYT0w/zF5OwzBv78/nFzFeOuWZenUwzC9pV7TP8LTGToTJkDOInCttW5iPEyhOr4hxjka2nDFbxlKFa/Vey0ZQXOrUfphi86fUOgSAYSKKUdEPumdkOwBjscmsaOp/sSrXsU7x0foFkmk0pcnICw9ZDbeg/U/5I4ssV1AXWMcO6jROateO4mJRjPW1ySvTaoMvHk9ngyrxHMafk0yD6VJNlRyChOzQ3JNPW5jegPYFMO3fSx9e8o74sG8dj8O0ozSxJ0d0zVeAMyE6oYUax0TQ+U53MK4AE7wVkLrtoiv6q4HQrRREBtjUJ8niCGSQRb+MWJQqOgN4Ajt4Yp8FU8VxcUbj5tV+vvJ3ChMYoktjSv1LAU+J9fNzYljAjlt52CUg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 02:57:38.7441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a95ad439-4533-458b-c594-08d75052460d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBuvi05D3MkHOy0q9FaBu9GaByBuZd7kp8kgl2wlyFI=;
 b=Vun9wvlWB1aGloYywMEZOWfLGJ8Jo2pNuiEO3FZDy5RvJJQS6kQBVnhlQpTIZZtriGuSqHRH9XOpIzkFkrt0W/wbBBmbSp49bt+z+wARxdEyk5WFkPy8yO1ogEWVu6hm11hLQMurLACPLVwF4BbCGTsmpTdLwcIFkvCgCFq2cNM=
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

c211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfQWxsb3dHZnhPZmYpIEp1c3QgdHVybiBvbiBh
IHN3aXRjaC4KCkFzIHRvIHdoZW4gR1BVIGdldCBpbnRvICJHRlhvZmYiIHdpbGwgYmUgdXAgdG8g
ZHJhd2luZyBsb2FkLgoKU28gd2UgY2FuIG5vdCBzdXJlIHdoaWNoIHN0YXRlIEdQVSBzaG91bGQg
YmUgaW4gYWZ0ZXIgZW5hYmxlIGdmeG9mZgpmZWF0dXJlLgoKU2lnbmVkLW9mZi1ieTogY2hlbiBn
b25nIDxjdXJyeS5nb25nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMl8wLmMgfCA5IC0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYwppbmRleCBjOTY5
MWQwLi5jYWM0MjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjEyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAu
YwpAQCAtMjQ0LDE1ICsyNDQsNiBAQCBzdGF0aWMgaW50IHNtdV92MTJfMF9nZnhfb2ZmX2NvbnRy
b2woc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlKQogCWlmIChlbmFibGUpIHsK
IAkJcmV0ID0gc211X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfQWxsb3dHZnhPZmYpOwogCi0J
CS8qIGNvbmZpcm0gZ2Z4IGlzIGJhY2sgdG8gIm9mZiIgc3RhdGUsIHRpbWVvdXQgaXMgNSBzZWNv
bmRzICovCi0JCXdoaWxlICghKHNtdV92MTJfMF9nZXRfZ2Z4b2ZmX3N0YXR1cyhzbXUpID09IDAp
KSB7Ci0JCQltc2xlZXAoMTApOwotCQkJdGltZW91dC0tOwotCQkJaWYgKHRpbWVvdXQgPT0gMCkg
ewotCQkJCURSTV9FUlJPUigiZW5hYmxlIGdmeG9mZiB0aW1lb3V0IGFuZCBmYWlsZWQhXG4iKTsK
LQkJCQlicmVhazsKLQkJCX0KLQkJfQogCX0gZWxzZSB7CiAJCXJldCA9IHNtdV9zZW5kX3NtY19t
c2coc211LCBTTVVfTVNHX0Rpc2FsbG93R2Z4T2ZmKTsKIAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
