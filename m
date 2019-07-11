Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD2652BA
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124A06E155;
	Thu, 11 Jul 2019 08:01:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810077.outbound.protection.outlook.com [40.107.81.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF986E155
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:01:01 +0000 (UTC)
Received: from CY4PR12CA0026.namprd12.prod.outlook.com (2603:10b6:903:129::12)
 by MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 11 Jul
 2019 08:01:00 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CY4PR12CA0026.outlook.office365.com
 (2603:10b6:903:129::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Thu, 11 Jul 2019 08:00:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 11 Jul 2019 08:00:59 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 11 Jul 2019
 03:00:57 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in hw_id_map
 array
Date: Thu, 11 Jul 2019 16:00:50 +0800
Message-ID: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(50466002)(53416004)(356004)(6666004)(70586007)(51416003)(53936002)(7696005)(68736007)(316002)(2616005)(426003)(36756003)(4744005)(48376002)(5660300002)(70206006)(476003)(126002)(86362001)(2906002)(14444005)(47776003)(26005)(305945005)(81156014)(50226002)(4326008)(54906003)(478600001)(16586007)(186003)(44832011)(2351001)(486006)(336012)(8676002)(8936002)(6916009)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1855; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e5d14c-a594-419b-f02f-08d705d5e95b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1855; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1855:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1855E070CD35EFFAF232A6DA95F30@MWHPR12MB1855.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 0095BCF226
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eDZE3oEPv+FKLIhdV4XALOcikLk1vssIx7hcCOooBGejpW4s22Z4fyNOco0vt2ysli003FVD3tXiRTfBMo7awqRVQ02s1VHJ+tAIC2d8gN+ly4i1eTFrdmvIndjuPC+8S4Jyf4spM39Bp0Ne5ohlStaxvE1QsikczO22VeKh3dtFZii+Mc22VCROGikiGhOhLJgaQe0ElCXXIXbnWPn8PWWNxJVh20/4wWQ1qeBbi4TakK23WafQVsfBuvpfwIttfP6S083/xZNbibUjk1w0ulr7NE9zOE2zy8/2ExWr3BbV87qm7Vs2e3LEYcH55+n+aNn1WZc/U0jTHzfNQvN1zFcNG0yHEB1ftqGDJ6JW+xh6/qnvVyOHE27mXUtznQ5bUqICQAxstVC9DEcM4jgRrsEcF1cm7fodptEHbV7BeZg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2019 08:00:59.4051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e5d14c-a594-419b-f02f-08d705d5e95b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1855
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjcC4M6C4ZORfAu23FDzwO/K34kkzfRaOUquT1Ma/H8=;
 b=eP+IXsq0c1Bnz0mYeZpMUt6pW6gzEk2OBy5tKkwpy/ufInG0N/G1xZXBr6HMnkc+dh2gviik7SaNhLukXL/KJmVvg4p7sMylv1vqbxEuzy4g5S1ceBH+y+rwM6xDMPx1yxeSuREFEL5ahmlMsKfXWSHt6bgTpJglAVwf/ObhELI=
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCklEIG9mIERDRV9IV0lQIGZyb20g
dmJpb3MgaXMgRE1VX0hXSUQsCm1pc21hdGNoIGNhdXNlIG51bGwgcG9pbnRlciBjcmFzaCBpbiBu
YXZpMTAgbW9kcHJvYmUuCgpDaGFuZ2UtSWQ6IEkzYmUzNjNjZjUyNDhkZTkwNGIzYmRhZTJmMzRk
M2JiZTBiYmJjMDdkClNpZ25lZC1vZmYtYnk6IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCmluZGV4IGUwNDlhZTYu
LjE0ODE4OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
aXNjb3ZlcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292
ZXJ5LmMKQEAgLTEyMyw3ICsxMjMsNyBAQCBzdGF0aWMgaW50IGh3X2lkX21hcFtNQVhfSFdJUF0g
PSB7CiAJW1VWRF9IV0lQXQk9IFVWRF9IV0lELAogCVtWQ0VfSFdJUF0JPSBWQ0VfSFdJRCwKIAlb
REZfSFdJUF0JPSBERl9IV0lELAotCVtEQ0VfSFdJUF0JPSBEQ0VBWl9IV0lELAorCVtEQ0VfSFdJ
UF0JPSBETVVfSFdJRCwKIAlbT1NTU1lTX0hXSVBdCT0gT1NTU1lTX0hXSUQsCiAJW1NNVUlPX0hX
SVBdCT0gU01VSU9fSFdJRCwKIAlbUFdSX0hXSVBdCT0gUFdSX0hXSUQsCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
