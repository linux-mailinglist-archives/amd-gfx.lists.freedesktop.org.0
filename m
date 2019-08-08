Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81F85F71
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EA46E812;
	Thu,  8 Aug 2019 10:22:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F6A6E818
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZAJXT/nCpnsIIABUPVHMJcjTUpWWbZeIpvm17gUlcsip90X12YV7cBrXYAC+fOLuGcxqmCd5dyeBd3dDsfrU9p1lpFsg4/nbJJ72lj6D5+ghqUukrVHZr9H18qWwHu8ZFi2OIhVBWe0pG2QGH4+kRRDMFN02jie6giZ73+yBqfdnMRx9E9HZ2K4l8gyk0z3LgLqYtlOF/tRbJKZ6+zz7MpmJQv4lzWBThnbtIE5X2An8CdoBg26PhY/uJB/vaiRuszSbQNgdnEWXhrbEqi6O94vk3YHnu7wHVLSAlN0mpWt/hKFJkI7/utAf40UuiChwEbFc/SHw+VwCbWJomTgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrN+nhkvyRMJsY4FltCOQg7LORZxP/2Hm2B5G7300TM=;
 b=f8LC0R/QNsvuN3po23QjZ9d9+URqjxulPhmsA4A0b+JPPhG4QjKfrfYk9n4BqvRmeYeKLLk7jGXqEecs/qT4A+HQgpJjx11idhDnA6BDdxkVNVHelbuicqD7yZh/7c1F4zmU2wqrWmeP8Vlb11dVBkHupiABRWeLfG4doG8EA5fhqFdJlirYFZgw9OZYMMTsQe2Spw+dmT9D7vX1th78bH8w+hCbJKWCYOojnJxNfkulJZY2xKh3Fw3ua5aVLntuFAWfgSueCJ6hjO/1Lq8RQPeiIo6iaLCEPJBRAt25LLMWb3OXVUV/1VPPsuBO1SaQ47TRxD7OHwm5bqek4lySiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0104.namprd12.prod.outlook.com (2603:10b6:0:55::24) by
 BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.19; Thu, 8 Aug 2019 10:22:10 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0104.outlook.office365.com
 (2603:10b6:0:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:22:09 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:22:08 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/9] drm/amdgpu: add sdma clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:53 +0800
Message-ID: <1565259714-30357-6-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(2906002)(70586007)(70206006)(36756003)(5660300002)(426003)(2351001)(11346002)(126002)(2616005)(476003)(446003)(14444005)(4744005)(356004)(6666004)(50226002)(6916009)(53936002)(49486002)(47776003)(4326008)(48376002)(81166006)(81156014)(8936002)(86362001)(305945005)(26005)(336012)(16586007)(316002)(44832011)(478600001)(486006)(50466002)(51416003)(76176011)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e530a814-03cb-4ae3-9dfe-08d71bea45a2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27107A644BFC3CD787A2646EF6D70@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KEFVeczhe9kMgGr1WRXyt3O6cKSabRwdh3KcZhKD7XCZb3d5Gbmh8kx+74cUM3QPE4QV+2TdNU6yHfg/HngCL0iDWHs+LFsfj7kv20UBggx+FT2e7O2tEQ24rfmNUFX/PYH5n4Qizu5GA4IwroxgtSpaz7Od4Yz6Mt7bXyM1lRE2Nr+COOyQ5qeN6IRVuNZWqmJW/vcndUwiLQmZ4MJjuQkimVr1g21UR8ewu4fKLitmI5ETmj4UvM+U2Pjycku3rdf2NjLsKGRacr6xPJRkX6Nd+MhYHhoxMs1F3PtpMCA0iM2Q249J3zb74y/mr+cqBLU4vYIUBlHvXdNJyZyALKzlSEtUdQccj8XKxS20Sj9xbflQWduJPaEeMyT79xBXNMpRiYAIFWkv5YDp7ZbfoTXKfw95KuWZ9EoTg3uWT9Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:22:09.8735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e530a814-03cb-4ae3-9dfe-08d71bea45a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrN+nhkvyRMJsY4FltCOQg7LORZxP/2Hm2B5G7300TM=;
 b=FQmV20M48K4p9vCbpDfg8/E3ePOV6N2YqwKA2iSribpGVFPMWFpFK8prFViRpox4Rm0v9oD3H4619cHBZtlFVT4+nDQjYDUu8HXLvkWsp8tX4/40XK2K5wbzIvgoigzrmJuvJ/oBF1NmwsS8sxo2GicGOF+kTDVNKMoxPbW2wNM=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIEFSQ1RVUlVTIGNhc2UgaW4gc2RtYSBzZXQgY2xvY2tnYXRpbmcgZnVuY3Rpb24KCkNoYW5n
ZS1JZDogSTY1YTNkOTlhMTQwYThhNzY5NDliNGQwM2MyMGJjNmUwMTk1Yzk4NTQKU2lnbmVkLW9m
Zi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NF8wLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggOWUzYzYzYy4uMTg1ZGZmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTIxNTcsNiArMjE1Nyw3
IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lkICpoYW5k
bGUsCiAJY2FzZSBDSElQX1ZFR0ExMjoKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9S
QVZFTjoKKwljYXNlIENISVBfQVJDVFVSVVM6CiAJCXNkbWFfdjRfMF91cGRhdGVfbWVkaXVtX2dy
YWluX2Nsb2NrX2dhdGluZyhhZGV2LAogCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFID8g
dHJ1ZSA6IGZhbHNlKTsKIAkJc2RtYV92NF8wX3VwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xl
ZXAoYWRldiwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
