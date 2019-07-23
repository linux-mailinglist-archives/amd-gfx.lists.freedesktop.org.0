Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA667142C
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305FB6E29C;
	Tue, 23 Jul 2019 08:41:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690069.outbound.protection.outlook.com [40.107.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF116E29C
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 08:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/qrMZcqZwd7YOJ9sK5KebpMX3z2WAGRDOKilJ4+NGyaLEMYwWDPJ1Q0nfsI1/vdaikJRgdi9IyMPT3QEtfau/qaiuyLZKEt5jCuYTT9RX0yPATqkPblryZN3mDq95Ou3ybV8a3TdjZI6JevFxsov3Ast7+8SPGzYxjbkLB3dJKMujXdWQnHJYUb6RaWTri5W0KY1HqBYF9qW6wEN89N45PbD6RNz3r7SitTRcgSUV6j5/t44L19ntIJMeoTrNq7cpH799eqgYJ7mhphLhJZMsJIH0DpXfGStG6ym8kFsSC4uWMueZLlKSaXhf+bowR9IdaytoJlTSaWnIh5pXcAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmUF05xI+SrCiqCh2OKf/TUlRpNSSEJw9cfaggm366E=;
 b=LuO+whxzl3XrSJxZ8iHUiqmJKiwGF/Yxou1Qx6WnTHYOqV422is6awgsKY5X6vYcnSMLHpIWxRUBw5xuVTH0OHekf+M0iQhUdQNz5qDdtq8zTC4dWrT2sxJvwaTgfTMo0++920VXJjSr3ZTyQtQBFS/rIT8sYzYxMGBx0Z+wetW1qI8/hiKS25K7DgfOePpGvQK2yf3t1bU1Q0Nimxm6fSyBIY4+ytfCk4NfdfY+eS5BtrEtn4xs1KRJz3/InAYnBRoM8uQgPoEwoosrwMpFKAE+N3ofiWRMP2PMxVrkdAhJAQ0/9m3MOUxZ55bXL0XYN8RY/fkAZKczD0W6org0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:610:57::18)
 by CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12; Tue, 23 Jul
 2019 08:41:40 +0000
