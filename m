Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823B4DB727
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068DB6EA2B;
	Thu, 17 Oct 2019 19:15:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBF06EA2B
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4VzVC5wN05kUUtLjlqBtiXE4G4PBPekim6jeTjyCLmZouNNDk7bJu+SM/+NQNMBmHc8z1IN4LvwhQlnOL3ARc3Vc5Zb+h+c++V9z3q0OCrWH9smle2kHW5o/zY7on7x4/ivB/xX2MSwVqfimPSMjr2Lk9FiXWrq1mvwXu59fxg/6M4fUVMle7ipeZRQWC7qrgz8zhNz3Mj1UdMrIsJ41D+SzKNJ8rkvvokYEilhZmzCcX+gtlQ0gdMUYqouClLe+gpbcrjMJzdMfzxx/V9MBxOuxJMHRBE4p0doG3jB9jxRKHcoR2jr8tq4wVI6DUk5ivTM1Ikl9NGvddE/wpzsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRqS7hPpfxP9REuuELwDreopaFnYf645ovprZYoxKQI=;
 b=GpFnOlsqsJyoJNH0JslRwHzwSGhaOflRmiCYIkLZNo/YYvs/eVmOqx1NQB+9PiCnrlroE2nqJIusgyNLtJxRyBvOyL27JVPCcWiPjjPTyAXwSEKi7jHV8jcBMR7cnoS4QQLo7AP8nXl5p7cLlH5kd94ezEyj7Sq0E8WFeNz0ohcTd5tK3K9gjr8dzXD/a9XtBgL1EyD/Ju/KvVqos0grnU34/TY47ytAEA/u4/iupqzRL+O0mRaYX/OcBDfNMj1Sok+gON805FbSF7p3TFxZwn1Cx7rFnUvHwMf9m8hcLHzExNi06nXkdyqr8m66E9x9GX0HMfEjUDY+oW6i+AU8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 17 Oct
 2019 19:15:29 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:28 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:27 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:27 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/37] drm/amd/display: add 50us buffer as WA for pstate
 switch in active
Date: Thu, 17 Oct 2019 15:12:53 -0400
Message-ID: <20191017191329.11857-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(199004)(189003)(54906003)(50466002)(478600001)(2351001)(316002)(86362001)(70206006)(81166006)(50226002)(2870700001)(2876002)(2906002)(8936002)(81156014)(4326008)(305945005)(8676002)(14444005)(47776003)(2616005)(76176011)(26005)(356004)(6666004)(36756003)(5660300002)(426003)(1076003)(48376002)(6916009)(336012)(186003)(476003)(446003)(486006)(51416003)(70586007)(11346002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1815; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7792194-2aec-4a65-c98e-08d753365f48
X-MS-TrafficTypeDiagnostic: CY4PR12MB1815:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1815B0BC969BC1E93C83BE96826D0@CY4PR12MB1815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SibLL6u99dGJkcxY+pwskV4+YQxXAdQUqHPMY9xXzl5/80aEmwaeaZmwO6cD7eD7iiTehDoQ5L44IDtkFOmzHY80dSWPKb7HdDPj9b+yyTdKwYeqou5p6MjbIj0h7Rli+CafXl04gp2tRoG6HeoSsRUML0yN6bOYO1ukAauBjy9+tI38Vj1Gi+AiMuoM8ijgAgY3Q1unnE1wb+z+Y08P4sPSJoDKED+vxVDxXRvBxlCq5Z2H+KoPbVka1GWj1N7VVbo5T0emiBNvbbalp13UU9hM12qCIRgyBR1kzNw5Y22QdGSxdVLxQDQC+qIuPXrKxGpH+/FzmJlnddA6OlzLJ+/NjxFosupwvUqgkrYY2BdC/aG2AOgjdmTCNQWVGGrlhCr7/vGnOCMDKAStthJlaA76+7ppxcwtMyS90++9Ew=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:28.7278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7792194-2aec-4a65-c98e-08d753365f48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRqS7hPpfxP9REuuELwDreopaFnYf645ovprZYoxKQI=;
 b=f0VUFaRIqnd5WZtxAz5UCv6NhfmJCBpaOdqADQ7RENSxPiDsYXW8/P4yUp5LdelXXeecrhrFWLqvNs5cpDObM28ssUX3haObRERTsqqVGsk+xmNAMvoki7PLhXX5UveMhkI4+Zp3bpQJLeWEqlUBdtVUUIvJWddG6kdjIA695rw=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKU2lnbmVkLW9mZi1ieTogSnVuIExlaSA8
SnVuLkxlaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjAuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kaXNwbGF5X21v
ZGVfdmJhXzIwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rp
c3BsYXlfbW9kZV92YmFfMjAuYwppbmRleCA2NDk4ODM3NzdmNjIuLjZjNmM0ODZiNzc0YSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kaXNwbGF5
X21vZGVfdmJhXzIwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9k
Y24yMC9kaXNwbGF5X21vZGVfdmJhXzIwLmMKQEAgLTI1NzcsNyArMjU3Nyw4IEBAIHN0YXRpYyB2
b2lkIGRtbDIwX0RJU1BDTEtEUFBDTEtEQ0ZDTEtEZWVwU2xlZXBQcmVmZXRjaFBhcmFtZXRlcnNX
YXRlcm1hcmtzQW5kUGVyCiAJCQltb2RlX2xpYi0+dmJhLk1pbkFjdGl2ZURSQU1DbG9ja0NoYW5n
ZU1hcmdpbgogCQkJCQkrIG1vZGVfbGliLT52YmEuRFJBTUNsb2NrQ2hhbmdlTGF0ZW5jeTsKIAot
CWlmIChtb2RlX2xpYi0+dmJhLk1pbkFjdGl2ZURSQU1DbG9ja0NoYW5nZU1hcmdpbiA+IDApIHsK
KwlpZiAobW9kZV9saWItPnZiYS5NaW5BY3RpdmVEUkFNQ2xvY2tDaGFuZ2VNYXJnaW4gPiA1MCkg
eworCQltb2RlX2xpYi0+dmJhLkRSQU1DbG9ja0NoYW5nZVdhdGVybWFyayArPSAyNTsKIAkJbW9k
ZV9saWItPnZiYS5EUkFNQ2xvY2tDaGFuZ2VTdXBwb3J0WzBdWzBdID0gZG1fZHJhbV9jbG9ja19j
aGFuZ2VfdmFjdGl2ZTsKIAl9IGVsc2UgewogCQlpZiAobW9kZV9saWItPnZiYS5TeW5jaHJvbml6
ZWRWQmxhbmsgfHwgbW9kZV9saWItPnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lcyA9PSAxKSB7Ci0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
