Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637C4D48B3
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599586ECA0;
	Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720081.outbound.protection.outlook.com [40.107.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A206EC99
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyTay+RHZk6Z0WoIjoesooVR90onvAdGKZLeati3zSX5aSXz8njcBBsKFjijwNbi9Ul+TDBOMGCcO/UK6D3MYZYnkBJLU3LCtN+P1DPt8ByP7eHQQYRJw6wJAAxmaVqEGCTZfWJBLosiFc3rk3wZUegAjXHUEX6sYxPcgc53zzvwqSUVzBXVXMD3csQBjyzt89R6koePorrET/X5GYwbsS2YvoxfXxG5wsBys5gVM1qEht0On73ukjZ5qDgGEjkCl0gFiGI29vy4VpqWbjdaIsnp82sTPHAe8NlLXzTbYT0TF1FVFyJzYync1ExFeqKsC1zFFnXIdsVOK9++kgcNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcIu417toHD4Zbn8IuUGzkxQtqg0pDPIxiJrEcQP4vQ=;
 b=VxdUcb/fT8Is0QHM89o2WP9HBqSe99mA86KrC3HpKpcHQQDIvN9G2vXnjVXIGWArs7qfuF/XrElReZChvk3Vrisp80MwOCa1fv6w8R6XggDsTEnjoO9MsRBb70ggErQoFdudQDa1tNrKp/cVeKczktW/ciJf15ocGyXgi0Ig9XGV3no8dw9K1HtgNJcNy+NY866gU8f3+eUT51oOe22ZRiw7oa/L8CEP8DTpi0Tmy8lp69LPTQNItFfPEv2/Z/XNw6P+I2kiQolsntyU7clJY1OGSmZXps7vSCVlYKdA3hNhSpXMf1HWb7ATAK71mwbaBPNA/HYiR1adQnXJBE6khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:52 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/29] drm/amd/display: update dcn21 hubbub registers
Date: Fri, 11 Oct 2019 15:53:12 -0400
Message-ID: <20191011195324.16268-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(428003)(199004)(189003)(26005)(316002)(6666004)(70586007)(8936002)(2906002)(446003)(126002)(70206006)(4326008)(6916009)(51416003)(186003)(48376002)(8676002)(336012)(486006)(50466002)(7696005)(356004)(16586007)(476003)(1076003)(81166006)(81156014)(426003)(2616005)(47776003)(86362001)(305945005)(36756003)(11346002)(5660300002)(76176011)(2351001)(50226002)(478600001)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3775; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986aa71b-0819-414d-817b-08d74e84bdb0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3775:
X-Microsoft-Antispam-PRVS: <MN2PR12MB377574A2A6DBAD95F8F2FD5BF9970@MN2PR12MB3775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4WsPzP+u7HFzLPPVXhgC3EF7XRndCiKUXV2bA1y1kJhljkVk9gQb2eBtaSZcAcnBAmIWBDdjgif6QiBy4pWIA02u8PKbfWAJ4nesxllVppRzevMQoFHLCLXtTZQ852xVyiD9h0ZUJfRpdc8+pokRgRwq4h5YyBS9xNlrGEbFGLVKPrxasf5psCJXE2JAvZ5IBV8N9yn4R+0vldoOsqpO2X2YJ6g6WByfXYl8ly9vY82nlYfRFhyWN37+Bue0aEPOe2JPdZEMK2SXP1n8bZD8b4KmrnDJuHZINJFPLrApTtY1j35turFDtJ241wLdOdLC0341k+dEw/dWN9dswr+Yhb+w7yp2Ct1BoLvxQK/p7dIzmgOsVEjdPknlK1oWoXStFTSq8oshdPCy6MXcNREcMKffVYrnPnCgY2ELb8BkndU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:51.9747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 986aa71b-0819-414d-817b-08d74e84bdb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3775
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcIu417toHD4Zbn8IuUGzkxQtqg0pDPIxiJrEcQP4vQ=;
 b=VaIoAg0U4Nsv/W1hcZxb+GvxLVclHIL7ubkTxCWoRY0i2QQz21d514EgCm60JHX8jUoDiov1FP+pJbGifBBUSDN2NNLsBL/qCO0tteBCb+SurWgCzkw7JWH8H8QM7LFsjEVOuH7IyqDflkaJ+7299kG+IaCxmX4FNsWbK1Iu1/A=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dXNlIGRjbjIwIGNvbW1vbiByZWdzIGRlZmluZSB0byBzaGFyZSBzb21lIHJlZ3Mgd2l0aCBkY24y
MAoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfaHViYnVi
LmggfCAxNyArKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5oCmluZGV4IDY5OGM0NzBjYzBmNi4uYzQ4NDBkZmIxZmE1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
aHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIx
X2h1YmJ1Yi5oCkBAIC0zNiw2ICszNiwxMCBAQAogCVNSKERDSFVCQlVCX0FSQl9GUkFDX1VSR19C
V19GTElQX0IpLFwKIAlTUihEQ0hVQkJVQl9BUkJfRlJBQ19VUkdfQldfRkxJUF9DKSxcCiAJU1Io
RENIVUJCVUJfQVJCX0ZSQUNfVVJHX0JXX0ZMSVBfRCksXAorCVNSKERDSFVCQlVCX0FSQl9SRUZD
WUNfUEVSX1RSSVBfVE9fTUVNT1JZX0EpLFwKKwlTUihEQ0hVQkJVQl9BUkJfUkVGQ1lDX1BFUl9U
UklQX1RPX01FTU9SWV9CKSxcCisJU1IoRENIVUJCVUJfQVJCX1JFRkNZQ19QRVJfVFJJUF9UT19N
RU1PUllfQyksXAorCVNSKERDSFVCQlVCX0FSQl9SRUZDWUNfUEVSX1RSSVBfVE9fTUVNT1JZX0Qp
LFwKIAlTUihEQ0hVQkJVQl9BUkJfSE9TVFZNX0NOVEwpLCBcCiAJU1IoRENIVk1fQ1RSTDApLCBc
CiAJU1IoRENIVk1fTUVNX0NUUkwpLCBcCkBAIC00NCwxNiArNDgsOSBAQAogCVNSKERDSFZNX1JJ
T01NVV9TVEFUMCkKIAogI2RlZmluZSBIVUJCVUJfUkVHX0xJU1RfRENOMjEoKVwKLQlIVUJCVUJf
UkVHX0xJU1RfRENOX0NPTU1PTigpLCBcCisJSFVCQlVCX1JFR19MSVNUX0RDTjIwX0NPTU1PTigp
LCBcCiAJSFVCQlVCX1NSX1dBVEVSTUFSS19SRUdfTElTVCgpLCBcCi0JSFVCQlVCX0hWTV9SRUdf
TElTVCgpLCBcCi0JU1IoRENIVUJCVUJfQ1JDX0NUUkwpLCBcCi0JU1IoRENOX1ZNX0ZCX0xPQ0FU
SU9OX0JBU0UpLFwKLQlTUihEQ05fVk1fRkJfTE9DQVRJT05fVE9QKSxcCi0JU1IoRENOX1ZNX0ZC
X09GRlNFVCksXAotCVNSKERDTl9WTV9BR1BfQk9UKSxcCi0JU1IoRENOX1ZNX0FHUF9UT1ApLFwK
LQlTUihEQ05fVk1fQUdQX0JBU0UpCisJSFVCQlVCX0hWTV9SRUdfTElTVCgpCiAKICNkZWZpbmUg
SFVCQlVCX01BU0tfU0hfTElTVF9IVk0obWFza19zaCkgXAogCUhVQkJVQl9TRihEQ0hVQkJVQl9B
UkJfREZfUkVRX09VVFNUQU5ELCBEQ0hVQkJVQl9BUkJfTUlOX1JFUV9PVVRTVEFORF9DT01NSVRf
VEhSRVNIT0xELCBtYXNrX3NoKSwgXApAQCAtMTAyLDcgKzk5LDcgQEAKIAlIVUJCVUJfU0YoRENI
VUJCVUJfQVJCX1JFRkNZQ19QRVJfVFJJUF9UT19NRU1PUllfRCwgRENIVUJCVUJfQVJCX1JFRkNZ
Q19QRVJfVFJJUF9UT19NRU1PUllfRCwgbWFza19zaCkKIAogI2RlZmluZSBIVUJCVUJfTUFTS19T
SF9MSVNUX0RDTjIxKG1hc2tfc2gpXAotCUhVQkJVQl9NQVNLX1NIX0xJU1RfSFZNKG1hc2tfc2gp
LFwKKwlIVUJCVUJfTUFTS19TSF9MSVNUX0hWTShtYXNrX3NoKSwgXAogCUhVQkJVQl9NQVNLX1NI
X0xJU1RfRENOX0NPTU1PTihtYXNrX3NoKSwgXAogCUhVQkJVQl9NQVNLX1NIX0xJU1RfU1RVVFRF
UihtYXNrX3NoKSwgXAogCUhVQkJVQl9TRihEQ0hVQkJVQl9HTE9CQUxfVElNRVJfQ05UTCwgRENI
VUJCVUJfR0xPQkFMX1RJTUVSX1JFRkRJViwgbWFza19zaCksIFwKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
