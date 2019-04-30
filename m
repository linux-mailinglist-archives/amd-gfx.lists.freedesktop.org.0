Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB11017E
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393B78924A;
	Tue, 30 Apr 2019 21:10:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004489240
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:57 +0000 (UTC)
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by DM5PR12MB2374.namprd12.prod.outlook.com (2603:10b6:4:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:56 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/20] drm/amd/display: 3.2.26
Date: Tue, 30 Apr 2019 17:09:11 -0400
Message-ID: <20190430210938.32335-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(50226002)(77096007)(16586007)(50466002)(186003)(2351001)(48376002)(68736007)(36756003)(126002)(305945005)(53416004)(2906002)(316002)(47776003)(6916009)(486006)(476003)(11346002)(446003)(8936002)(2616005)(14444005)(4326008)(81166006)(4744005)(7696005)(26005)(81156014)(51416003)(8676002)(76176011)(86362001)(336012)(53936002)(70586007)(72206003)(1076003)(426003)(478600001)(5660300002)(356004)(6666004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15ba00e-b583-4bea-7ce5-08d6cdb03253
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2374; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:
X-Microsoft-Antispam-PRVS: <DM5PR12MB237433016E70483F75FCB000F93A0@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Vc3HqhdfWPrVYPbRf5hWDSAufEL4nhMPzdkOPHTR3Kx0BvDaD5rhuO/Ybv0vCytiT6k0fRNqDCiH1h3y21MRryp2bDfIIdi7p+C1KMSGlOuTSdn7gBxryJuVZbMMECGKlpVIw/RkylwWvYRdcuu13x3KxNeFcZDtnBiQq0D9wNZuSxcx+TnAHHtn7Zq7uZIzKxPn83fcIiblv47uN3IEYpBv+mA8/CM5VnQkaljm2RR6DG6xdpgo4hYZB+gh1CAwX13UFSmPC6fh7f7t/DaR59QdwPr1xL3/q/DTv1B1DnXNC6cbldGt+yv6c+9zQo9hlUa66ggDoOoO4YOhdYxFFQ4UwYitJTYdD6shsRuwI/9tCGX4g2UigJTlfePfEEEd5t+psNtYEaFs1OdTiPUXy8FwvXN833HBUO36F3stZfg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:56.0052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a15ba00e-b583-4bea-7ce5-08d6cdb03253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z43+jQZvVCBxG+ZFeMy1uKrcir9swfPZMQphB90L2sw=;
 b=klHK1ZTdDSIPNSbRePAdEnOMox76WxhzajtkkzGbvAXrarRyHowv2uPoIKe2rJ3xR9gTHEDC1uggfQBaUDGqEQNHiQeEBZj66krTvD7U9o6tv/6QPviTd3TaTbZs7osEqpJNKSXVKCnw0u2TR7r2M6f5DTibDbNTDxkE5wytQTM=
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

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IEkyZTM1MTcwMTk1
NzE3ZmE0MTdkZGFlYjM3MmVmZTI5MDg3MjJkNGE5ClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxh
cmljLmN5ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjLmgKaW5kZXggNjM3YTdiMzllZWE0Li5iMGZkZjgzODdlN2EgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC00Miw3ICs0Miw3IEBACiAjaW5jbHVkZSAiaW5jL2h3
L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERD
X1ZFUiAiMy4yLjI1IgorI2RlZmluZSBEQ19WRVIgIjMuMi4yNiIKIAogI2RlZmluZSBNQVhfU1VS
RkFDRVMgMwogI2RlZmluZSBNQVhfUExBTkVTIDYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
