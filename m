Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE451A24
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9260D89DA2;
	Mon, 24 Jun 2019 17:58:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BC989DA2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:58:52 +0000 (UTC)
Received: from DM3PR12CA0099.namprd12.prod.outlook.com (2603:10b6:0:55::19) by
 CY4PR1201MB0053.namprd12.prod.outlook.com (2603:10b6:910:23::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Mon, 24 Jun
 2019 17:58:50 +0000
Received: from BY2NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by DM3PR12CA0099.outlook.office365.com
 (2603:10b6:0:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Mon, 24 Jun 2019 17:58:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT019.mail.protection.outlook.com (10.152.84.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Mon, 24 Jun 2019 17:58:49 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 24 Jun 2019
 12:58:48 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: update infoframe after dig fe is turned
 on (v2)
Date: Mon, 24 Jun 2019 13:58:47 -0400
Message-ID: <20190624175847.26253-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(14444005)(68736007)(50466002)(486006)(356004)(426003)(2616005)(86362001)(72206003)(81166006)(336012)(77096007)(81156014)(186003)(26005)(15650500001)(51416003)(8936002)(7696005)(305945005)(2906002)(2351001)(8676002)(478600001)(6916009)(50226002)(47776003)(53936002)(476003)(5660300002)(53416004)(54906003)(70586007)(70206006)(1076003)(36756003)(16586007)(316002)(48376002)(4326008)(126002)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0053; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee6605c-cf2c-48b5-211c-08d6f8cd9c86
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0053; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0053:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00539CAAFCCD7784A5729FC6ECE00@CY4PR1201MB0053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 007814487B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zE3AVKVnvdx0xt0zBI5HqRZxaGCGoI/OAj9lITFHLiJuJTgVdOMhimYKxaycwhLlxYFB1G3F6sJtkl45JnxGttZr8bXXnqodn5oOx7jkXluOUFVeuyurHeKVqgkhZY2kb6Fk97TQV/H3I6wTgwfjZ+mhX32u5gS4Ph7hEMlNz7IJ/jDuhb5FqZf521V84HF6XbUe5tQWy28bAf0ZPyeXz9pl2dGfVmy1etXBdRp6cPnWzSsvw4qrcNNNfgU4+rWYe0e6bS+d0mZJ29woqdYGD7hM1iOJajfpoqSjseg2fQEP2t+d5lSkK/EL8X5RvwQmuZb699CE4aP6KiIfORJ5RUVoJRR7USJ+zr0mXeILQXC4O2GFS/5uxrUC1QXnAIaezaDyf/85oJpdnsRIE5FU9HXEN2wixrfyy1U7DI+LhBA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2019 17:58:49.4301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee6605c-cf2c-48b5-211c-08d6f8cd9c86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBuLgwZTOw8N3Ev9aDKA13pUoC9y4wGn+eq44mCkYpo=;
 b=OxgfCY01cIAuJEAncih88VfcHWaETEIvo5svJKBRxi4F9SgqMMA97wX+EycEiRPM986cJh+BqBBUqIjyCQL0++WXrwUZP/55Ngmt/A6VUNUXZ9/OxQmrmM/UzJh5wik/SNBpYvNdFWH5Ev9Lyu3YKrhKat+aNhdKAp1CEmgBdcU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Roman Li <roman.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIEFWSSBpbmZvZnJhbWUgaXMgaW5jb3JyZWN0bHkgcHJvZ3JhbW1lZCBvbiBEQ04x
LzIgd2hlbiBlbmFibGluZyBhCnN0cmVhbSAtIGNhdXNpbmcgdGhlIHdyb25nIHBpeGVsIGVuY29k
aW5nIHRvIGJlIHVzZWQgZm9yIGRpc3BsYXkuCgpUaGlzIGlzIGJlY2F1c2UgdGhlIEFWSSBpbmZv
ZnJhbWUgaXMgcHJvZ3JhbW1lZCBiZWZvcmUgdGhlIERJRyBCRSBpcwpjb25uZWN0ZWQgdG8gdGhl
IEZFIGFuZCB0dXJuZWQgb24sIHNvIGVuYWJsaW5nIHRoZSBBRk1UIGJsb2NrIGRvZXNuJ3QKYWN0
dWFsbHkgd29yayBhbmQgdGhlIHJlZ2lzdGVycyBzdWJzZXF1ZW50bHkgY2FuJ3QgYmUgd3JpdHRl
biB0by4KCltIb3ddClByb2dyYW0gdGhlIGluZm9mcmFtZSAqYWZ0ZXIqIHR1cm5pbmcgb24gdGhl
IERJRyBGRS4gVGhpcyB3YXMgdGhlCmJlaGF2aW9yIHByZXZpb3VzbHkgdXNlZCBidXQgaXQgd2Fz
IGluY29ycmVjdGx5IHJldmVydGVkCndoZW4gYWRkaW5nIHRoZSBEQ04yIEhXIHNlcXVlbmNlciBj
b2RlLgoKdjI6IERvbid0IGNhbGwgdXBkYXRlX2luZm9fZnJhbWUgdHdpY2UKCkZpeGVzOiA1NGZm
MzU5MTU5NDggKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBEQ04yIEhXIFNlcXVlbmNlciBhbmQgUmVz
b3VyY2UiKQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzog
Um9tYW4gTGkgPHJvbWFuLmxpQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2th
c0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNl
MTEwX2h3X3NlcXVlbmNlci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTEx
MF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDk0MGU3NGI3ZDJjNi4uODRkOTBiNDc1ZTJhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9o
d19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEw
L2RjZTExMF9od19zZXF1ZW5jZXIuYwpAQCAtNjg2LDYgKzY4Niw3IEBAIHZvaWQgZGNlMTEwX2Vu
YWJsZV9zdHJlYW0oc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIAkJCQkJCQlkbWRhdGFfZHAg
OiBkbWRhdGFfaGRtaSk7CiAJfQogI2VuZGlmCisJZGNlMTEwX3VwZGF0ZV9pbmZvX2ZyYW1lKHBp
cGVfY3R4KTsKIAogCS8qIGVuYWJsZSBlYXJseSBjb250cm9sIHRvIGF2b2lkIGNvcnJ1cHRpb24g
b24gRFAgbW9uaXRvciovCiAJYWN0aXZlX3RvdGFsX3dpdGhfYm9yZGVycyA9Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
