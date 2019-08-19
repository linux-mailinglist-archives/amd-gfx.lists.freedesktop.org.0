Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD26926F9
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571BA6E161;
	Mon, 19 Aug 2019 14:35:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770566E15F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8M+aIHQ2avqzvyH8xYq0HJqBlL/tailglNW3JG2Rp5qiTdO9KGNNWqNCelVcaiFAYdVEoiSjdeZjLa8UI6f/O4VACxwvwUMa+LB8ctTbsg3MaDSuKhK74e6lkaNOhHJjWWBRZRToRBBbzhAHg2PfsrV/LrZ7YBIE4n2Ec7xkEI1/Bh3ZlJKhBYWaBXf03iCHwV0m88bEifQPnGpvizdLi5maSZrD0UBl5ONvhnXUUPfvdUhMBD3DnwSO/46x6m9113D6B6eqMa7eBqNrjXptqFWlwvckmG3dyHTl71akTRaMFMesJnX2xl+ngSgfW715coJ+DKo/K/FQUck+jxu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jFfTEckH3ggb/3L8N6hlXKMwErVByZBe6yZTbfJ4qY=;
 b=OGhgJZTY7Ve31gwQybx/BcCBCAu9UNwoOd1uLTgl4OMC89rjfEX0ncITiw45b8dPQM0SbW8UxwPmwJuG2V2fOhcQB6thFSeQcOhSWNVXXUGiqJqqXu5e3jtlSrK+CijfllVKTmtqY6+NJu+KU0+eTDomdA0aBP1RsAsNN8Bop2EH2+WbjCtmf2CvrypQtsfX/2f/FZGBF8LNtPdLXC+NBjv//rg9Hg55XiKqfnab4Egr2UaWmbYwwjTWOFTNwzZXkUSglzPYQztQHiekeUEviw8zwZm9CKEVlxn0Ru1BoNEuAsLEqitmq9xdzyBoF8e44M0/XbQ2QcOuK3XfV+o8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:35:53 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:52 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/36] drm/amd/display: 3.2.47
Date: Mon, 19 Aug 2019 10:34:54 -0400
Message-ID: <20190819143515.21653-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(53416004)(5660300002)(48376002)(305945005)(478600001)(186003)(7696005)(76176011)(51416003)(8936002)(81166006)(1076003)(2351001)(26005)(476003)(2616005)(11346002)(86362001)(126002)(4744005)(446003)(486006)(4326008)(50466002)(6916009)(47776003)(336012)(426003)(70206006)(70586007)(6666004)(356004)(53936002)(316002)(36756003)(16586007)(8676002)(81156014)(2906002)(50226002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9df9847-d643-4a52-0be8-08d724b289a5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12723A3C3419FFBFBE40966BF9A80@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: buBl2X9VY3xDlY5pC0lC3hF+UOrQj8psp1qqy5fmH7CE+oscvUOjh+nGSeu7UabS7Jtayzzw891Z607iT4u23ZF9eKGcjgVh6NilfsBHiGvOhjHnu4GRfMi8W8JDTgL/XDcvXVBl4Zu/q0h31B6iFvCwdezIDEJEQDXSA+bYFzZ4KgwMDIYRYhNfcvc+WKeDIjcNyK33sSXxOrllpUjtFWjv6ynQAYHSwvNmL94MxXAWJIdtO1Zn+z9gwQ+s20L9SEmuWUyA1qyQxGVIMdzPInrHqcyNDAA/zVvQC8LkX+WjwP+i2NtfcWeeEcmaJ6CWjB8lF+Hl3OyzM4rPac1/1s1NKB2pKIi6AtJvQaB+0QmaXIS6lvoTa0yXTttkYE3qblFxM/TnblJWLrwGplOfpQM/lNlD87HZEUVa+m70hFg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:52.6646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9df9847-d643-4a52-0be8-08d724b289a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jFfTEckH3ggb/3L8N6hlXKMwErVByZBe6yZTbfJ4qY=;
 b=KqeAG6WLlk2X8+4JXjrdhoS5AYSumj3SnQwTc61k27hh7rcGd3U/TWRdwTbzgSQgezMkRYW2ha/8fuHd1wyQlFhD+IHf0bPMAZEk+ieYrx2xROwGzYPlB9U2zQQSJKsWVsYsIUGwJT51MFwafF6RZD3BOqpA2V1e05O4Uv94kdI=
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
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IDZlZTgyZWM2ZTI4YS4uMjM5
Y2IwOTUyYzYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzksNyArMzks
NyBAQAogI2luY2x1ZGUgImluYy9ody9kbWN1LmgiCiAjaW5jbHVkZSAiZG1sL2Rpc3BsYXlfbW9k
ZV9saWIuaCIKIAotI2RlZmluZSBEQ19WRVIgIjMuMi40NiIKKyNkZWZpbmUgRENfVkVSICIzLjIu
NDciCiAKICNkZWZpbmUgTUFYX1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
