Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBDA0284
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 15:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F2D89C68;
	Wed, 28 Aug 2019 13:03:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25A89C68
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFO8Uo6gyGr8A7CPXo/5XfaOgfe8VzzJxhtMBEIwenhzKBCeY5d34IuGH0/XayeICw51ZWgjia46MKZEHMe4bFh9Ijh9j+xv7JFq1HLAIPuDmavw4sUGZqejRPuK4D6zPlThTKqOrSHWH1QpIawU3b6r70EHjs6TI0ggUfynGvPxazOdA3rR0J7PlpLPHTVqTO5823Mm96b0M6KQZuN2Bh+Ei+wjDCQ6IzZsBekYx3HU9042J0SY1JWrWtVPH+mT+/mFNxoFYM6aDet8A6Tw0hahvOji2bSN/Fxb1kQxhZFlTnTLiQGb+la+0G1xmKkr1Y8szjbph9arF5kVFE8AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk3LFh+tGs++fmzvRG+9rG90Jd1bsDp3Zq9JepyRhKc=;
 b=E+0F0uVdQe9CI3K05suit3FOMsVHg14ETSkAR5KiIXyFJ0AUMPff7XQ9P2HQz2iYvHtAbWRK4atmK0ocHLmfVPQ2fZCroO008TGk+kUtnQv+HoqiDN3m8bhOWRjmTLw3KZJcCWje12gdXJN1uVudgoJh5wRG729lDdYBz5bvaOagQ5pgP3EdByv71UDKG1zkuxf/Vn0J0dAHr9n3odHhUSnspB5fZCF7NQc7Lrt7o1Sgp1weehrYJiFIchwVjMXQtsnjwysEx+6BpYkkoC13JgMkijXdGrGnx2z536VNGt7lKzZa3PrWc+Sdi8L9DAGwzDxhvS/BlQ0xwEKkfNAzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0033.namprd12.prod.outlook.com (2603:10b6:301:2::19)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Wed, 28 Aug
 2019 13:03:49 +0000
Received: from BY2NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by MWHPR12CA0033.outlook.office365.com
 (2603:10b6:301:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 13:03:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT026.mail.protection.outlook.com (10.152.84.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 13:03:48 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 28 Aug 2019 08:03:47 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Tao Zhou <tao.zhou1@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for nbio v7_4
Date: Wed, 28 Aug 2019 21:03:15 +0800
Message-ID: <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(428003)(189003)(199004)(50226002)(70206006)(86362001)(36756003)(76176011)(53936002)(51416003)(7696005)(8676002)(2906002)(48376002)(26005)(14444005)(8936002)(50466002)(5660300002)(6636002)(4326008)(186003)(356004)(446003)(6666004)(336012)(426003)(11346002)(305945005)(486006)(476003)(126002)(47776003)(478600001)(16586007)(110136005)(316002)(53416004)(81156014)(70586007)(81166006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9914533-a0ad-4153-8f97-08d72bb82acb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27110DC2F1A2FE9E15B77D92FCA30@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gEfm0HJ5+9yzGSUkSllXWQ/4wgxBGdstikxRNYOFMeMUkGWkUUaiT4jBPHWfVAlUPb1XNHRF9cC56werZPyO0mnSbuJy5M3B9/FXqWLY2RajomxHtITdiW6HcRgv9ucx/wex/5m+gpPiizViyRkgzkqZRrcT0jalFbx4HUDVFyVsoZt56qZ2nd/jTnSgTFH5czauxGlr3SP72l8B1DZyixvf9oVEnI4DGUAdqKsF31tXN8wkKFZSz2YrxuBvonZRHWD4HMnUx0DhvV0/8rVFzs4bG+LiO5SgCm2Ki6odWdncHYLOceNORa+PeC/WQZUaYRO3JM5l8qAH8IHlvxkI5lk79QYEvb1goLLnKXcTbT5E5abyu9qtmltk0hpxZi0bImcKj8gj8MOYJ7fJTODSg8EDn5nmmn5F+EdsXmqpycQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 13:03:48.5582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9914533-a0ad-4153-8f97-08d72bb82acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk3LFh+tGs++fmzvRG+9rG90Jd1bsDp3Zq9JepyRhKc=;
 b=YybABi5g2M4Hr5nwPBDKTY1LQpklNeRIqlNoBBzovMdblenmpZ+/c+m/cSORfF6+LpaQWQFA+Cj+vo919qgRMg5fOIdPSNiU+UOWmHvkJNtrHpV7lYv9Bd0dX+NayDu4Mv5IRkVZhlDhKXomeZLcfNkkN4utOJkJRrxmgAweuf0=
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

aW52b2tlIG5iaW8gcmFzX2xhdGVfaW5pdCBjYWxsYmFjayBmdW5jdGlvbiB0byBkbyBuYmlvIHJh
cyBpbml0CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDEzICsrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggZTdmMjUzOS4uZjUzYmQ1OSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMjA2LDExICsxMjA2LDE1IEBAIHN0YXRpYyBp
bnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogc3RhdGljIGludCBzb2Mx
NV9jb21tb25fbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKKwlpbnQgcjsKIAogCWlm
IChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCXhncHVfYWlfbWFpbGJveF9nZXRfaXJxKGFkZXYp
OwogCi0JcmV0dXJuIDA7CisJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPnJhc19sYXRlX2luaXQpCisJ
CXIgPSBhZGV2LT5uYmlvLmZ1bmNzLT5yYXNfbGF0ZV9pbml0KGFkZXYpOworCisJcmV0dXJuIHI7
CiB9CiAKIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX3N3X2luaXQodm9pZCAqaGFuZGxlKQpAQCAt
MTI4Nyw2ICsxMjkxLDEzIEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX2h3X2Zpbmkodm9pZCAq
aGFuZGxlKQogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCXhncHVfYWlfbWFpbGJveF9w
dXRfaXJxKGFkZXYpOwogCisJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYt
Pm5iaW8ucmFzX2lmLT5ibG9jaykpIHsKKwkJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFz
X2NvbnRyb2xsZXJfaW50ZXJydXB0KQorCQkJYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtPm5i
aW8ucmFzX2NvbnRyb2xsZXJfaXJxLCAwKTsKKwkJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPmluaXRf
cmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQpCisJCQlhbWRncHVfaXJxX3B1dChhZGV2LCAm
YWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwgMCk7CisJfQorCiAJcmV0dXJuIDA7
CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