Received: from CO1NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by CH2PR12CA0008.outlook.office365.com
 (2603:10b6:610:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Tue, 23 Jul 2019 08:41:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT037.mail.protection.outlook.com (10.152.80.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 23 Jul 2019 08:41:39 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 23 Jul 2019
 03:41:37 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: some cosmetic fixes
Date: Tue, 23 Jul 2019 16:41:12 +0800
Message-ID: <20190723084112.11439-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723084112.11439-1-evan.quan@amd.com>
References: <20190723084112.11439-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(316002)(2906002)(4326008)(36756003)(5660300002)(6916009)(11346002)(486006)(44832011)(2351001)(53936002)(305945005)(70586007)(70206006)(2870700001)(446003)(68736007)(51416003)(8676002)(186003)(86362001)(50226002)(50466002)(6666004)(7696005)(8936002)(26005)(76176011)(478600001)(336012)(1076003)(48376002)(126002)(476003)(2616005)(81166006)(426003)(47776003)(53416004)(14444005)(81156014)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1576; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905b7ec1-5874-46d5-e060-08d70f499469
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1576; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1576:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1576C89E3426BC2F0B423BB2E4C70@CY4PR12MB1576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0107098B6C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /kZXl9pve8ouQiZgJbApeHZjjBT3aSsVs71ZitDEwyqTToeH40Oj/In5FDK3U1TtmEk09OAz9upfwmV+2WdLPTriSF2lXR6IFHX4LD2OK9sTjH5/gTNjj7eYo8cwMSCOxCIs2l0UdEzFOBiMACAaG3sp6yFQtKaek1x6kvQuEnn9yU6EPA29d4b5k4+ehZ9SDBnRrDiKHOIbelcC7dZcWQTPYlBceSJ1RhrZnVyhunG74IlZ6bdtKiKioKFT/5mlMKy0pDysQNvtyZfYM4Frg4VV+cmKpY3ZrXzzCD8F/fii7Lh/MpbPjYoSUnGJICvdlpx/zg9+vJoawTCPuEZ6xdkcxua9MIznr19+iB/xOtAqGQC5Qky+TqjKmQLUTAORq5u1zRcJm5TCnrYWbZCQMxbWwpIlYc9HQMMWknizM58=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2019 08:41:39.0638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 905b7ec1-5874-46d5-e060-08d70f499469
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1576
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmUF05xI+SrCiqCh2OKf/TUlRpNSSEJw9cfaggm366E=;
 b=fuqM8DzIeMAn4xwCLMSDL4Y7dm+JPu/fJct1b20AsaxMrjjPjKs1Ykfkc18uToVPtbpKVefSzEtmGjR2rn+It8Bo1PHSj9DVvTq2CEepNXm+VkWr5ACYS0Qh5uzHm5YEofWMITjVh47qTKzGXhlpQJHZZZnutxMdw+1eejw55js=
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

RHJvcCByZWR1bmRhbnQgY2hlY2ssIGR1cGxpY2F0ZSBjaGVjaywgZHVwbGljYXRlIHNldHRpbmcK
YW5kIGZpeCB0aGUgcmV0dXJuIHZhbHVlLgoKQ2hhbmdlLUlkOiBJMDQxNzFiY2FjODJmMTcxNTIz
NzFkMDVlNjk1OGQ0ZmMwNzJjMGY2YgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAg
ICB8IDMzICsrKysrKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYyB8IDMwICsrKysrKysrLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDI4IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggODY2MDk3ZDVjZjI2Li5hYWQzZTEwNTkwMWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBAIC0zNjcsMTMgKzM2Nyw2IEBAIHN0
YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfZHBtX2ZvcmNlZF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJICAgICAoZGRldi0+c3dpdGNoX3Bvd2VyX3N0YXRlICE9IERSTV9T
V0lUQ0hfUE9XRVJfT04pKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmICghYW1kZ3B1X3NyaW92
X3ZmKGFkZXYpKSB7Ci0JCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKLQkJCWN1cnJlbnRf
bGV2ZWwgPSBzbXVfZ2V0X3BlcmZvcm1hbmNlX2xldmVsKCZhZGV2LT5zbXUpOwotCQllbHNlIGlm
IChhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmdldF9wZXJmb3JtYW5jZV9sZXZlbCkKLQkJCWN1
cnJlbnRfbGV2ZWwgPSBhbWRncHVfZHBtX2dldF9wZXJmb3JtYW5jZV9sZXZlbChhZGV2KTsKLQl9
Ci0KIAlpZiAoc3RybmNtcCgibG93IiwgYnVmLCBzdHJsZW4oImxvdyIpKSA9PSAwKSB7CiAJCWxl
dmVsID0gQU1EX0RQTV9GT1JDRURfTEVWRUxfTE9XOwogCX0gZWxzZSBpZiAoc3RybmNtcCgiaGln
aCIsIGJ1Ziwgc3RybGVuKCJoaWdoIikpID09IDApIHsKQEAgLTM5NywxNyArMzkwLDIzIEBAIHN0
YXRpYyBzc2l6ZV90IGFtZGdwdV9zZXRfZHBtX2ZvcmNlZF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1
Y3QgZGV2aWNlICpkZXYsCiAJCWdvdG8gZmFpbDsKIAl9CiAKLSAgICAgICAgaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkgewotICAgICAgICAgICAgICAgIGlmIChhbWRnaW1faXNfaHdwZXJmKGFk
ZXYpICYmCi0gICAgICAgICAgICAgICAgICAgIGFkZXYtPnZpcnQub3BzLT5mb3JjZV9kcG1fbGV2
ZWwpIHsKLSAgICAgICAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJmFkZXYtPnBtLm11dGV4
KTsKLSAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPnZpcnQub3BzLT5mb3JjZV9kcG1fbGV2
ZWwoYWRldiwgbGV2ZWwpOwotICAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZh
ZGV2LT5wbS5tdXRleCk7Ci0gICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Ci0g
ICAgICAgICAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOworCS8qIGhhbmRsZSBzcmlvdiBjYXNlIGhlcmUgKi8KKwlpZiAoYW1kZ3B1X3NyaW92
X3ZmKGFkZXYpKSB7CisJCWlmIChhbWRnaW1faXNfaHdwZXJmKGFkZXYpICYmCisJCSAgICBhZGV2
LT52aXJ0Lm9wcy0+Zm9yY2VfZHBtX2xldmVsKSB7CisJCQltdXRleF9sb2NrKCZhZGV2LT5wbS5t
dXRleCk7CisJCQlhZGV2LT52aXJ0Lm9wcy0+Zm9yY2VfZHBtX2xldmVsKGFkZXYsIGxldmVsKTsK
KwkJCW11dGV4X3VubG9jaygmYWRldi0+cG0ubXV0ZXgpOworCQkJcmV0dXJuIGNvdW50OworCQl9
IGVsc2UgeworCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KLSAgICAgICAgfQorCX0KKworCWlmIChp
c19zdXBwb3J0X3N3X3NtdShhZGV2KSkKKwkJY3VycmVudF9sZXZlbCA9IHNtdV9nZXRfcGVyZm9y
bWFuY2VfbGV2ZWwoJmFkZXYtPnNtdSk7CisJZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1
bmNzLT5nZXRfcGVyZm9ybWFuY2VfbGV2ZWwpCisJCWN1cnJlbnRfbGV2ZWwgPSBhbWRncHVfZHBt
X2dldF9wZXJmb3JtYW5jZV9sZXZlbChhZGV2KTsKIAogCWlmIChjdXJyZW50X2xldmVsID09IGxl
dmVsKQogCQlyZXR1cm4gY291bnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKaW5kZXggMjY2NjE0ZTI3MzkyLi5hOTJkMTNiNTEzZGEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTEzOTgsNiArMTM5OCw3IEBAIGlu
dCBzbXVfYWRqdXN0X3Bvd2VyX3N0YXRlX2R5bmFtaWMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
CiAKIAlpZiAoIXNtdS0+cG1fZW5hYmxlZCkKIAkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoIXNr
aXBfZGlzcGxheV9zZXR0aW5ncykgewogCQlyZXQgPSBzbXVfZGlzcGxheV9jb25maWdfY2hhbmdl
ZChzbXUpOwogCQlpZiAocmV0KSB7CkBAIC0xNDA2LDggKzE0MDcsNiBAQCBpbnQgc211X2FkanVz
dF9wb3dlcl9zdGF0ZV9keW5hbWljKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQl9CiAJfQog
Ci0JaWYgKCFzbXUtPnBtX2VuYWJsZWQpCi0JCXJldHVybiAtRUlOVkFMOwogCXJldCA9IHNtdV9h
cHBseV9jbG9ja3NfYWRqdXN0X3J1bGVzKHNtdSk7CiAJaWYgKHJldCkgewogCQlwcl9lcnIoIkZh
aWxlZCB0byBhcHBseSBjbG9ja3MgYWRqdXN0IHJ1bGVzISIpOwpAQCAtMTQyNiw5ICsxNDI1LDE0
IEBAIGludCBzbXVfYWRqdXN0X3Bvd2VyX3N0YXRlX2R5bmFtaWMoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiAJCXJldCA9IHNtdV9hc2ljX3NldF9wZXJmb3JtYW5jZV9sZXZlbChzbXUsIGxldmVs
KTsKIAkJaWYgKHJldCkgewogCQkJcmV0ID0gc211X2RlZmF1bHRfc2V0X3BlcmZvcm1hbmNlX2xl
dmVsKHNtdSwgbGV2ZWwpOworCQkJaWYgKHJldCkgeworCQkJCXByX2VycigiRmFpbGVkIHRvIHNl
dCBwZXJmb3JtYW5jZSBsZXZlbCEiKTsKKwkJCQlyZXR1cm4gcmV0OworCQkJfQogCQl9Ci0JCWlm
ICghcmV0KQotCQkJc211X2RwbV9jdHgtPmRwbV9sZXZlbCA9IGxldmVsOworCisJCS8qIHVwZGF0
ZSB0aGUgc2F2ZWQgY29weSAqLworCQlzbXVfZHBtX2N0eC0+ZHBtX2xldmVsID0gbGV2ZWw7CiAJ
fQogCiAJaWYgKHNtdV9kcG1fY3R4LT5kcG1fbGV2ZWwgIT0gQU1EX0RQTV9GT1JDRURfTEVWRUxf
TUFOVUFMKSB7CkBAIC0xNDg3LDI4ICsxNDkxLDE4IEBAIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2
ZWwgc211X2dldF9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAog
aW50IHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
ZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCkKIHsKLQlpbnQgcmV0ID0gMDsKLQlpbnQg
aTsKIAlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBtX2N0eCA9ICYoc211LT5zbXVfZHBt
KTsKKwlpbnQgcmV0ID0gMDsKIAogCWlmICghc211X2RwbV9jdHgtPmRwbV9jb250ZXh0KQogCQly
ZXR1cm4gLUVJTlZBTDsKIAotCWZvciAoaSA9IDA7IGkgPCBzbXUtPmFkZXYtPm51bV9pcF9ibG9j
a3M7IGkrKykgewotCQlpZiAoc211LT5hZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9
PSBBTURfSVBfQkxPQ0tfVFlQRV9TTUMpCi0JCQlicmVhazsKLQl9Ci0KLQotCXNtdS0+YWRldi0+
aXBfYmxvY2tzW2ldLnZlcnNpb24tPmZ1bmNzLT5lbmFibGVfdW1kX3BzdGF0ZShzbXUsICZsZXZl
bCk7Ci0JcmV0ID0gc211X2hhbmRsZV90YXNrKHNtdSwgbGV2ZWwsCi0JCQkgICAgICBBTURfUFBf
VEFTS19SRUFESlVTVF9QT1dFUl9TVEFURSk7CisJcmV0ID0gc211X2VuYWJsZV91bWRfcHN0YXRl
KHNtdSwgJmxldmVsKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JbXV0ZXhfbG9jaygm
c211LT5tdXRleCk7Ci0Jc211X2RwbV9jdHgtPmRwbV9sZXZlbCA9IGxldmVsOwotCW11dGV4X3Vu
bG9jaygmc211LT5tdXRleCk7CisJcmV0ID0gc211X2hhbmRsZV90YXNrKHNtdSwgbGV2ZWwsCisJ
CQkgICAgICBBTURfUFBfVEFTS19SRUFESlVTVF9QT1dFUl9TVEFURSk7CiAKIAlyZXR1cm4gcmV0
OwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
