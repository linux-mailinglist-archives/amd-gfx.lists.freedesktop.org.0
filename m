Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A68C00B
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 19:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4642A6E219;
	Tue, 13 Aug 2019 17:59:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249F16E219
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 17:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA6dCsXJBSrgPixsBWiBCOq3sAa4o6GcrhtH34w20zqc6qfzM7c0jI2CjUuzlgdqpTHcTuRZXdXPqwGUAm5bpx9a+SncppISVUMaPMGHxb+l3j7HNM8eGD1U7N09IYEM+4tRy2UX4ob98FpB7cdv4V8YaxOQjh8SteAvvE9sa3EREivF9I/WR+a1kkcw4dveBn1WDRrLMFcx74IunxFWXmJUeQ0ILwe32qy6wn72vjVM81FEEvDISoCaeLDCKg3Hl/BN0/hwFBu9H8J26s5+BUpIV9Jkozlf3wW4iOmt30iUQxa+i9oKh0eLB9xcNzmgAGl6/b0PcU/nO3oTp7ciMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydZ5K/UZJdTG/YrUoBMYn6PgfCMEM1jSgfqHZXqNzps=;
 b=X+GifKHsfJ11FfEjKBYxhTt62zF7Rh4TOiiRr5GlHujijM2vUz8MQkyOZXI181Mq5ktUixND8mhOi0qlc3jj8hO/luQnwLwvAEFGb9K1o0jCJ7MWVW+achQyztPf95iEK8PiwTl9AoxfDqs2gJu2rrOXuSkJ/sdxrOHZRuoYTh66+Ns614sfcvzfgNmfSqnyRr5DaLNlYZLjh+ePofsAd3WKmCYdn6abVDkSDnOQ2ip9rKidXd7ZGz8YGPcz4Mwg42Powrg50pReZVatSdTtUo1Z/gNVdNhGk1fs0vzWH88Ngfa5XlpViPP4wWsdJCg2y5iG6U0NJirvwpQts5k0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0015.namprd12.prod.outlook.com (2603:10b6:4:1::25) by
 SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 17:59:22 +0000
