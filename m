Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11606C9082
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E636E191;
	Wed,  2 Oct 2019 18:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030C6E15A
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDmsx4bUUUnAdTH8wt1z3jQ3YkA4OBLkhocMe7Gqd6fMaVp9g3eAhmPiLoLffUy8kZclGfuUaW9ev1O5pbelhuAA927O4loclJ+zLQhvHUycEuCNHN9uWrqzP+gxIvsK4zPId+pmKTQrDxReBnp/sL6kV2E+zYEeoJCapTfbRTLiSM97lx57QDoJUvYyjtnDvMsYFPhutycW1A+pGT9EkhtfMNFI6iWt5v3gvmlYoOlvMpH/cmByZG6lH9TCrVlt85NcBVd+D/d6cTKk+BeCncl2eq6lZk0Jlxqb+lMdV3q4uNaWhOEfIIM5g1JBH4tuVydkBzzAJm8tP/K8bP1ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74PAmr2qQ/ZT5IY28BHWPGnuKKZVmbiBwr9mffcN0CE=;
 b=SBbQNXbIK5XzWMT139CSM4JAvKqSopDZeQdp97Sdvj7eChlKPZUrayjG/oCkxGaKhhyIemwXNX0pED63K2+UiJeenUEDC6DBO7tZMnwlql8Ou+MXxJQZQWVntFnhRsr/JLubXIDyAJ3vzX37ATZTDhTPuWMaKlo+4BWFc156v/s76mCFNBkWhJFFb5rk6EzIjeU/TTQwD9Chj3ogtmDXUBYzB/YewmARZy0BUG8yht9o61o1W2V9ZoJd42T4U0UBPhnKGibZhEReolU8pj0rz1Wn/e9gBdJAVZCjGE8oti4qONqdefKA88HP6tf0cGx6pZAWhCLnFoGVBwLICEFx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 BN8PR12MB3539.namprd12.prod.outlook.com (2603:10b6:408:9d::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 18:16:38 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:38 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:36 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/38] drm/amd/display: Add Logging for Gamma Related
 information
