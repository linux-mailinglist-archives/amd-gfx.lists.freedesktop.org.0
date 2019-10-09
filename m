Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D63D1A80
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253F86EA62;
	Wed,  9 Oct 2019 21:06:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65A6EA61
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA8DgI7CUIeRBCOfSTcj42IkyHagvwQYOQ7pYtB11h13KcyQeiXz8j38a51cXlyBPtcLluVNc0wcNKNRc8w1CwVmhwGKvTxqo2CdOoePytY2EfIsRqG3h/7t0Rlf4tzfu2GeZCYMK6Y5meyzMTPzrs//AifZsCeKEHdBd0FQ7bHQ/yHXRfF9SpvGyzk7B1iHQMdCBPHLNKRW/CYamEf4DaPShjRQTXfVrPJAkYpncJtOpAFHhR4yiQ4CNAClTPP9kcxW4da+b5ESz8d/wDjW5EZLY/CsMI1qsj4F4L1UTESObxrbqB21XC8hydPqVqxyEWxQrkkDGDZYXtiAQ714XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lsRamgrUP/zoL76weZnPTYoNqAmD0vFGx46FdYljug=;
 b=Ek62x/w+L/H9piBibKXGxQ5r0fmO+VTRGLXfm7CI9oOAoooEGVo84LKrHPl2M440z2AHXRjBeBLM8VrIYpjjP9rDhdwhgJHab0GPubeJ66AvSfu9+GWwWWjtkpYb0cu5SrR/nWLeYMAwNg1F+M2+IEvFxjVeoAqoLZaj46nfRyARjPe9Ryvoncu8nrk2Z0d5KnIX8yuvtEqmKjR8xIrH/k3LgFYJHCQmREk5QWIp1uKC6a8abGfGy+s3FgTkUqAW4C9KTH6Ava2u8lHxEP1vskLEVNpZNQK8BK73w3uYQ4WhOGSIaWLYi1wBJ3Ig9cHKClRgydq9kxuCWqw1XHklpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Wed, 9 Oct
 2019 21:06:25 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:25 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:23 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/26] drm/amd/display: fix incorrect page table address for
 renoir
Date: Wed, 9 Oct 2019 17:05:57 -0400
Message-ID: <20191009210613.17929-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(428003)(199004)(189003)(316002)(476003)(2351001)(47776003)(16586007)(36756003)(446003)(11346002)(54906003)(426003)(126002)(2616005)(486006)(1076003)(186003)(26005)(5660300002)(478600001)(50466002)(336012)(53416004)(70206006)(86362001)(50226002)(4326008)(8936002)(356004)(6666004)(70586007)(81166006)(2906002)(6916009)(48376002)(81156014)(8676002)(305945005)(51416003)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3205; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20595480-2106-43b3-24cb-08d74cfc8bbc
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32056D4162CB5F65DB4EA557F9950@BYAPR12MB3205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqfJMpf1FmntxM4c3X9C5ti2U7NSYyGF0cZbBRta5CxSAI0FYaFlBJz3NI2KGUgGWwwetqGeZTitOppgrfIdBAFhJS6WzQkHqoEO8EPH56IwenVqMFaTRp8TSFExnC5i/pbK09tFH2GbJLXS5eQni2tQ3AXkAmAnoXJ9wzM/x4p5J7qaGxhkUAXlAFXf39D1lic9sE7D/CGAX5B0PJMZHYuPkzrXhxb+rhfqiWQhq3dBJIdu2WCK8RkZkNu/3JRR9ti1Zix+wSgUEyFUkgpfyHcsU+NBAGmk+iAmp4QAAsCYBv+2eiP7a5aM8gf484iNPeCD93ADnRzRqzUcvxbK9fPXiyFyVR/57z+DxMCeVCQnQHVleamTBnJlXNhRAfB9muz0vuj4ZNotMTCgZopN42yToDRllWfrxMEcZAMMFqY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:25.5046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20595480-2106-43b3-24cb-08d74cfc8bbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3205
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lsRamgrUP/zoL76weZnPTYoNqAmD0vFGx46FdYljug=;
 b=S02PyPyDzSQvxzg5yzpOgB0xcqNt2nuYMF1Mo3+Hh8Vkltf+Kmv2EFbogue7i9qvNRt1bcuPRRSkQehALo0SuOJDt4quwJoKMkdaXy1diZjrvyhzM8RwRbokze30E8z71fWAQLNM1jFzsTLWaVtb4Y+N9qOnfYgvM44z1YeFIF0=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5jb3JyZWN0IHBhZ2UgdGFibGUgYWRkcmVzcyBhbmQgcHJvZ3JhbW1pbmcgc3lzIGFwZXJ0dXJl
