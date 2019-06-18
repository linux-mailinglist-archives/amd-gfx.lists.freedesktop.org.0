Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763C49795
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 04:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB49A6E0CF;
	Tue, 18 Jun 2019 02:43:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B926E0CF
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 02:43:29 +0000 (UTC)
Received: from MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) by BN7PR12MB2660.namprd12.prod.outlook.com
 (2603:10b6:408:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17; Tue, 18 Jun
 2019 02:43:28 +0000
Received: from BY2NAM03FT033.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by MWHPR1201CA0002.outlook.office365.com
 (2603:10b6:301:4a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12 via Frontend
 Transport; Tue, 18 Jun 2019 02:43:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT033.mail.protection.outlook.com (10.152.84.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 02:43:27 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 17 Jun 2019
 21:43:26 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix the null pointer about get vbios
Date: Tue, 18 Jun 2019 10:43:20 +0800
Message-ID: <1560825800-29464-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(14444005)(72206003)(478600001)(2906002)(81166006)(47776003)(48376002)(2616005)(126002)(4326008)(426003)(70206006)(50466002)(70586007)(476003)(486006)(356004)(336012)(6666004)(86362001)(186003)(5660300002)(36756003)(7696005)(50226002)(305945005)(16586007)(68736007)(2351001)(53936002)(81156014)(6916009)(8676002)(316002)(53416004)(51416003)(26005)(77096007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2660; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dff182b-5ccc-4950-72d4-08d6f396be0e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2660; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2660:
X-Microsoft-Antispam-PRVS: <BN7PR12MB266016E4A1A4677C44EE824B8FEA0@BN7PR12MB2660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dx5zYzUJtX9qoO9it3F1ZGtpaQjj0Y/5ePx0FAqHWmq/fdkYqgBuf83UizEreR7C+Xk9Ie9oqTlg9TRdwS4stcH5CQddDQoE9h9M4rJYxwHXmuVE++iP6TJqAdczjIvYv6fy9DdTM2/QI92QZc1OM6p5AAIgQel9D8IYslfJWp6wGJOdmiZnsIOuEq4/J40hsp6d850rWyjsw98IViSlTiKKA0p56kzR6+rrvhbW0JyPYDMeS5/bgHumwp2uRUoW1pMrrfyBza7r3/lYnvaTaJisbwrrQnoH42Fx3+T5QpYc8i55yhaO8FtFqU1L3nx/+ChxVb+GmCWDdxcZL2Lp04SzrWffWrj39Bgygend5YS3dSQs13cq2q1OIqwBcR9988uvfjNuOszAfb01O8L9M2tjdU0k6QbWYy0iWkXn3q0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 02:43:27.7204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dff182b-5ccc-4950-72d4-08d6f396be0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2660
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PCFbb1ObQbhhdxkp77ye8Jts12ye/AsHSCqdoZpHQE=;
 b=SRN7MIaSzvcL5FmdUHqYIPpuT59+rI+dwIufDdkP7JUWmNHpYsJZ8s2BPr/LiXRePycDOZ47/lBDbYQISYHGWT9pqIs10hSvFnTJVd1Ac7y8MST5BYRrHuLEXHsSaRy+4AWb4l0bsAYibx8tnbKkFJmkMlLzXAaHo986JC2gE8w=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSB0aGUgZ2V0IHZiaW9zIG9ubHkgYmVmb3JlIFNETUEgYmxvY2sgZWFybHkgaW5pdCB0byBm
aXggbnVsbCBwb2ludGVyCmFib3V0IGdldCB2Ymlvcy4KClNpZ25lZC1vZmYtYnk6IEVtaWx5IERl
bmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA0YTgzNmRiLi44MzBjNGI4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0xNTM0LDE4ICsxNTM0
LDE5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9lYXJseV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCWFkZXYtPnBt
LnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOwogCi0JLyogUmVhZCBCSU9TICovCi0JaWYg
KCFhbWRncHVfZ2V0X2Jpb3MoYWRldikpCi0JCXJldHVybiAtRUlOVkFMOwotCi0JciA9IGFtZGdw
dV9hdG9tYmlvc19pbml0KGFkZXYpOwotCWlmIChyKSB7Ci0JCWRldl9lcnIoYWRldi0+ZGV2LCAi
YW1kZ3B1X2F0b21iaW9zX2luaXQgZmFpbGVkXG4iKTsKLQkJYW1kZ3B1X3ZmX2Vycm9yX3B1dChh
ZGV2LCBBTURHSU1fRVJST1JfVkZfQVRPTUJJT1NfSU5JVF9GQUlMLCAwLCAwKTsKLQkJcmV0dXJu
IHI7Ci0JfQotCiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewor
CQlpZiAoIGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT50eXBlID09IEFNRF9JUF9CTE9DS19U
WVBFX1NETUEgKSB7CisJCQkvKiBSZWFkIEJJT1MgKi8KKwkJCWlmICghYW1kZ3B1X2dldF9iaW9z
KGFkZXYpKQorCQkJCXJldHVybiAtRUlOVkFMOworCisJCQlyID0gYW1kZ3B1X2F0b21iaW9zX2lu
aXQoYWRldik7CisJCQlpZiAocikgeworCQkJCWRldl9lcnIoYWRldi0+ZGV2LCAiYW1kZ3B1X2F0
b21iaW9zX2luaXQgZmFpbGVkXG4iKTsKKwkJCQlhbWRncHVfdmZfZXJyb3JfcHV0KGFkZXYsIEFN
REdJTV9FUlJPUl9WRl9BVE9NQklPU19JTklUX0ZBSUwsIDAsIDApOworCQkJCXJldHVybiByOwor
CQkJfQorCQl9CiAJCWlmICgoYW1kZ3B1X2lwX2Jsb2NrX21hc2sgJiAoMSA8PCBpKSkgPT0gMCkg
ewogCQkJRFJNX0VSUk9SKCJkaXNhYmxlZCBpcCBibG9jazogJWQgPCVzPlxuIiwKIAkJCQkgIGks
IGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+bmFtZSk7Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