Received: from BY2NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM5PR12CA0015.outlook.office365.com
 (2603:10b6:4:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20 via Frontend
 Transport; Tue, 13 Aug 2019 17:59:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT050.mail.protection.outlook.com (10.152.85.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Tue, 13 Aug 2019 17:59:21 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 13 Aug 2019 12:59:20 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: Start using amdgpu_ras_add_bad_pages
Date: Tue, 13 Aug 2019 13:59:11 -0400
Message-ID: <1565719151-26190-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565718642-18107-2-git-send-email-andrey.grodzovsky@amd.com>
References: <1565718642-18107-2-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(44832011)(2351001)(48376002)(6666004)(7696005)(51416003)(26005)(50466002)(356004)(486006)(126002)(476003)(2616005)(186003)(76176011)(53416004)(316002)(4326008)(53936002)(50226002)(16586007)(11346002)(81156014)(2906002)(81166006)(54906003)(8936002)(70586007)(86362001)(36756003)(478600001)(70206006)(5660300002)(426003)(446003)(336012)(47776003)(8676002)(6916009)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0358125d-b789-4a37-d2b8-08d72017f83f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27181722BCC3B904B9D7F323EAD20@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 01283822F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2bJi/jwap4Z3+O4yp45DosM77ufmvvFQg4SnavO9C/70Z8VGxs49bR4P9mKQrst2HQtBA3q90pf8CKXqHCx6YFuKWcPbfJeGljpel7zo6gCk6ZwCFT18C7wr7v2yz+8g+nhbkdfgjVab48qNH6ts8bjK1wxqo6BIgszmvuNgU1K59eIoukE6HjcYifXmA89z2jwIonKBnCwhk3+z33keaNEsvUro39OmuLpLRnNrRPK+/cLmeBwEfPmG9a1IbncM3XGv5xzAQC2V/amiLd5k7U8KhVwnZrAUPIjfeJ2bdXV0RM6ppSrGoCWn2vY5v44LXtZKLw88CJzzeB0U49PCB9eyUg0USEI93ZTXunuDROEpPd5SVuQPasfJR7DExqxsL7sOj/t5mead8/rbg+OnRwSLjDbVtmhfoqwLOOR5f0I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 17:59:21.5792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0358125d-b789-4a37-d2b8-08d72017f83f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydZ5K/UZJdTG/YrUoBMYn6PgfCMEM1jSgfqHZXqNzps=;
 b=d2E/LNdZ6epd6yvGzkTA1PfAbdClwD2zalpP3T/lWZBdub5Bm/otXG48TGkBiouWaYzVDDYJCEBEJ1Za3oR/28BKmLhK9JyUl5N5UM2OM8eFjXZ3MBWcxX9lcyAMgNWclyazPe1CILDDbJxGe3ZPfXFRbxv5mhI/Igf6pMd763A=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Xinhui.Pan@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6IFRyaWdnZXIgR1BVIHJlc2V0IGluIGNhc2Ugb2YgbmV3IGJhZCBhZGRyZXNzIGVycm9ycy4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAyNyArKysr
KysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4
IDI5NmUyZDkuLmY1ZjM2ZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpA
QCAtMjQzLDE3ICsyNDMsNDAgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRh
X2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlzdHJ1Y3QgcmFzX2Vycl9kYXRhICpl
cnJfZGF0YSwKIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpCiB7CisJdW5zaWduZWQg
bG9uZyBuZXdfZXJyX2FkZHJfY250LCBvbGRfZXJyX2FkZHJfY250OworCW5ld19lcnJfYWRkcl9j
bnQgPSAwOworCW9sZF9lcnJfYWRkcl9jbnQgPSBlcnJfZGF0YS0+ZXJyX2FkZHJfY250OworCiAJ
a2dkMmtmZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5rZmQuZGV2KTsKIAlpZiAoYWRldi0+dW1j
LmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCiAJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlf
cmFzX2Vycm9yX2NvdW50KGFkZXYsIGVycl9kYXRhKTsKIAkvKiB1bWMgcXVlcnlfcmFzX2Vycm9y
X2FkZHJlc3MgaXMgYWxzbyByZXNwb25zaWJsZSBmb3IgY2xlYXJpbmcKIAkgKiBlcnJvciBzdGF0
dXMKIAkgKi8KLQlpZiAoYWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcykK
KwlpZiAoYWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcykgeworCQl1bnNp
Z25lZCBsb25nICpicHM7CisJCWludCBpOworCiAJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFz
X2Vycm9yX2FkZHJlc3MoYWRldiwgZXJyX2RhdGEpOwogCisJCW5ld19lcnJfYWRkcl9jbnQgPSBl
cnJfZGF0YS0+ZXJyX2FkZHJfY250IC0gb2xkX2Vycl9hZGRyX2NudDsKKworCQlpZiAobmV3X2Vy
cl9hZGRyX2NudCkgeworCQkJYnBzID0ga2NhbGxvYyhuZXdfZXJyX2FkZHJfY250LCBzaXplb2Yo
KmJwcyksIEdGUF9LRVJORUwpOworCQkJaWYgKCFicHMpCisJCQkJcmV0dXJuIC1FTk9NRU07CisK
KwkJCWZvciAoaSA9IDA7IGkgPCBuZXdfZXJyX2FkZHJfY250OyBpKyspCisJCQkJYnBzW2ldID0g
ZXJyX2RhdGEtPmVycl9hZGRyW29sZF9lcnJfYWRkcl9jbnQgKyBpXSAgPj4gUEFHRV9TSElGVDsK
KworCQkJYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKGFkZXYsIGJwcywgbmV3X2Vycl9hZGRyX2Nu
dCk7CisKKwkJCWtmcmVlKGJwcyk7CisJCX0KKwl9CisKIAkvKiBvbmx5IHVuY29ycmVjdGFibGUg
ZXJyb3IgbmVlZHMgZ3B1IHJlc2V0ICovCi0JaWYgKGVycl9kYXRhLT51ZV9jb3VudCkKKwlpZiAo
ZXJyX2RhdGEtPnVlX2NvdW50IHx8IG5ld19lcnJfYWRkcl9jbnQpCiAJCWFtZGdwdV9yYXNfcmVz
ZXRfZ3B1KGFkZXYsIDApOwogCiAJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
