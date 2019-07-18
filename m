Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E06D1CE
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E476E42E;
	Thu, 18 Jul 2019 16:18:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9556E42E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI+d23TRU1WonDb/Hr+QpFfGL8GRdzfg3AwvGyBHDG4Heb8GLM1SL2me+a1QnFRkd2f7cOVnh5VRU9tO87x/fDi6f1Ry6xjPAKF1YIBJax0Xt/3OqmsdIYri/bpvcEh4Y4mNhvMFdb+2gkMwhX0SdVIZ99oVFpESeieQ0/v1NZvu+fKAk5ZHgvgOC0q9GvNJS0mDdcc3Ak5rgvDW8+F/cotyQ62Hif6t2dVhIn3AskIoTjWjXS73rPNg9AfgOzkYej5jXyW6VEGs/EBEB59OMrA6hwqYl9xA6OWR8+QK2oWha+Gvd360k65+g7dfZmWBmOzwgrciR58w/4lBdgANNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDK8kcReZPBUH1CCiB4umY173GpgJ4OPPZR9SI2S+bk=;
 b=Tb3q81bJ8fXVsgV2gSUVOa8lsii/MLOK/x4K0Lgpt+W6ZJBRPBBzGYS95e1ndp3tWhw43eN4eZscgGLXCWZMH64INkHzqMY3YArTwifWD5Pw6htimJjzmEL2ZSvNWKATi0Q9me6dC12FFwLXNoT0KU7q+XnkW2GeWFhQWz3TZK5hU5/mAI1N3Yuc9ZGB8/waqMiBdAKUtOm7rQ75Z4lI331KzLUR9jBYPmFJ4YmCcpHIkBvYZspZRJcnAR+h6xcvzNbeJepDKqA6WG0niNVgTaTki1ZvKJ+eToHM8kvNfLoJcdoLvZc5ljPwfaCto0OqpvuDPWgTYd2jrY97hXbC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:910:16::25) by DM5PR12MB1932.namprd12.prod.outlook.com
 (2603:10b6:3:10e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Thu, 18 Jul
 2019 16:18:07 +0000
Received: from DM3NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR1201CA0015.outlook.office365.com
 (2603:10b6:910:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 16:18:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT031.mail.protection.outlook.com (10.152.82.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 16:18:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 18 Jul 2019 11:18:05 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Remove undefined amdgpu_device_parse_faked_did
Date: Thu, 18 Jul 2019 12:17:56 -0400
Message-ID: <20190718161756.22875-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(2906002)(14444005)(478600001)(1076003)(86362001)(2876002)(336012)(66574012)(6916009)(50226002)(49486002)(23676004)(50466002)(186003)(2351001)(476003)(5660300002)(6666004)(26005)(2870700001)(2616005)(4326008)(426003)(54906003)(305945005)(316002)(47776003)(70206006)(70586007)(5820100001)(8936002)(36756003)(486006)(81166006)(68736007)(81156014)(356004)(126002)(53936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db0917bd-6ea2-4966-bf6a-08d70b9b83e8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1932; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1932AF6E4CC75F9740E7FE8A82C80@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iaCUV4LEcdzgTmosPd6eWs2LbqTCFD1aG9QiqX9kLpDwxTv6meptEaZy0GnWhMTPjDbg60uwd1+t9Ns87CwnGFawBX7YAMl3uTksPYvlPeNUQd5ZDyqATnzRDRdaUQT1cJtlFynZMV3cjAKsVtTYzAThqApqTcatcUiNXKS83hxCXDn/ThzyPxNnv8r5ZdrW/XowLlaBwuboE7/EQxWmPO1oe/QLC7yspAwq7pMLe1FULydK/p2KQVppr7+YmM81Mzi8xdBzaZU5uT+jaJ2rEGRwAbJlU4TLmDl19LYbW0qQr51FRfJOpx95TAmBqbW97Y5BrEI23246FExVKwzoSritDAxfif3aFh5Ogp86F23DCnB6vnbLewy1QuMzQ/sLMwFhjBRn5D8lwoYj8lFViGP4+qruwsr6opkOtJ73tQY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 16:18:05.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0917bd-6ea2-4966-bf6a-08d70b9b83e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDK8kcReZPBUH1CCiB4umY173GpgJ4OPPZR9SI2S+bk=;
 b=rjbtDkaq+dQJLLEZlGgtx16Xf6GFtEcYkHv7K4yl9HLf/+nK5e0CcO+5oR09C1yDVqsxHYwST9QAnaV4L6cNl6XOrzOluvoNi2OJowPdxAQFJMDqMsfmyo4+zCMZYiYJbgGy26xmcv09P7pahu+/mEOnEA0Nxt8rbVrdFouX16A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIGZvcndhcmQgZGVjbGFyZSB3
YXMgYWRkZWQgZm9yIG5vIGFwcGFyZW50IHJlYXNvbi4gUmVtb3ZlIGl0IHRvCnJlc29sdmUgdGhp
cyB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtLy9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYzox
MzE6MTM6IHdhcm5pbmc6IOKAmGFtZGdwdV9kZXZpY2VfcGFyc2VfZmFrZWRfZGlk4oCZIGRlY2xh
cmVkIOKAmHN0YXRpY+KAmSBidXQgbmV2ZXIgZGVmaW5lZCBbLVd1bnVzZWQtZnVuY3Rpb25dCiBz
dGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX3BhcnNlX2Zha2VkX2RpZChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldik7CgpDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KU2ln
bmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpp
bmRleCA3NjEwNmFkOGFjODQuLjQ0MjVmZjA2ZWNjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTI4LDcgKzEyOCw2IEBAIHN0YXRpYyBERVZJQ0Vf
QVRUUihwY2llX3JlcGxheV9jb3VudCwgU19JUlVHTywKIAkJYW1kZ3B1X2RldmljZV9nZXRfcGNp
ZV9yZXBsYXlfY291bnQsIE5VTEwpOwogCiBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX2dldF9w
Y2llX2luZm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotc3RhdGljIHZvaWQgYW1kZ3B1
X2RldmljZV9wYXJzZV9mYWtlZF9kaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCiAv
KioKICAqIGFtZGdwdV9kZXZpY2VfaXNfcHggLSBJcyB0aGUgZGV2aWNlIGlzIGEgZEdQVSB3aXRo
IEhHL1BYIHBvd2VyIGNvbnRyb2wKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
