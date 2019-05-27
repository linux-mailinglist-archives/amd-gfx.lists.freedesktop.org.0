Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6042BADF
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001989A4E;
	Mon, 27 May 2019 19:52:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68C889A4E
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:04 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.18; Mon, 27 May
 2019 19:52:03 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:02 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:56 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/26] drm/amd/display: Add min_dcfclk_mhz field to bb
 overrides
Date: Mon, 27 May 2019 15:50:50 -0400
Message-ID: <1558986665-12964-12-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(186003)(36756003)(77096007)(2616005)(426003)(476003)(446003)(11346002)(26005)(16586007)(126002)(336012)(486006)(68736007)(50226002)(305945005)(47776003)(8936002)(316002)(81166006)(8676002)(81156014)(76176011)(86362001)(2876002)(2906002)(86152003)(53416004)(5660300002)(2351001)(4744005)(53936002)(50466002)(48376002)(6916009)(72206003)(51416003)(7696005)(4326008)(70586007)(70206006)(6666004)(478600001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d213a0b1-053e-4758-6e8f-08d6e2dcca04
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0056; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB005625019F4196B4454C9280821D0@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fai0l7OIEJSuMAzIrMZiUpHjypzj2RTMHvGyFSoJByOfgk9YM5VvQuvqsEXf6IvAzJCJkZY7ZQkB0ezCfZuuTeVyEZf+13KjRnU5QGYzsEg7l8KyccNvZfauHy0xyowv2XRun2arpwYDKKqjYY1SicR0B2c0nTMHR0VUK9iXgIRp2VMrgG/4LDy1jn5FSTBltGimKnWIXaxJVz46mTsIqWD9TKx71j90hmbVJNoRZtzxoINkoU8nn58GiriXBy27d+8Mr+ZQznw9i1LS9o9ObAXGXRVdCjjRQZiFKf9tUPBiGY+kVjq9Acdm4uRgQ4R2MMEbg951q5yOxSF/s+mqCxKVOa6UiCx0I5kTSgWOXe+O+NCbGpM+RVQrlgYrzU+S7s1pMf3FmXtF3ekv00h5Gr+stafzX6+2lNNfElN/Fdc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:02.6972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d213a0b1-053e-4758-6e8f-08d6e2dcca04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0XKzhpex/UWYYNPZItWCHTB28AI+tdRajAScVJfIEw=;
 b=W4JIQAeX15Qc6t+vRHUABNQc/9SSyE/c/+WpKw6CSS361oLY+/7DdVChUPXHlrTsdkjG6ZODj3lM5dNB8sqLdobSAmmGhQ56GrmjNMwomSC5CLfuiSN8NN7u1ejW2KBJPicP8Kw7Eixge3p6c1yuBIo6Wa+0r6zZfTTFKdqWiKE=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKQWRkIG1pbl9kY2ZjbGtfbWh6IHRvIGJv
dW5kaW5nIGJveCBvdmVycmlkZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2Vk
LWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGMuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAppbmRleCAyMDk3NWFiLi43YWMwZWE4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzY3LDYgKzM2Nyw3IEBAIHN0cnVjdCBk
Y19ib3VuZGluZ19ib3hfb3ZlcnJpZGVzIHsKIAlpbnQgdXJnZW50X2xhdGVuY3lfbnM7CiAJaW50
IHBlcmNlbnRfb2ZfaWRlYWxfZHJhbWJ3OwogCWludCBkcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5
X25zOworCWludCBtaW5fZGNmY2xrX21oejsKIH07CiAKIHN0cnVjdCBkY19zdGF0ZTsKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
