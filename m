Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CB1C6FC
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 12:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE00892D8;
	Tue, 14 May 2019 10:25:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710084.outbound.protection.outlook.com [40.107.71.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14C892D8
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 10:25:06 +0000 (UTC)
Received: from CY4PR12CA0037.namprd12.prod.outlook.com (2603:10b6:903:129::23)
 by CY4PR1201MB0054.namprd12.prod.outlook.com (2603:10b6:910:1a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25; Tue, 14 May
 2019 10:25:04 +0000
Received: from DM3NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CY4PR12CA0037.outlook.office365.com
 (2603:10b6:903:129::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 14 May 2019 10:25:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT021.mail.protection.outlook.com (10.152.82.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 10:25:04 +0000
Received: from gamma.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 14 May 2019
 05:25:03 -0500
From: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: Need to initialize the HDP_NONSURFACE_BAStE
Date: Tue, 14 May 2019 18:24:52 +0800
Message-ID: <1557829492-5991-1-git-send-email-Tiecheng.Zhou@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(136003)(396003)(376002)(2980300002)(428003)(189003)(199004)(476003)(126002)(70206006)(486006)(72206003)(426003)(186003)(478600001)(70586007)(36756003)(47776003)(50466002)(2906002)(2616005)(77096007)(53416004)(336012)(4326008)(6916009)(48376002)(26005)(305945005)(4744005)(6666004)(51416003)(2351001)(16586007)(53936002)(86362001)(316002)(54906003)(68736007)(81166006)(8676002)(356004)(8936002)(50226002)(81156014)(7696005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0054; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7230c1-d533-4e1d-3afb-08d6d8566e3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0054; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0054:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0054379572194508D4B5A31CE4080@CY4PR1201MB0054.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y7qP1PXLGgX4Le9ZwarcEesaufbW1kdQRbwYJwj3zu/QkkPPRbqyIKXEdjMpSeBP8b7hJj127duBZNqpUtgXkqcA7ykX4jZw1kbGX8E7dSDSZQ/ZxLVfwVQbl1ShXavkZQH6srXJFfZ1o3XYFloFvEPLruyymfFfEH+spn52frKczYWmioAomxTWhsAQn4XmOSsUv9iG49bZeU61y8Gy/a3VO1g0aW4YjS2ekbkNFnlveInOi13EYqGEGB5MGqQdKoFG5oKTN13BRSOVNaVcnHZ6seXZ51gfb1yZY2/McC+Xy/IGAQIdCPKdRxD5sGhgn/OTGLRJgzGetFKvOctj52ON2KK+Xllcq4i0Hm8ta/Tf+BPgJkVVico+IIzbeQyJ/JPZfeKY73Pp4l0O2TdbRGSInZyXLE8QnqLjFgcQAb0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 10:25:04.6339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7230c1-d533-4e1d-3afb-08d6d8566e3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TzQJdEncEliEzxiyjH8jaSkSsTT5WtEOG3y5MWwxxE=;
 b=GgxfvzO/4do3GbO9BkEDKTKetaaoexjoSKWVNiEI8/G1O/wXDk7JsOevphnK/8QdAuJ5L5+BV8bzZ6olQ9vO6bUh7uTthAZT1Mw3DeAR2aguYKdq2hrQ3QiL4Csab8YifbtZH3KcvGI+vo3P8jwBmnukhv0OddE5AkxhJ3gvjsU=
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
Cc: Tiecheng Zhou <Tiecheng.Zhou@amd.com>, Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aXQgcmVxdWlyZXMgdG8gaW5pdGlhbGl6ZSBIRFBfTk9OU1VSRkFDRV9CQVNFLCBzbyBhcyB0byBh
dm9pZAp1c2luZyB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNyaW92IHNj
ZW5hcmlvLgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUaWVjaGVuZyBaaG91IDxUaWVjaGVuZy5aaG91QGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwppbmRleCBiZTcyOWU3Li5lOTY2ODRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMKQEAgLTExODEsNiArMTE4MSwxMSBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5h
YmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXRtcCA9IFJSRUczMl9TT0MxNShIRFAs
IDAsIG1tSERQX0hPU1RfUEFUSF9DTlRMKTsKIAlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9I
T1NUX1BBVEhfQ05UTCwgdG1wKTsKIAorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKKwkJ
V1JFRzMyX1NPQzE1KEhEUCwgMCwgbW1IRFBfTk9OU1VSRkFDRV9CQVNFLCAoYWRldi0+Z21jLnZy
YW1fc3RhcnQgPj4gOCkpOworCQlXUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9OT05TVVJGQUNF
X0JBU0VfSEksIChhZGV2LT5nbWMudnJhbV9zdGFydCA+PiA0MCkpOworCX0KKwogCS8qIEFmdGVy
IEhEUCBpcyBpbml0aWFsaXplZCwgZmx1c2ggSERQLiovCiAJYWRldi0+bmJpb19mdW5jcy0+aGRw
X2ZsdXNoKGFkZXYsIE5VTEwpOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
