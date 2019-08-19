Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84A9270E
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7AC6E186;
	Mon, 19 Aug 2019 14:36:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1736E176
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTENJQ/n31FZ+r53vgizP5XvbYINMZCFhUq5aSDlYxkUWcTmdRGLsZ9zI+Fi/S+O7NrAH74X79ZNnPmT9zFTt7VNma9+bHX46XdL0l4Cba4mClv5wfxLIZxsAVGpUHXVvyBeRAhrjRvPaxqHCq1j/4Q02e0Kni6HnrDDOuSf+5DdTeJ3h3suz7xCMcf2c3LXcJUL9VomtzrGAr5S8YS8tVUd/3JmmO9X+52eVX0HNGKVFo/jIr1lty3b8UChZafV5T/XGeb7UHB0w6TGSxCpIfDV2MuKJVyw731g6yGCt6pJJm00VCrU81CbnF76LbUTPIGba4GUW41aQSlkhf05uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM6dkF0bgV/qVB6gPxeOHvxOrL0QDSizzC5G8kLACxQ=;
 b=ZWs/wNVsEmEH4PE9izGSZt7XMZaYEjjQ5zqqYOrhG+PTPbnx6ivn1nJDbu4NR2YpJYgxWsF0NwPX/FJnNRYrzmhdbDnYeqdv4HS75ygdwWFHfJLq39bgDH2AZJn91mb7bxFWOGRtIkDeLqZnFa1572FUFW+K1yT75POrYtzPCbuiBig1qMZSMa/8zLrE1VNK7AGPBS+Uxbue5nInBUlqveqeoe8VtxKp0OREfHXYtliK9+XPkW3NrOiL++5kBHp60iuAXAfhBQmUe6liiQOZC/JyEr/UI1E97NC3MlDmRCCRMyFtP4yZaDje2irso443r80f7PjrlY/ToKqciG9Grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:36:11 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:10 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 36/36] drm/amd/display: 3.2.48
Date: Mon, 19 Aug 2019 10:35:15 -0400
Message-ID: <20190819143515.21653-37-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(2351001)(53416004)(2616005)(6916009)(476003)(7696005)(11346002)(51416003)(446003)(1076003)(76176011)(426003)(2906002)(86362001)(316002)(16586007)(48376002)(336012)(70206006)(70586007)(478600001)(486006)(126002)(50466002)(4326008)(305945005)(36756003)(6666004)(356004)(8936002)(5660300002)(81166006)(8676002)(81156014)(50226002)(186003)(26005)(4744005)(47776003)(14444005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab86b1d-c832-406d-c5e5-08d724b29427
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278D204825DDF85D81D8F11F9A80@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KDq0NVPJaP7kST+cl/NIjqyH1lAp8sudIl2pLU7QQOLt8mxqBd5uj3LZOUftIEBDrQGCs0URec3GrcBTfjuD7ifH7iQjWhwv99+572TfUEKShm/cu+Qf71LUziX0XIlsi5mXekVLJfy84TTfkNf6Vz3CkyyLbk1O0vwkrNWlF1J51/5UpcCKoU1GtWh3/AOOVMPdFp9a/S6yCfwYHO7rRw6QVI3Tmil4MczIpr7wQsqrpwQBsXGTAYrkPOnEDjWuX4q22Ll7ag6aYL8aYOJkZiHRsxiNV9NwQ+OMYj7USFmAQIlcKDq49w6ynkmoSeJIz5qFvtiTkffU7ZrnVc/bDk9hIgb09eBtLo0teMkhZpWp1PzWg2RBKAqRWYC6jgC0lQEOlUdrLNM/mlfcgHN80unT6IC2lUZJN6cs3BirjJw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:10.2886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab86b1d-c832-406d-c5e5-08d724b29427
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM6dkF0bgV/qVB6gPxeOHvxOrL0QDSizzC5G8kLACxQ=;
 b=J12bGDwngm6GBKBJIG6DzIQGAkil+PCvORE4fG8HiLA4yMBP/HCdW2S1mxpg7Pc6UT6EreabUDvXXDyHASuc9qLGp3anqTBjky7yJFMvq+4IT5z0RcCcuGsWz+onJ7iyZSGPxcXfNmIwsDwgSRhqpli8oPOMoRK0wzF4HXefeIw=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBB
bnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29v
IDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IDIzOWNiMDk1MmM2MS4uOGZm
NTk1ZTY2YTZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzksNyArMzks
NyBAQAogI2luY2x1ZGUgImluYy9ody9kbWN1LmgiCiAjaW5jbHVkZSAiZG1sL2Rpc3BsYXlfbW9k
ZV9saWIuaCIKIAotI2RlZmluZSBEQ19WRVIgIjMuMi40NyIKKyNkZWZpbmUgRENfVkVSICIzLjIu
NDgiCiAKICNkZWZpbmUgTUFYX1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
