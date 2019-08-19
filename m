Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D7926EF
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350326E160;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F706E15D
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5oyma8D56nn9qz3RCjA1AIZ/WN/JbwftoBYzobZhRYMo7VFkumwJC+s2moh/T9icsbl7TKgVbfqVu5R14msqrZB6vWeGrAHWVYuCcqf8M/AnZcaNfIWQt5YlKbo9t441RbLaXY78SVb88oKuKgzXVQbMqgRgWtm7JqFhWoSLvBzlIKSc/ip3xQNiHRtVD6z/IYMW69ymDZY32Iw+cV6ind8KkISfcBNvBZucKOlBXl/LHK9YoUELCm3/vFW/5gTqzTqXNbE23eQFTAve+hSMBCrfTceWnDgB5AQeXDQZFrqyUo9ZESBvQHzHVMlrBpdBwklUzlbyObg7TpYwIF4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jESkOkdFOt4Owj5+0g7YU/btkZNcZ8Prc1UJCh7fp+w=;
 b=f4qLMgDVfRHH74n0zewNFTJp87aVy5wT+51UZpW+ug/tZY2l1Upl+HXg59R/gNwB4Nky1nKuqF2wpzS8lnPsExETnFEncJyf3RjSn4wV2Nvc7IE2ZIX6MfW4zuOFaxYtcnNpPj3uzuRCLtQ00MHW5fIZxCbwIdjVJW0EkKIFBBbGF1FRN5ZMC/eoxJ6cdcYP8rfiZZK+PUlS+WckQJKSZMov7OTH6l2CUeGpx++U5uDmI4aaHQQHaMth8adlqq0gBZxlH3HePsT3aDldk5ZRLvOGj2zAusWgpXDGiEfZh/V/sXmHhtUpVhCVfy1N9w5AlNFGP4wZYY43H0vAwZIBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 14:35:54 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:53 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/36] drm/amd/display: support spdif
