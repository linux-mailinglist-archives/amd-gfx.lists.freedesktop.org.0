Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FF5FB7D
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6556F6E388;
	Thu,  4 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE896E37C
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:21 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by MWHPR12MB1856.namprd12.prod.outlook.com (2603:10b6:300:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Thu, 4 Jul
 2019 16:06:19 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:06:00 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/17] drm/amdgpu: add AMDGPU_HW_IP_VCN_JPEG_ENC to info query
Date: Thu, 4 Jul 2019 12:04:27 -0400
Message-ID: <20190704160429.14758-15-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(486006)(36756003)(16526019)(186003)(76176011)(53936002)(50466002)(2876002)(48376002)(6916009)(126002)(8936002)(476003)(356004)(6666004)(2906002)(478600001)(68736007)(2351001)(426003)(2616005)(11346002)(72206003)(446003)(53416004)(3846002)(6116002)(70206006)(1076003)(50226002)(5660300002)(7696005)(4326008)(51416003)(86362001)(16586007)(336012)(26005)(77096007)(8676002)(81166006)(81156014)(305945005)(70586007)(47776003)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1856; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6e29c23-f822-454f-04b3-08d700998cff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1856; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1856:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18567F3F4A71A098E2C0626C87FA0@MWHPR12MB1856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bzu5bjfbeROgfpiEGBsvmyrhF1aLivzH9izI/sPTqhwdqNtBXnOpcYGS/2LEb9gmhpF14up1DmRDPb6gsv/PlYRIht88rlN7bJkCXb6maV/bNa+rjpUAn8x2KREqQP5ePDaeHNfmSWI56Lurswlx0iRWQhbcUeGjGIFcYlNq2i6rPUtAxWa9plUWvFYJTxL9UliXWazdDvXE/WkPjQLDw0No++aK0k00rTMbqhj2QzNtO6jDP/xquuhErOqtHF0SL1C4v4Ms1mffzRdG4/zKJp9sQs1/JtJuqZT18F0W5NpoSzFdxPd5Isi4bN7nWnvHQmXs49B+a/+GJaY1N74pQaUK9InsDpcNvVsGP443PjxGDHwqS3pBkvYJkNMAzt46/8N8r5Q8/3K+aI/xOURvHfDlmK7caBiVNDzXYqTfOT0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:18.9872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e29c23-f822-454f-04b3-08d700998cff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf7G2PyCY+4UHwIYCHufLcGJ502YDxj44wDO5ZSoTt4=;
 b=QCod/gc6Ma74ynMz8vfnfibp3OoPPhg9NUWSoGq5D2RcX9cJZc5xCbssM5Q2pdbVIgNtig+PDPiAosbmYIyKJKdDA5mK2nOG3ptH7L2jug3t1gK9aaR/5m/QII/Ggc6knD1flS5VhnoJRKqFJlxMUWW3cFnecNvQHjqRxTTE4Lo=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBBTURHUFVfSFdf
SVBfVkNOX0pQRUdfRU5DIHR5cGUgdG8gaW5mbyBxdWVyeQoKU2lnbmVkLW9mZi1ieTogQm95dWFu
IFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCmluZGV4IDhjZWQ3ODQx
YzIzZi4uZjc2M2QyMDQ2OGYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jCkBAIC00MjQsNiArNDI0LDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2h3X2lwX2luZm8oc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCWliX3N0YXJ0X2FsaWdubWVudCA9IDE2OwogCQlp
Yl9zaXplX2FsaWdubWVudCA9IDE2OwogCQlicmVhazsKKwljYXNlIEFNREdQVV9IV19JUF9WQ05f
SlBFR19FTkM6CisJCXR5cGUgPSBBTURfSVBfQkxPQ0tfVFlQRV9WQ047CisJCWlmIChhZGV2LT52
Y24ucmluZ19qcGVnX2VuYy5zY2hlZC5yZWFkeSkKKwkJCSsrbnVtX3JpbmdzOworCQlpYl9zdGFy
dF9hbGlnbm1lbnQgPSAxNjsKKwkJaWJfc2l6ZV9hbGlnbm1lbnQgPSAxNjsKKwkJYnJlYWs7CiAJ
ZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQpAQCAtNTUyLDYgKzU1OSw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2luZm9faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwgc3RydWN0IGRybV9maWxlCiAJCWNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9ERUM6CiAJCWNhc2Ug
QU1ER1BVX0hXX0lQX1ZDTl9FTkM6CiAJCWNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9KUEVHOgorCQlj
YXNlIEFNREdQVV9IV19JUF9WQ05fSlBFR19FTkM6CiAJCQl0eXBlID0gQU1EX0lQX0JMT0NLX1RZ
UEVfVkNOOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
