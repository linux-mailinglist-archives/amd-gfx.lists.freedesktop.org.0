Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF11A237
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A18C6E797;
	Fri, 10 May 2019 17:20:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366916E794
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:27 +0000 (UTC)
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 10 May
 2019 17:20:25 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:25 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:15 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/16] drm/amd/display: Use VCP for extended colorimetry
Date: Fri, 10 May 2019 13:19:30 -0400
Message-ID: <20190510171935.19792-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(6666004)(356004)(1076003)(305945005)(47776003)(5660300002)(76176011)(8936002)(14444005)(68736007)(50226002)(53416004)(6916009)(36756003)(8676002)(2906002)(81166006)(81156014)(476003)(2616005)(486006)(126002)(446003)(426003)(53936002)(7696005)(16586007)(11346002)(316002)(70206006)(478600001)(4326008)(186003)(72206003)(77096007)(70586007)(26005)(51416003)(48376002)(336012)(50466002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0055; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc39bb6-8b53-436d-dc05-08d6d56bca5b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR1201MB0055; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB005518FDE561A5821F9BF5D3F90C0@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VhB0EvzVPp058ZHLSeYj7s0lGeutZMmfC7rT3O/j5DcPfaTIixxKUEFMuOhe5xnSmzmImaECx/KldIq9WD5mfuaIjjFe+VVgIBwXMdY3qxruozdgGlTAcnNtzzB5BAHadkc6ujd4xTINwCf37B7AYFnPmX+/YHzKSfw/PMGzEsn4DL/7Sj+x1JpqdiYs7zKflBWoX9ZZhyoQwuTZ1pU7aR5rO5gs0tarun8IHb/0pMcDSxBjmHY4d7iOr4qV7+ZE+YlZ34pTIte3CgtDM++8RJVOa2DxilGyYzFARWgYZMU7PC3RHFNf+ukRFpZ6cUNSrIf9mJdYUk4bZooLGldDfilm1ekT1ExhHEy6uP4OwNnD0nI/KxMGiVchKHD+i9uawLoCF1f8ByB+t4cfG7Lx4dajx82Dt8yPUCMCNkNOvx4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:25.0546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc39bb6-8b53-436d-dc05-08d6d56bca5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAqhtBrxpuyq0QkIWMWvOz7Sm57YB3VcVb/ESDCJcd4=;
 b=CM0eVb6Gl2Xri2rG/+7LD5XNTsm7tIjkDqT1dlK4Fjzwbrjtxa9VtekvE+sYlJmDQT9xQP9UaDNOF1orIe0jDUwSE2I5RI/YgWHv3U23Mm1iRnOklGxIMbRbKbrkeL4yF0xBBTBaz4eZ6YCMmctBSvAzxnzXU047JDdU21dGOJQ=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpEUFJYIHNob3VsZCBzZW5kIHRoZSBW
Q1AgZXh0ZW5kZWQgY29sb3JpbWV0cnkgcGFja2V0IGlmIHRoZQpzaW5rIHN1cHBvcnRzIERQQ0Qg
cmV2MS40IGFuZCByZXBvcnRzIHRoZSBleHRlbmRlZCBjb2xvcmltZXRyeQpiaXQuCgpTaWduZWQt
b2ZmLWJ5OiBBcmljIEN5ciA8YXJpYy5jeXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkg
S29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJo
YXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tl
dC5jCmluZGV4IGRiMDZmYWIyYWQ1Yy4uYmMxM2M1NTI3OTdmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9f
cGFja2V0LmMKQEAgLTYzLDcgKzYzLDkgQEAgdm9pZCBtb2RfYnVpbGRfdnNjX2luZm9wYWNrZXQo
Y29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAogCWlmIChzdHJlYW0tPnBzcl92
ZXJzaW9uICE9IDApCiAJCXZzY1BhY2tldFJldmlzaW9uID0gMjsKIAotCWlmIChzdHJlYW0tPnRp
bWluZy5waXhlbF9lbmNvZGluZyA9PSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQyMCkKKwkvKiBVcGRh
dGUgdG8gcmV2aXNpb24gNSBmb3IgZXh0ZW5kZWQgY29sb3JpbWV0cnkgc3VwcG9ydCBmb3IgRFBD
RCAxLjQrICovCisJaWYgKHN0cmVhbS0+bGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2LnJhdyA+PSAw
eDE0ICYmCisJCQlzdHJlYW0tPmxpbmstPmRwY2RfY2Fwcy5kcHJ4X2ZlYXR1cmUuYml0cy5WU0Nf
U0RQX0NPTE9SSU1FVFJZX1NVUFBPUlRFRCkKIAkJdnNjUGFja2V0UmV2aXNpb24gPSA1OwogCiAJ
LyogVlNDIHBhY2tldCBub3QgbmVlZGVkIGJhc2VkIG9uIHRoZSBmZWF0dXJlcwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