Date: Mon, 19 Aug 2019 10:34:56 -0400
Message-ID: <20190819143515.21653-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(428003)(189003)(199004)(36756003)(8676002)(70586007)(1076003)(8936002)(50226002)(426003)(76176011)(70206006)(336012)(51416003)(81166006)(7696005)(16586007)(2351001)(4326008)(5660300002)(47776003)(316002)(48376002)(26005)(50466002)(478600001)(356004)(6666004)(53416004)(476003)(53936002)(2906002)(6916009)(486006)(305945005)(126002)(86362001)(81156014)(11346002)(2616005)(186003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e167a3-cf95-4225-4eb5-08d724b28a20
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1275502F45B9D650E209CBBEF9A80@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4nzH9qcqEkxwJ4xts0dw2pT9SnF/x+fseLp2HQPtv/tDRhqwl234SI1KQyrlcsi3xLEUN3g1ihG5P9POIPLXSZH2KgAd7ZD0H0ie4VDgtHaN5ZPtQUsOgGrG72QrPWfA8cLxydmSCpVR+vIhN1Fs2E4k/eOw9skn7BShP1Wax8jqhUbQDPHjUvAGvwqFPiWht2yFg420Ptra0S/thtvPXbXUGy2WTwrjZetNdsB6yK24ZiJZsqTGTAo3syPG8x+Afmv2IR3YApbC1331uh/Pz85h14AFKF3g4zJ0+0ttW0XXbsryY69AHqquW7qIcCbQtHxYteGr5V8vL4PiKaO5SrVRUaL68UGm/zQHuTFJM6BtsUkZCLYljwOcWNQZ/M9wReXtn2w/hlUVfSqG2X+9dfOoV8IxF5R2BbYlQl1PC1U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:53.4825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e167a3-cf95-4225-4eb5-08d724b28a20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jESkOkdFOt4Owj5+0g7YU/btkZNcZ8Prc1UJCh7fp+w=;
 b=YuayqEXepuNyVmcISbqDuZIjCztLuCzEc/8picdZHG1jQTYAqwSIJGiHjvOwJMsvEvjY1EnvB3lyRLKm8LkPPystM6aPTxUTd4vzbQSJ2t8dy+ZZFsMXc30hjX5w9wSsk9a/o0KpOwue5R3NkiJL9bhLU3GUWVNq4NasyjcCTG8=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
cG9ydCBzcGRpZiBmaXggdG8gc3RhZ2luZzoKIHNwZGlmIGhhcmR3aXJlZCB0byBhZm10IGluc3Qg
MS4KIHNwZGlmIGZ1bmMgcG9pbnRlcgogc3BkaWYgcmVzb3VyY2UgYWxsb2NhdGlvbiAocmVzZXJ2
ZSBsYXN0IGF1ZGlvIGVuZHBvaW50IGZvciBzcGRpZiBvbmx5KQoKU2lnbmVkLW9mZi1ieTogQ2hh
cmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBMYWt0
eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVl
dCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgICB8IDE3ICsrKysrKysrLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jICB8ICA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5k
ZXggMTQ2NGY0YzYwMDg5Li45NTNiYTRkMDJhMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpAQCAtMjU5LDEyICsyNTksMTAgQEAg
Ym9vbCByZXNvdXJjZV9jb25zdHJ1Y3QoCiAJCQkJRENfRVJSKCJEQzogZmFpbGVkIHRvIGNyZWF0
ZSBhdWRpbyFcbiIpOwogCQkJCXJldHVybiBmYWxzZTsKIAkJCX0KLQogCQkJaWYgKCFhdWQtPmZ1
bmNzLT5lbmRwb2ludF92YWxpZChhdWQpKSB7CiAJCQkJYXVkLT5mdW5jcy0+ZGVzdHJveSgmYXVk
KTsKIAkJCQlicmVhazsKIAkJCX0KLQogCQkJcG9vbC0+YXVkaW9zW2ldID0gYXVkOwogCQkJcG9v
bC0+YXVkaW9fY291bnQrKzsKIAkJfQpAQCAtMTYxOCwyNCArMTYxNiwyNSBAQCBzdGF0aWMgc3Ry
dWN0IGF1ZGlvICpmaW5kX2ZpcnN0X2ZyZWVfYXVkaW8oCiAJCWNvbnN0IHN0cnVjdCByZXNvdXJj
ZV9wb29sICpwb29sLAogCQllbnVtIGVuZ2luZV9pZCBpZCkKIHsKLQlpbnQgaTsKLQlmb3IgKGkg
PSAwOyBpIDwgcG9vbC0+YXVkaW9fY291bnQ7IGkrKykgeworCWludCBpLCBhdmFpbGFibGVfYXVk
aW9fY291bnQ7CisKKwlhdmFpbGFibGVfYXVkaW9fY291bnQgPSBwb29sLT5hdWRpb19jb3VudDsK
KworCWZvciAoaSA9IDA7IGkgPCBhdmFpbGFibGVfYXVkaW9fY291bnQ7IGkrKykgewogCQlpZiAo
KHJlc19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVkW2ldID09IGZhbHNlKSAmJiAocmVzX2N0eC0+aXNf
c3RyZWFtX2VuY19hY3F1aXJlZFtpXSA9PSB0cnVlKSkgewogCQkJLyp3ZSBoYXZlIGVub3VnaCBh
dWRpbyBlbmRwb2ludCwgZmluZCB0aGUgbWF0Y2hpbmcgaW5zdCovCiAJCQlpZiAoaWQgIT0gaSkK
IAkJCQljb250aW51ZTsKLQogCQkJcmV0dXJuIHBvb2wtPmF1ZGlvc1tpXTsKIAkJfQogCX0KIAot
ICAgIC8qIHVzZSBlbmdpbmUgaWQgdG8gZmluZCBmcmVlIGF1ZGlvICovCi0JaWYgKChpZCA8IHBv
b2wtPmF1ZGlvX2NvdW50KSAmJiAocmVzX2N0eC0+aXNfYXVkaW9fYWNxdWlyZWRbaWRdID09IGZh
bHNlKSkgeworCS8qIHVzZSBlbmdpbmUgaWQgdG8gZmluZCBmcmVlIGF1ZGlvICovCisJaWYgKChp
ZCA8IGF2YWlsYWJsZV9hdWRpb19jb3VudCkgJiYgKHJlc19jdHgtPmlzX2F1ZGlvX2FjcXVpcmVk
W2lkXSA9PSBmYWxzZSkpIHsKIAkJcmV0dXJuIHBvb2wtPmF1ZGlvc1tpZF07CiAJfQotCiAJLypu
b3QgZm91bmQgdGhlIG1hdGNoaW5nIG9uZSwgZmlyc3QgY29tZSBmaXJzdCBzZXJ2ZSovCi0JZm9y
IChpID0gMDsgaSA8IHBvb2wtPmF1ZGlvX2NvdW50OyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwg
YXZhaWxhYmxlX2F1ZGlvX2NvdW50OyBpKyspIHsKIAkJaWYgKHJlc19jdHgtPmlzX2F1ZGlvX2Fj
cXVpcmVkW2ldID09IGZhbHNlKSB7CiAJCQlyZXR1cm4gcG9vbC0+YXVkaW9zW2ldOwogCQl9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYwppbmRleCBi
N2Q2M2NhMTI2ZGYuLmJkY2MzYzhhNmE5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXVkaW8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jCkBAIC02MTEsNiArNjExLDggQEAgdm9pZCBkY2VfYXVk
X2F6X2NvbmZpZ3VyZSgKIAogCUFaX1JFR19XUklURShBWkFMSUFfRjBfQ09ERUNfUElOX0NPTlRS
T0xfU0lOS19JTkZPMSwKIAkJdmFsdWUpOworCURDX0xPR19IV19BVURJTygiXG5cdEFVRElPOmF6
X2NvbmZpZ3VyZTogaW5kZXg6ICV1IGRhdGEsIDB4JXgsIGRpc3BsYXlOYW1lICVzOiBcbiIsCisJ
CWF1ZGlvLT5pbnN0LCB2YWx1ZSwgYXVkaW9faW5mby0+ZGlzcGxheV9uYW1lKTsKIAogCS8qCiAJ
KndyaXRlIHRoZSBwb3J0IElEOgpAQCAtOTIwLDcgKzkyMiw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYXVkaW9fZnVuY3MgZnVuY3MgPSB7CiAJLmF6X2NvbmZpZ3VyZSA9IGRjZV9hdWRfYXpfY29u
ZmlndXJlLAogCS5kZXN0cm95ID0gZGNlX2F1ZF9kZXN0cm95LAogfTsKLQogdm9pZCBkY2VfYXVk
X2Rlc3Ryb3koc3RydWN0IGF1ZGlvICoqYXVkaW8pCiB7CiAJc3RydWN0IGRjZV9hdWRpbyAqYXVk
ID0gRENFX0FVRCgqYXVkaW8pOwpAQCAtOTUxLDcgKzk1Miw2IEBAIHN0cnVjdCBhdWRpbyAqZGNl
X2F1ZGlvX2NyZWF0ZSgKIAlhdWRpby0+cmVncyA9IHJlZzsKIAlhdWRpby0+c2hpZnRzID0gc2hp
ZnRzOwogCWF1ZGlvLT5tYXNrcyA9IG1hc2tzOwotCiAJcmV0dXJuICZhdWRpby0+YmFzZTsKIH0K
IAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
