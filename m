Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D71C7AC
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 13:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A7588584;
	Tue, 14 May 2019 11:19:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0C88584
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 11:19:35 +0000 (UTC)
Received: from MN2PR12CA0035.namprd12.prod.outlook.com (20.179.80.48) by
 DM6PR12MB2667.namprd12.prod.outlook.com (20.176.116.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 11:19:29 +0000
Received: from BY2NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by MN2PR12CA0035.outlook.office365.com
 (2603:10b6:208:a8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 14 May 2019 11:19:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT010.mail.protection.outlook.com (10.152.84.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 11:19:29 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 14 May 2019
 06:19:27 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: support uclk activity retrieve on sw
 smu routine
Date: Tue, 14 May 2019 19:19:21 +0800
Message-ID: <20190514111922.21780-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(305945005)(53416004)(50466002)(48376002)(7696005)(1076003)(316002)(77096007)(44832011)(186003)(2351001)(70586007)(6666004)(356004)(6916009)(26005)(70206006)(14444005)(86362001)(47776003)(51416003)(2870700001)(8936002)(126002)(68736007)(5660300002)(81166006)(8676002)(81156014)(426003)(50226002)(336012)(53936002)(4326008)(36756003)(72206003)(2616005)(478600001)(486006)(2906002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7523e026-085b-4386-136b-08d6d85e0817
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB2667; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2667CB74D5711F293FE60B45E4080@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: s7TbgevAIdGlqCU4VKwK0V8lwaRfDZskO/fNz5/3X9SIn6TIs/ZnSLagsNOLrAtVLsyw48HjJ/fK9lgEe2L5iMUh3Kzaj2mG5qvtZqHnMUlpsfUrq60mqWF0fN1z7lbxA24u/I3/pdX+PKFpEnRhPbID7YdVb8NdTnwiBXxDEXmPK1az8dHDllOBZ/sp05sJN8dumdb4x5sWwYrPMn46bBmWWrg6uaiq+CG8uKhKFYjNMQyV2WW4bQl97mzQVpsEZK9NZS0fUzpcdKhftioR6saMMrKs4j30/m2iMRoTxHT+HceuluVnaQgX2yFA0nq9xnGahuqI5aanl8CTIuHmLBRbvjQS/eB6azzxf4K64vqoIXNsURdFkBt7Npxy/ttSPDq22nh9nSUrYpNq2AbZNcIIRQFhkoNP/AOucOvAXeM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 11:19:29.2154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7523e026-085b-4386-136b-08d6d85e0817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rqp8MINLcdjOdygBCyNqj58BN80ASHmXggBFz8MeGI=;
 b=Xsl/0d8eJUp+pxL156yS8eWYM0OfNdlnPLH8juNlJN6wYka9eCUeqasgioVSPh7ECmEpaB6hHX5APMHa3wBYMo29EZfn7LiHuggVBZURm/cM4QRXEtpU5/KpBpPEVb82xKK6DJoKY8HwCcCGVdLYE1qBApYBK+H0YvHjknpFW6k=
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

U3VwcG9ydCByZWFsdGltZSB1Y2xrIGFjdGl2aXR5IHJlcG9ydC4KCkNoYW5nZS1JZDogSTg5Y2Y3
Yzk1MjMzMDYwZWUxMDZlOWZjZWYzYjhlNjcwN2NkNjA0NjYKU2lnbmVkLW9mZi1ieTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDE1ICsrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jCmluZGV4IDg3Y2NjYTA0NWYzNi4uNzM4YWUxZDJlZjE3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMTEyMyw2ICsxMTIzLDcgQEAg
c3RhdGljIGludCBzbXVfdjExXzBfZ2V0X21ldHJpY3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsCiB9CiAKIHN0YXRpYyBpbnQgc211X3YxMV8wX2dldF9jdXJyZW50X2FjdGl2aXR5X3Bl
cmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJCQkgIGVudW0gYW1kX3BwX3NlbnNv
cnMgc2Vuc29yLAogCQkJCQkJICB1aW50MzJfdCAqdmFsdWUpCiB7CiAJaW50IHJldCA9IDA7CkBA
IC0xMTM1LDcgKzExMzYsMTcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfZ2V0X2N1cnJlbnRfYWN0
aXZpdHlfcGVyY2VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCi0JKnZhbHVlID0gbWV0cmljcy5BdmVyYWdlR2Z4QWN0aXZpdHk7CisJc3dpdGNo
IChzZW5zb3IpIHsKKwljYXNlIEFNREdQVV9QUF9TRU5TT1JfR1BVX0xPQUQ6CisJCSp2YWx1ZSA9
IG1ldHJpY3MuQXZlcmFnZUdmeEFjdGl2aXR5OworCQlicmVhazsKKwljYXNlIEFNREdQVV9QUF9T
RU5TT1JfTUVNX0xPQUQ6CisJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVVjbGtBY3Rpdml0eTsK
KwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfZXJyKCJJbnZhbGlkIHNlbnNvciBmb3IgcmV0cmll
dmluZyBjbG9jayBhY3Rpdml0eVxuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KIAogCXJldHVy
biAwOwogfQpAQCAtMTIxMCw3ICsxMjIxLDkgQEAgc3RhdGljIGludCBzbXVfdjExXzBfcmVhZF9z
ZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaW50IHJldCA9IDA7CiAJc3dpdGNoIChz
ZW5zb3IpIHsKIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfR1BVX0xPQUQ6CisJY2FzZSBBTURHUFVf
UFBfU0VOU09SX01FTV9MT0FEOgogCQlyZXQgPSBzbXVfdjExXzBfZ2V0X2N1cnJlbnRfYWN0aXZp
dHlfcGVyY2VudChzbXUsCisJCQkJCQkJICAgICBzZW5zb3IsCiAJCQkJCQkJICAgICAodWludDMy
X3QgKilkYXRhKTsKIAkJKnNpemUgPSA0OwogCQlicmVhazsKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
