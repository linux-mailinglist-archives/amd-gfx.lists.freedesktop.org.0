Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B4CC3B7
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420C6E314;
	Fri,  4 Oct 2019 19:45:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710074.outbound.protection.outlook.com [40.107.71.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4816E314
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 19:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrI+HubPsC9pvcuy7ri/qOVDr34jZ+6DksWDudXoopHErSXBuM5Pj+TcNbiR7DCj2zWP7DV/u0lWiwmiSNva3/7Jx/ZU9EyNUrP/M7BSl7/CzfG93yUt2npSRd6oxH6sPpidlPHlVEbIQ/byfhHiWx/bYVSZB7wjFQ9CAXwhINjmEklHb0LEX1D01Z+IEiUKrgxTSWnUWqSWb35p2xSHUFf6Ce1t9RdDbbGHOLDel5ns65OBPW0lQu5UkwEEYvBd/Loysuy68gD+K6JwVxrk1qKceJQl/TykRNm4eRHfksuIUg2kGRdlXAP8tETtOR1RoUTiCCvhD0qDlg1i95pF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm3CuJvXPFTCvChv8ZSDHd7p5aT7iWrjheM21KYJZp0=;
 b=FPtA0nARjMQghvenjcY8c3DMzcI7nHP1ohkLEQvc1kKxG3ep6BX0cfORQRoRA5IUOqkg9fqA2ToJTsKR+O4O2f7h/qGtCeBW/VLHMD9rB1ejfWR4nbhGaxFyNJzOoosMObavCnbVpjierNCofH4Q/V/sa5EywF93WXmCKxEWR4Pa9LjLQdj3+KAKIv8PwGjU6TQ6jrGuF67JNpKRZ0yBb7/v3Y/ofzY2WsAU7exORuz9YnCQMjKxTs0ahrL3sxtt9YtswBRvjndHD5J21/0ouc9z17+++nLa+B969p2nj5DRv06SzGXB897SEn4C7K5SFOU7JGJbEq9LCbG3j6nYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 MN2PR12MB3789.namprd12.prod.outlook.com (2603:10b6:208:164::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 19:45:12 +0000
Received: from DM3NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Fri, 4 Oct 2019 19:45:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT028.mail.protection.outlook.com (10.152.82.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 19:45:12 +0000
Received: from roma-lnx-dev.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 4 Oct 2019
 14:45:11 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/include: add aux timeout vega registers
Date: Fri, 4 Oct 2019 15:45:00 -0400
Message-ID: <1570218300-23968-1-git-send-email-Roman.Li@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(199004)(189003)(48376002)(6666004)(426003)(53416004)(126002)(476003)(356004)(2616005)(2876002)(478600001)(4326008)(54906003)(305945005)(2906002)(50466002)(5660300002)(36756003)(6916009)(70586007)(7696005)(186003)(51416003)(86362001)(8676002)(81156014)(81166006)(336012)(8936002)(2351001)(26005)(316002)(47776003)(486006)(16586007)(70206006)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3789; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f817b34a-1958-49e5-c383-08d749035ee9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3789:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3789353681ACF38CE2DABDD6899E0@MN2PR12MB3789.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fYgF+yC26sCN30DUACbH24CdRSyyygsHT9F+Lu0SNSjI1bExuJhRStLh61nPG8fmeOPLTAO181+Al+n4IbilHesRYYrOW4J06tJsqnYfTqdxKkjjdUM1Mw+DtXM/dXYQw7lkVjgmS+MTrh207e49qjspwv5AI53fTSUPkNQXgOivCtXUyQUE/c8O8yAMzM8B6pKaz1mV9owoV1zuuPitWAq2QMpCh8He+K8LdtXEMGgn0nLGmOU5PEHM0fy00a9OThNJbUXiiLfLlqPFO57SpOEclUuYZ4HNhBsvM2yqrM4NyA2aY/lkQQeAXG9+1NPW+QcinWjoBBQyeHanEPrNv+oOO0JzDSZs5HERIO4zCtiqI447S+4b9s+FCU5uf0dfxjaLAko0LyTcF+ycr5ySSFNcxoDs7leL/t9sIVAv5s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 19:45:12.1221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f817b34a-1958-49e5-c383-08d749035ee9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3789
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm3CuJvXPFTCvChv8ZSDHd7p5aT7iWrjheM21KYJZp0=;
 b=yw8Pu3P0DNY0dBWNxEFfnpjmvWQSyPWUU2QL4xqlxMZyiXtI6aIef03Uj8CMzG+gmpDUlcl9aDyBvJZKmCPsuuekdtikKXS0bM0Resitn5D70wLnzaDPRancAiTHefdKlt7XPKZUJnht/Q/J47QgZsBodX0cm7BZjhHCo9sSyHQ=
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
Cc: Abdoulaye.Berthe@amd.com, Zhan.Liu@amd.com, Roman Li <Roman.Li@amd.com>,
 harry.wentland@amd.com, Alexander.Deucher@amd.com, Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpEQyBuZWVkcyB0aGVtIHRvIHN1cHBv
cnQgY29uZmlndXJhYmxlIGF1eCB0aW1lb3V0IG9uIHZlZ2EKClNpZ25lZC1vZmYtYnk6IFJvbWFu
IExpIDxSb21hbi5MaUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
c2ljX3JlZy9kY2UvZGNlXzEyXzBfc2hfbWFzay5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2FzaWNfcmVnL2RjZS9kY2VfMTJfMF9zaF9tYXNrLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvYXNpY19yZWcvZGNlL2RjZV8xMl8wX3NoX21hc2suaAppbmRleCBiY2QxOTBhLi44MzJk
N2IyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZGNl
L2RjZV8xMl8wX3NoX21hc2suaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvZGNlL2RjZV8xMl8wX3NoX21hc2suaApAQCAtMzU1NDksNyArMzU1NDksMTEgQEAKICNk
ZWZpbmUgRFBfQVVYMF9BVVhfRFBIWV9SWF9DT05UUk9MMF9fQVVYX1JYX0RFVEVDVElPTl9USFJF
U0hPTERfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg3MDAw
MDAwMEwKIC8vRFBfQVVYMF9BVVhfRFBIWV9SWF9DT05UUk9MMQogI2RlZmluZSBEUF9BVVgwX0FV
WF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhfUFJFQ0hBUkdFX1NLSVBfX1NISUZUICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKKyNkZWZpbmUgRFBfQVVYMF9B
VVhfRFBIWV9SWF9DT05UUk9MMV9fQVVYX1JYX1RJTUVPVVRfTEVOX19TSElGVCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg4CisjZGVmaW5lIERQX0FVWDBf
QVVYX0RQSFlfUlhfQ09OVFJPTDFfX0FVWF9SWF9USU1FT1VUX0xFTl9NVUxfX1NISUZUICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4ZgogI2RlZmluZSBEUF9BVVgw
X0FVWF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhfUFJFQ0hBUkdFX1NLSVBfTUFTSyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDAwMEZGTAorI2RlZmlu
ZSBEUF9BVVgwX0FVWF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhfVElNRU9VVF9MRU5fTUFTSyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDA3RjAw
TAorI2RlZmluZSBEUF9BVVgwX0FVWF9EUEhZX1JYX0NPTlRST0wxX19BVVhfUlhfVElNRU9VVF9M
RU5fTVVMX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
eDAwMDE4MDAwTAogLy9EUF9BVVgwX0FVWF9EUEhZX1RYX1NUQVRVUwogI2RlZmluZSBEUF9BVVgw
X0FVWF9EUEhZX1RYX1NUQVRVU19fQVVYX1RYX0FDVElWRV9fU0hJRlQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKICNkZWZpbmUgRFBfQVVY
MF9BVVhfRFBIWV9UWF9TVEFUVVNfX0FVWF9UWF9TVEFURV9fU0hJRlQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg0Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
