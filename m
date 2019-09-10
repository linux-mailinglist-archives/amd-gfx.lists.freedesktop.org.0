Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C96AEC77
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0F6E8FA;
	Tue, 10 Sep 2019 13:55:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48866E8F5
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnTT2u13istMgxis5qAYs3YEUsudiZcCg1wPScAa/OoSoNFtz68oXoOHuCMWczFL4yLjv/47g8Y8/LuI3OpjYv5jcXczz62waTDmjS1FlQF/6O2iAqVoAY1t2f9W+Rb269hyZdcJG7xb3YfR2wRyDSMbYy/rdWnUlVY4Q6dRxFogPtsjGqdj3yeVLagNHxkf+2CW2AAdqx3j/Gawa4uuvXEsLb44mDNqx1Ehi88KxkM04dPr7PuB/xDqdk/ggr4FbmwcCk9y5rqEwtfipRAoO5QOxAFeTHDQAZJsNL7G52hrJCTRyhoSTS/0RudgtxzI9FMgvNE2/ubs9FEkCl0EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDu9GKxowVEG4HUTy1Ftljj4Xz7v5rCgznS18N7GKno=;
 b=WkMhisNGweXIxkfJw0iKxYr6nrpLDidTBliBNyhhX6NqcIyxXpXyobJnBzAH/xsFtNXoebCp1W8n+wXFKL9lkKCns5sPN0D3UEFOdR4UT73ockKhDsnSSzZMDHJ76lGCQnRGzVYAkPIckVmayYbJvrOMMQ2D2SokItvyqzue46t0kdwI86O1jH5Hih6tZ1hzYjsM+8n+6f7gUoAi6GXYPJ9xvVuyEglIYKBLCjIkgPrh+NmiWeLizOt/a6qP6bYtbX1kn6FLYEC/BRzfSzWU8Dd6QdjUVEXPYJMiRjraMnldhZvIxWRXywOHtc8ZaT7WVkpMy91FHOzwUvFdXb03xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by MW2PR12MB2523.namprd12.prod.outlook.com (2603:10b6:907:9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 13:55:04 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:03 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:57 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/25] drm/amd/display: Separate hardware initialization from
 creation
