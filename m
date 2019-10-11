Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFDD48B7
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EA66ECA8;
	Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02996EC98
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI5eX6TURLLIvJE35xVIEOWoirzS2sVv8A6MbNRBwr/t/v0muLPnBTG4TN9JHmwpM3VxqIgD6MQU0sPJObpZXnGEhVM0R3Zga3agVzZpdMfFSs37g6O/D3FwUbxw3IEWomwRv1EFJwC1R6bbsseH0OWUT4NnlNERp+c3AJBk7gdUGSOF/uzzuFKzz2LRXC296tjQg/Fa2eXJfh70opoQZkn9yp3E34VYDh9Y//2am7YeGvKFqhuERFpIAGUkPle39sX3RQeEU+9aIbR1t6Yof3AvOzeCjSdqb1ZLK6lcPH3ub3x5FL6gMJph9ybE3eD+WG2rOe+idWJofN4xRWTYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3KMRzKAgU5CHveR3FX+RI5NHn6QZmTN21sWK9uGN8A=;
 b=a6bhrX0K2wfSIN9cWzOZvRd5Ham+sD9I91oiIQWErgsw2HCJuW1LeRyTuBK0hJ1MetFzKI/bXOGFCS0tC1UJvdy9KUkwc2OnfQhVq/t+M747k3d8iLNvnikWrnF1tQ3lN0gXQNxvaLSKhQ5YfoNViQvLWfvpwsBVbRw5BrbfcjnU1jk7rvH/GENlDEZNrTlkkGxiLfa3Qo0X/zbEQiiI3G9QQBT2H8IIDOhPWU9OVZhHEdS+6rj7RnDSrVoqIyclw9Rn/5MWFf0CKL81mtXxSuR6e6JqqoYnQzMi7ZCpCq+bEgo2UNUL1HAJdYmEySdKsdruyiZImr9tbdWmE52hSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by BYAPR12MB2839.namprd12.prod.outlook.com (2603:10b6:a03:72::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:54 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:53 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/29] drm/amd/display: handle "18" case in TruncToValidBPP
Date: Fri, 11 Oct 2019 15:53:17 -0400
Message-ID: <20191011195324.16268-23-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6029001)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(189003)(199004)(70206006)(76176011)(4326008)(305945005)(70586007)(7696005)(86362001)(1076003)(16586007)(47776003)(316002)(26005)(50226002)(6916009)(11346002)(426003)(48376002)(446003)(51416003)(336012)(81156014)(81166006)(8676002)(478600001)(2351001)(8936002)(486006)(186003)(36756003)(2906002)(5660300002)(4744005)(53416004)(476003)(6666004)(356004)(50466002)(2616005)(126002)(145603002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2839; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 763c763c-f92f-4cda-3847-08d74e84bec2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2839:
X-Microsoft-Antispam-PRVS: <BYAPR12MB283983554800BDD6B01B2A06F9970@BYAPR12MB2839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEGrRnMHmfIQmIiboIMbz+wpUIhZY/b9KjWjp32NjH1+WI3d3BFOJ348Ifrdh9W8ZSbw9ImeoyvjgYXFJmCdLjkoOfWxQpdH54HdUgvXxx3lAYEWW0vsYyP7NRHzGLmKo9F/XgZZuYFRHDcG5w1hHKNYeoTin/sduKB0oGsjscfljUTAMEBfTdX+snNU9Om9UnoHXbPcabWEd7jjnM/cpKUcfSmN6jkBvwmp4PUHc1YCtoUgns+Q8tGBj0C5RD9n7j4vMy3VFStTaAJFgBOJSxLsyqMn6uc/3JNi1DCcDqAncEu5sQ43Cs1FN05PaYVpvxYrVl1ZoOdpUBq+7RaQ6o00IDfQOUqKc8vbqn+pzV22IIKNeYxCX2TXwsq828Gs6rHDZvFuBcF/IjvbdWN2LKsTq1PCAKLZJo97l5mdWxo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:53.7792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c763c-f92f-4cda-3847-08d74e84bec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2839
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3KMRzKAgU5CHveR3FX+RI5NHn6QZmTN21sWK9uGN8A=;
 b=MEHv6Uxy7kHK72JT8j+tdxi01NZdMTkcWaD6v5lBSDFi5OB7hKouwTAfZSnKBCxfUzhJS6Ui/v1itdH9StOKHR8tAspmCcw90kWiOZE5jROkCb5/A2vbq4EI3K4+26iuhFJPqFnGhjztH5WLQAMIYgVDHCam/apQI1NLemIjRHg=
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

SGFuZGxlIDE4IERlY2ltYWxCUFAgbGlrZSBvdGhlciBjYXNlcwoKU2lnbmVkLW9mZi1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3
YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjEvZGlzcGxheV9tb2RlX3Zi
YV8yMS5jCmluZGV4IGZkNzA3ZTc0NTliNS4uYmE3Nzk1N2FlZmUzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlf
bW9kZV92YmFfMjEuYwpAQCAtMzM4MCw2ICszMzgwLDggQEAgc3RhdGljIHVuc2lnbmVkIGludCBU
cnVuY1RvVmFsaWRCUFAoCiAJCQkJcmV0dXJuIDMwOwogCQkJZWxzZSBpZiAoRGVjaW1hbEJQUCA+
PSAyNCAmJiAoRGVzaXJlZEJQUCA9PSAwIHx8IERlc2lyZWRCUFAgPT0gMjQpKQogCQkJCXJldHVy
biAyNDsKKwkJCWVsc2UgaWYgKERlY2ltYWxCUFAgPj0gMTggJiYgKERlc2lyZWRCUFAgPT0gMCB8
fCBEZXNpcmVkQlBQID09IDE4KSkKKwkJCQlyZXR1cm4gMTg7CiAJCQllbHNlCiAJCQkJcmV0dXJu
IEJQUF9JTlZBTElEOwogCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
