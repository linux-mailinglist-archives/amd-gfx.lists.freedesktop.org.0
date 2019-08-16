Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA628FA9B
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D96EACF;
	Fri, 16 Aug 2019 06:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8265A6EACE
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBVORTIaWSdVQdBIxtdFh6KNwFLUfVGMznmwg2VHTwJe415/JGq7kp3mQ+PouZ093nMhCstgFrNmFiNsZ6BqPjMda7hDoiWKPsKGn850gdl98ptyTvSeqHHmaUfVPAYunCukzv3ilmeIUyqjErkEJXQJpiUBSMqP0xrBCuRqY+nPdfJdTxdJJsdKVxZKBMZRjt+ULi7TwlJX6zDFA0vdKuZ1DzbqnESeRHqpAbqHvnnhpx+qZFa3mgVS4tkDL+ZVzP0GagX/s2xCrT35LSscf6zxe+fAG5LDpm5/+liw0P3wZWJVotNZKm2tAnY9rk5asZJmi9NweyUFGOortLXICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SJMARzBM0x1Xot0iPgn3YzdqcLdNV/Al9XQxm/1h70=;
 b=NPtILqEUYzFwjmyRRZu69k3JQOypm7NOQh4YYXkigX317slUc2kzYQPmTOCiaJznbHhCe0jvFQ5fBKGRO/J2xC1zcMSVCel2fIFgouxR2/MIBCEyj+cEQWWUxQeIKYw5+uz0/4HQdQDcx9TT/hmh+HaChDB4ulMWKxoqmGIFQ618PjmO4TbTnipfMeFIwletpMJumYT/ACB3cLpIKxcF+ZSRg0BeXoE492YgqMM+34+KMCRX8MVDFYIF0F2yEZXBdEIpaItdA8RN2cEAGG/N8TP//I2oW6iyKduzplA+XWwEW92gUphMNltcwGreaKCm+pCC8wfBKZl+LY8c6RGX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0066.namprd12.prod.outlook.com (2603:10b6:0:56::34) by
 DM6PR12MB2715.namprd12.prod.outlook.com (2603:10b6:5:4a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 06:08:25 +0000
Received: from BY2NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0066.outlook.office365.com
 (2603:10b6:0:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 06:08:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT034.mail.protection.outlook.com (10.152.84.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 06:08:24 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 01:08:23 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value
Date: Fri, 16 Aug 2019 14:08:06 +0800
Message-ID: <20190816060807.11922-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816060807.11922-1-evan.quan@amd.com>
References: <20190816060807.11922-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(189003)(199004)(70586007)(6916009)(478600001)(36756003)(70206006)(305945005)(8676002)(8936002)(4326008)(50226002)(316002)(81156014)(81166006)(53936002)(76176011)(53416004)(486006)(11346002)(1076003)(476003)(2616005)(86362001)(2906002)(446003)(426003)(47776003)(336012)(356004)(44832011)(6666004)(126002)(7696005)(26005)(50466002)(2870700001)(5660300002)(48376002)(2351001)(51416003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29db621d-74f3-4f8e-66a0-08d7221025cf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2715FD61023A72DB3C58BBD8E4AF0@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B/z5P8W+18BT3I8tklhCAzJE1d7DNU+4KoDfOO9+Vq5/XgAO8T5anULSgqYlIK3mr8UpInc8fWpXEDUQ06pnH5bIVWQKqoig5yrxWx07BQXZMzIOSZuPRKlCWTmn8RhozIqwXXM3sF4JJOEWtQszJI/xmtLwoZcpI8iBEy+FWGFHxz163nAsIxs+kAu7pXxnWYFYd5cMDsw5pgegVTFcrdApacZ2QvvcINwFPm+kiBGLIJ/3BLAEmQoAumbF0rijHvUY062dnjMBkBaoaIfMefdBscpMzYKN2duzKJxYVIlqKHTFiG+scmrEGJQ3SUIZOfF/p4TPdQIz8wRZd2dMxLI1NrCrKzm9YJYLzEiK8K5nKxgbb+vlDedAEbWlthtK6CIQJzvWUO0SWlVoO1WkeZQmGrJWXIcXyJUpUJKKTQ8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 06:08:24.3853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29db621d-74f3-4f8e-66a0-08d7221025cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SJMARzBM0x1Xot0iPgn3YzdqcLdNV/Al9XQxm/1h70=;
 b=FjwE8XSuQI//6PpA2zDMwTD1wouWLjKJp7nIjc7J5qKwAg2B78Kktxi6ktEGrKgfw7pejqsxELc0Ui/Ws4r9WOA+YLqpftgUx8TLwRE7QwFmkkV0PLfZTRN/Zqaamx4/A/LhJIZwCFEafA7xvIaowQiIyreEpjf6TQe0xPh9M/U=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBhdmFpbGFibGUgd2l0aCBmaXJtd2FyZWluZm8gdGFibGUgdjMuMiBvciBsYXRlci4K
CkNoYW5nZS1JZDogSTIyM2VkZjNjNjE2YjllM2UyNTI3Yzc1MjIxNGZlZjVhYjUzZDFjZWEKU2ln
bmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jICAgICB8IDIxICsrKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IGNhOWI5ZWMzOWRlOC4uMmMx
NmViNDEyOTU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmgKQEAgLTIyMiw2ICsyMjIsOSBAQCBzdHJ1Y3Qgc211X2Jpb3NfYm9vdF91cF92YWx1
ZXMKIAl1aW50MTZfdAkJCXZkZF9nZng7CiAJdWludDhfdAkJCQljb29saW5nX2lkOwogCXVpbnQz
Ml90CQkJcHBfdGFibGVfaWQ7CisJdWludDMyX3QJCQlmb3JtYXRfcmV2aXNpb247CisJdWludDMy
X3QJCQljb250ZW50X3JldmlzaW9uOworCXVpbnQzMl90CQkJZmNsazsKIH07CiAKIGVudW0gc211
X3RhYmxlX2lkCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4
IDRhNTFkZTRmZjE2Mi4uZGY3YjY1MzYwYWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjExXzAuYwpAQCAtNTY4LDYgKzU2OCw5IEBAIGludCBzbXVfdjExXzBfZ2V0X3Zi
aW9zX2Jvb3R1cF92YWx1ZXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCXNtdS0+c211X3Rh
YmxlLmJvb3RfdmFsdWVzLnBwX3RhYmxlX2lkID0gdl8zXzMtPnBwbGliX3BwdGFibGVfaWQ7CiAJ
fQogCisJc211LT5zbXVfdGFibGUuYm9vdF92YWx1ZXMuZm9ybWF0X3JldmlzaW9uID0gaGVhZGVy
LT5mb3JtYXRfcmV2aXNpb247CisJc211LT5zbXVfdGFibGUuYm9vdF92YWx1ZXMuY29udGVudF9y
ZXZpc2lvbiA9IGhlYWRlci0+Y29udGVudF9yZXZpc2lvbjsKKwogCXJldHVybiAwOwogfQogCkBA
IC02NDcsNiArNjUwLDI0IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2dldF9jbGtfaW5mb19mcm9t
X3ZiaW9zKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCW91dHB1dCA9IChzdHJ1Y3QgYXRvbV9n
ZXRfc211X2Nsb2NrX2luZm9fb3V0cHV0X3BhcmFtZXRlcnNfdjNfMSAqKSZpbnB1dDsKIAlzbXUt
PnNtdV90YWJsZS5ib290X3ZhbHVlcy5kY2xrID0gbGUzMl90b19jcHUob3V0cHV0LT5hdG9tX3Nt
dV9vdXRwdXRjbGtmcmVxLnNtdV9jbG9ja19mcmVxX2h6KSAvIDEwMDAwOwogCisJaWYgKChzbXUt
PnNtdV90YWJsZS5ib290X3ZhbHVlcy5mb3JtYXRfcmV2aXNpb24gPT0gMykgJiYKKwkgICAgKHNt
dS0+c211X3RhYmxlLmJvb3RfdmFsdWVzLmNvbnRlbnRfcmV2aXNpb24gPj0gMikpIHsKKwkJbWVt
c2V0KCZpbnB1dCwgMCwgc2l6ZW9mKGlucHV0KSk7CisJCWlucHV0LmNsa19pZCA9IFNNVTExX1NZ
U1BMTDFfMF9GQ0xLX0lEOworCQlpbnB1dC5zeXNwbGxfaWQgPSBTTVUxMV9TWVNQTEwxXzJfSUQ7
CisJCWlucHV0LmNvbW1hbmQgPSBHRVRfU01VX0NMT0NLX0lORk9fVjNfMV9HRVRfQ0xPQ0tfRlJF
UTsKKwkJaW5kZXggPSBnZXRfaW5kZXhfaW50b19tYXN0ZXJfdGFibGUoYXRvbV9tYXN0ZXJfbGlz
dF9vZl9jb21tYW5kX2Z1bmN0aW9uc192Ml8xLAorCQkJCQkJICAgIGdldHNtdWNsb2NraW5mbyk7
CisKKwkJcmV0ID0gYW1kZ3B1X2F0b21fZXhlY3V0ZV90YWJsZShhZGV2LT5tb2RlX2luZm8uYXRv
bV9jb250ZXh0LCBpbmRleCwKKwkJCQkJCSh1aW50MzJfdCAqKSZpbnB1dCk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gLUVJTlZBTDsKKworCQlvdXRwdXQgPSAoc3RydWN0IGF0b21fZ2V0X3NtdV9j
bG9ja19pbmZvX291dHB1dF9wYXJhbWV0ZXJzX3YzXzEgKikmaW5wdXQ7CisJCXNtdS0+c211X3Rh
YmxlLmJvb3RfdmFsdWVzLmZjbGsgPSBsZTMyX3RvX2NwdShvdXRwdXQtPmF0b21fc211X291dHB1
dGNsa2ZyZXEuc211X2Nsb2NrX2ZyZXFfaHopIC8gMTAwMDA7CisJfQorCiAJcmV0dXJuIDA7CiB9
CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
