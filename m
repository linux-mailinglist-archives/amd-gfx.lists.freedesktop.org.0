Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0726CD48B2
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094CE6EC9C;
	Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2ED6EC9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTVhBbTG/fWqBAsC0z4kDvZyb3O+eRuAClMh56xd0j+Epb1LKENMOjqTTaIYvIOQnrAD6TqG2FtpkWflvv62MedUkfSLVw+4n3iF7Dsg78oIlxDoenbDr4g2qx1b41gnkTJe7nW8bIYhxBa73osVo314wCwg76xc7Fe4nDAR/h1sr56/VkzNSe35XljzNOXwkBhFyA1uhTdEILTrOQiT3kluWRX4h8I7RYIILgF/WZ1+0ZktDoZXh+ihrMgGcYqqIYossjIk/q9NWnOelIbyipTKDRuDNrlgqc3X/nYQmUVp+1hWEa4X9PR9/9zgXRGPSKeyQ7mJDG8XLTmG1Wgmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlERoL7pxVo2aOsbApTegazePR98LjG/78Pn4OpEiE=;
 b=Qeq5w0WG4aXbWXdpJWNgJ6yEc3XgBMA1VDgK2KkqfsVEq9QxSr/XamWbH2TOxQMnifrtzZWRRLZjZlhnExDf7Qrdae7F40TQT/nnvf99/7EzoXY9KOvGdZOPyrj5glcenUdBEkd5MZBHdMpsl1ckRUnMXvBhR8zmq29fxW9n7KBtDOHLFx65ukz1sVGBTZGYWN0tFeB2qSF0kCHdxpKszLK8ZeD0CzxWPrYF9nrPU/+M87SniYtB4EHTWKNXgNJJfsobQDzOf+JpyjB8klk0WaTqq9BUzvXrKCs1/x4x1OdsIGmyOhg2368DG1BFVB9409qcWA3cWkZCzXm+VXx7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by MN2PR12MB3070.namprd12.prod.outlook.com (2603:10b6:208:c1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:52 +0000
Received: from BY2NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.21 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT062.mail.protection.outlook.com (10.152.85.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 19:53:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/29] drm/amd/display: update renoir bounding box and res_caps
Date: Fri, 11 Oct 2019 15:53:13 -0400
Message-ID: <20191011195324.16268-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(428003)(199004)(189003)(2616005)(5660300002)(53416004)(47776003)(36756003)(478600001)(4326008)(2351001)(1076003)(70586007)(6916009)(305945005)(86362001)(126002)(476003)(6666004)(356004)(70206006)(486006)(7696005)(51416003)(446003)(50466002)(426003)(50226002)(8676002)(186003)(81166006)(48376002)(316002)(81156014)(336012)(2906002)(11346002)(8936002)(16586007)(76176011)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3070; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69021a7-85e8-4e35-74e7-08d74e84bdae
X-MS-TrafficTypeDiagnostic: MN2PR12MB3070:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3070B7CDEBAC944D1895889CF9970@MN2PR12MB3070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAi34I7vTzXyjQJ0D+90isVqr5x4mPd5d/SFI/0s2Tr5tZ6xJxQOWHHfUGz6NcQrnfrlTheykQrVDgsuc7ayn4A5NbCtEMTYTcpcCKa1wPoSUjnvHQdGeIKVkqjTjrMxi4e3+O5zdvVKeRb/T7RJ1RYzX2vMdHgK6TC7Dmwmq36vhhaLCTeXLwzkynpJGFQLdC5gmdf5cFkK6SZCvEsHKE0wiexg3pGz4lFFuIPMf3+dmAIbti+q1TwchIHOBK2jpd0xaf8Of+NsZFx+ohnVQ21CkznY9IlpO3qczqNk/u82tG1fSez9QWLrPCqfwkTpMcym3R0BwloHa/5R5S0nWlgQLEZUlrszwn0mR/p1rswihXKfgAYuaJanhMntUORFg2hFAodEcv4kBwyq1lEQWTMXySXUKNZKizFq+eWus1I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:51.9229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69021a7-85e8-4e35-74e7-08d74e84bdae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvlERoL7pxVo2aOsbApTegazePR98LjG/78Pn4OpEiE=;
 b=FNJVNYSL0sy//mEvLB2skUrABvttzQuZZRq+qA0lIaf4+u0nnCgmRjb4c2e3umqL3ioRsSdQPIrpTJeneesJtwgD6wcmx7x1nSxsRaE4eU6e9veT4X1SyD/f0HqLz2PtMU2VLdLDBJgBpD67a/Fe6Xp/H8VfhyAId/bDX7VqGQ8=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHZhbHVlcyBmb3IgYm91bmRpbmcgYm94IGFuZCByZXNfY2FwcyB3ZXJlIGluY29ycmVjdC4g
U28KRml4IHRoZW0KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
cmVzb3VyY2UuYyB8IDI0ICsrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCmluZGV4IDVlMTVmODAwYTlm
MS4uMDAyZTdmYjY3MDY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtODIsNiArODIsNyBAQAogCiAKIHN0cnVj
dCBfdmNzX2RwaV9pcF9wYXJhbXNfc3QgZGNuMl8xX2lwID0geworCS5vZG1fY2FwYWJsZSA9IDEs
CiAJLmdwdXZtX2VuYWJsZSA9IDAsCiAJLmhvc3R2bV9lbmFibGUgPSAwLAogCS5ncHV2bV9tYXhf
cGFnZV90YWJsZV9sZXZlbHMgPSAxLApAQCAtMjAzLDExICsyMDQsMTEgQEAgc3RydWN0IF92Y3Nf
ZHBpX3NvY19ib3VuZGluZ19ib3hfc3QgZGNuMl8xX3NvYyA9IHsKIAkJCQkuc3RhdGUgPSA0LAog
CQkJCS5kY2ZjbGtfbWh6ID0gODEwLjAsCiAJCQkJLmZhYnJpY2Nsa19taHogPSAxNjAwLjAsCi0J
CQkJLmRpc3BjbGtfbWh6ID0gMTAxNS4wLAotCQkJCS5kcHBjbGtfbWh6ID0gMTAxNS4wLAotCQkJ
CS5waHljbGtfbWh6ID0gODEwLjAsCisJCQkJLmRpc3BjbGtfbWh6ID0gMTM5NS4wLAorCQkJCS5k
cHBjbGtfbWh6ID0gMTI4NS4wLAorCQkJCS5waHljbGtfbWh6ID0gMTMyNS4wLAogCQkJCS5zb2Nj
bGtfbWh6ID0gOTUzLjAsCi0JCQkJLmRzY2Nsa19taHogPSAzMTguMzM0LAorCQkJCS5kc2NjbGtf
bWh6ID0gNDg5LjAsCiAJCQkJLmRyYW1fc3BlZWRfbXRzID0gNDI2Ni4wLAogCQkJfSwKIAkJCS8q
RXh0cmEgc3RhdGUsIG5vIGRpc3BjbGsgcmFtcGluZyovCkBAIC0yMTUsMTggKzIxNiwxOCBAQCBz
dHJ1Y3QgX3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCBkY24yXzFfc29jID0gewogCQkJCS5z
dGF0ZSA9IDUsCiAJCQkJLmRjZmNsa19taHogPSA4MTAuMCwKIAkJCQkuZmFicmljY2xrX21oeiA9
IDE2MDAuMCwKLQkJCQkuZGlzcGNsa19taHogPSAxMDE1LjAsCi0JCQkJLmRwcGNsa19taHogPSAx
MDE1LjAsCi0JCQkJLnBoeWNsa19taHogPSA4MTAuMCwKKwkJCQkuZGlzcGNsa19taHogPSAxMzk1
LjAsCisJCQkJLmRwcGNsa19taHogPSAxMjg1LjAsCisJCQkJLnBoeWNsa19taHogPSAxMzI1LjAs
CiAJCQkJLnNvY2Nsa19taHogPSA5NTMuMCwKLQkJCQkuZHNjY2xrX21oeiA9IDMxOC4zMzQsCisJ
CQkJLmRzY2Nsa19taHogPSA0ODkuMCwKIAkJCQkuZHJhbV9zcGVlZF9tdHMgPSA0MjY2LjAsCiAJ
CQl9LAogCiAJCX0sCiAKLQkuc3JfZXhpdF90aW1lX3VzID0gOS4wLAotCS5zcl9lbnRlcl9wbHVz
X2V4aXRfdGltZV91cyA9IDExLjAsCisJLnNyX2V4aXRfdGltZV91cyA9IDEyLjUsCisJLnNyX2Vu
dGVyX3BsdXNfZXhpdF90aW1lX3VzID0gMTcuMCwKIAkudXJnZW50X2xhdGVuY3lfdXMgPSA0LjAs
CiAJLnVyZ2VudF9sYXRlbmN5X3BpeGVsX2RhdGFfb25seV91cyA9IDQuMCwKIAkudXJnZW50X2xh
dGVuY3lfcGl4ZWxfbWl4ZWRfd2l0aF92bV9kYXRhX3VzID0gNC4wLApAQCAtNzY0LDYgKzc2NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2VfY2FwcyByZXNfY2FwX3JuID0gewogCQku
bnVtX3BsbCA9IDUsICAvLyBtYXliZSAzIGJlY2F1c2UgdGhlIGxhc3QgdHdvIHVzZWQgZm9yIFVT
Qi1jCiAJCS5udW1fZHdiID0gMSwKIAkJLm51bV9kZGMgPSA1LAorCQkubnVtX3ZtaWQgPSAxLAog
I2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAJCS5udW1fZHNjID0gMywKICNl
bmRpZgpAQCAtODMzLDcgKzgzNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNfZGVidWdfb3B0
aW9ucyBkZWJ1Z19kZWZhdWx0c19kcnYgPSB7CiAJCS5kaXNhYmxlX2RjYyA9IERDQ19FTkFCTEUs
CiAJCS52c3Jfc3VwcG9ydCA9IHRydWUsCiAJCS5wZXJmb3JtYW5jZV90cmFjZSA9IGZhbHNlLAot
CQkubWF4X2Rvd25zY2FsZV9zcmNfd2lkdGggPSA1MTIwLC8qdXB0byA1SyovCisJCS5tYXhfZG93
bnNjYWxlX3NyY193aWR0aCA9IDM4NDAsCiAJCS5kaXNhYmxlX3BwbGliX3dtX3JhbmdlID0gZmFs
c2UsCiAJCS5zY2xfcmVzZXRfbGVuZ3RoMTAgPSB0cnVlLAogCQkuc2FuaXR5X2NoZWNrcyA9IHRy
dWUsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
