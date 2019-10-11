Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68724D48BB
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058E6EC9F;
	Fri, 11 Oct 2019 19:53:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539366EC96
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO1m/+3PTGO1b+hIorxkOI894xUOGV5Q3HCA2k63IY6GKBOtq5WNtLssIuE19ilO13MEasgMusqbHk9lB+0FD9mOYiD4l3IfX/aOw56Ps/lUO3mwS2XP8WNwQg4d3Pgd3PCJQ6AECL6npbj0q7OlCA1CdYHk2cjrA40dKiV9EB5EPIU8Kgj0E67IgIiPTKtD4mMdHTb1doYeOjKTkaLUckw7Fqq/eOk8mmfWf/py0avfD385xa16XcKbwCLEcUAICueqvQSjvxj0zww01BVP/8Wle/B4oJ2hOUoJ6Q62zWY0/kIubX53+MsN5KjtqCkFJmgCKhX2Vmsfw7e63or9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AJsBLAFCiO3DqUx8KIGpbKeyKildrPSEPWqqQYzAwI=;
 b=iByoFNxtS0r6je4FidyakZ5X+M6Ta7r1AYWSWngxQMA5cjdqGLE6OZYqY8mW0O+QMlpP4FXyrbaxjQF01Yi6s3miqLMXqwmy+ET0uYIEFn44E5T/pelYyCepjVP2ixozBSakjYAOo47n4Po6P+Y7e1GXwBUn2NP8YLvLARa5toRR7agiavuLwtVQMROAJNwTnihQ54ZJix6qQJ/F8ugOZqfBXC90XnuOuTW3dleqdtnhB48yPRX1h7jjkxMkNMFbzaRvyufpai6RdWUYCejAk3T5M//TpfeUfAlRR6GrXQ2XeuOe2DpU+dJ2OGAzyfXK0rSlKHjd9n65r33yU6UWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:405:4c::24) by BN8PR12MB3620.namprd12.prod.outlook.com
 (2603:10b6:408:49::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 19:53:50 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR1201CA0014.outlook.office365.com
 (2603:10b6:405:4c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/29] drm/amd/display: correct dcn21 NUM_VMID to 16
Date: Fri, 11 Oct 2019 15:53:10 -0400
Message-ID: <20191011195324.16268-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(428003)(199004)(189003)(50466002)(86362001)(305945005)(1076003)(5660300002)(53416004)(4744005)(446003)(11346002)(47776003)(126002)(426003)(486006)(356004)(6666004)(4326008)(2616005)(476003)(70586007)(478600001)(70206006)(14444005)(316002)(2906002)(2351001)(76176011)(7696005)(50226002)(16586007)(6916009)(26005)(51416003)(48376002)(186003)(336012)(8676002)(36756003)(81156014)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3620; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74c294c9-374f-46c9-efb4-08d74e84bcc4
X-MS-TrafficTypeDiagnostic: BN8PR12MB3620:
X-Microsoft-Antispam-PRVS: <BN8PR12MB362024AFBF0EE635A7116518F9970@BN8PR12MB3620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SFHAP1epToalPWJUFTIadbwY69qI1o9iXKJGG++qEjz/BWNARbxx9+Ny4k7k8bJLhQj99WW1nIvZqNQ0tkb0gGoxxaIqaOzyDbMeI2dGmFOsKlS1pLamUvbZ+rhscXhHGh2rK0JMRiP2ICd5GFyXj2bx51dmXGghV63tp084B0l2Tx2ENAwTgCVWo8aoNzMmjMHuEGYM6+RA5xU5zTmnci+1SC6cAEtF/9+oOSc9+yCfpoDr/MMTYPcOygeF3OmK8BklRZJsLQwKcvCCp3TiPlDAv43HFN9XRam0CFAKgtiYihYDxxHxDFc3frGWxCXDSQQFKCkdxYO3/FXvVSlWL4I5dg3BFTQytLxym7QvE1Pz1U4NtC8uZT9/OdzgEIP+QtraDkIxTkmpHCSkVRvfYlQL/+7oV1GFQLv+K0o2ng=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:50.4300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c294c9-374f-46c9-efb4-08d74e84bcc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3620
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AJsBLAFCiO3DqUx8KIGpbKeyKildrPSEPWqqQYzAwI=;
 b=R6jeNBKRksk8p5R1mrlEXZVx/l4ZphQ3rCgeW+uvnT8UoUCELbf51y04yzaI/J0FT9xNv2TWztNh8NiT51oa9kuTI7NM8sRoYrYdWRnOkhOy5n3sBllkcf725lhG46yRlhkv8rEDv1GVWc+PI6dzXcIqmGY29JH7zQLsFmMjE6g=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCjEg
dm1pZCBsaW1pdGF0aW9uIG9ubHkgZXhpc3RzIGZvciBIT1NUVk0gd2hpY2ggaXMgYSBjdXN0b20K
dXNlIGNhc2UgYW55d2F5LgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0
cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMS9kY24yMV9odWJidWIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMS9kY24yMV9odWJidWIuYwppbmRleCA0NGY2NGE4ZTMzZjEuLmFlYjVkZTZmNDUz
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIx
X2h1YmJ1Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9odWJidWIuYwpAQCAtNTIsNyArNTIsNyBAQAogI2lmZGVmIE5VTV9WTUlECiAjdW5kZWYgTlVN
X1ZNSUQKICNlbmRpZgotI2RlZmluZSBOVU1fVk1JRCAxCisjZGVmaW5lIE5VTV9WTUlEIDE2CiAK
IHN0YXRpYyB1aW50MzJfdCBjb252ZXJ0X2FuZF9jbGFtcCgKIAl1aW50MzJfdCB3bV9ucywKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
