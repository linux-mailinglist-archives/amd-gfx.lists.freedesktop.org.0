Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9810190
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B21892C8;
	Tue, 30 Apr 2019 21:10:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730063.outbound.protection.outlook.com [40.107.73.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44C8892BD
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:18 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 BY2PR12MB0647.namprd12.prod.outlook.com (2a01:111:e400:52e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 21:10:17 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:16 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:57 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/20] drm/amd/display: Fill plane attrs only for valid pxl
 format
Date: Tue, 30 Apr 2019 17:09:36 -0400
Message-ID: <20190430210938.32335-39-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(8936002)(53416004)(50466002)(72206003)(53936002)(478600001)(70586007)(476003)(1076003)(2616005)(11346002)(486006)(86362001)(47776003)(6666004)(126002)(446003)(81156014)(81166006)(8676002)(14444005)(356004)(2351001)(50226002)(68736007)(26005)(305945005)(336012)(186003)(426003)(70206006)(77096007)(4326008)(16586007)(6916009)(36756003)(76176011)(51416003)(2906002)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR12MB0647; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846f7e96-aaf1-4e00-257c-08d6cdb03e62
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY2PR12MB0647; 
X-MS-TrafficTypeDiagnostic: BY2PR12MB0647:
X-Microsoft-Antispam-PRVS: <BY2PR12MB0647DB8C62EA623D801EC76BF93A0@BY2PR12MB0647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: psM5z+6tYsLqRwWQLEG+HMMxPJnirqBsp6eqf2GjWtm06BBEo2xuq6s1yBQRpSqTwCe5QczigpWHCH0g6eKaGW6uAPELWzmMqfawBGrVSHMQY65R1auC4Z3vv0PdN5E/3G900ZNCVait8/9U5CsmyMxOJzmC8N/xjhEfFJr6dlO7TPDVp4bW8Cf4hWIQTDcy9Aq1CsmklnZrdw10QXcPYuJ6k5LZQQZkqEaw9uWeoGAZX8GpV7CfJurnOuU4zk57VkL5zEurHH5RDZ+0HqbMyZBlg1gy2KciNrOjISnr5FWW7W05W4Jm1QdACXvyfmEDq70tZNQMqsD707fwTz/59Xrok3/bD2WxBZ898TEkI29gK7TvyWgldr1bmPMYif+qfv9DxSDZQZfC1yaoZ9XqcCyUvwNExY8teZgK7TJgdaI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:16.2206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846f7e96-aaf1-4e00-257c-08d6cdb03e62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR12MB0647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqjGHpeTZii06UpI2EPB/lW+vSMQJC3HVz5b8cFot2s=;
 b=n3w1vFJXiZFgydjFCgK7NWoAUyGesGvVg6M3mmGIVctlogEtiFzX39UGRYMoAGt95Vo+CMTgFmDJ7jEtGLF43giw4r9CFYFfQlK41NEQxAW17uGibcFUtpyJ3juQS/lt79H64gIqMp8HtdFFZ7eWk3vzmwaWXZy+0HuxgwkjzPg=
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
Cc: Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpbV2h5XQpJbiBmaWxsX3BsYW5lX2J1
ZmZlcl9hdHRyaWJ1dGVzKCkgd2UgY2FsY3VsYXRlIGNocm9tYS9sdW1hCmFzc3VtaW5nIHRoYXQg
dGhlIHN1cmZhY2VfcGl4ZWxfZm9ybWF0IGlzIGFsd2F5cyB2YWxpZC4KSWYgaXQncyBub3QgdGhl
IGNhc2UsIHRoZXJlJ3MgYSByaXNrIG9mIGRpdmlkZSBieSB6ZXJvIGVycm9yLgoKW0hvd10KQ2hl
Y2sgaWYgZm9ybWF0IHZhbGlkIGJlZm9yZSBjYWxjdWxhdGluZyBwaXhlbCBmb3JtYXQgYXR0cmli
dXRlcwoKQ2hhbmdlLUlkOiBJNmJiYzMxYjAzZWYzNWEzYjhmODQ2OWFiMmE2MzM4OTVmMjU5MGNl
ZgpTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA4NjQyMzI0NGZmYzAuLjFi
MTE1MTgzOGYwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCkBAIC0yNjU3LDcgKzI2NTcsNyBAQCBmaWxsX3BsYW5lX2J1ZmZlcl9h
dHRyaWJ1dGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlhZGRyZXNzLT50eXBlID0g
UExOX0FERFJfVFlQRV9HUkFQSElDUzsKIAkJYWRkcmVzcy0+Z3JwaC5hZGRyLmxvd19wYXJ0ID0g
bG93ZXJfMzJfYml0cyhhZmItPmFkZHJlc3MpOwogCQlhZGRyZXNzLT5ncnBoLmFkZHIuaGlnaF9w
YXJ0ID0gdXBwZXJfMzJfYml0cyhhZmItPmFkZHJlc3MpOwotCX0gZWxzZSB7CisJfSBlbHNlIGlm
IChmb3JtYXQgPCBTVVJGQUNFX1BJWEVMX0ZPUk1BVF9JTlZBTElEKSB7CiAJCXVpbnQ2NF90IGNo
cm9tYV9hZGRyID0gYWZiLT5hZGRyZXNzICsgZmItPm9mZnNldHNbMV07CiAKIAkJcGxhbmVfc2l6
ZS0+dmlkZW8ubHVtYV9zaXplLnggPSAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