Date: Tue, 10 Sep 2019 09:54:32 -0400
Message-ID: <20190910135445.18300-13-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(49486002)(70586007)(2351001)(70206006)(2906002)(48376002)(4326008)(11346002)(478600001)(50466002)(86362001)(1076003)(446003)(476003)(426003)(5660300002)(126002)(305945005)(486006)(336012)(2616005)(356004)(6666004)(54906003)(76176011)(51416003)(2870700001)(36756003)(81156014)(186003)(50226002)(81166006)(8676002)(6916009)(8936002)(26005)(47776003)(316002)(53936002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2523; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec64177-9422-4dde-218c-08d735f67b1d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MW2PR12MB2523; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2523:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2523A817074A55EDA5C561CF82B60@MW2PR12MB2523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FozAaetRSSVTxC6iIc36/tcwlzcYZ58DKSnO8yzOoFK/MJjWCaLDClKT+JM2/6oaqrlfRQw7+zL9wJ8wGj90UWgw+CdOhSMmnrWcUdHm4DK+2/z5zVor3NInm1JcDl6pn4VKCzoAGqkca+ti6FqC10UnrXODTcMQLz5Cy40uWgmZcpu2C5K0WEB97ZEak6BNELKMiVb8BfBiBUjsshlgKLmmCr+EPUu6nysBw+SZiwBRnVddR6rSXrItPXAiycHGksDMa8ZLHEbKN9biyVbxk03ZTAqKN8fN5FmqoN9scF+gKbos1j5DE62kUyS7PUXuSpqs5yL9LjDY3V4F1hyw7IHjnC5JmDi9GS6FNw+huKpDkaowgwHklVbrsUNkL9OY3xIxiT3xYheo6t3OH3gp5E6aglosk4frKaF1aglXLfQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:03.7766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec64177-9422-4dde-218c-08d735f67b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDu9GKxowVEG4HUTy1Ftljj4Xz7v5rCgznS18N7GKno=;
 b=C6SBarN0RERHBXwUa/LGAeeNmi4u51LxDRjYbHjTeoyiAqbtNnY9XZTPdCW0DpihmeTAA9YgMsczMDuQwqI7nDmAtkig3bn4BrSa35upCFd8KBMsKxWmTK4TH4VuLOZP7aF3l5tQQ2kfGiAh6RyfEsi2mGd44877+X+uNpioeGo=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Julian Parkin <julian.parkin@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKW1doeV0KU2VwYXJh
dGluZyB0aGUgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gZnJvbSB0aGUgY3JlYXRpb24gb2YgdGhl
CmRjIHN0cnVjdHVyZXMgZ2l2ZXMgZ3JlYXRlciBmbGV4aWJpbGl0eSB0byB0aGUgZG0gdG8gb3Zl
cnJpZGUKb3B0aW9ucyBmb3IgZGVidWdnaW5nLgoKW0hvd10KTW92ZSB0aGUgaGFyZHdhcmUgaW5p
dGlhbGl6YXRpb24gY2FsbCB0byBhIG5ldyBmdW5jdGlvbiwKZGNfaGFyZHdhcmVfaW5pdC4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgaXMgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gUGFy
a2luIDxqdWxpYW4ucGFya2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255
LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQWNr
ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwg
MiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgICB8
IDggKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAgICAgICAg
ICAgICAgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwppbmRleCBmOWMxM2RjY2ZjMDMuLmM3ODcxZGRiNWRmNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC03MTEsNiAr
NzExLDggQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJZ290byBlcnJvcjsKIAl9CiAKKwlkY19oYXJkd2FyZV9pbml0KGFkZXYtPmRtLmRj
KTsKKwogCWFkZXYtPmRtLmZyZWVzeW5jX21vZHVsZSA9IG1vZF9mcmVlc3luY19jcmVhdGUoYWRl
di0+ZG0uZGMpOwogCWlmICghYWRldi0+ZG0uZnJlZXN5bmNfbW9kdWxlKSB7CiAJCURSTV9FUlJP
UigKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDE3NTI3NTU2
MGU3NS4uMGQ3ZWY4OWIxN2E0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMKQEAgLTc4Nyw5ICs3ODcsNiBAQCBzdHJ1Y3QgZGMgKmRjX2NyZWF0ZShjb25zdCBzdHJ1
Y3QgZGNfaW5pdF9kYXRhICppbml0X3BhcmFtcykKIAlpZiAoZmFsc2UgPT0gY29uc3RydWN0KGRj
LCBpbml0X3BhcmFtcykpCiAJCWdvdG8gY29uc3RydWN0X2ZhaWw7CiAKLQkvKlRPRE86IHNlcGFy
YXRlIEhXIGFuZCBTVyBpbml0aWFsaXphdGlvbiovCi0JZGMtPmh3c3MuaW5pdF9odyhkYyk7Ci0K
IAlmdWxsX3BpcGVfY291bnQgPSBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7CiAJaWYgKGRjLT5y
ZXNfcG9vbC0+dW5kZXJsYXlfcGlwZV9pbmRleCAhPSBOT19VTkRFUkxBWV9QSVBFKQogCQlmdWxs
X3BpcGVfY291bnQtLTsKQEAgLTgyMiw2ICs4MTksMTEgQEAgc3RydWN0IGRjICpkY19jcmVhdGUo
Y29uc3Qgc3RydWN0IGRjX2luaXRfZGF0YSAqaW5pdF9wYXJhbXMpCiAJcmV0dXJuIE5VTEw7CiB9
CiAKK3ZvaWQgZGNfaGFyZHdhcmVfaW5pdChzdHJ1Y3QgZGMgKmRjKQoreworCWRjLT5od3NzLmlu
aXRfaHcoZGMpOworfQorCiB2b2lkIGRjX2luaXRfY2FsbGJhY2tzKHN0cnVjdCBkYyAqZGMsCiAJ
CWNvbnN0IHN0cnVjdCBkY19jYWxsYmFja19pbml0ICppbml0X3BhcmFtcykKIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggZDIxZThmYzAxNzllLi4zMGVmMzFhNzg4ZjggMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC01NTYsNiArNTU2LDggQEAgc3RydWN0
IGRjX2NhbGxiYWNrX2luaXQgewogfTsKIAogc3RydWN0IGRjICpkY19jcmVhdGUoY29uc3Qgc3Ry
dWN0IGRjX2luaXRfZGF0YSAqaW5pdF9wYXJhbXMpOwordm9pZCBkY19oYXJkd2FyZV9pbml0KHN0
cnVjdCBkYyAqZGMpOworCiBpbnQgZGNfZ2V0X3ZtaWRfdXNlX3ZlY3RvcihzdHJ1Y3QgZGMgKmRj
KTsKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAKIHZvaWQgZGNfc2V0dXBfdm1fY29u
dGV4dChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNfdmlydHVhbF9hZGRyX3NwYWNlX2NvbmZpZyAq
dmFfY29uZmlnLCBpbnQgdm1pZCk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
