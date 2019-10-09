Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED38D1A9B
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176F06EA75;
	Wed,  9 Oct 2019 21:06:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914C06EA67
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRzHlsnDSsp0L8zBucV0P56d94YkwIIRUAN9Sxah4jC47+VgXT7OIhZhjpTkOxEoPxkJZWcWyZ99bdK6jC48ikdhjeFhHOKGEqEZ1fRwyfMVSD4dfIc6ApyiMlrMTwMNkIJDWS39X76L7+EhQPCMWlYRPFDo14lAL4lYn6wHDKODa1ZpaTkOnsRYyxjl5E0HRZ55LRDLm4fYiDNJQ5iwi8srcsuh4qDLIA0uWVVoAsNdGszE+UroaSvPeiZJJtQu3UXUaFgOK4RjY0Gx17Zmez9TAhKZ4FEP9Ueu3cv4xhCZ/zpwD2JvjQ3C27K0xsBoBZIWr05hY3orXJDhKq6+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqKotz6XhmfGwINQxhWkdjDPEf2chsPXhCmHsPQKABs=;
 b=k12lbp+wz/eqxfqbP/AdU0w1bPDzRXSTfzoREHGJhDqq46/m4AiW9NaIxKpbmbC4ONvU9Gs9OujGCFBvb6NhRjhGMP0GFnCs8rW6gftct00WgaovvnsZv575ogde7u++pk9njhsBAAzCYZMmPEIZ78kJr+hDwx1GvZv3gzvcK37RmCeJVwR4jGS9UW0VpufAfGIpiNQ88F7JJPtF7afv2Pyr59DsT0p6r6CrEh6vVXigy4CcKIYKYPb61rovOaVujdLPrgN3Ni7VNKn/Wpkb/gJQMmqyT89a+fsM73YnmFKGGZxMt/Q2KL12/Y0z/bpJWt59pcSncwRivSQaReHQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by BN6PR12MB1491.namprd12.prod.outlook.com (2603:10b6:405:5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 21:06:31 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:30 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:30 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/26] drm/amd/display: fix header for RN clk mgr
