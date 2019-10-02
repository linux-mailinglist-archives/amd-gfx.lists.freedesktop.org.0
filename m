Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C5C908F
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94966E972;
	Wed,  2 Oct 2019 18:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89306E95F
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxCAbi798ckZc1Zq5GXlyLBHOtPn45U51HekD3xnkt2SlULrAXA1DhX1ngxSBI8MQPOouAdFkbqk45gS5JCkAQlhXln0A8gfWbWDLXxQO4xNzAYVFFsKrlZbBaYc7S+s7vUwFreN5FsFiJlfFUyjJuoH+mg/SW7khpLsXWQQVCQ4crYcWWehie+feKp2BWLiEx+bA/de/hZ/paLWnuJU25O4vp4j/noiA7q+EtUbDmR4EwOXPNzOdJtFeaMpUy0dWSroUwOKEoOVNNUlEc3jvt+q2f+iBknJLl4i13EgIS8FETlI4NH00iFO7icgv4XbqkgpSbDHnkHk7IFnrGhDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2bf0uV2oDDu6WjOZ9pQMy6UeBD5vopkbUpy5lRZ/bs=;
 b=OyEMiSWdDx/06s2pS9+FIEj/v4bvc9nbqb7Q488OwgXN6UqIi/phkkvkeyg3TafJqZKYSJRK1T6soIXRqoK6Euqu+hT3+rpCrQyvUHqBAtstNcHTv6llFnrqzn/4tUE90gHCnvMpzmOG3LAqOxiRGp9BaBv0lXsTHYI7neZE1QsQnKlB4Q1kJ21JCmkdwiKsT4vHGdxyrbn7JysYbFI1BNZ0z/OD5pNX5/+dyOyTUYS9GERPKIPG1w/6JFGkABMhQq+vHulm067yxeeCIbjXFt0ykgO0IZO+hefewvjKkG9IoUlz62sbbpuCFW4r/rcAL2VszLFcC2KfY88AQ1mQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 BN6PR12MB1585.namprd12.prod.outlook.com (2603:10b6:405:9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:44 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:44 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/38] drm/amd/display: 3.2.53
Date: Wed, 2 Oct 2019 14:16:16 -0400
Message-ID: <20191002181633.22805-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(189003)(199004)(126002)(4326008)(478600001)(305945005)(16586007)(6916009)(86362001)(70586007)(316002)(1076003)(2351001)(36756003)(53416004)(186003)(7696005)(4744005)(5660300002)(76176011)(47776003)(2906002)(6666004)(356004)(51416003)(50226002)(8936002)(14444005)(81166006)(48376002)(81156014)(8676002)(70206006)(476003)(446003)(11346002)(426003)(2616005)(336012)(50466002)(486006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1585; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb2e8d7c-f557-4b51-306f-08d74764ae35
X-MS-TrafficTypeDiagnostic: BN6PR12MB1585:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15857D1F64A2B3061A9EA121F99C0@BN6PR12MB1585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITLdxRudqi/pe+mmlW5PAaCw8RPRQFfH+SECHlxcuaQLcx/3BDYKwfw47GGUW0pqPu2L2ItqQhS7bvPgE5qW81baWsrpyzRNwHGkHex3BBP+n2K/HV75po17rovQMtBohhYAPDSGcKqFHEJdoSxte7JXyFPSoFeQDDpJ4nqhXFKePXTGvro8mEQSRuMW6D9pYW4cWv+GBNLUS5qjZiDBxbHOkg9h8v5R7Ald6IYTDm2L3atarpvr5OOejv1pcitm3eTSg39taUQrspLakmA0kNY47bapdEWR6prDZWXB784XKZws9fYXukm9psN5L58Ce4QagS/G7JorhncONWnxbOZiIEWD8uhnLUMgpGosWzD+HTEo2/A/I6imzN9dtRKUVJrKO4MwSCZmlkcTpYhXiLe7uCAU9JFV2QMcTENsk8g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:44.0086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2e8d7c-f557-4b51-306f-08d74764ae35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1585
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2bf0uV2oDDu6WjOZ9pQMy6UeBD5vopkbUpy5lRZ/bs=;
 b=qlpTjE4Fl+ODjOUyuWHJD+47cQR/eINR5aO5tF52ORm/tfsmvwDwguUoDtKxP3+w7358cSA/4PAwn7hvmW82d+x3otYmFa5Chktw3SdUcCetip/r248DbKMDk2JqhsWZ5r6e4xAm0IvpzCY0B4/y5AQ27mzWk1kDTQ+oLShavRk=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IEkxOTg1OTIyNzA3
YTQwZjljZTVmNmMwMTM4NWJkZWQzNjA1ODIwNmYyClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxh
cmljLmN5ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjLmgKaW5kZXggM2RmYzU3MDRiYjU5Li42YzUwZDVjMjQ2NTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0zOSw3ICszOSw3IEBACiAjaW5jbHVkZSAiaW5jL2h3
L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERD
X1ZFUiAiMy4yLjUyIgorI2RlZmluZSBEQ19WRVIgIjMuMi41MyIKIAogI2RlZmluZSBNQVhfU1VS
RkFDRVMgMwogI2RlZmluZSBNQVhfUExBTkVTIDYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
