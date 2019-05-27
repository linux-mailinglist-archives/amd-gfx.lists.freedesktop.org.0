Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE732BAE7
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1A289AB7;
	Mon, 27 May 2019 19:52:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5FE89AB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:13 +0000 (UTC)
Received: from DM3PR12CA0111.namprd12.prod.outlook.com (2603:10b6:0:55::31) by
 DM6PR12MB2666.namprd12.prod.outlook.com (2603:10b6:5:4a::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:52:11 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM3PR12CA0111.outlook.office365.com
 (2603:10b6:0:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:10 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:58 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/26] drm/amd/display: fix crash on setmode when mode is
 close to bw limit
Date: Mon, 27 May 2019 15:50:54 -0400
Message-ID: <1558986665-12964-16-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(68736007)(72206003)(2876002)(478600001)(186003)(53936002)(446003)(16586007)(76176011)(336012)(356004)(6666004)(11346002)(14444005)(7696005)(51416003)(2351001)(50226002)(486006)(8676002)(77096007)(2906002)(126002)(53416004)(426003)(26005)(48376002)(81166006)(81156014)(6916009)(305945005)(50466002)(36756003)(4326008)(5660300002)(86152003)(2616005)(316002)(47776003)(70586007)(70206006)(8936002)(476003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2666; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc097b81-60f5-42c8-9eaf-08d6e2dccee3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2666; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2666:
X-Microsoft-Antispam-PRVS: <DM6PR12MB266649F6382A08D5A6C15CA3821D0@DM6PR12MB2666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9OiDTw3pMrGIJfGY8TQJhiNp4RHQAqX8Uy0igaDHX8y6UY/wPxF2my5OudogAM8wX95zO5IMXWXE+UEJqtaiA7srKf8GxWduPLNANJp0zdIBJayDlNxodFoGvB9Pe3OYrNPNOF0eAXEatZoDTLSiR9RwuH3BHVynIXEN64IQGnc4gx6bOO6NaT4bJ0liwx8iFUsqNZFvj4t9YJd/scucaqjpMBuzTSDlXrT848OlLeNR08sEGDWX/23sKZlCbwiSJ7nAiI7nbEdja2e/ID4ofWwRCkPkhj+sRmJ9FjdS+tRVdR8r9MqbnUOe3jd0fcQmbNVv6rXpCU9AYuBWKs/TNz28pUB9B+4GtJXBixWsCmva3kaWzoMRwP24/c9wi1rS5RXByqZgCYvI6Kq8OWWXhI3t97lPnt1lNyRZozoi6T0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:10.9072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc097b81-60f5-42c8-9eaf-08d6e2dccee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2666
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nVJ4R+FjkQNmU4bTXmCbyFKFTxEWWFVhtJ89thWoFw=;
 b=kiug2HRK76wWiU7+HqZHwq11pS0SlCXU598NAQjHCbDz/IEmTaug+6+XpJLSCXI6m6CaUagkJTvhVK7crTs1c1XVIBWtjvNp17Wz2Oy1QWc2Ahcm2XLQnSDmbDjNEAx/fwEfQoskzBnBr5BK0fyEQ8L84a8HAQmCfYIQo4GHDgI=
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
Cc: Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KClt3aHldCmR1cmluZyBJdCdz
IHBvc3NpYmxlIHRvIGNhbGwgZGNuX3ZhbGlkYXRlX2JhbmR3aWR0aCB3aXRoIG5vIHBsYW5lLgpJ
biB0aGF0IGNhc2UsIGFzIHdlIGFyZSBvbmx5IGludGVyc3RlZCBpbiBpZiBvdXRwdXQgdGltaW5n
IGlzIHN1cHBvcnRlZCBvciBub3QsCmV2ZW4gaWYgd2UgY2Fubm90IHN1cHBvcnQgbmF0aXZlIHJl
c29sdXRpb24sIHdlIHN0aWxsIHdhbnQgdG8gc3VwcG9ydCBsb3dlcgpyZXNvbHV0aW9uIGlmIGl0
IGlzIHZhbGlkCgpbaG93XQppZiB0aGVyZSBleGlzdCBubyBzdXJmYWNlLCBtYWtlIHZpZXdwb3J0
L3JlY19vdXQgc2l6ZSBhdCBtYXggMTA4MHAuIEl0IGlzCmFscmVhZHkga25vd24gdGhhdCAxMDgw
cCB4IDYobWF4ICMgb2YgcGlwZXMpIGlzIHN1cHBvcnRlZCwgc28gaWYgd2UgZmFpbAp2YWxpZGF0
aW9uLCBpdCBpcyBiZWNhdXNlIG9mIHRoZSBzdHJlYW0KClNpZ25lZC1vZmYtYnk6IFN1IFN1bmcg
Q2h1bmcgPFN1LkNodW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4g
PERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9j
YWxjcy5jIHwgMTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNuX2NhbGNzLmMKaW5kZXggMGEzMzZjOC4uNWMxZTBhZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3MuYwpAQCAtODcyLDgg
Kzg3MiwxOSBAQCBib29sIGRjbl92YWxpZGF0ZV9iYW5kd2lkdGgoCiAJCQl2LT5sYl9iaXRfcGVy
X3BpeGVsW2lucHV0X2lkeF0gPSAzMDsKIAkJCXYtPnZpZXdwb3J0X3dpZHRoW2lucHV0X2lkeF0g
PSBwaXBlLT5zdHJlYW0tPnRpbWluZy5oX2FkZHJlc3NhYmxlOwogCQkJdi0+dmlld3BvcnRfaGVp
Z2h0W2lucHV0X2lkeF0gPSBwaXBlLT5zdHJlYW0tPnRpbWluZy52X2FkZHJlc3NhYmxlOwotCQkJ
di0+c2NhbGVyX3JlY19vdXRfd2lkdGhbaW5wdXRfaWR4XSA9IHBpcGUtPnN0cmVhbS0+dGltaW5n
LmhfYWRkcmVzc2FibGU7Ci0JCQl2LT5zY2FsZXJfcmVjb3V0X2hlaWdodFtpbnB1dF9pZHhdID0g
cGlwZS0+c3RyZWFtLT50aW1pbmcudl9hZGRyZXNzYWJsZTsKKwkJCS8qCisJCQkgKiBmb3IgY2Fz
ZXMgd2hlcmUgd2UgaGF2ZSBubyBwbGFuZSwgd2Ugd2FudCB0byB2YWxpZGF0ZSB1cCB0byAxMDgw
cAorCQkJICogc291cmNlIHNpemUgYmVjYXVzZSBoZXJlIHdlIGFyZSBvbmx5IGludGVyZXN0ZWQg
aW4gaWYgdGhlIG91dHB1dAorCQkJICogdGltaW5nIGlzIHN1cHBvcnRlZCBvciBub3QuIGlmIHdl
IGNhbm5vdCBzdXBwb3J0IG5hdGl2ZSByZXNvbHV0aW9uCisJCQkgKiBvZiB0aGUgaGlnaCByZXMg
ZGlzcGxheSwgd2Ugc3RpbGwgd2FudCB0byBzdXBwb3J0IGxvd2VyIHJlcyB1cCBzY2FsZQorCQkJ
ICogdG8gbmF0aXZlCisJCQkgKi8KKwkJCWlmICh2LT52aWV3cG9ydF93aWR0aFtpbnB1dF9pZHhd
ID4gMTkyMCkKKwkJCQl2LT52aWV3cG9ydF93aWR0aFtpbnB1dF9pZHhdID0gMTkyMDsKKwkJCWlm
ICh2LT52aWV3cG9ydF9oZWlnaHRbaW5wdXRfaWR4XSA+IDEwODApCisJCQkJdi0+dmlld3BvcnRf
aGVpZ2h0W2lucHV0X2lkeF0gPSAxMDgwOworCQkJdi0+c2NhbGVyX3JlY19vdXRfd2lkdGhbaW5w
dXRfaWR4XSA9IHYtPnZpZXdwb3J0X3dpZHRoW2lucHV0X2lkeF07CisJCQl2LT5zY2FsZXJfcmVj
b3V0X2hlaWdodFtpbnB1dF9pZHhdID0gdi0+dmlld3BvcnRfaGVpZ2h0W2lucHV0X2lkeF07CiAJ
CQl2LT5vdmVycmlkZV9odGFfcHNbaW5wdXRfaWR4XSA9IDE7CiAJCQl2LT5vdmVycmlkZV92dGFf
cHNbaW5wdXRfaWR4XSA9IDE7CiAJCQl2LT5vdmVycmlkZV9odGFfcHNjaHJvbWFbaW5wdXRfaWR4
XSA9IDE7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
