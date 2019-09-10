Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E8AEC68
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F59892FD;
	Tue, 10 Sep 2019 13:55:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700069.outbound.protection.outlook.com [40.107.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E48892A1
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0lRzQJJl4jlQHq/bxfqKeZMXFrheSkBp9G/7esfRIjrp3ouazx6r8ILRibTSLlT1+rB9gsp2vGadUYw5r4TzhbVZT30UX9zuKVVsbz2nNaYeqf1wScaypcUEJxnKBOjMsUGILGb+Tfq+jrIqrYS/FAJJ26ml6SROClXi6MGWRSd2BBBA/3JPH+SSU/GKqaQRhDEZSAHebHxQmWdsy2tcbyqPDdvJNKgAWJmXkX4rzsTX0GD3IJb/8SJhW+ZakV+zft7fRaWjX05CDLpIgW7F8wGm0N5T8nlmVuleliHuN48w7VM6lY5GqpN+VfoQ8mnzAY2jyuxQsIxFfCm/DW2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMkQ5mwfQXaeCLXiwg0x/PtK7m1YYf1sO1cwkTPn3aU=;
 b=oHBw0si5i2qO7xGz7qU8maX4CNBofPJ8HPch1hxZvdeZVKe6gK5GyGr/EAIjowRrTw4FIIWfBMkNDlZZTbUyQKquSVc77R/QiAsbj8RTJackPlA2M1BClSmSukNQ94pA84hg8Lz1u976/g7jS1FYh8cf9+t0RWEi5sXmJ4Bifk75ySYQdta5i2tV1kD13EC8iuJPN1efIh3TbwZ2tVG+p9zO6GvbXlLa7C/tUgh6hTjJH6bS6Mz3JqcA+JOgwFS0iENNIF7f1G1w/3I7teX7mOKqfWHMiKCOkRaAx4B97FfPLYU3DyX97+gZOuGZbIg7J3sYW3BZPYRpgX3KC9CWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MN2PR12MB3821.namprd12.prod.outlook.com (2603:10b6:208:166::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:54:59 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:58 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/25] drm/amd/display: Rebuild mapped resources after pipe
 split
Date: Tue, 10 Sep 2019 09:54:24 -0400
Message-ID: <20190910135445.18300-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(81156014)(6916009)(4326008)(8936002)(1076003)(70586007)(14444005)(48376002)(50226002)(50466002)(76176011)(305945005)(478600001)(51416003)(2351001)(36756003)(2876002)(8676002)(126002)(47776003)(2616005)(426003)(11346002)(476003)(53936002)(336012)(446003)(49486002)(486006)(26005)(2870700001)(6666004)(86362001)(2906002)(70206006)(81166006)(316002)(54906003)(5660300002)(186003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3821; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09ee30a7-3fb7-499e-eb67-08d735f6781b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB3821; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3821:
X-Microsoft-Antispam-PRVS: <MN2PR12MB382129D108978A6781FDE21482B60@MN2PR12MB3821.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y6TvdfHPa03WMq5uHyp5jOWxSpj9ToC/E9bepKnjMgLy1v7Lo52BN4Ysb7LH7RTmZFsdbUrJVoALHoqOw3tCWev7h9i9QuNk6YlPvXvGGlksZN24P3XUZehajHpAEFaV/54IOQnf/78BCLz+zqqV+N1XVvv72uSP8AndDEy+aIFlF/hb3JDPdNBmCe38P0EOSs2qCPi6P1svAiehZRPiicDyzbgS+NtsGFY4voKybHWcOuam/bV+Rck5H9b2WNtV7qRWVAen61wYDRES3BSS5YWu4/FCTkk1V4zC+vwnc+GwCSSPrP9b8ofTSbKDVru998CHTS3HKZP1wf9SRnY8j1zyE0vhCQdh93DsPeMf4CD6JAPNWIKjCnhFLJqe7AGrX+6k3TtH0S8KTz1wjPmHTYn/WTvINDlM9URopfXn/6E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:58.7685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ee30a7-3fb7-499e-eb67-08d735f6781b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMkQ5mwfQXaeCLXiwg0x/PtK7m1YYf1sO1cwkTPn3aU=;
 b=IbNNrTXWqHSALwNi3qAVVeO65izAdFteBGcJVSN6vZE0i/oTqcGpD0D17mSmn4Xvdk3tqYDIrupTuVyhYQlzHLNHPSK+T79sy130ghLvjwDXkZlKJKGrhEeoA/tBFuHCh61dBtZPpS9ZLohDJxUZew0fSV4NJBvKJ3wIIrufMVg=
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
Cc: Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKW3doeV0KVGhlIGlz
c3VlIGlzIHNwZWNpZmljIGZvciBsaW51eCwgYXMgb24gdGltaW5ncyBzdWNoIGFzIDhLQDYwCm9y
IDRLQDE0NCBEU0Mgc2hvdWxkIGJlIHdvcmtpbmcgaW4gY29tYmluYXRpb24gd2l0aCBPRE0gQ29t
YmluZQppbiBvcmRlciB0byBlbnN1cmUgdGhhdCB3ZSBjYW4gcnVuIHRob3NlIHRpbWluZ3MuIFRo
ZSB2YWxpZGF0aW9uCmZvciB0aG9zZSB0aW1pbmdzIHdhcyBwYXNzaW5nLCBidXQgd2hlbiBwaXBl
IHNwbGl0IHdhcyBoYXBwZW5pbmcKc2Vjb25kIHBpcGUgd2Fzbid0IGJlaW5nIHByb2dyYW1tZWQu
CgpbaG93XQpSZWJ1aWxkIG1hcHBlZCByZXNvdXJjZXMgaWYgd2Ugc3BsaXQgc3RyZWFtIGZvciBP
RE0uCgpTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+
CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCA2MmU5YTk4MjZjOTcuLjlhY2Vi
MTU5YmVmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI0NjYsNiArMjQ2Niw3IEBAIGJvb2wgZGNuMjBfZmFz
dF92YWxpZGF0ZV9idygKIAkJCQkJCQkmY29udGV4dC0+cmVzX2N0eCwgZGMtPnJlc19wb29sLAog
CQkJCQkJCXBpcGUsIGhzcGxpdF9waXBlKSkKIAkJCQkJCWdvdG8gdmFsaWRhdGVfZmFpbDsKKwkJ
CQkJZGNuMjBfYnVpbGRfbWFwcGVkX3Jlc291cmNlKGRjLCBjb250ZXh0LCBwaXBlLT5zdHJlYW0p
OwogCQkJCX0gZWxzZQogCQkJCQlkY24yMF9zcGxpdF9zdHJlYW1fZm9yX21wYygKIAkJCQkJCSZj
b250ZXh0LT5yZXNfY3R4LCBkYy0+cmVzX3Bvb2wsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
