Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8421FEBC
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 07:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A10892A8;
	Thu, 16 May 2019 05:11:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E0892A8
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 05:11:42 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 SN6PR12MB2669.namprd12.prod.outlook.com (2603:10b6:805:6f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 05:11:40 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 05:11:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 05:11:40 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 16 May 2019 00:11:39 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: skip fw pri bo alloc for SRIOV
Date: Thu, 16 May 2019 13:11:32 +0800
Message-ID: <1557983492-25237-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(478600001)(8676002)(81166006)(81156014)(50226002)(72206003)(426003)(6916009)(486006)(186003)(126002)(476003)(51416003)(8936002)(2906002)(26005)(77096007)(2351001)(2616005)(7696005)(54906003)(356004)(6666004)(336012)(36756003)(5660300002)(305945005)(53416004)(68736007)(48376002)(4326008)(50466002)(70586007)(16586007)(47776003)(70206006)(316002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2669; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d232f0ab-3df6-4380-f3ac-08d6d9bcfad8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN6PR12MB2669; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2669:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2669FE0EEED1602DB92679B2E50A0@SN6PR12MB2669.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8ayyCtfYV/DVWX7q82ScCuHNEUgw1HVCpDHMUSqS3BqcDNVXbAlOlWWYfg8FZCydeFPn8RRnsnMrZAVroVyCmnURvHaxF0EqUp0qWScn6mFmFsYexItx6Pswce+e+dQVL6BsIUBi/sHehFJ8enYcZt564HKDnJ1wBacV/4zurYeIfW4wfITpErzeSAI07YH0Eue4OkJBj9QPzUjk/bJJpfVBSA56Hj7FIk1xEuIhBqELnBLN7MoE0Oj28YJWp7YlVkk2UgCcG+eFYgDz0x9VLZfkZQhDDcg9NDxq26tzcBFGmrJn5jPK7rGFSdwughyiE+EUotIuuCe0nuTRu2kk9yUPYdbjLTqSUrw3F+tusAIWeO9o72j42g8QcFkvdJc4cxIzzi3KM/+OQrUs7XQE/U2aPU8Q5yDotwEj0OPawfo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 05:11:40.3874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d232f0ab-3df6-4380-f3ac-08d6d9bcfad8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2669
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rntBBOOOfy76udkoAV50YYChI0BGOaSctp1cXF3HrLk=;
 b=IyzSdsh9G2K6WH149FWs35JnTKnoWuqXfjOScnDLLurdtlIIc9JQyVYm835gM8YZgQ7MUitPrk9sC6iooe5ajELTeN6qY4JuEZAtirGHBhTf13M0ROhrhQKFvjlqVHtOYkzMBMvpQhFMZDxcF9/ZK03oNS0DXU+atrIqq9Pv4+4=
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
Cc: Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UFNQIGZ3IHByaW1hcnkgYnVmZmVyIGlzIG5vdCB1c2VkIHVuZGVyIFNSSU9WClRoZXJlZm9yZSwg
d2UgZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTog
WWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25r
LkxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YyB8IDIyICsrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYwppbmRleCBjNTY3YTU1Li5kM2M3N2QyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCkBAIC05MDUsMTMgKzkwNSwxNiBAQCBzdGF0aWMgaW50IHBzcF9sb2FkX2Z3
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmICghcHNwLT5jbWQpCiAJCXJldHVybiAt
RU5PTUVNOwogCi0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgUFNQXzFfTUVH
LCBQU1BfMV9NRUcsCi0JCQkJCUFNREdQVV9HRU1fRE9NQUlOX0dUVCwKLQkJCQkJJnBzcC0+Zndf
cHJpX2JvLAotCQkJCQkmcHNwLT5md19wcmlfbWNfYWRkciwKLQkJCQkJJnBzcC0+ZndfcHJpX2J1
Zik7Ci0JaWYgKHJldCkKLQkJZ290byBmYWlsZWQ7CisJLyogdGhpcyBmdyBwcmkgYm8gaXMgbm90
IHVzZWQgdW5kZXIgU1JJT1YgKi8KKwlpZiAoIWFtZGdwdV9zcmlvdl92Zihwc3AtPmFkZXYpKSB7
CisJCXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIFBTUF8xX01FRywgUFNQXzFf
TUVHLAorCQkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9HVFQsCisJCQkJCSAgICAgICZwc3At
PmZ3X3ByaV9ibywKKwkJCQkJICAgICAgJnBzcC0+ZndfcHJpX21jX2FkZHIsCisJCQkJCSAgICAg
ICZwc3AtPmZ3X3ByaV9idWYpOworCQlpZiAocmV0KQorCQkJZ290byBmYWlsZWQ7CisJfQogCiAJ
cmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgUFNQX0ZFTkNFX0JVRkZFUl9TSVpF
LCBQQUdFX1NJWkUsCiAJCQkJCUFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCkBAIC0xMDEyLDggKzEw
MTUsOSBAQCBzdGF0aWMgaW50IHBzcF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAlwc3BfcmluZ19k
ZXN0cm95KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOwogCiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVs
KCZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsICZwc3AtPnRtcl9idWYpOwotCWFtZGdw
dV9ib19mcmVlX2tlcm5lbCgmcHNwLT5md19wcmlfYm8sCi0JCQkgICAgICAmcHNwLT5md19wcmlf
bWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1Zik7CisJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocHNwLT5h
ZGV2KSkKKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZ3X3ByaV9ibywKKwkJCQkgICAg
ICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+ZndfcHJpX2J1Zik7CiAJYW1kZ3B1X2JvX2Zy
ZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywKIAkJCSAgICAgICZwc3AtPmZlbmNlX2J1Zl9t
Y19hZGRyLCAmcHNwLT5mZW5jZV9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmcHNwLT5h
c2Rfc2hhcmVkX2JvLCAmcHNwLT5hc2Rfc2hhcmVkX21jX2FkZHIsCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
