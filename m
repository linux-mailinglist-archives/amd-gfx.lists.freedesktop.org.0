Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4082A0C1B
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0E189DEC;
	Wed, 28 Aug 2019 21:04:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710088.outbound.protection.outlook.com [40.107.71.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B4989F33
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg43k0MRRQIBnkyyciR0deGez49dvrRliCNEtgQUP19UVXk0S/MERMJDGvaFfJ/g9p5Zp+8Ds/wglgazi494aBsjcnSBsblhaA4OQQlsh5DsTOPQYMpIHlQC0XerLCD6ZMWCcqSGJPdMAtNuuvF44YVcT5FtIKjOZDAlcRxPDBPkEMHEJDnHfAZjQG9FHI9GqOpEnR79sFwEP8ucIhA4gUL3CwUxvVmgGXGEvr2jdnFy/IBvmzyrQQZdP/ixaOmE0ZSV1F6smRgEApZLytwCuygqFOcINQ83bTOKXU76BG/LVjQwQvwHDtHjKdoXczivygEXL84a+C2WOHctxT+BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccyWhNZID/YEqH/A1GW2aXRHoQH+l+HaW1syWX6ELqk=;
 b=XRTfgW8fYx4ZaLq4ca7Qn47HTFJEqBLPaOYSocernjkvCK4u7FWBLgPuZtwKpW5STqPG29o20kUd+3fnBfwPnTZVNPNFrlY1w1AT+ZTxDsf+BhtypfRv/X1rcDOoqEyHSKFV5jJP6Qv1K0DY9dr1DoNwC0WHQd9l4Oxwry67mccxN6EQJdnPKpcR5NIMJHqr1M56uZifaYVffjdqpoOhw2pZ4Jj2O+iCd3B62xZ+Z6klviWSZoKsTavyVHbm/U3+6A7vbFyq1w+GEsJkl4guSwZF2/eGuMrSWN5RuBc25tZvy+AVbwXKHTOgbfv3Or5O6kqTuuaCndtCUMGQDGtHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0052.namprd12.prod.outlook.com (2603:10b6:0:56::20) by
 DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 28 Aug 2019 21:04:17 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0052.outlook.office365.com
 (2603:10b6:0:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:16 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:06 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/17] drm/amd/display: OTC underflow fix
Date: Wed, 28 Aug 2019 17:03:50 -0400
Message-ID: <20190828210354.21464-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(53936002)(14444005)(4326008)(2906002)(6916009)(86362001)(486006)(36756003)(51416003)(356004)(76176011)(6666004)(7696005)(426003)(126002)(476003)(2616005)(186003)(11346002)(336012)(26005)(446003)(48376002)(50466002)(50226002)(53416004)(478600001)(1076003)(47776003)(2351001)(81166006)(305945005)(8936002)(70206006)(70586007)(316002)(16586007)(5660300002)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1532; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 140db93a-8700-429c-38a9-08d72bfb499a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1532; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB153267EDA5605F6408C782C9F9A30@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: j3ne408e5hzLNdAPDymiE5MDyxc2rZ1w9eVBUC0k6KeNi0jZm27e8Mf2NfqVlJxZHusfAa59FSMWq8s/yxcd2NStR2FoM1JTgahHK8s6DtqqPqEhjNeR+Ac9OKoyvHY4Lrotn/OXv84h+DKDgdEQU8M0aVA14mAxtPYQoNCmtZ4w9R5hZQio9DHnTDZOjm8XnQLAxeQGERKFszbwp7uaaQBymP8LABq5CVa9G3c1Y5gUK7JzHcwS0kgldEd3g2+iMabU2XAulLSZIpHzSYvBPTCLAt4ZYJfZsY2S3ZdnG5p+exUE0KIkDXykz0xBZLTsqYTEwu4l/M5ZPSuXw0ok0DQaDdxDSsC8THIAblpWDGSSiF9RvahYAI/uFRw36yco4FlFRljiuOSZfGnePTSyj2AM8qb17OQORqwa/6x7eRE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:16.6242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 140db93a-8700-429c-38a9-08d72bfb499a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccyWhNZID/YEqH/A1GW2aXRHoQH+l+HaW1syWX6ELqk=;
 b=eMpmgGwObsIIpxGWsAhibgk02b4vx9GsnAMoxCNbDcUobypfjRqiSB5ucrLxgSGzQf4ZsENv9/kyNQ3sWoffDF18kkBoT3mUkgGrdMxtrcYEWsYOudKmb8vJ04NRJvDL+lQJxRCgnVkc/l5wOgKO28OqBESeqpMXFw892qvD0Qg=
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
Cc: Jaehyun Chung <jaehyun.chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFlaHl1biBDaHVuZyA8amFlaHl1bi5jaHVuZ0BhbWQuY29tPgoKW1doeV0gVW5kZXJm
bG93IG9jY3VycyBvbiBzb21lIGRpc3BsYXkgc2V0dXBzKHJlcHJvJ2Qgb24gM3g0SyBIRFIpIG9u
IGJvb3QsCm1vZGUgc2V0LCBhbmQgaG90LXBsdWdzIHdpdGguIFVuZGVyZmxvdyBvY2N1cnMgYmVj
YXVzZSBtZW0gY2xrCmlzIG5vdCBzZXQgaGlnaCBhZnRlciBkaXNhYmxpbmcgcHN0YXRlIHN3aXRj
aGluZy4gVGhpcyBiZWhhdmlvdXIgb2NjdXJzCmJlY2F1c2Ugc29tZSBjYWxjdWxhdGlvbnMgYXNz
dW1lZCBkaXNwbGF5cyB3ZXJlIHN5bmNocm9uaXplZC4KCltIb3ddIEFkZCBhIGNvbmRpdGlvbiB0
byBjaGVjayBpZiB0aW1pbmcgc3luYyBpcyBkaXNhYmxlZCBzbyB0aGF0CnN5bmNocm9uaXplZCB2
YmxhbmsgY2FuIGJlIHNldCB0byBmYWxzZS4KClNpZ25lZC1vZmYtYnk6IEphZWh5dW4gQ2h1bmcg
PGphZWh5dW4uY2h1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsdmluIExlZSA8QWx2aW4uTGVl
MkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hh
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDM1M2UzZTdjYjkyOS4uNjJlOWE5ODI2Yzk3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYwpAQCAtMTc1Nyw3ICsxNzU3LDcgQEAgaW50IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBl
c19mcm9tX2NvbnRleHQoCiAJCQlwaXBlX2NudCA9IGk7CiAJCQljb250aW51ZTsKIAkJfQotCQlp
ZiAoIXJlc291cmNlX2FyZV9zdHJlYW1zX3RpbWluZ19zeW5jaHJvbml6YWJsZSgKKwkJaWYgKGRj
LT5kZWJ1Zy5kaXNhYmxlX3RpbWluZ19zeW5jIHx8ICFyZXNvdXJjZV9hcmVfc3RyZWFtc190aW1p
bmdfc3luY2hyb25pemFibGUoCiAJCQkJcmVzX2N0eC0+cGlwZV9jdHhbcGlwZV9jbnRdLnN0cmVh
bSwKIAkJCQlyZXNfY3R4LT5waXBlX2N0eFtpXS5zdHJlYW0pKSB7CiAJCQlzeW5jaHJvbml6ZWRf
dmJsYW5rID0gZmFsc2U7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