IGZvcgpzdHV0dGVyIGdhdGhlciwgc28gZml4IGl0LgoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYyAgIHwgMjMgKysrKysrKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCmlu
ZGV4IGJkMjQ3ZTVlNzUzZS4uZmRmYmRlYjMyNDU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jCkBAIC0xMTEsMTkgKzExMSwz
MCBAQCBpbnQgaHViYnViMjFfaW5pdF9kY2h1YihzdHJ1Y3QgaHViYnViICpodWJidWIsCiAJCXN0
cnVjdCBkY25faHViYnViX3BoeXNfYWRkcl9jb25maWcgKnBhX2NvbmZpZykKIHsKIAlzdHJ1Y3Qg
ZGNuMjBfaHViYnViICpodWJidWIxID0gVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yik7CisJc3RydWN0
IGRjbl92bWlkX3BhZ2VfdGFibGVfY29uZmlnIHBoeXNfY29uZmlnOwogCiAJUkVHX1NFVChEQ05f
Vk1fRkJfTE9DQVRJT05fQkFTRSwgMCwKLQkJRkJfQkFTRSwgcGFfY29uZmlnLT5zeXN0ZW1fYXBl
cnR1cmUuZmJfYmFzZSk7CisJCQlGQl9CQVNFLCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5m
Yl9iYXNlID4+IDI0KTsKIAlSRUdfU0VUKERDTl9WTV9GQl9MT0NBVElPTl9UT1AsIDAsCi0JCQlG
Ql9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCk7CisJCQlGQl9UT1AsIHBh
X2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmZiX3RvcCA+PiAyNCk7CiAJUkVHX1NFVChEQ05fVk1f
RkJfT0ZGU0VULCAwLAotCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5m
Yl9vZmZzZXQpOworCQkJRkJfT0ZGU0VULCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5mYl9v
ZmZzZXQgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9CT1QsIDAsCi0JCQlBR1BfQk9ULCBw
YV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3BfYm90KTsKKwkJCUFHUF9CT1QsIHBhX2NvbmZp
Zy0+c3lzdGVtX2FwZXJ0dXJlLmFncF9ib3QgPj4gMjQpOwogCVJFR19TRVQoRENOX1ZNX0FHUF9U
T1AsIDAsCi0JCQlBR1BfVE9QLCBwYV9jb25maWctPnN5c3RlbV9hcGVydHVyZS5hZ3BfdG9wKTsK
KwkJCUFHUF9UT1AsIHBhX2NvbmZpZy0+c3lzdGVtX2FwZXJ0dXJlLmFncF90b3AgPj4gMjQpOwog
CVJFR19TRVQoRENOX1ZNX0FHUF9CQVNFLCAwLAotCQkJQUdQX0JBU0UsIHBhX2NvbmZpZy0+c3lz
dGVtX2FwZXJ0dXJlLmFncF9iYXNlKTsKKwkJCUFHUF9CQVNFLCBwYV9jb25maWctPnN5c3RlbV9h
cGVydHVyZS5hZ3BfYmFzZSA+PiAyNCk7CisKKwlpZiAocGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5w
YWdlX3RhYmxlX3N0YXJ0X2FkZHIgIT0gcGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5wYWdlX3RhYmxl
X2VuZF9hZGRyKSB7CisJCXBoeXNfY29uZmlnLnBhZ2VfdGFibGVfc3RhcnRfYWRkciA9IHBhX2Nv
bmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9zdGFydF9hZGRyID4+IDEyOworCQlwaHlzX2Nv
bmZpZy5wYWdlX3RhYmxlX2VuZF9hZGRyID0gcGFfY29uZmlnLT5nYXJ0X2NvbmZpZy5wYWdlX3Rh
YmxlX2VuZF9hZGRyID4+IDEyOworCQlwaHlzX2NvbmZpZy5wYWdlX3RhYmxlX2Jhc2VfYWRkciA9
IHBhX2NvbmZpZy0+Z2FydF9jb25maWcucGFnZV90YWJsZV9iYXNlX2FkZHIgfCAxOyAvL05vdGU6
IGhhY2sKKwkJcGh5c19jb25maWcuZGVwdGggPSAwOworCQlwaHlzX2NvbmZpZy5ibG9ja19zaXpl
ID0gMDsKKwkJLy8gSW5pdCBWTUlEIDAgYmFzZWQgb24gUEEgY29uZmlnCisJCWRjbjIwX3ZtaWRf
c2V0dXAoJmh1YmJ1YjEtPnZtaWRbMF0sICZwaHlzX2NvbmZpZyk7CisJfQogCiAJZGNuMjFfZGNo
dm1faW5pdChodWJidWIpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
