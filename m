Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2B10196
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55448930B;
	Tue, 30 Apr 2019 21:10:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1C1892B8
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:12 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 BLUPR12MB0644.namprd12.prod.outlook.com (2a01:111:e400:594e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Tue, 30 Apr
 2019 21:10:11 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:10 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:55 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/20] drm/amd/display: Check scaling info when determing
 update type
Date: Tue, 30 Apr 2019 17:09:31 -0400
Message-ID: <20190430210938.32335-34-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(72206003)(26005)(50226002)(50466002)(8936002)(316002)(16586007)(48376002)(81156014)(305945005)(8676002)(6916009)(53936002)(4326008)(36756003)(81166006)(478600001)(53416004)(47776003)(15650500001)(186003)(51416003)(7696005)(5660300002)(2351001)(2616005)(11346002)(76176011)(1076003)(486006)(476003)(68736007)(14444005)(86362001)(126002)(70586007)(77096007)(336012)(446003)(70206006)(356004)(6666004)(2906002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0644; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2f634f5-ef7e-4c70-adb1-08d6cdb03b06
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0644; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0644:
X-Microsoft-Antispam-PRVS: <BLUPR12MB0644ACDE94BFC95F1D26903CF93A0@BLUPR12MB0644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tMunmk2d6NER+tlNTCbY6oGTzLgF0qqt+OYvKObFFTTWveNOvHPKP8hJnXf3cMLdBQCSAvdf4SIF3tJPNwCQwqYhBCn0tRc1yB/QNU1UsKNFvRgXy1fH9lezD1t6BKHPFRV4lLKwi+X+DzYs+E2v8cvRnt+bFywStMMMihSaBC/FS9fvQ7Zog9fU6juVKe90QUCjHCBz+mgm7eHedeQk5VrBxoIe6wDyCIFvxzKQSGq6Bo3P17ImxmYhDIbaaQF75XOspLebxVmpHpV+loUXmAMN5KdY61FilTqgfegl4kITPIt9WToDN7Oe+ZGxOt6w/HrAJgIlgqG0kREnmsEIfMSkPkfdecrTI4xH+wTd54zADHmZXFrcyh5uJJS6AE3vZbvYUw7F+/5gxzyc82mYEf5o813Y9Ng+FWwnUPG7Mj8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:10.5823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f634f5-ef7e-4c70-adb1-08d6cdb03b06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isF42yiuQCLnd9jeuM0z+l82pkewAlx9db8SVaJVrQs=;
 b=Z1Ysj7I2m/mYVEhZ8qHUfNg5tF/+G1PzYlI8y1NOC3eIUg1lW5WRNWYfkBfoWQAh/VjGyv0Ia8GscFfVODmOl/BKlXtlQXD51utCh2mcnBcI1dneEB2Guz6JlbIGwoqVgh7mtS9Ovxai4tar0cYk7WK/JhzvzIayxV+8d+RlNak=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KU3VyZmFjZSBzY2FsaW5nIGluZm8gdXBkYXRlcyBjYW4gYWZmZWN0IGJhbmR3aWR0aCBh
bmQgYmxvY2tzLiBXZSBuZWVkCnRvIGJlIGNoZWNraW5nIHRoZXNlIHdpdGggZ2xvYmFsIHZhbGlk
YXRpb24gdG8gYXZvaWQgdW5kZXJmbG93IG9yCmNvcnJ1cHRpb24uCgpbSG93XQpEcm9wIHRoZSBz
dGF0ZS0+YWxsb3dfbW9kZXNldCBlYXJseSBleGl0IGluCmRtX2RldGVybWluZV91cGRhdGVfdHlw
ZV9mb3JfY29tbWl0LiBNb3N0IG9mIHRob3NlIHNob3VsZCBiZSBjb25zaWRlcmVkCmZhc3Qgbm93
IGFueXdheS4KCkZpbGwgaW4gc2NhbGluZyBpbmZvIGFuZCBpdCB0byB0aGUgc3VyZmFjZSB1cGRh
dGUgaW4gYXRvbWljCmNoZWNrLgoKQ2hhbmdlLUlkOiBJM2QzMmI4NDI2YTgwOTdiYjM0ODUxYzUx
ZGZlMTQzYTc1NzA3ZjA4ZApTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNo
b2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQgTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggM2FhMWI5YzA1Zjg4Li4zZmY4N2JjMzFh
OGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtNjQwNiw2ICs2NDA2LDcgQEAgZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zv
cl9jb21taXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCiAJZm9yX2VhY2hf
b2xkbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLCBuZXdfY3J0
Y19zdGF0ZSwgaSkgewogCQlzdHJ1Y3QgZGNfc3RyZWFtX3VwZGF0ZSBzdHJlYW1fdXBkYXRlID0g
eyAwIH07CisJCXN0cnVjdCBkY19zY2FsaW5nX2luZm8gc2NhbGluZ19pbmZvOwogCiAJCW5ld19k
bV9jcnRjX3N0YXRlID0gdG9fZG1fY3J0Y19zdGF0ZShuZXdfY3J0Y19zdGF0ZSk7CiAJCW9sZF9k
bV9jcnRjX3N0YXRlID0gdG9fZG1fY3J0Y19zdGF0ZShvbGRfY3J0Y19zdGF0ZSk7CkBAIC02NDMz
LDkgKzY0MzQsNiBAQCBkbV9kZXRlcm1pbmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3Qg
YW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQkJZ290byBjbGVhbnVwOwogCQkJfQogCi0J
CQlpZiAoIXN0YXRlLT5hbGxvd19tb2Rlc2V0KQotCQkJCWNvbnRpbnVlOwotCiAJCQlpZiAoY3J0
YyAhPSBuZXdfcGxhbmVfY3J0YykKIAkJCQljb250aW51ZTsKIApAQCAtNjQ1Nyw2ICs2NDU1LDEz
IEBAIGRtX2RldGVybWluZV91cGRhdGVfdHlwZV9mb3JfY29tbWl0KHN0cnVjdCBhbWRncHVfZGlz
cGxheV9tYW5hZ2VyICpkbSwKIAkJCQkJCW5ld19kbV9jcnRjX3N0YXRlLT5zdHJlYW0tPm91dF90
cmFuc2Zlcl9mdW5jOwogCQkJfQogCisJCQlyZXQgPSBmaWxsX2RjX3NjYWxpbmdfaW5mbyhuZXdf
cGxhbmVfc3RhdGUsCisJCQkJCQkgICAmc2NhbGluZ19pbmZvKTsKKwkJCWlmIChyZXQpCisJCQkJ
Z290byBjbGVhbnVwOworCisJCQl1cGRhdGVzW251bV9wbGFuZV0uc2NhbGluZ19pbmZvID0gJnNj
YWxpbmdfaW5mbzsKKwogCQkJbnVtX3BsYW5lKys7CiAJCX0KIAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
