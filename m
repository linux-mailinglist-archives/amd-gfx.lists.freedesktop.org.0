Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD73D48BC
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBF06ECA5;
	Fri, 11 Oct 2019 19:54:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEC86EC9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xxf6qb0dwYR6ojXHd+seeATOZwwZNOcH24RGn78vNoNn4uwvWQxs7yhlmmAw3kiKpBCifhW6usqFmw/jTnRc5xY1LQKCLBKuTzt9Cy+BdrAlmko4Dv4u5gMtVdHkUVXt8z/x6fKMm65QpTPxj3RHxIGgSFj8wGPeJkPvbw9fiBfrkh9po826Qu1Dk8YZ+9GlLkldquOp5Ovy+nH67XJxWUgqXmhCeUXFvaQ74QsBd9P6kCfZpxwEhLBGlidc6vgN9B9EmJg3QM3xqdLHR7yOr8ntPwVF96l9+6swSy8VbvZFfTQaRwta8l0+wBYpHUBKwX9iFm3GeqnAsjKKE5oqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI5LNbbphhntNHF+EE8Fr9lCDETVuy7iJ/GZPAD0kF0=;
 b=fZeMUxk2VzIZ9x/bnK1Ttkf0bFdU8MpYSvVF1KZ7aR0EfsAcbYq8MiNTFPRh4orupRC5I+bhhkN+lnjBTHXT9EL520BxeIj3WGM3WXMCjr/uUlA3NfXJFrY6JX1I104TTXiCf8gmSUvzCQqKbrnzCZLvFxr6GPuKxSxbD+CXEYnUzecvdJvymv1Ui6zNF55YjW82tMwRoFxdfK9lVT8m4INLkpIeed85lwwiX5Obq2GOplSN77+rQZqlzEMcv2rmf1ok0gNJT66MXStFHbvRwkKrazbRYucFRZOKa7zsp9bjt2AiDrFdJOOCvalCKpw6khqX9UnW+PQfgT+Pa/1uhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Fri, 11 Oct
 2019 19:53:54 +0000
Received: from BY2NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT062.mail.protection.outlook.com (10.152.85.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/29] drm/amd/display: add sanity check for clk table from smu
Date: Fri, 11 Oct 2019 15:53:19 -0400
Message-ID: <20191011195324.16268-25-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(428003)(189003)(199004)(305945005)(86362001)(8676002)(81156014)(81166006)(486006)(8936002)(36756003)(5660300002)(4326008)(6916009)(478600001)(50226002)(1076003)(14444005)(47776003)(16586007)(316002)(53416004)(51416003)(48376002)(76176011)(26005)(356004)(7696005)(6666004)(50466002)(2906002)(186003)(446003)(476003)(2616005)(11346002)(126002)(2351001)(70586007)(70206006)(426003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4309; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd4363cc-9fed-4603-5d25-08d74e84bf07
X-MS-TrafficTypeDiagnostic: CH2PR12MB4309:
X-Microsoft-Antispam-PRVS: <CH2PR12MB43091E5F57B2DE1A01FB571FF9970@CH2PR12MB4309.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mrFnUPBUjyvCS1nd/W/9cBNgj9cRz7GzB8OBSt1/JrdeYC8wTBhBGsbxMSl1B5xHnnKWBd2W3PXqRUEAZ9cZNagafZCa37aNik92oJLXb5+xygAzmCRruUNEXEhAvJLctpDxqoUNKL8ju/zZ5aBMOJkxM4vzQ6j8b7bLhJfxUpf/bHlpxbNVYVR86UAOq/1gucOrQZbWBNK11mzuvt4YfIDuyqvwziJ9lxvMKSsvwh8CRAIdpfXOuD2ymL1N8w3TsKywtmtI47EFoatT8imTfmgERAYrgSaix9BCoyA2fCbV4GeSBWgsZ3iiZu6+WXQv8m4nzVLy80jEVbGYwRLjRQmagFJ0e8Du/n9w+3skwHl7JqShPGr2FlzskP/ZEdqAjDdkQ+5Evnlo5iPP+IYmHkwgQsQLJEzwJgboxZ6V1w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:54.2223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4363cc-9fed-4603-5d25-08d74e84bf07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI5LNbbphhntNHF+EE8Fr9lCDETVuy7iJ/GZPAD0kF0=;
 b=mEYXq5nfYwJ0Zj6YGLwtNKWmmjNigwVb+o3gHz9tEln/oMZhqPFTwpz+ksaSYvX/tqJmwuG1tcP0EXUjHbDF8QaQPtEeATcfswCLlXFNaJrNlr5wc+mKObyGsEKfN6/IHJxAE3Nlq6zMQChg7ZIyw8d6F5tI+WVG/M+vgny910I=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpIYW5kbGUgdGhlIGNh
c2Ugd2hlcmUgd2UgZG9uJ3QgZ2V0IGEgdmFsaWQgdGFibGUuIEFsc28gZml4ZXMgY29tcGlsZXIK
d2FybmluZyBmb3IgdmFyaWFibGUgcG90ZW50aWFsbHkgdXNlZCBiZWZvcmUgYXNzaWdubWVudC4K
CltIb3ddCklmIHRoZSBlbnRpcmUgdGFibGUgaGFzIG5vIHZhbGlkIGZjbGssIHJlamVjdCB0aGUg
dGFibGUgYW5kIHVzZSBvdXIgb3duCmhhcmQgY29kZS4KClNpZ25lZC1vZmYtYnk6IEVyaWMgWWFu
ZyA8RXJpYy5ZYW5nMkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwppbmRleCBmYjhhYTk0MzZiZjAuLjBl
NzEyZGY4NzEwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwpAQCAtNTQ2LDYgKzU0Niw4IEBAIHZvaWQg
cm5fY2xrX21ncl9oZWxwZXJfcG9wdWxhdGVfYndfcGFyYW1zKHN0cnVjdCBjbGtfYndfcGFyYW1z
ICpid19wYXJhbXMsIHN0cnVjCiB7CiAJaW50IGksIGogPSAwOwogCisJaiA9IC0xOworCiAJQVNT
RVJUKFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTIDw9IE1BWF9OVU1fRFBNX0xWTCk7CiAKIAkv
KiBGaW5kIGxvd2VzdCBEUE0sIEZDTEsgaXMgZmlsbGVkIGluIHJldmVyc2Ugb3JkZXIqLwpAQCAt
NTU3LDYgKzU1OSwxMiBAQCB2b2lkIHJuX2Nsa19tZ3JfaGVscGVyX3BvcHVsYXRlX2J3X3BhcmFt
cyhzdHJ1Y3QgY2xrX2J3X3BhcmFtcyAqYndfcGFyYW1zLCBzdHJ1YwogCQl9CiAJfQogCisJaWYg
KGogPT0gLTEpIHsKKwkJLyogY2xvY2sgdGFibGUgaXMgYWxsIDBzLCBqdXN0IHVzZSBvdXIgb3du
IGhhcmRjb2RlICovCisJCUFTU0VSVCgwKTsKKwkJcmV0dXJuOworCX0KKwogCWJ3X3BhcmFtcy0+
Y2xrX3RhYmxlLm51bV9lbnRyaWVzID0gaiArIDE7CiAKIAlmb3IgKGkgPSAwOyBpIDwgYndfcGFy
YW1zLT5jbGtfdGFibGUubnVtX2VudHJpZXM7IGkrKywgai0tKSB7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
