Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66F732B3
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDBE6E5CB;
	Wed, 24 Jul 2019 15:28:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680081.outbound.protection.outlook.com [40.107.68.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9A6E5CB
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzConIPocJBDXlaY5sBl5Ujkeu+lTqCrBTi9tLso1zF/WaqmsqEBfvFInWvv0yf+XWdWopoKuYX+ixVB7VmKljF4vlj30aa/5cRStwzedATNDLWnixfw4Pj9ZxhyZtmPclJheMVl3F7kV09tDJD4QxPJGVCXUCl+NgsChlrp0GVrlouCEdTisfw0thfGhXdz7tggo1GtReKlfbNgzZk5Cc6kUWH92NqWj9Dot4YEUPADQEf0FKtiWey8Y6Jc5TLou2bqsMHg6HXK6s97wn3zcrgZX/DbOxtn3JtJ7l+6Isr1EFfHUyZfeTZ9SlFYkahwVuMQyAVVlNFCb3gcpg0b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrCOK6Qdi2/VToHX5GARcuP02hcKZoLbbWQQatQW2Y0=;
 b=Bo+lx5R2l7I9vw2ccRytT1DvPOtI73phfnWt+Qnh683AV3nCR+AdPSaTkMUCtsGg1o00Z9mFcTx1c4CxMMIbskPT0vxQUNSfmIax9Tc4h5p39p32pB8wJVUldhaTvpcoB25v4js/LfyS+rGRFRNH5s0Nf5YSGrOeZ19F6BLH8Ph3sRiP0gD1t/lSYcDAaYrisXSgo7BoSeSH+TWqftsrT1un3Q5s9Jlq5tyH0moPHqpj/S3z+Vndn0YLKv+aNUXNp6PRsC7Hpvi0Kh+WviE4hNzS0iyiWbDRSzbI09jw2baanupGDPBdPcgnsyXIhOlYoH+/ksqImjOiirvC3AZqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN4PR12CA0019.namprd12.prod.outlook.com (2603:10b6:403:2::29)
 by BN6PR12MB1570.namprd12.prod.outlook.com (2603:10b6:405:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Wed, 24 Jul
 2019 15:27:59 +0000
Received: from DM3NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN4PR12CA0019.outlook.office365.com
 (2603:10b6:403:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Wed, 24 Jul 2019 15:27:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT049.mail.protection.outlook.com (10.152.83.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 15:27:59 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 10:27:58 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 0/4] Enable S/G for Picasso
Date: Wed, 24 Jul 2019 11:27:42 -0400
Message-ID: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(81166006)(47776003)(70586007)(81156014)(70206006)(316002)(8936002)(48376002)(36756003)(86362001)(4744005)(54906003)(4326008)(50466002)(44832011)(486006)(16586007)(478600001)(126002)(476003)(2351001)(2906002)(7696005)(51416003)(186003)(6916009)(53936002)(5660300002)(68736007)(8676002)(305945005)(53416004)(50226002)(336012)(26005)(2616005)(356004)(6666004)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1570; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9898f17-31d7-4da1-1145-08d7104b8262
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1570; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1570:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15709E3F007B29CE1267DAB0EAC60@BN6PR12MB1570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NV2bQZdbTAfk2ysUOrdLpP5UyRzcle5JZzrZkfeIj7upoUqZb+MCt91yM/Wc4w7wb/mtkU9CmTZl68bLBBtUiXtHQU/++UA9yN59F+CqF9soRFXc2JaTUOB6i13sE7DcYsEG+QJsCT+74zieMrRVLbcAs88RUaWfZTUvlOrM4ACuneGKYvCPB/bDpj6jEhpPEf0dlnja8+9a2kS3B8HApcSrcnQnJuZW9GKZaB0snhhiAplUkVdUXsNJhHdMz4tWHVfnkEVqIFpU3cMtynLgHvEYI9LMoiRUQWOd2XCdckBuuVfs4smuRycuWv9EDyIFJgFEgGyQLuJpNxteIAHjSsKs+c0sS7nfmLi7XSNTmoptmtIAIVJrZ38Ps6LXVN8JzJ2L605YPLjM6HcPMxNihbXGd2UQXek5TnMS5EmdmsA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 15:27:59.1380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9898f17-31d7-4da1-1145-08d7104b8262
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrCOK6Qdi2/VToHX5GARcuP02hcKZoLbbWQQatQW2Y0=;
 b=jOZ9wr3ATUr6LrvQjnrqXwrae47uGOIqS6a9EOxAAjckmccWaX9OIcnG168chlZ3CbhASjey6zdCL2spYvFy0MFEZSAsGeYbEuBNilUlU667vuXGA7bdzxaKeD7pqSNXFwm9PL1yRCS7sEC/5VL9cN4h2GZb8yXvCe03/cnkL9c=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rmlyc3QgcGF0Y2hlcyBmaXhlcyBhIGhhcmQgaGFuZyBpbnRyb2R1Y2VkIGJ5IHBsYWNpbmcgdGhl
IGRpc3BsYXkgQk8gaW4gCkdUVCBtZW1vcnkgYmVjYXVzZSBvZiBIVyBpc3N1ZXMgd2l0aCBjYWNo
ZWQgbWFwcGluZ3MuIFNlY29uZCBwYXRjaCBkb2VzCnNvbWUgbWlub3IgcmVhZmFjdG9yaW5nIHRv
IHJlc3VlIGNvZGUgaW4gdGhyaWQgcGF0Y2guIFRoaXJkIHBhdGNoIGFkZHMKY2hlY2sgZm9yIFVT
V0Mgc3VwcG9ydCBhcyBjb25kaXRpb24gdG8gcGxhY2luZyBBUFVzIHNjYW5vdXQgQk8gaW4gR1RU
LgpMYXN0IHBhdGNoIGVuYWJsZXMgUy9HLgoKQW5kcmV5IEdyb2R6b3Zza3kgKDMpOgogZHJtL2Ft
ZGdwdTogRml4IGhhcmQgaGFuZyBmb3IgUy9HIGRpc3BsYXkgQk9zLgogZHJtL2FtZGdwdTogQ3Jl
YXRlIGhlbHBlciB0byBjbGVhciBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKIGRybS9h
bWRncHU6IEFkZCBjaGVjayBmb3IgVVNXQyBzdXBwb3J0IGZvciBhbWRncHVfZGlzcGxheV9zdXBw
b3J0ZWRfZG9tYWlucwoKU2hpcmlzaCBTICgxKToKIGRybS9hbWQvZGlzcGxheTogZW5hYmxlIFMv
RyBmb3IgUkFWRU4gY2hpcAoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNw
bGF5LmMgICAgICAgfCAxMSArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZmIuYyAgICAgICAgICAgIHwgIDcgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2VtLmMgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYyAgICAgICAgfCA2MSArKysrKysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oICAgICAgICB8ICAyICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAgMiArLQogNiBm
aWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
