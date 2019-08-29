Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0176A1B78
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 15:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08996E10F;
	Thu, 29 Aug 2019 13:31:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B26E116
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 13:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyJmyVMBRfZ3fKwOpa2fnfck/+QbcVKxW9iVUGlcExUCjD01crHUfksFvYu9dwQ/Zd9qlL98yYHjhppShqx3u1a/mo6kjQMePzrcJKk8bnMEJd9X/vd74qQLqEFma5ck7CEKwG+HvmRxMxKgQ2pQ3ee6p/ZroFgp6BaaeyKXGPAmJYAmsJ823lwaR+GMTvyaZDqDMwIgirEBSIkFYV5o4qKQDuI8oXQnzP5xtzDMxG8iVPHSDJ2/EI1I+8vZ0Y9I2EX7BnzJwLE5tCyBo3I7s3xHHn2Co2/InaZ7KNxoPrPRDzmgd/f/I7G+4NxZ56ReayYPZ17JEzNbHZ6t1DZ8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfNt3aY+B+VCayeYT7NFMS6jguB61wTLfugo9LiajIk=;
 b=BECkMRR2Cpoc+YgbVApz4jZNBBypEcCVFRW8iRh95N7jVxIFr25vfmG+19HI3inads0jSmgrqMQAdCptJpPG3lhIskyt0J5aqQam3mm4xHjw21PmtXx2uNviVt+zpc0vMPJr79fTNQL/VamBbXX4m8ldI9bN0QiyonyRszSMRWkTep/0RPmDK+fRtd+X8BYbI/tzBHPnjd7wgMQDh69iGqCMgnDAUhNKuXxACeRi2+cxnq4JNrxm3ht6PVIhx9F1z2FZLFG2c678diwrY758x+ZD/qNIt7THq9RCx22hkGQIlw9X/AVNCRrIGNlsdXQqor3vuhW7vAtOTs2KP+kY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Thu, 29 Aug
 2019 13:31:22 +0000
Received: from BY2NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Thu, 29 Aug 2019 13:31:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT011.mail.protection.outlook.com (10.152.84.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 13:31:21 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 29 Aug 2019 08:31:20 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Tao Zhou <tao.zhou1@amd.com>, Guchun Chen <guchun.chen@amd.com>
Subject: [PATCH 7/7] drm/amdgpu: switch to amdgpu_ras_late_init for nbio v7_4
 (v2)
Date: Thu, 29 Aug 2019 21:30:32 +0800
Message-ID: <1567085432-27452-7-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
References: <1567085432-27452-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(2906002)(36756003)(2616005)(476003)(8676002)(76176011)(48376002)(50466002)(8936002)(53936002)(110136005)(316002)(16586007)(81156014)(14444005)(6666004)(7696005)(50226002)(51416003)(356004)(4326008)(26005)(126002)(81166006)(5660300002)(70206006)(53416004)(186003)(70586007)(478600001)(336012)(6636002)(47776003)(446003)(426003)(486006)(305945005)(11346002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ace6bd2-5e13-4d8e-98be-08d72c852e8b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1272F175D5399BDFE194421DFCA20@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NxKVN0kUe8mId9mZ+B6diuW5UZyWnWxslIU1V/5Y1QrCRnNgU4hEmiYvp/jto5YAJL9Q2C4d9wtoGXefV5ptz5+YSlE1FfrC0yTBI3V2+zohBE30z7ErXSZNGSKoSBRNBs7UwU4nLENlykXL1cQ8LeSeyeVi0XlfQbG0Ha1qgofk9t3igxk+JP7T/z+jmNo1vqVi48js//oFJMWF/3wEk/dGZO5zpscCcA+jv4x1ovB45+/UnOqb8uJ3lytnKNG9sZevWiRQ8b7MCcSbY3optEU6tAzI+cWI+cb9S+O7l56F0Da1tQogP6WDv/ovF7on/T4QBXnJWJqwpPcapK7F5B3dWOGzaTwHvPai9t/F0jlde/TvIxkxydVi4ZbXTWUwHTtNDXxMXAPogGTccPam2RJkznLVEMxmLZKhkiWOJnA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 13:31:21.7816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ace6bd2-5e13-4d8e-98be-08d72c852e8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfNt3aY+B+VCayeYT7NFMS6jguB61wTLfugo9LiajIk=;
 b=ESXXTI8xsstw9keQWGxyGrn0XoIlicDHIPLY1QhddC2c1/9yhpWWFoleOiNr1QVAUQsMFi3RVcM+yIKU3J8bAIBUZ/wDHJF6SZjRy2W3HLUt6W8vg2SH4glxCHruOFXHOSq4LWPz8yKcSUbFIgO9v5EHr41Anc615q7EV1zM1bk=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2FsbCBoZWxwZXIgZnVuY3Rpb24gaW4gbGF0ZSBpbml0IHBoYXNlIHRvIGhhbmRsZSByYXMgaW5p
dApmb3IgbmJpbyBpcCBibG9jawoKdjI6IGluaXQgbG9jYWwgdmFyIHIgdG8gMCBpbiBjYXNlIHRo
ZSBmdW5jdGlvbiByZXR1cm4gZmFpbHVyZQpvbiBhc2ljcyB0aGF0IGRvbid0IGhhdmUgcmFzX2xh
dGVfaW5pdCBpbXBsZW1lbnRhdGlvbgoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGU3OTFhYzMu
LmM2ZmYyMjVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTEyMDgsMTEgKzEy
MDgsMTUgQEAgc3RhdGljIGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
CiBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogewogCXN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxl
OworCWludCByID0gMDsKIAogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCXhncHVfYWlf
bWFpbGJveF9nZXRfaXJxKGFkZXYpOwogCi0JcmV0dXJuIDA7CisJaWYgKGFkZXYtPm5iaW8uZnVu
Y3MtPnJhc19sYXRlX2luaXQpCisJCXIgPSBhZGV2LT5uYmlvLmZ1bmNzLT5yYXNfbGF0ZV9pbml0
KGFkZXYpOworCisJcmV0dXJuIHI7CiB9CiAKIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX3N3X2lu
aXQodm9pZCAqaGFuZGxlKQpAQCAtMTI4OSw2ICsxMjkzLDEzIEBAIHN0YXRpYyBpbnQgc29jMTVf
Y29tbW9uX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikp
CiAJCXhncHVfYWlfbWFpbGJveF9wdXRfaXJxKGFkZXYpOwogCisJaWYgKGFtZGdwdV9yYXNfaXNf
c3VwcG9ydGVkKGFkZXYsIGFkZXYtPm5iaW8ucmFzX2lmLT5ibG9jaykpIHsKKwkJaWYgKGFkZXYt
Pm5iaW8uZnVuY3MtPmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0KQorCQkJYW1kZ3B1X2ly
cV9wdXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2NvbnRyb2xsZXJfaXJxLCAwKTsKKwkJaWYgKGFk
ZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQpCisJCQlh
bWRncHVfaXJxX3B1dChhZGV2LCAmYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwg
MCk7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
