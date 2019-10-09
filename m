Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA5D1A90
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A976EA6E;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2056EA68
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvM5p4ad1czlvXyM94EIFHvAfTNaFMlwVqUHsCmsbrn//TZGxMiLQ5OBCxn55fW96Mh+UVzb4UMq3xyZG1/jyuXnkYM3wgxYSzBIbCZ3YteOwVS3fAgJxZj8k51yvsQq4eufrWKzBZU4RHs8K4DMlfHvfBjfmf3iV6L1Wx7nO7GBlp9HBS0yGRFCIMyIj6wuOb5lXJB4mMWHUYXR9xlzLbZr43DJ+MpF8p+Mv+feOsGhCoET/14iOZsMkVtGuGpyetOHf2JaGPgMkqiVxlYRDtjWEVC+1rZEOHMllZluqrIAZlmVZeXUfWEdYpD1XZF6B4v6CFSdS+y/OG3NooL0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaN6tij4Btj5jITwB1/ymvfCDGbJ9L+pD9cY5y91Pgk=;
 b=mFWwQmnUFVG7nxECESpreES8j09+oUtqrXZD0scDef/5Vj55UaXeZDHsVIN0qjztCvvRu0/3wbUZPgaEOar2v7EIWgEh+Zm0IJSQ79JhTV+8tOC0JdDdAhoiyTR2snGvflp5Sr8mX7DLnfJ54QR7ZaoIUSS3me0qQoFoBFz0gI8yX0M3cKuodVUHHjNbkuESl+x16t4uJibA3DhRd23bzodY7HP2maTykT67h0rVcN+paYGjwPBcJKtiBEIpCbQ3Om5PYGoFDCE4prVu2uBS25JpQ32Ztvu9+QzTP8k/I+lbKhiNE7w7NgfsS8xNshlPUPyk1KT5stqHE4psupS27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 21:06:28 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:27 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/26] drm/amd/display: change PP_SM defs to 8
Date: Wed, 9 Oct 2019 17:06:05 -0400
Message-ID: <20191009210613.17929-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(428003)(199004)(189003)(476003)(2351001)(356004)(336012)(36756003)(316002)(2616005)(6916009)(16586007)(50466002)(126002)(54906003)(486006)(8676002)(81156014)(81166006)(8936002)(50226002)(6666004)(426003)(305945005)(446003)(11346002)(86362001)(47776003)(478600001)(51416003)(186003)(26005)(1076003)(7696005)(76176011)(4744005)(53416004)(70206006)(4326008)(70586007)(48376002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3023; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c543aa17-77fe-4561-a656-08d74cfc8d54
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:
X-Microsoft-Antispam-PRVS: <MN2PR12MB30236AABF5E9654C261948BBF9950@MN2PR12MB3023.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6enWQ0EQGhxZm3oUxhKGsXprJXAJ5Zd1tE+z3sGgVllTDqJIzAwcYR8r/tYsuRYFg7Rf5gq13TdKAR99lE9pQIg6IORpSOk8EiDkOcWFcw3r2xI6iMIEswmuWTrmVV5G+L6UEGLUUzXLnr9D58A+YavpTzvjrUCzO+i9lVQKfc6Ougk3lPNMrxA5an8DM9eDQCmHtTD5jdCoiz5o41mYZrjRl/SoFM+7SDbdvstSdN4gSRNcp7Ken/BarMj6CfA+i1HS0+PzUCQrajBUgJ97vZpPz2a/23KJKpVGsvfOYtB1ZcazT2RMPLFwJlaRqvBmIrLuRnwedbRSRiIPn/EpkpoHxA1oE5w/vSepC8/BFiAOFKFdvfFjZK3mheDrzHS3iYSr26h3kRsmGjxAq80NaQvI5xPBojjxl1UQw1qQo0M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:28.1888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c543aa17-77fe-4561-a656-08d74cfc8d54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaN6tij4Btj5jITwB1/ymvfCDGbJ9L+pD9cY5y91Pgk=;
 b=fFsp9JhlY7h8+WH6cjT0H1aVDMKwlDI0ym9SiKf+G5DhEPEneYaap5j6bLYcKCdie6/Ve99HU7LBxNL+KOTNLcntsqcZ7IfZaYV5j7E1rmLKJeBnnD9irKUng5hK4phYbPHSoyHDVESSuGTioC9LoFd10k7MEIewKv+Gmxchq38=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RFBNIGxldmVsIGlzIDggdGhlc2Ugd2VyZSBpbmNvcnJlY3QgYmVmb3JlLiBGaXggdGhlbQoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oCmluZGV4IGMwM2E0NDFlZTYz
OC4uZGUzYzgzYzhmNmMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZG1fcHBfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3Bw
X3NtdS5oCkBAIC0yNTIsOSArMjUyLDkgQEAgc3RydWN0IHBwX3NtdV9mdW5jc19udiB7CiAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCiAKICNkZWZpbmUgUFBfU01VX05VTV9T
T0NDTEtfRFBNX0xFVkVMUyAgOAotI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19EUE1fTEVWRUxT
ICA0Ci0jZGVmaW5lIFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDQKLSNkZWZpbmUgUFBf
U01VX05VTV9NRU1DTEtfRFBNX0xFVkVMUyAgNAorI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19E
UE1fTEVWRUxTICA4CisjZGVmaW5lIFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDgKKyNk
ZWZpbmUgUFBfU01VX05VTV9NRU1DTEtfRFBNX0xFVkVMUyAgOAogCiBzdHJ1Y3QgZHBtX2Nsb2Nr
IHsKICAgdWludDMyX3QgIEZyZXE7ICAgIC8vIEluIE1IegotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
