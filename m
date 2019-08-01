Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9CE7D5E3
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251689FCA;
	Thu,  1 Aug 2019 06:54:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D489FCA
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2rVsmUN7sNLnjHqeKn2WYnWwrCdPBqTB6rvahLa4kqopOZcXwQfDq4dYEONOB0ErGN/bgmqrKhxK353PA4/TwIaPnjQzxBTo1lyJXazgyY18EcN8MiJYc65+ndb7D071a5Uf0CJR9YtBvM2WUndHXhX1DfIVMvRUz7/LyvjzBM4wBl1ompxVrVoxyPbQdP11IL9t86Fb4AQnI0r1Hcjjrf1I4kIGizKgI2QLuBMdltykyOH+0/EJWwaala7YUarnKfs3v5kkShzaq1GnBDtfUahX1wSYz362xwUTFnyJ0NIj90au+6+0M9bceV80mvl+T9knJLyOJ3xbC65DV8m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9NYZ5slUwKGOT5PqYddS0VBVUOeh0ZAey844kvcxQ=;
 b=UufUTcrZpq7IkEhAkIX2p4ItzeV6pE7XDVopDdUJw0059r+uMaUqzDb1XErCbJlqxd9HgKyTK5TG4T+TQcxG9XcYVwEqeYpCwwxbpKFJKTEdvEM1WzgG11MsBpgwCEBcyTVHdirvxqOlAqCSic+NeAEnSNeunGhVNIme2sGJ5ooaAZJ5Eef1ZWBhvFSQkPVFmwwU+zaHPLYFxVLZCJsLCk5+bwQyS45ebHH9wiM6oFHGquHSZgPDguoVemUKbpoik5SW3mbw9e2bJnHeWhJHh+81XXGCfdCDjnWLCqOpDUQ1Zg3EjcVxIlEiclZmKWHEHfMt0/C7udqFgxlCEz8W0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0072.namprd12.prod.outlook.com (2603:10b6:0:57::16) by
 BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 06:54:29 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0072.outlook.office365.com
 (2603:10b6:0:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Thu, 1 Aug 2019 06:54:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:54:28 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:54:26 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: support ce interrupt in ras module
Date: Thu, 1 Aug 2019 14:53:39 +0800
Message-ID: <20190801065342.8450-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801065342.8450-1-tao.zhou1@amd.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(68736007)(2616005)(11346002)(476003)(486006)(126002)(26005)(446003)(76176011)(51416003)(7696005)(86362001)(426003)(336012)(186003)(478600001)(47776003)(53416004)(36756003)(305945005)(110136005)(6666004)(1076003)(50226002)(81156014)(356004)(70206006)(6636002)(8936002)(5660300002)(70586007)(81166006)(2906002)(50466002)(4326008)(316002)(8676002)(16586007)(48376002)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2417; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9563b363-5d2a-45c4-0d43-08d7164d1944
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BL0PR12MB2417; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417F05DBE57640D38218429B0DE0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9oeqcyJhV6aco2cOKmxsFwrCQuNWC39+ovlPdcX5R9RFouGqaQSSOfsELcMcqeXG6XNgVJWJTb0PcqpM9n2GVDwe8HCAuetuxp6fAHrXLM9MbSevBUXFiAwWB7iPOxE65xhc7I6Hwvgr9JduaBizGyShd1vKNDUddLwqjE4SwROMsrFKh54ksuw6t9rlVIe/y0abama10OMJm/69CVcCygTvIDY/npU8XfFzHHLVCEflnMN2oNLyeetwe04i0+M8NTa3ziwvIsEgy10wzCL22qkRv6pgR1jZkiSk54cNO9R3i3oxET2e5/4fyC3hhcBfVFUetgbkyScu6WvSkjiMxBKl+aIx19V9kPm7hpnNVTv3APzE5NmKHG7Lxw0ZcXvhsP9icbIQGLsDq9USFaCBPJRSyCKF91IfeJsHg3tcEkQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:54:28.6896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563b363-5d2a-45c4-0d43-08d7164d1944
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9NYZ5slUwKGOT5PqYddS0VBVUOeh0ZAey844kvcxQ=;
 b=ZR1UKHbO5ghjiktoXDAyToqGEck9ukAlGvC5Oq7buOIvDYNXgVuCAz2SAnPM3AVwmZvBAJCaiEFF8lE+lQijN3lWJJ9LMU0mFhQBZvB73WbNbccPexNJlAH0gaZY+tDfieXxG9oe5dRqqpc1/aY+6493vgbkSmTloe4/OwxKTRs=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y29ycmVjdGFibGUgZXJyb3IgY2FuIGFsc28gdHJpZ2dlciBpbnRlcnJ1cHQgaW4gc29tZSByYXMg
YmxvY2tzCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTIgKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAwOTRjMjcwMDBiODMuLjRhMGRj
NTI2OWRkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTA0
NywxMiArMTA0NywxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2ludGVycnVwdF9oYW5kbGVy
KHN0cnVjdCByYXNfbWFuYWdlciAqb2JqKQogCQkJICogdGhlIGVycm9yLgogCQkJICovCiAJCQlp
ZiAocmV0ID09IEFNREdQVV9SQVNfVUUpIHsKKwkJCQkvKiB0aGVzZSBjb3VudHMgY291bGQgYmUg
bGVmdCBhcyAwIGlmCisJCQkJICogc29tZSBibG9ja3MgZG8gbm90IGNvdW50IGVycm9yIG51bWJl
cgorCQkJCSAqLwogCQkJCW9iai0+ZXJyX2RhdGEudWVfY291bnQgKz0gZXJyX2RhdGEudWVfY291
bnQ7CisJCQkJb2JqLT5lcnJfZGF0YS5jZV9jb3VudCArPSBlcnJfZGF0YS5jZV9jb3VudDsKIAkJ
CX0KLQkJCS8qIE1pZ2h0IG5lZWQgZ2V0IGNlIGNvdW50IGJ5IHJlZ2lzdGVyLCBidXQgbm90IGFs
bCBJUAotCQkJICogc2F2ZXMgY2UgY291bnQsIHNvbWUgSVAganVzdCB1c2Ugb25lIGJpdCBvciB0
d28gYml0cwotCQkJICogdG8gaW5kaWNhdGUgY2UgaGFwcGVuZWQuCi0JCQkgKi8KIAkJfQogCX0K
IH0KQEAgLTE1NDksNiArMTU0OSwxMCBAQCBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVfcmFzX2ZzX2luaXQoYWRldikpCiAJCWdvdG8g
ZnNfb3V0OwogCisJLyogcmFzIGluaXQgZm9yIGVhY2ggcmFzIGJsb2NrICovCisJaWYgKGFkZXYt
PnVtYy5mdW5jcy0+cmFzX2luaXQpCisJCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7
CisKIAlEUk1fSU5GTygiUkFTIElORk86IHJhcyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIK
IAkJCSJoYXJkd2FyZSBhYmlsaXR5WyV4XSByYXNfbWFza1sleF1cbiIsCiAJCQljb24tPmh3X3N1
cHBvcnRlZCwgY29uLT5zdXBwb3J0ZWQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
