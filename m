Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B09C9084
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9826E1A5;
	Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680067.outbound.protection.outlook.com [40.107.68.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5E96E196
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGr/HGZ1mDAroXIMGmUNnhsZJF8g999tDq5TKyQIdqWXcG7IpZycLnDsEFHxj15otynx0sWa25jOw1vKLX/vp5tL0XBFsGeccgtkSs9SQo803e842QtYFrbw9TrmJaTbodT73TIhX/tmH4UaxsEKjGPB9lV2D5WIQkN5LdXK/Rr/+7lmtDoSiZHqkC2xl+z0rc7iTRQpvtsTBc9d3/cOTX7DleEx9Cq+9b07fY1ImyxV416kDbU8w5kA/XiWDQuN1W2V53hzVzZXXuRPlC/Y2kwtgn85sv5eRdCY8ogfU5ctjk0ebDbg8FrKUCYEK8sEw9oJ9sA7SPhpCniDsPWCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMh6YItmWo5h5H5LNjb4V3Ir4eomJDiLYz8soZXsZW8=;
 b=DSBA69hMuOBKkwceZLiff5y4muh+ULC1iKWvnu8miWwv9pwVCobLECkhfuttF6qKWLFZvwwGMuts6zXZVcEhP9w9uwmy7XrATX6aQlLbzOk7I68Y+mZCELPKcg4krRrC5h+wGz02mJWZYC+cJNHPnaXjKjpWqHo7oOPhVhw3x5+eapHXx1W/hYqHYnev6CblvqvjyfwGQaLv9oNHJY7SQZHFyoxykcd/ut5C9m3M+4K9WPlYZBYNwlJnfR3U8L8XuC+e3V42dC6F8jyOMPCZXJ2Id9k7sSCNEJiBfJNAW4ipP0nxBMYT8+KRuL7gIyS0ry67TFu/B7NVRy46DF3VWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0125.namprd12.prod.outlook.com (2603:10b6:0:51::21) by
 MWHPR12MB1726.namprd12.prod.outlook.com (2603:10b6:300:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:40 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0125.outlook.office365.com
 (2603:10b6:0:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:39 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/38] drm/amd/display: Add missing shifts and masks for dpp
 registers on dcn2
Date: Wed, 2 Oct 2019 14:16:06 -0400
Message-ID: <20191002181633.22805-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(199004)(189003)(316002)(186003)(16586007)(5660300002)(50226002)(53416004)(81166006)(81156014)(6666004)(356004)(8676002)(8936002)(76176011)(51416003)(7696005)(86362001)(47776003)(26005)(4326008)(486006)(478600001)(126002)(2906002)(6916009)(1076003)(2351001)(336012)(426003)(2616005)(11346002)(476003)(48376002)(446003)(70586007)(305945005)(70206006)(50466002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1726; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ffc78c-2f53-4f2a-395b-08d74764abfe
X-MS-TrafficTypeDiagnostic: MWHPR12MB1726:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1726477463870B12A7C5F775F99C0@MWHPR12MB1726.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RxjxFhp1qPcvO4OltC9vcTNSN2G3ovHIwbbN+iMK1cAbGRRjgka9e2SzPciexYgI+5h3fE/aWI4+TP+TOK/iZq8cLVFJLf/4lvVKYKCkEbuU3Qmv2auvQhPXfy5H2h7fPrtla3AsDLppd7whC8OTbMUcaUpxgJH83CUC3xe5bPFi7AjvTtl5yfmFdThj8G+msJH78204patDwUfGiXczlUNHWRkmGBSAGtFtw81DTyDuskfwVB0xyOK+TFapiTaw/BmKVS5D/frVBtpEyvKZgEG0TbUchpgUy4szaeIybzW4L9ojOeJUuiQEaluUYJuKluiW49QCORzs9+IlY3dg8I5jlFguzXFu1i+uXu/cu3ZIfqJbzDlpciOVLmSyYdt7pEwTYKn5mOF+DbuP3VQQ7XGTK1230Vz1Zys60KuVrQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:40.3110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ffc78c-2f53-4f2a-395b-08d74764abfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMh6YItmWo5h5H5LNjb4V3Ir4eomJDiLYz8soZXsZW8=;
 b=MDg69UblGxZNoIxufHrM3JA6VwEareBhmZYdBhbY9qyVLFtt6NKskouY1vYWmVsGUzxW8MdFzooy0MGkBgUGhfmJAN7VDcwwjzlzTkFDEETrYRKZU7SI2SYxy5MWtK0t90ckRx3p0tkjhAsX8Is6xRnw5qPT2FJGohnWUcq5dYY=
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
Cc: Joshua Aberback <joshua.aberback@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClRo
ZSByZWdpc3RlciBDTV9URVNUX0RFQlVHX0RBVEEgaXMgdXNlZCBpbiBkcHAxX3Byb2dyYW1faW5w
dXRfY3NjLCB3aGljaCBpcwpjYWxsZWQgZnJvbSBkcHAyX2Nudl9zZXR1cCwgYnV0IHRoZSBzaGlm
dHMgYW5kIG1hc2tzIGZvciB0aGUgZmllbGRzIG9mIHRoYXQKcmVnaXN0ZXIgYXJlIG5vdCBpbml0
aWFsaXplZCBmb3IgZGNuMi4gVGhpcyBjYXVzZXMgYWxsIHJlYWRzIG9mIHRoYXQgcmVnaXN0ZXIK
dG8gcmV0dXJuIDAuCgpDaGFuZ2UtSWQ6IEk4OWQ3YzI5MTUzZTE0OTQ3Yjk3YmZlZTdkM2I3NGMw
ODE0ZDdhYTI1ClNpZ25lZC1vZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNr
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWVoeXVuIENodW5nIDxKYWVoeXVuLkNodW5nQGFtZC5j
b20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKaW5kZXggYWYwZTBkMWJlMTQ3Li4xMzQ4NGZmZjdhZDYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jCkBAIC01ODEsMTEgKzU4MSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRjbjJfZHBw
X3JlZ2lzdGVycyB0Zl9yZWdzW10gPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRjbjJf
ZHBwX3NoaWZ0IHRmX3NoaWZ0ID0gewotCQlURl9SRUdfTElTVF9TSF9NQVNLX0RDTjIwKF9fU0hJ
RlQpCisJCVRGX1JFR19MSVNUX1NIX01BU0tfRENOMjAoX19TSElGVCksCisJCVRGX0RFQlVHX1JF
R19MSVNUX1NIX0RDTjEwCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRjbjJfZHBwX21hc2sg
dGZfbWFzayA9IHsKLQkJVEZfUkVHX0xJU1RfU0hfTUFTS19EQ04yMChfTUFTSykKKwkJVEZfUkVH
X0xJU1RfU0hfTUFTS19EQ04yMChfTUFTSyksCisJCVRGX0RFQlVHX1JFR19MSVNUX01BU0tfRENO
MTAKIH07CiAKICNkZWZpbmUgZHdiY19yZWdzX2RjbjIoaWQpXAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
