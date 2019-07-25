Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5907435B
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 04:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5A6E4E8;
	Thu, 25 Jul 2019 02:39:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43D6E4E8
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 02:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOBHz3nfj3KiL281nOnC9C6gvinVE4A3fUP/KfjFyE3ELk9Qkjzmc2wJHYy+akAKbZkgl4tQy0xSnZ89VYDvl/X5x5RPpX3iouOoTXHA8jcrBIeEseyW8rZilBJoJkZrPU6lwaDGMuVoCQfE3HNIXLU8YRecK5CjwlNbhyjttuEeLeJA6wW/Ba4y+3ngH6casywUu/zlUq/Li5MYso7z74lsAqOv/pDl6cd03dn6/54unRZmbORHdnYpXb40jpic0sTUF/GYBaZ3Mtln7goC+aXEgEBkSCIGBK5ghvCi9PFN9yVIMjtCl8xyyWRK88JfWvIifb3iqLJlumEvvgs08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRJl23CIFpDVLWyOLevS6a+2E+5ITq4dCjmwOwMBe+Y=;
 b=YtyTHOfojwPeJ9tf/rqRtq8PV7LBS2WsS29l5Fqq2MdQBJXWX1ijgP3Xx+J0wdve6Q4L+B9psn8S1vXS+zm0Uit6slmQ6ajtt1HM4h8FkvHtpf9sBokxqAIfqnE1DMwztNGe7seXmHGSEoMumssU32wz6gMKcEHbMLalAtk6olQo+8smPMyq182nTm6xzuCTxZwNCaqziFUg43zu9JrssM1GC6KUDI9kMm5jGCdQBBzPW4ZTVjARKLuNC8aW4h1+Iao1IJK8IlA4r9B7jHIoZejB4Qr5KAf5nX2Zkgbq90jKYqqEv1TPJBciybLbtkv1VtxElLaqVoKEW004gBdOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0086.namprd12.prod.outlook.com (2603:10b6:0:57::30) by
 MWHPR12MB1312.namprd12.prod.outlook.com (2603:10b6:300:11::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 02:39:44 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0086.outlook.office365.com
 (2603:10b6:0:57::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Thu, 25 Jul 2019 02:39:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 02:39:43 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 24 Jul 2019
 21:39:42 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Date: Thu, 25 Jul 2019 10:39:29 +0800
Message-ID: <20190725023930.22521-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725023930.22521-1-evan.quan@amd.com>
References: <20190725023930.22521-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(76176011)(186003)(6666004)(36756003)(305945005)(50466002)(4326008)(81156014)(316002)(50226002)(26005)(81166006)(8936002)(356004)(486006)(426003)(446003)(11346002)(7696005)(2870700001)(2616005)(51416003)(336012)(126002)(48376002)(68736007)(2906002)(1076003)(44832011)(8676002)(47776003)(6916009)(53416004)(476003)(2351001)(478600001)(70586007)(70206006)(86362001)(5660300002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1312; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3957d6c-fdf3-41a3-921f-08d710a959eb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1312; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1312:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1312DC338F9C365222D0464AE4C10@MWHPR12MB1312.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WBgMsPlOb32WCkGI6+j4NG18Hfip1Zre5UORo9LFZ8xMe9HCSWH1mmXt1vr3KpNdlImHjqED5CSil9otFkY7dF9wH4D2pYrG7V63fS3ObTa/Lzi/xzQNye0c2tXcMVxLv3q9rnPGDEc1f/toELv0fLI5khVfEEzLoB9JSB3VqXvAH9rFX6dc8Ma7w9J7kJRKxuLH059qlRUt7dFhSeVGyLc11cM4QlOjSv9ncXTYrzJZEXbvj4hmv+/iy1mmDd6sDzEVF8TGxiYuz1YnTivdaKIyh2SleF/JVPfn115e/PqowFBbiVd0cLkzkzIbVTUVYjPXk4cp6t9ZTc/R0VgfjEbPV6YWAzwMqTvo0WwtgP8JjscwyJZChtQN6s+dc+LautreSajGdccwALc6a6EO/J1lrtJ6+5aZoQPtm4JcVC0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 02:39:43.8521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3957d6c-fdf3-41a3-921f-08d710a959eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1312
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRJl23CIFpDVLWyOLevS6a+2E+5ITq4dCjmwOwMBe+Y=;
 b=zD1/JEjWC717eMi5QNfEfoWwd/kjWBhbRaWR4Gt2Zf99iyC1ztTjKYNQNzhqMXwwaW3uYHh3k4hY0ld68hzA707EwxVgXLkZCy4IPcxeNEwXHrklb/bXpIRLirHv0ppajQYGFQWDzqFxXhnuadS9rAumVYyh6XKkgWPcryXScXM=
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

TW92ZSBTTVUgaXJxIGhhbmRsZXIgcmVnaXN0ZXIgdG8gc3dfaW5pdCBhcyB0aGF0J3MgdG90YWxs
eQpzb2Z0d2FyZSByZWxhdGVkLiBPdGhlcndpc2UsIGl0IHdpbGwgcHJldmVudCBTTVUgcmVzZXQg
d29ya2luZy4KCkNoYW5nZS1JZDogSWJkM2U0OGFlOWE5MGFiNTdmNDJiM2YyZGRiYjczNmRlZWVi
Yzg3MTUKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAxNiArKysrKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA2OTM1YTAw
Y2QzODkuLmE1MDc5YjkzY2FhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwpAQCAtNzQxLDYgKzc0MSwxMiBAQCBzdGF0aWMgaW50IHNtdV9zd19pbml0KHZv
aWQgKmhhbmRsZSkKIAkJcmV0dXJuIHJldDsKIAl9CiAKKwlyZXQgPSBzbXVfcmVnaXN0ZXJfaXJx
X2hhbmRsZXIoc211KTsKKwlpZiAocmV0KSB7CisJCXByX2VycigiRmFpbGVkIHRvIHJlZ2lzdGVy
IHNtYyBpcnEgaGFuZGxlciFcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwogCXJldHVybiAwOwog
fQogCkBAIC03NTAsNiArNzU2LDkgQEAgc3RhdGljIGludCBzbXVfc3dfZmluaSh2b2lkICpoYW5k
bGUpCiAJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OwogCWludCByZXQ7CiAK
KwlrZnJlZShzbXUtPmlycV9zb3VyY2UpOworCXNtdS0+aXJxX3NvdXJjZSA9IE5VTEw7CisKIAly
ZXQgPSBzbXVfc21jX3RhYmxlX3N3X2Zpbmkoc211KTsKIAlpZiAocmV0KSB7CiAJCXByX2Vycigi
RmFpbGVkIHRvIHN3IGZpbmkgc21jIHRhYmxlIVxuIik7CkBAIC0xMDYxLDEwICsxMDcwLDYgQEAg
c3RhdGljIGludCBzbXVfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJaWYgKHJldCkKIAkJZ290byBm
YWlsZWQ7CiAKLQlyZXQgPSBzbXVfcmVnaXN0ZXJfaXJxX2hhbmRsZXIoc211KTsKLQlpZiAocmV0
KQotCQlnb3RvIGZhaWxlZDsKLQogCWlmICghc211LT5wbV9lbmFibGVkKQogCQlhZGV2LT5wbS5k
cG1fZW5hYmxlZCA9IGZhbHNlOwogCWVsc2UKQEAgLTEwOTQsOSArMTA5OSw2IEBAIHN0YXRpYyBp
bnQgc211X2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogCWtmcmVlKHRhYmxlX2NvbnRleHQtPm92ZXJk
cml2ZV90YWJsZSk7CiAJdGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlID0gTlVMTDsKIAot
CWtmcmVlKHNtdS0+aXJxX3NvdXJjZSk7Ci0Jc211LT5pcnFfc291cmNlID0gTlVMTDsKLQogCXJl
dCA9IHNtdV9maW5pX2ZiX2FsbG9jYXRpb25zKHNtdSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJl
dDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