Date: Wed, 9 Oct 2019 17:06:11 -0400
Message-ID: <20191009210613.17929-25-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(428003)(199004)(189003)(50226002)(8936002)(5660300002)(305945005)(7696005)(23676004)(476003)(446003)(126002)(1076003)(11346002)(356004)(336012)(2870700001)(2616005)(6916009)(478600001)(426003)(6666004)(316002)(50466002)(14444005)(4326008)(53416004)(2906002)(186003)(70586007)(5820100001)(54906003)(81156014)(8676002)(76176011)(81166006)(47776003)(486006)(86362001)(70206006)(2351001)(26005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1491; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c7f4dc8-3411-432f-aed9-08d74cfc8ef3
X-MS-TrafficTypeDiagnostic: BN6PR12MB1491:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14917E3091857CAD47EA3398F9950@BN6PR12MB1491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxMKT8akjZV59sU26PFfEC+Q8hOSuJpTAqlbNYxFVlUDuv3ihwb40tqnEP9LcgAJdhdpYxZepB/lYBiy9ok4o7qeUdvZJPHcPtBsGMzkodU1VXNy9TkOc7V9CkADeVLQR+RaIrM2MTPlgfcl1E2Z2xlML5ajijp4UhEHCHBISviAVcK5ZW42TVpQ7C+PuVm1Ebsnk5BZj63SVMIghFDlGtrNSiJfACuaBLc98VPte3+zpwciokM1TdOIxKP5gX4nbJrHhmgo8Ts3/pQjt+eJ1rvXgf3uc7OofmJWRMTiG18O38TYeGDdtCTc4oSD3ZOWIvQb5BhENkvsMmSzlCRvEEE1NPdyiOtHHAjq6romcXSO5SaLiCKjbPJpGxcB6Y5F4dpt5fA8mocqUfynTRMzueshhj3xsLpPsuczApsgUP0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:30.8617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7f4dc8-3411-432f-aed9-08d74cfc8ef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqKotz6XhmfGwINQxhWkdjDPEf2chsPXhCmHsPQKABs=;
 b=1+IESG/gcsOdjNEz/tVBxB2o9PtysldanJem++aMsCHrv0XEaaNn4eVS09T0L53lfg4+X+8pa2VUVPV6GqOvaNNQqJyS0bnneCokpJ54L1n3qS7kBzrKP0RnnwUldFklSteRfDWebnOsSDdf05fVhMNtcEF9Mela4kkHUUdSci0=
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
Cc: sunpeng.li@amd.com, joseph gravenor <joseph.gravenor@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogam9zZXBoIGdyYXZlbm9yIDxqb3NlcGguZ3JhdmVub3JAYW1kLmNvbT4KClt3aHldClNo
b3VsZCBhbHdheXMgTVAwX0JBU0UgZm9yIGFueSByZWdpc3RlciBkZWZpbml0aW9uIGZyb20gTVAg
cGVyLUlQIGhlYWRlciBmaWxlcy4KSSBiZWxpdmUgdGhlIHJlYXNvbiB0aGUgbGludXggdmVyc2lv
biBvZiBNUDFfQkFTRSB3b3JrcyBpcyBUaGUgMHRowqBlbGVtZW50IG9mIHRoZSAwdGjCoHRhYmxl
Cm9mIHRoYXQgaXMgaWRlbnRpY2FsIHRvIHRoZSBjb3JyaXNwb25kaW5nIHZhbHVlIG9mIE1QMF9C
QVNFIGluIHRoZSByZW5vaXIgb2Zmc2V0IGhlYWRlciBmaWxlLgpUaGUgcmVhc29uIHdlIHNob3Vs
ZCBvbmx5IHVzZSBNUDBfQkFTRSBpcyBUaGVyZSBpcyBvbmx5IG9uZSBzZXQgb2YgcGVyLUlQIGhl
YWRlcnMgTVAKdGhhdCBpbmNsdWRlcyBhbGwgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgcmVsYXRlZCB0
byBTTVUgSVAgYmxvY2suIFRoaXMgSVAgaW5jbHVkZXMgTVAwLCBNUDEsIE1QMgphbmQgIGFuIGVj
cnlwdGlvbiBlbmdpbmUgdGhhdCBjYW4gYmUgdXNlZCBvbmx5IGJ5IE1QMC4gQXMgYSByZXN1bHQg
YWxsIHJlZ2lzdGVyIGRlZmluaXRpb25zIGZyb20KTVAgZmlsZSBzaG91bGQgYmUgYmFzZWQgb25s
eSBvbiBNUDBfQkFTRSBkYXRhLgoKW0hvd10KQ2hhbmdlIE1QMV9CQVNFIHRvIE1QMF9CQVNFCgpT
aWduZWQtb2ZmLWJ5OiBqb3NlcGggZ3JhdmVub3IgPGpvc2VwaC5ncmF2ZW5vckBhbWQuY29tPgpB
Y2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0t
LQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3Zi
aW9zX3NtdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKaW5kZXggOGU4NjBm
NTY3ZDVjLi5kYjI4ZTkxYWRiM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19z
bXUuYwpAQCAtMzMsNyArMzMsNyBAQAogI2luY2x1ZGUgIm1wL21wXzEyXzBfMF9zaF9tYXNrLmgi
CiAKICNkZWZpbmUgUkVHKHJlZ19uYW1lKSBcCi0JKE1QMV9CQVNFLmluc3RhbmNlWzBdLnNlZ21l
bnRbbW0gIyMgcmVnX25hbWUgIyMgX0JBU0VfSURYXSArIG1tICMjIHJlZ19uYW1lKQorCShNUDBf
QkFTRS5pbnN0YW5jZVswXS5zZWdtZW50W21tICMjIHJlZ19uYW1lICMjIF9CQVNFX0lEWF0gKyBt
bSAjIyByZWdfbmFtZSkKIAogI2RlZmluZSBGTihyZWdfbmFtZSwgZmllbGQpIFwKIAlGRChyZWdf
bmFtZSMjX18jI2ZpZWxkKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
