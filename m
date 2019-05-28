Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB32C0D0
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 10:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157789AB9;
	Tue, 28 May 2019 08:06:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C6389AB9
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 08:06:23 +0000 (UTC)
Received: from DM3PR12CA0084.namprd12.prod.outlook.com (2603:10b6:0:57::28) by
 DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 08:06:21 +0000
Received: from DM3NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM3PR12CA0084.outlook.office365.com
 (2603:10b6:0:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Tue, 28 May 2019 08:06:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT043.mail.protection.outlook.com (10.152.83.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Tue, 28 May 2019 08:06:20 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 28 May 2019
 03:06:20 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu:Fix the unpin warning about csb buffer
Date: Tue, 28 May 2019 16:06:15 +0800
Message-ID: <1559030775-19612-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(26005)(53936002)(476003)(2616005)(126002)(77096007)(72206003)(53416004)(426003)(486006)(36756003)(2351001)(48376002)(70206006)(6916009)(336012)(50466002)(4326008)(4744005)(70586007)(47776003)(5660300002)(81166006)(305945005)(316002)(81156014)(2906002)(8936002)(6666004)(356004)(16586007)(8676002)(14444005)(51416003)(68736007)(7696005)(186003)(478600001)(86362001)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0059; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2cc872a-7a18-484a-c8d4-08d6e3435ead
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0059; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0059:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0059EBE617209A5B7933EED08F1E0@DM5PR1201MB0059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /7QC5yevZA7iVy7MCLrUUc9frxdjHauC+hEykKX2uplJO0Ia4kZ7jVoN+ixVx8dBPY5U1FAa1+DiOVrE86pjeCKnpk3wDzFyYU/Tx86KYGDuHk59SnocO6q2hTmd1G7UNIaVVCULTuhAyR3wdzPy3j3/xqsZiEDx620KCW7evj/0ZjUi5GTugczrc8wZ9YOSLGY9ECMgiLBKWyAgmD/H1nJcq1ODitDWEwWDsrFay6yIQRaPVMerpwusj33Rat5yJc5AmKHqAPmT7/mvlR1yS8tcFOrsgcOsSNnbcHSUjq8HifBfdE1qJvFmX7suIu1EawqZYrITLzOvWWbUmaUKeyltFX23an3S3CfFX1OVzEvXRDS1R2OrO1Cy1u9GFBhAJT4YzVE4h4FxCRxu+0omj8ig+QLbIhFrKvNNresdlrY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 08:06:20.8834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cc872a-7a18-484a-c8d4-08d6e3435ead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oasjQeYrbjhXuIhi7qRwOUDb1dSLl4xY4szLnXcoPBU=;
 b=eoaEp5S7687/S790XOlqR7sR86dTR3Xj6J18XH631tBfAbqwhIVC2mu09gKHDwrG/+0pgtgUkN9dHIWqe2MWXKlThddnhBCAqD3ePHfbeEqmkZsAiPbD9a+mMBuqP1WaX8wyUkPTvcZQReZUaHFYe4AbZr3NGrW8KlAwYYcpPTk=
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

QXMgaXQgd2lsbCBkZXN0cm95IGNsZWFyX3N0YXRlX29iaiwgYW5kIGFsc28gd2lsbCB1bnBpbiBp
dCBpbiB0aGUKZ2Z4X3Y5XzBfc3dfZmluaSwgc28gZG9uJ3QgbmVlZCB0bwpjYWxsIGFtZGdwdV9i
b19mcmVlX2tlcm5lbCBpbiBnZnhfdjlfMF9zd19maW5pLCBvciBpdCB3aWxsIGhhdmUgdW5waW4g
d2FybmluZy4KClNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgNCArLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggYzc2MzczMy4uY2M1YTM4MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC0xNzk0LDkgKzE3OTQsNyBAQCBzdGF0aWMgaW50
IGdmeF92OV8wX3N3X2Zpbmkodm9pZCAqaGFuZGxlKQogCiAJZ2Z4X3Y5XzBfbWVjX2ZpbmkoYWRl
dik7CiAJZ2Z4X3Y5XzBfbmdnX2ZpbmkoYWRldik7Ci0JYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwKLQkJCQkmYWRldi0+Z2Z4LnJsYy5jbGVhcl9z
dGF0ZV9ncHVfYWRkciwKLQkJCQkodm9pZCAqKikmYWRldi0+Z2Z4LnJsYy5jc19wdHIpOworCWFt
ZGdwdV9ib191bnJlZigmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwogCWlmIChhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikgewogCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFk
ZXYtPmdmeC5ybGMuY3BfdGFibGVfb2JqLAogCQkJCSZhZGV2LT5nZngucmxjLmNwX3RhYmxlX2dw
dV9hZGRyLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
