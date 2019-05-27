Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF22BAD8
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325B899D4;
	Mon, 27 May 2019 19:51:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4AF899A3
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:51:56 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 MWHPR12MB1277.namprd12.prod.outlook.com (2603:10b6:300:f::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Mon, 27 May 2019 19:51:54 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:54 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:51 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/26] drm/amd/display: Move CLK_BASE_INNER macro
Date: Mon, 27 May 2019 15:50:43 -0400
Message-ID: <1558986665-12964-5-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(81166006)(8936002)(50226002)(426003)(86362001)(72206003)(478600001)(2906002)(316002)(446003)(2876002)(305945005)(8676002)(2616005)(486006)(476003)(70206006)(81156014)(36756003)(70586007)(126002)(11346002)(5660300002)(47776003)(68736007)(26005)(2351001)(48376002)(6666004)(7696005)(51416003)(53416004)(86152003)(76176011)(186003)(16586007)(50466002)(4326008)(53936002)(77096007)(6916009)(356004)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1277; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d4d534-f03b-48fc-6039-08d6e2dcc4db
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1277; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1277:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127707BBA0B8D6BC58FFF77E821D0@MWHPR12MB1277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AsAkr8irbfbRT3LFdQSFmkDPo3TuvGSNV1EsmRjWp28YYEREfC1ZZUa20lBgAB/tsUse0bgZhIYTWR6kx0iwjCcKjpTmRd3oKZUNK7WVKA9gzau4cxTalZHyLWLwAycw0ysEo8XAOmqnlTukbHll0wC65TAhVE+MnEZafyiTOygpXAkG4ZcXmTpApJ9khwkYEYJyGJaW507MJ9ATIvVpaza4tT8i4ipbrrL0h1jI32HaB2XlmztGOjGDKODl70GpV+gcNZayX+Vjd2AheXT98JCKfFOKA+bEQKETSLGKig2ZN19/nCkZWTPBEwBMjGkewdPdKYeiQjoogF1F4ofcOOzgENytbGo3pV+ziGW51L2T+/yx08Hl5zISvJ/IbBDW1K+WiNdDqvjBGtYXNy3WRZoBzxuhot7Pu7IzVMsMnOM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:54.1006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d4d534-f03b-48fc-6039-08d6e2dcc4db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbD/S4YNCjbJzjx+bFsKV3Ht13bXWqyq26Aq+GJiqOo=;
 b=WJ2uoMOaCawgHa35oR1w5hg9phNhppkDhNBIRPr+tRYGtMz8qwrq36eodSfve5ahpMbbtZNERScFweDoqfZTvXr6m8/9z/odH3n0Vd18tSBCTU4sYY/auOTfl26+oPte3G7ItGn7DOIuur55cW5GxOreTVTf1AQhCYhTsXlcjCw=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpUaGlzIG1hY3JvIGlzIHNwZWNp
ZmljbHkgdXNlZCBieSBSVjEuIE1vdmUgaXQgdG8gdGhlIGFwcHJvcHJpYXRlCmxvY2F0aW9uLgoK
U2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9ydjFf
Y2xrX21ncl9jbGsuYyAgIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2h3L2Nsa19tZ3JfaW50ZXJuYWwuaCB8IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMTAvcnYxX2Nsa19tZ3JfY2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMTAvcnYxX2Nsa19tZ3JfY2xrLmMKaW5kZXggODg3ODE0Yy4uZTk5
YWYyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL3J2
MV9jbGtfbWdyX2Nsay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9ydjFfY2xrX21ncl9jbGsuYwpAQCAtMzYsNiArMzYsMTAgQEAKIAogI2luY2x1ZGUgImRjZS9k
Y2VfY2xrX21nci5oIgogCisjZGVmaW5lIENMS19CQVNFX0lOTkVSKGluc3QpIFwKKwlDTEtfQkFT
RV9fSU5TVCAjIyBpbnN0ICMjIF9TRUcwCisKKwogI2RlZmluZSBDTEtfUkVHKHJlZ19uYW1lLCBi
bG9jaywgaW5zdClcCiAJQ0xLX0JBU0UobW0gIyMgYmxvY2sgIyMgXyAjIyBpbnN0ICMjIF8gIyMg
cmVnX25hbWUgIyMgX0JBU0VfSURYKSArIFwKIAkJCQkJbW0gIyMgYmxvY2sgIyMgXyAjIyBpbnN0
ICMjIF8gIyMgcmVnX25hbWUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvY2xrX21ncl9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgKaW5kZXggNDJmNzJjNC4uNTNmNjI4NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdy
X2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9j
bGtfbWdyX2ludGVybmFsLmgKQEAgLTQ5LDggKzQ5LDcgQEAKIAljbGtfbWdyLT5jdHgtPmxvZ2dl
cgogCiAKLSNkZWZpbmUgQ0xLX0JBU0VfSU5ORVIoaW5zdCkgXAotCUNMS19CQVNFX19JTlNUICMj
IGluc3QgIyMgX1NFRzAKKwogCiAjZGVmaW5lIENMS19CQVNFKGluc3QpIFwKIAlDTEtfQkFTRV9J
Tk5FUihpbnN0KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