Date: Wed, 2 Oct 2019 14:15:59 -0400
Message-ID: <20191002181633.22805-5-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(428003)(189003)(199004)(336012)(8936002)(7696005)(36756003)(50466002)(47776003)(2616005)(316002)(26005)(126002)(2351001)(305945005)(53416004)(11346002)(478600001)(476003)(186003)(2906002)(446003)(76176011)(86362001)(8676002)(81166006)(48376002)(81156014)(16586007)(4326008)(6916009)(426003)(486006)(70206006)(50226002)(70586007)(6666004)(356004)(1076003)(5660300002)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3539; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48b02799-7a0f-45cd-6444-08d74764aab0
X-MS-TrafficTypeDiagnostic: BN8PR12MB3539:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3539FD1CFB1BF99B63541978F99C0@BN8PR12MB3539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHi+1dZUeqgPkZay5cQxwbQvZ3O/bNYwa1R1eBOHbSnj8yZSFkOB2kUUNnLZO/QnsYJGxxkDlwtR0CjIk2gizarINA7NbZlB13YUHb+SQQ3/ZPFFT1Og7hD2jYLo3SqKiORX0f3rnrO/4ED+fNmndipR2i2GyuWt/Ydd09RyI7XBaUaWIo636UwFG+kgrqzEG7bYo+NhRQ43+TaAbn+ybC9ULn1DxFg0S4MZghjSJr+JYwi9w0LNdAbiFnXSoGxCHYF3w1MGQFCvIqVYdgAMyNi5Gu3P5ibwRbJJ23qo5+hO8aDjtjkaTOQHO5SCRIbK5XyDaumxpYjwjMpuf1Wq05Rcn+wIlmPqEaeqAxCSSP4En+IS84IFBE0j3EuFe7dBCRJs1XeWNMa3omaFDOp0pLQt0s1nExTQpnijFNc3wHs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:38.0642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b02799-7a0f-45cd-6444-08d74764aab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3539
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74PAmr2qQ/ZT5IY28BHWPGnuKKZVmbiBwr9mffcN0CE=;
 b=G2+VMAZx8lbNGVrlWv2g5mTqlnds1QfX3dE+Bv4OEd5aI8rb7Zkyax36/1ILp9egjJ3rM2ESf8Nd1b2P2RoWsDmY1dSKzx40r4J1QX1RfJP8oJ07YJ6CY7de/QGKsIvMGvqGlTgj/+EIHQK+GEv+oHUhMYCN4BJSL+cqC3zuDU0=
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
Cc: Wyatt Wood <wyatt.wood@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV3lhdHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgoKW1doeV0KQSByZWNlbnQgYnVn
IHNob3dlZCB0aGF0IGxvZ2dpbmcgd291bGQgYmUgdXNlZnVsIGluIGRlYnVnZ2luZwp2YXJpb3Vz
IGdhbW1hIGlzc3Vlcy4KCltIb3ddCkZpeCBmb3JtYXR0aW5nIGZvciBlYXNpZXIgZ3JhcGhpbmcu
ClByZXZlbnQgcGVyZm9ybWFuY2UgaGl0IHdoZW4gZG9pbmcgZGlhZy4KCkNoYW5nZS1JZDogSTRm
MmEzYWZlZWNjNGE1MDE4MGFhYWE5NmY1NGEyM2ZmNGYwZWEwNGUKU2lnbmVkLW9mZi1ieTogV3lh
dHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMu
Q3lyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFr
aGFAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jICAgIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwppbmRleCBlODIxNDEzMWQ0
M2MuLjJmZTI5NTI2NTMyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwpAQCAtMTQ1MiwxNSArMTQ1Miwx
NSBAQCBzdGF0aWMgdm9pZCBsb2dfdGYoc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKIAlEQ19MT0df
QUxMX1RGX0NIQU5ORUxTKCJMb2dnaW5nIGFsbCBjaGFubmVscy4uLiIpOwogCiAJZm9yIChpID0g
MDsgaSA8IGh3X3BvaW50c19udW07IGkrKykgewotCQlEQ19MT0dfR0FNTUEoIlJcdCVkXHQlbGx1
XG4iLCBpLCB0Zi0+dGZfcHRzLnJlZFtpXS52YWx1ZSk7Ci0JCURDX0xPR19BTExfVEZfQ0hBTk5F
TFMoIkdcdCVkXHQlbGx1XG4iLCBpLCB0Zi0+dGZfcHRzLmdyZWVuW2ldLnZhbHVlKTsKLQkJRENf
TE9HX0FMTF9URl9DSEFOTkVMUygiQlx0JWRcdCVsbHVcbiIsIGksIHRmLT50Zl9wdHMuYmx1ZVtp
XS52YWx1ZSk7CisJCURDX0xPR19HQU1NQSgiUlx0JWRcdCVsbHUiLCBpLCB0Zi0+dGZfcHRzLnJl
ZFtpXS52YWx1ZSk7CisJCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkdcdCVkXHQlbGx1IiwgaSwg
dGYtPnRmX3B0cy5ncmVlbltpXS52YWx1ZSk7CisJCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkJc
dCVkXHQlbGx1IiwgaSwgdGYtPnRmX3B0cy5ibHVlW2ldLnZhbHVlKTsKIAl9CiAKIAlmb3IgKGkg
PSBod19wb2ludHNfbnVtOyBpIDwgTUFYX05VTV9IV19QT0lOVFM7IGkrKykgewotCQlEQ19MT0df
QUxMX0dBTU1BKCJSXHQlZFx0JWxsdVxuIiwgaSwgdGYtPnRmX3B0cy5yZWRbaV0udmFsdWUpOwot
CQlEQ19MT0dfQUxMX1RGX0NIQU5ORUxTKCJHXHQlZFx0JWxsdVxuIiwgaSwgdGYtPnRmX3B0cy5n
cmVlbltpXS52YWx1ZSk7Ci0JCURDX0xPR19BTExfVEZfQ0hBTk5FTFMoIkJcdCVkXHQlbGx1XG4i
LCBpLCB0Zi0+dGZfcHRzLmJsdWVbaV0udmFsdWUpOworCQlEQ19MT0dfQUxMX0dBTU1BKCJSXHQl
ZFx0JWxsdSIsIGksIHRmLT50Zl9wdHMucmVkW2ldLnZhbHVlKTsKKwkJRENfTE9HX0FMTF9URl9D
SEFOTkVMUygiR1x0JWRcdCVsbHUiLCBpLCB0Zi0+dGZfcHRzLmdyZWVuW2ldLnZhbHVlKTsKKwkJ
RENfTE9HX0FMTF9URl9DSEFOTkVMUygiQlx0JWRcdCVsbHUiLCBpLCB0Zi0+dGZfcHRzLmJsdWVb
aV0udmFsdWUpOwogCX0KIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
