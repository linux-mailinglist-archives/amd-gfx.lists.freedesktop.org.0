Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842BF29520
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 11:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204FF6E0A5;
	Fri, 24 May 2019 09:52:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A526E0A5
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 09:52:07 +0000 (UTC)
Received: from BN6PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:405:4c::30) by BYASPR01MB3.namprd12.prod.outlook.com
 (2603:10b6:a02:ce::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15; Fri, 24 May
 2019 09:52:05 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR1201CA0020.outlook.office365.com
 (2603:10b6:405:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Fri, 24 May 2019 09:52:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Fri, 24 May 2019 09:52:04 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 24 May 2019
 04:51:57 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix unload driver fail
Date: Fri, 24 May 2019 17:52:00 +0800
Message-ID: <1558691520-5819-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(199004)(189003)(36756003)(186003)(126002)(2351001)(47776003)(53936002)(426003)(7696005)(51416003)(70586007)(70206006)(476003)(336012)(86362001)(2616005)(4326008)(72206003)(478600001)(50226002)(486006)(6666004)(356004)(2906002)(305945005)(6916009)(81156014)(8676002)(48376002)(81166006)(14444005)(53416004)(16586007)(50466002)(5660300002)(68736007)(316002)(26005)(77096007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYASPR01MB3; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbfce155-26eb-45dd-3eaf-08d6e02d7a2a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYASPR01MB3; 
X-MS-TrafficTypeDiagnostic: BYASPR01MB3:
X-Microsoft-Antispam-PRVS: <BYASPR01MB3A93769D73ADA4AD0FC9C8F020@BYASPR01MB3.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-Forefront-PRVS: 0047BC5ADE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AaKcg3UrW/9nd2506eq3FWKhwZW8+jA8k7/1XNRPrPvUDBT1BY2XsAofmtcKlJPTf2weJkZt/YPL+zETQajXE5kngG0rN3TW20myQsbWu1BBUveO8rfkq4rhzetTkCCqmwnS1KjLIF6mD3tr7k4ub63WxSo4uIUsMKJR+Giz+RO7ea7uKTCjyK/5ccvfLjXYUnqo0c/YBwx9dEN0FJGouAezunG5ZGzfedBaNDb3dUvYdJG9QUyvw3Fs/R2NCCf4GqWJun+pcUBxiUJzYd/u6s8uf/7m64ttWciJIcD7q1KKy7kPkjXXx3wH4rc2kE1BrE4I/nr3Jt9iFdafaS6N5RyiBNqgZDovZd91ZBqkWghAZ/1QXNgBZJXjcBgFySRvd9sEFgsRhEMFHHvdSFLD/qbXjJ8HFPjr0Bmgpw9l3v4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2019 09:52:04.5561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfce155-26eb-45dd-3eaf-08d6e02d7a2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ekb9YTlmNqFoH13ieb0qQJwyAEPnLzI/1QoEponUnhA=;
 b=tpAUwVP5W0+p+2s1vInL+fLWsj6N3TRcEmljN1mMabc0jLMYeDlCeFoKtOxBhW8CkGWkXoWzgUNxNdm6rCY1N5OSa22iDPszKFjBQ4QzHcR+iucbwfc4DhfENfR4+t+Al0vqNmLjpQA3pxAPWLKyl3u9WrnREs7Hdibn+5BUzAA=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZGNfZGVzdHJveSBzaG91bGQgYmUgY2FsbGVkIGFtZGdwdV9jZ3NfZGVzdHJveV9kZXZpY2UsCmFz
IGl0IHdpbGwgdXNlIGNncyBjb250ZXh0IHRvIHJlYWQgb3Igd3JpdGUgcmVnaXN0ZXJzLgoKU2ln
bmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA3ICsrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZmQw
NDIxNy4uZjU1OGM5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCkBAIC02MTYsNiArNjE2LDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiBzdGF0aWMgdm9pZCBhbWRncHVf
ZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlhbWRncHVfZG1fZGVzdHJv
eV9kcm1fZGV2aWNlKCZhZGV2LT5kbSk7CisKKwkvKiBEQyBEZXN0cm95IFRPRE86IFJlcGxhY2Ug
ZGVzdHJveSBEQUwgKi8KKwlpZiAoYWRldi0+ZG0uZGMpCisJCWRjX2Rlc3Ryb3koJmFkZXYtPmRt
LmRjKTsKIAkvKgogCSAqIFRPRE86IHBhZ2VmbGlwLCB2bGFuayBpbnRlcnJ1cHQKIAkgKgpAQCAt
NjMwLDkgKzYzNCw2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCQltb2RfZnJlZXN5bmNfZGVzdHJveShhZGV2LT5kbS5mcmVlc3luY19t
b2R1bGUpOwogCQlhZGV2LT5kbS5mcmVlc3luY19tb2R1bGUgPSBOVUxMOwogCX0KLQkvKiBEQyBE
ZXN0cm95IFRPRE86IFJlcGxhY2UgZGVzdHJveSBEQUwgKi8KLQlpZiAoYWRldi0+ZG0uZGMpCi0J
CWRjX2Rlc3Ryb3koJmFkZXYtPmRtLmRjKTsKIAogCW11dGV4X2Rlc3Ryb3koJmFkZXYtPmRtLmRj
X2xvY2spOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
