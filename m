Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2FDB742
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82D76EAD0;
	Thu, 17 Oct 2019 19:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700059.outbound.protection.outlook.com [40.107.70.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B66EABF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTNS+Ixwr9uvXTwpqB1/TPWicS0kUvPitW902S+e7w6wtl+L/A2NcA9E6XMtprP/nRW+ephPyR7kFQ6vxDlRt685jt1fVfPCZx5FSqdMZOICiumGws7+Cftk9lK12KvFRTsCIUNEoNrP1lPs62Ub836WkN2OJcyz+CKsSRb/yalfPteU2rRw0nQoWzlXcej76jBzhyIaY4sccFSGv6aOU2pEjC3einKjTO9/bzRgQsKbpx65Ntg6u7rcDHOvWdbr+hFaSTPXgJFfIm3wBlxPQ1Awx790mw0tzdX7Oi+3ZjRqLZSYxSetQ3eTvdZpnOdAaw7oyC10hYHZZ7m6ZVQyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A3+oFlmDMUyLrsBSAEz/RU5T1qCWFZnNoMM2Ms3RuI=;
 b=IssECQy88RCE6jPHzBElZJds3k6/wBCuuCpoh/1SPdDQjQpqZmYb3cUHAcYkdV8mJP/v34029DkCZrXrIierB87CdpjcIScnZ7iFsNsvIF44E8uHWrEc5uiXqj06NFBVmDD7w2EDQ7/VhgYEKM21XFwbo4BQnhAYzYSRF7/c8wqPil25/dECgIcPBC1Pm58BE2tUmchWQBPAdx08WuZHTF4Ppqwn7vGvKr7Yt8ZvCX3BozEYc97HTXkDAJHdxPzVASo6adnrWqvTPSAD0OMsm4r4P3ytRbAxX4YAaH7qHaB4350uwZzlCaQkvfy034ZnfFN1d4hbCwEu+rv1UZP4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:405:4c::23) by CH2PR12MB3991.namprd12.prod.outlook.com
 (2603:10b6:610:2f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:56 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by BN6PR1201CA0013.outlook.office365.com
 (2603:10b6:405:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:56 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:55 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 37/37] drm/amd/display: Apply vactive dram clock change
 workaround to dcn2 DMLv2
Date: Thu, 17 Oct 2019 15:13:29 -0400
Message-ID: <20191017191329.11857-38-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(428003)(199004)(189003)(6916009)(305945005)(14444005)(316002)(50466002)(36756003)(81156014)(186003)(48376002)(86362001)(81166006)(336012)(76176011)(50226002)(70586007)(51416003)(8676002)(70206006)(8936002)(54906003)(1076003)(2870700001)(2906002)(47776003)(426003)(486006)(356004)(6666004)(4326008)(478600001)(26005)(11346002)(2351001)(2616005)(476003)(126002)(446003)(5660300002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3991; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb6769e-5011-44c7-b466-08d753366fa6
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39910CDB8D25E20B24C1849B826D0@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEdp7cFsSXixtN9xJBisV+plrt5PAMIkwvHgeVYU1DiAxrRyBR/JiCwtnCr8Jv0CEr7AZL8Qv3cJCm+xJavs6Sc9wWbvfgaRQjWgKW/jMvmhIuEJp7NbQHsjvL8jEELVbImhuKaTFDcZIzW8u5b1zjce+5RZpsYOvaT5qegCV1fILF+/JutRJ3vyT9Q9wdOy0yykmQ8ygkJrkNulR3Nq+ypcD2/znWPgklncQho9sKHM/c0OlIv1uaSi0x6KUZsCBw5/HCAfpwK12sJ7VaNUEfr3Sr/BbczfBMqQnBN1YbpO0sVOmo1vOjgw2VREa+5pinhv1I72UDIsgs8VeXeKypWSrqW7+cTMdS5foKP1jN5Pv6hP1VyT4TxSqZhQkIwO86R+5/ozsAszD0r5yQ5hmeGl7oEtI50n6RyFc/eelWY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:56.1428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb6769e-5011-44c7-b466-08d753366fa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A3+oFlmDMUyLrsBSAEz/RU5T1qCWFZnNoMM2Ms3RuI=;
 b=n6d42McR851MqXk6+EaSxo/s92NK/g3CLMpAlZD085HX/VFQ58GrqqAIW3qhVBIt6vlJp1832QIIYeWC8xFn4t7HOD31FSmW1Pu1ESmtn5B+qEC/3TNJDkWwLp1OqmqOL1IhvoeeKT7k26ulm7SV75+C0N55ESCWzhXAbF5fWeE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <joshua.aberback@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClRo
aXMgd29ya2Fyb3VuZCB3YXMgcHV0IGluIGRjbjIgRE1MdjEsIGFuZCBub3cgd2UgbmVlZCBpdCBp
biBETUx2Mi4KClNpZ25lZC1vZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNr
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2RlX3ZiYV8yMHYyLmMgICB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kaXNwbGF5X21vZGVfdmJhXzIw
djIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjAvZGlzcGxheV9t
b2RlX3ZiYV8yMHYyLmMKaW5kZXggODQxZWQ2YzIzZjkzLi4zYzcwZGQ1NzcyOTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2Rl
X3ZiYV8yMHYyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24y
MC9kaXNwbGF5X21vZGVfdmJhXzIwdjIuYwpAQCAtMjYxMSw3ICsyNjExLDggQEAgc3RhdGljIHZv
aWQgZG1sMjB2Ml9ESVNQQ0xLRFBQQ0xLRENGQ0xLRGVlcFNsZWVwUHJlZmV0Y2hQYXJhbWV0ZXJz
V2F0ZXJtYXJrc0FuZFAKIAkJCW1vZGVfbGliLT52YmEuTWluQWN0aXZlRFJBTUNsb2NrQ2hhbmdl
TWFyZ2luCiAJCQkJCSsgbW9kZV9saWItPnZiYS5EUkFNQ2xvY2tDaGFuZ2VMYXRlbmN5OwogCi0J
aWYgKG1vZGVfbGliLT52YmEuTWluQWN0aXZlRFJBTUNsb2NrQ2hhbmdlTWFyZ2luID4gMCkgewor
CWlmIChtb2RlX2xpYi0+dmJhLk1pbkFjdGl2ZURSQU1DbG9ja0NoYW5nZU1hcmdpbiA+IDUwKSB7
CisJCW1vZGVfbGliLT52YmEuRFJBTUNsb2NrQ2hhbmdlV2F0ZXJtYXJrICs9IDI1OwogCQltb2Rl
X2xpYi0+dmJhLkRSQU1DbG9ja0NoYW5nZVN1cHBvcnRbMF1bMF0gPSBkbV9kcmFtX2Nsb2NrX2No
YW5nZV92YWN0aXZlOwogCX0gZWxzZSB7CiAJCWlmIChtb2RlX2xpYi0+dmJhLlN5bmNocm9uaXpl
ZFZCbGFuayB8fCBtb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzID09IDEpIHsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
